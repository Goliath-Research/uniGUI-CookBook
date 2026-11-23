"""Execute the Pascal routines that resolve the service-account credential.

The runner reads those routines from the product sources and evaluates the
statements that are not comments. Registry, ini files, and the database are
stand-ins whose steps follow the product routines and the Oracle 12.1
CREATE USER password rule (same case as written in the statement).
"""

from __future__ import annotations

import re
from dataclasses import dataclass, field
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


class PascalError(Exception):
    pass


class AuthFailed(PascalError):
    pass


class Returned(Exception):
    def __init__(self, value):
        self.value = value


def strip_comments(src: str) -> str:
    out = []
    i = 0
    n = len(src)
    while i < n:
        if src.startswith("(*", i):
            end = src.find("*)", i + 2)
            if end < 0:
                break
            out.append("\n" * src.count("\n", i, end))
            i = end + 2
            continue
        if src.startswith("{$", i) or src.startswith("(*$", i):
            pass
        if src[i] == "{":
            end = src.find("}", i + 1)
            if end < 0:
                break
            out.append("\n" * src.count("\n", i, end))
            i = end + 1
            continue
        if src.startswith("//", i):
            end = src.find("\n", i)
            i = n if end < 0 else end
            continue
        if src[i] == "'":
            j = i + 1
            while j < n:
                if src[j] == "'":
                    if j + 1 < n and src[j + 1] == "'":
                        j += 2
                        continue
                    j += 1
                    break
                j += 1
            out.append(src[i:j])
            i = j
            continue
        out.append(src[i])
        i += 1
    return "".join(out)


def _skip(src: str, i: int) -> int:
    while i < len(src) and src[i] in " \t\r\n":
        i += 1
    return i


def _ident(src: str, i: int):
    i = _skip(src, i)
    m = re.match(r"[A-Za-z_][A-Za-z0-9_]*", src[i:])
    if not m:
        return None, i
    return m.group(0), i + len(m.group(0))


def _qual_name(src: str, i: int):
    name, i = _ident(src, i)
    if name is None:
        return None, i
    while True:
        j = _skip(src, i)
        if j < len(src) and src[j] == ".":
            extra, j2 = _ident(src, j + 1)
            if not extra:
                break
            name += "." + extra
            i = j2
            continue
        return name, i


@dataclass
class Routine:
    name: str
    params: list
    body: str
    consts: dict = field(default_factory=dict)
    nested: dict = field(default_factory=dict)
    varnames: list = field(default_factory=list)


def _matching_end(src: str, begin_at: int) -> int:
    """Return index just after the end that closes begin_at (a 'begin')."""
    i = begin_at
    depth = 0
    n = len(src)
    while i < n:
        i = _skip(src, i)
        if src.startswith("begin", i) and _word_boundary(src, i, 5):
            depth += 1
            i += 5
            continue
        if src.startswith("try", i) and _word_boundary(src, i, 3):
            depth += 1
            i += 3
            continue
        if src.startswith("case", i) and _word_boundary(src, i, 4):
            depth += 1
            i += 4
            continue
        if src.startswith("end", i) and _word_boundary(src, i, 3):
            depth -= 1
            i += 3
            if depth == 0:
                i = _skip(src, i)
                if i < n and src[i] == ";":
                    i += 1
                return i
            continue
        if i < n and src[i] == "'":
            i += 1
            while i < n:
                if src[i] == "'":
                    if i + 1 < n and src[i + 1] == "'":
                        i += 2
                        continue
                    i += 1
                    break
                i += 1
            continue
        i += 1
    raise PascalError("unclosed begin")


def _word_boundary(src: str, i: int, length: int) -> bool:
    before_ok = i == 0 or not (src[i - 1].isalnum() or src[i - 1] == "_")
    j = i + length
    after_ok = j >= len(src) or not (src[j].isalnum() or src[j] == "_")
    return before_ok and after_ok


def extract_routine(src: str, signature: str) -> Routine:
    """signature is the text before the parameter list or the name token."""
    clean = strip_comments(src)
    pattern = rf"(?m)^(?:function|procedure|constructor)\s+{re.escape(signature)}\b"
    found = list(re.finditer(pattern, clean))
    if not found:
        raise PascalError(f"routine not found: {signature}")
    errors = []
    for match in found:
        try:
            routine, _end = _parse_routine_header_and_body(clean, match.start())
        except PascalError as exc:
            errors.append(str(exc))
            continue
        if routine.body:
            return routine
    raise PascalError(f"routine has no body: {signature}; {errors}")


def _parse_routine_header_and_body(src: str, i: int):
    _kind, i = _ident(src, i)
    name, i = _qual_name(src, i)
    i = _skip(src, i)
    params = []
    if i < len(src) and src[i] == "(":
        start = i + 1
        depth = 0
        while i < len(src):
            if src[i] == "(":
                depth += 1
            elif src[i] == ")":
                depth -= 1
                if depth == 0:
                    params = _split_params(src[start:i])
                    i += 1
                    break
            i += 1
    i = _skip(src, i)
    if i < len(src) and src[i] == ":":
        while i < len(src) and src[i] != ";":
            i += 1
    if i < len(src) and src[i] == ";":
        i += 1
    consts = {}
    nested = {}
    varnames = []
    while True:
        i = _skip(src, i)
        word, j = _ident(src, i)
        low = (word or "").lower()
        if low == "const":
            consts, i = _parse_simple_consts(src, j)
            continue
        if low == "var":
            found, i = _parse_var_names(src, j)
            varnames.extend(found)
            continue
        if low == "type":
            i = _skip_until_routine_or_begin(src, j)
            continue
        if low in ("function", "procedure"):
            routine, i = _parse_routine_header_and_body(src, i)
            nested[routine.name.lower()] = routine
            continue
        if low == "begin":
            end = _matching_end(src, i)
            body = src[i:end]
            return Routine(name, params, body, consts, nested, varnames), end
        raise PascalError(f"unexpected token in {name}: {src[i:i+40]!r}")


def _parse_var_names(src: str, i: int):
    names = []
    while True:
        i = _skip(src, i)
        word, j = _ident(src, i)
        if not word or word.lower() in ("begin", "function", "procedure", "const", "type"):
            return names, i
        group = [word]
        i = j
        while True:
            i = _skip(src, i)
            if i < len(src) and src[i] == ",":
                i += 1
                extra, i = _ident(src, i)
                if extra:
                    group.append(extra)
                continue
            if i < len(src) and src[i] == ":":
                while i < len(src) and src[i] != ";":
                    if src[i] == "'":
                        _text, i = _read_string(src, i)
                        continue
                    i += 1
                if i < len(src) and src[i] == ";":
                    i += 1
                names.extend(group)
                break
            return names, i


def _skip_until_routine_or_begin(src: str, i: int) -> int:
    while i < len(src):
        i = _skip(src, i)
        word, j = _ident(src, i)
        if word and word.lower() in ("begin", "function", "procedure", "const", "var", "type"):
            return i
        i = j if word else i + 1
    return i


def _parse_simple_consts(src: str, i: int):
    consts = {}
    while True:
        i = _skip(src, i)
        word, j = _ident(src, i)
        if not word or word.lower() in ("var", "type", "begin", "function", "procedure"):
            return consts, i
        i = _skip(src, j)
        if i >= len(src) or src[i] != "=":
            return consts, i
        i += 1
        i = _skip(src, i)
        if src[i] == "'":
            text, i = _read_string(src, i)
            consts[word] = text
        else:
            # Skip non-scalar consts (records, arrays) by leaving them for the unit loader.
            return consts, i
        i = _skip(src, i)
        if i < len(src) and src[i] == ";":
            i += 1


def _split_params(src: str) -> list:
    parts = []
    buf = []
    depth = 0
    for ch in src:
        if ch == "(":
            depth += 1
        elif ch == ")":
            depth -= 1
        if ch == ";" and depth == 0:
            parts.append("".join(buf))
            buf = []
        else:
            buf.append(ch)
    if "".join(buf).strip():
        parts.append("".join(buf))
    names = []
    for part in parts:
        left = part.split(":")[0]
        left = left.replace("const", " ").replace("var", " ").replace("out", " ")
        for name in left.split(","):
            name = name.strip()
            if name:
                names.append(name)
    return names


def _read_string(src: str, i: int):
    assert src[i] == "'"
    i += 1
    chars = []
    while i < len(src):
        if src[i] == "'":
            if i + 1 < len(src) and src[i + 1] == "'":
                chars.append("'")
                i += 2
                continue
            return "".join(chars), i + 1
        chars.append(src[i])
        i += 1
    raise PascalError("unterminated string")


class Parser:
    def __init__(self, src: str):
        self.src = src
        self.i = 0
        self.n = len(src)

    def skip(self):
        self.i = _skip(self.src, self.i)

    def peek_ident(self):
        self.skip()
        word, _j = _ident(self.src, self.i)
        return word

    def eat_ident(self, expected=None):
        word, j = _ident(self.src, self.i)
        if word is None or (expected and word.lower() != expected.lower()):
            raise PascalError(f"expected {expected or 'ident'} at {self.src[self.i:self.i+30]!r}")
        self.i = j
        return word

    def starts(self, word):
        got = self.peek_ident()
        return got is not None and got.lower() == word.lower()

    def parse_block(self):
        self.eat_ident("begin")
        stmts = []
        while True:
            self.skip()
            if self.starts("end"):
                self.eat_ident("end")
                self.skip()
                if self.i < self.n and self.src[self.i] == ";":
                    self.i += 1
                break
            stmts.append(self.parse_stmt())
        return ("block", stmts)

    def parse_stmt(self):
        self.skip()
        if self.starts("begin"):
            return self.parse_block()
        if self.starts("if"):
            self.eat_ident("if")
            cond = self.parse_expr()
            self.eat_ident("then")
            then_s = self.parse_stmt()
            else_s = None
            self.skip()
            if self.starts("else"):
                self.eat_ident("else")
                else_s = self.parse_stmt()
            return ("if", cond, then_s, else_s)
        if self.starts("for"):
            self.eat_ident("for")
            var = self.eat_ident()
            self.skip()
            self._eat(":=")
            start = self.parse_expr()
            self.eat_ident("to")
            stop = self.parse_expr()
            self.eat_ident("do")
            body = self.parse_stmt()
            return ("for", var, start, stop, body)
        if self.starts("while"):
            self.eat_ident("while")
            cond = self.parse_expr()
            self.eat_ident("do")
            body = self.parse_stmt()
            return ("while", cond, body)
        if self.starts("try"):
            self.eat_ident("try")
            try_stmts = []
            finally_stmts = []
            except_stmts = []
            kind = None
            while True:
                self.skip()
                if self.starts("finally"):
                    kind = "finally"
                    self.eat_ident("finally")
                    break
                if self.starts("except"):
                    kind = "except"
                    self.eat_ident("except")
                    break
                if self.starts("end"):
                    break
                try_stmts.append(self.parse_stmt())
            tail = []
            while True:
                self.skip()
                if self.starts("end"):
                    self.eat_ident("end")
                    self.skip()
                    if self.i < self.n and self.src[self.i] == ";":
                        self.i += 1
                    break
                tail.append(self.parse_stmt())
            if kind == "finally":
                finally_stmts = tail
                except_stmts = None
            else:
                except_stmts = tail
            return ("try", try_stmts, except_stmts, finally_stmts)
        if self.starts("with"):
            self.eat_ident("with")
            obj = self.parse_expr()
            self.eat_ident("do")
            body = self.parse_stmt()
            return ("with", obj, body)
        if self.starts("raise"):
            self.eat_ident("raise")
            expr = self.parse_expr()
            self._optional_semi()
            return ("raise", expr)
        if self.starts("exit"):
            self.eat_ident("exit")
            self.skip()
            value = None
            if self.i < self.n and self.src[self.i] == "(":
                self.i += 1
                value = self.parse_expr()
                self.skip()
                if self.src[self.i] != ")":
                    raise PascalError("expected ) after Exit")
                self.i += 1
            self._optional_semi()
            return ("exit", value)
        # assignment or call
        expr = self.parse_expr()
        self.skip()
        if self.src.startswith(":=", self.i):
            self.i += 2
            value = self.parse_expr()
            self._optional_semi()
            return ("assign", expr, value)
        self._optional_semi()
        return ("expr", expr)

    def _optional_semi(self):
        self.skip()
        if self.i < self.n and self.src[self.i] == ";":
            self.i += 1

    def _eat(self, text):
        self.skip()
        if not self.src.startswith(text, self.i):
            raise PascalError(f"expected {text} at {self.src[self.i:self.i+20]!r}")
        self.i += len(text)

    def parse_expr(self):
        return self.parse_or()

    def parse_or(self):
        node = self.parse_and()
        while True:
            self.skip()
            word = self.peek_ident()
            if word and word.lower() == "or":
                self.eat_ident("or")
                node = ("or", node, self.parse_and())
            else:
                return node

    def parse_and(self):
        node = self.parse_cmp()
        while True:
            self.skip()
            word = self.peek_ident()
            if word and word.lower() == "and":
                self.eat_ident("and")
                node = ("and", node, self.parse_cmp())
            else:
                return node

    def parse_cmp(self):
        node = self.parse_add()
        self.skip()
        for op in ("<>", "<=", ">=", "=", "<", ">"):
            if self.src.startswith(op, self.i):
                self.i += len(op)
                return ("binop", op, node, self.parse_add())
        return node

    def parse_add(self):
        node = self.parse_mul()
        while True:
            self.skip()
            word = self.peek_ident()
            if word and word.lower() in ("xor", "or"):
                # or is handled higher; xor is additive in Delphi
                if word.lower() == "xor":
                    self.eat_ident("xor")
                    node = ("binop", "xor", node, self.parse_mul())
                    continue
            if self.i < self.n and self.src[self.i] in "+-":
                op = self.src[self.i]
                self.i += 1
                node = ("binop", op, node, self.parse_mul())
                continue
            return node

    def parse_mul(self):
        node = self.parse_unary()
        while True:
            self.skip()
            word = self.peek_ident()
            if word and word.lower() in ("div", "mod", "and"):
                if word.lower() == "and":
                    return node
                op = self.eat_ident()
                node = ("binop", op.lower(), node, self.parse_unary())
                continue
            if self.i < self.n and self.src[self.i] in "*/":
                op = self.src[self.i]
                self.i += 1
                node = ("binop", op, node, self.parse_unary())
                continue
            return node

    def parse_unary(self):
        self.skip()
        word = self.peek_ident()
        if word and word.lower() == "not":
            self.eat_ident("not")
            return ("not", self.parse_unary())
        if self.i < self.n and self.src[self.i] == "-":
            self.i += 1
            return ("neg", self.parse_unary())
        return self.parse_primary()

    def parse_primary(self):
        self.skip()
        if self.i >= self.n:
            raise PascalError("unexpected end")
        if self.src[self.i] == "'":
            text, self.i = _read_string(self.src, self.i)
            return ("str", text)
        if self.src[self.i].isdigit():
            m = re.match(r"\d+", self.src[self.i :])
            self.i += len(m.group(0))
            return ("num", int(m.group(0)))
        if self.src[self.i] == "(":
            self.i += 1
            expr = self.parse_expr()
            self.skip()
            if self.src[self.i] != ")":
                raise PascalError("expected )")
            self.i += 1
            return expr
        if self.src[self.i] == "[":
            self.i += 1
            items = []
            self.skip()
            if self.i < self.n and self.src[self.i] != "]":
                while True:
                    items.append(self.parse_expr())
                    self.skip()
                    if self.src[self.i] == ",":
                        self.i += 1
                        continue
                    break
            self.skip()
            if self.src[self.i] != "]":
                raise PascalError("expected ]")
            self.i += 1
            return ("list", items)
        word = self.eat_ident()
        return self.parse_postfix(("name", word))

    def parse_postfix(self, node):
        while True:
            self.skip()
            if self.i < self.n and self.src[self.i] == ".":
                self.i += 1
                name = self.eat_ident()
                node = ("dot", node, name)
                continue
            if self.i < self.n and self.src[self.i] == "(":
                self.i += 1
                args = []
                self.skip()
                if self.i < self.n and self.src[self.i] != ")":
                    while True:
                        args.append(self.parse_expr())
                        self.skip()
                        if self.src[self.i] == ",":
                            self.i += 1
                            continue
                        break
                if self.src[self.i] != ")":
                    raise PascalError("expected )")
                self.i += 1
                node = ("call", node, args)
                continue
            if self.i < self.n and self.src[self.i] == "[":
                self.i += 1
                index = self.parse_expr()
                self.skip()
                if self.src[self.i] != "]":
                    raise PascalError("expected ]")
                self.i += 1
                node = ("index", node, index)
                continue
            return node


class Connection:
    def __init__(self, oracle, label):
        self.oracle = oracle
        self.label = label
        self.params = {}
        self.connected = False
        self.connection_def = None
        self.session = None

    def set_connected(self, value, defs):
        self.connected = bool(value)
        if not self.connected:
            self.session = None
            return
        user = self.params.get("UserName") or self.params.get("User_Name")
        password = self.params.get("Password")
        database = self.params.get("Database")
        if self.connection_def and self.connection_def in defs:
            stored = defs[self.connection_def]
            user = _param_from_list(stored, "User_Name") or user
            password = _param_from_list(stored, "Password")
            database = _param_from_list(stored, "Database") or database
            self.params["UserName"] = user
            self.params["Password"] = password
            self.params["Database"] = database
        self.session = self.oracle.connect(user, password, database)
        self.oracle.attempts.append(
            {"user": user, "accepted": self.session is not None, "via": self.label}
        )
        if self.session is None:
            self.connected = False
            raise AuthFailed("database rejected the service login")


def _param_from_list(items, name):
    prefix = name + "="
    for item in items:
        if isinstance(item, str) and item.startswith(prefix):
            return item[len(prefix) :]
    return None


class StringList:
    def __init__(self):
        self.items = []

    def add(self, value):
        self.items.append(value)


class Oracle:
    """Minimal listener stand-in for the statements these routines execute.

    Password comparison is case-sensitive, matching Oracle Database 12.1
    SQL Language Reference, CREATE USER, IDENTIFIED BY password: a later
    connect must use the same case as the CREATE USER statement.
    """

    def __init__(self):
        self.users = {}
        self.grants = set()
        self.iqms_log = ""
        self.tablespaces = {"USERS", "TEMP"}
        self.attempts = []
        self.app_users = set()

    def connect(self, user, password, _database):
        if user is None:
            return None
        stored = self.users.get(str(user).upper())
        if stored is None or stored != password:
            return None
        return {"user": str(user).upper()}

    def has_select(self, user, table):
        return (user.upper(), "SELECT", table.upper()) in self.grants or user.upper() == "IQMS"

    def execute(self, sql, caller):
        text = " ".join(sql.split())
        upper = text.upper()
        created = re.search(
            r"CREATE\s+USER\s+(\w+)\s+IDENTIFIED\s+BY\s+(\"[^\"]+\"|\w+)",
            text,
            re.IGNORECASE,
        )
        if created:
            name = created.group(1)
            raw = created.group(2)
            if raw.startswith('"'):
                password = raw[1:-1]
            else:
                password = raw
            self.users[name.upper()] = password
            return None
        grant_select = re.search(
            r'GRANT\s+SELECT\s+ON\s+(\w+)\s+TO\s+"?(\w+)"?',
            text,
            re.IGNORECASE,
        )
        if grant_select:
            table = grant_select.group(1).upper()
            grantee = grant_select.group(2).upper()
            self.grants.add((grantee, "SELECT", table))
            return None
        if upper.startswith("GRANT "):
            return None
        if upper.startswith("DELETE "):
            return None
        inserted = re.search(
            r"INSERT\s+INTO\s+S_USER_GENERAL\s*\(USER_NAME\)\s*VALUES\s*\('([^']*)'\)",
            text,
            re.IGNORECASE,
        )
        if inserted:
            self.app_users.add(inserted.group(1).upper())
            return None
        selected_log = re.search(
            r"SELECT\s+IQMS_LOG\s+FROM\s+([\w.]+)",
            text,
            re.IGNORECASE,
        )
        if selected_log:
            if caller is None or not self.has_select(caller, "IQORDER2"):
                raise PascalError("select on the order settings table was not granted")
            return self.iqms_log
        users_q = re.search(
            r"FROM\s+DBA_USERS\s+WHERE\s+USERNAME\s*=\s*'([^']+)'",
            text,
            re.IGNORECASE,
        )
        if users_q:
            return 1 if users_q.group(1).upper() in self.users else 0
        spaces = re.search(
            r"FROM\s+USER_TABLESPACES\s+WHERE\s+TABLESPACE_NAME\s*=\s*UPPER\(TRIM\('([^']+)'\)\)",
            text,
            re.IGNORECASE,
        )
        if spaces:
            return 1 if spaces.group(1).upper() in self.tablespaces else 0
        raise PascalError("stand-in has no rule for SQL the product executed")


_PROPERTY_GETTERS = {
    "rtboxpassword": "getrtboxpassword",
    "rtboxconnection": "getrtboxconnection",
    "iqmspassword": "getiqmspassword",
    "iqmsconnection": "getiqmsconnection",
    "webiqdatabase": "getwebiqdatabase",
}


class Env:
    def __init__(self, unit_src: str, oracle: Oracle, registry: dict, ini: dict):
        self.unit_src = unit_src
        self.oracle = oracle
        self.registry = registry
        self.ini = ini
        self.defs = {}
        self.scopes = [self._builtins()]
        self.with_stack = []
        self.string_utils = None
        self.routines = {}

    def _builtins(self):
        return {
            "nil": None,
            "true": True,
            "false": False,
            "HKEY_LOCAL_MACHINE": "HKEY_LOCAL_MACHINE",
            "dtString": "dtString",
        }

    def load_routine(self, signature: str):
        routine = extract_routine(self.unit_src, signature)
        self.routines[routine.name.lower()] = routine
        return routine

    def call(self, name, args, owner=None):
        key = name.lower()
        if key in self.routines:
            return self._invoke(self.routines[key], args, owner)
        raise PascalError(f"no routine {name}")

    def _invoke(self, routine: Routine, args, owner):
        if len(args) != len(routine.params):
            raise PascalError(
                f"{routine.name} expected {len(routine.params)} args, got {len(args)}"
            )
        local = {name: None for name in routine.varnames}
        local.update({routine.params[i]: args[i] for i in range(len(args))})
        local["Result"] = ""
        local.update(routine.consts)
        if owner is not None:
            local["Self"] = owner
        added = []
        for key, nested in routine.nested.items():
            self.routines[key] = nested
            added.append(key)
        self.scopes.append(local)
        parser = Parser(routine.body)
        try:
            block = parser.parse_block()
            if parser.i < parser.n and parser.src[parser.i :].strip():
                leftover = parser.src[parser.i : parser.i + 40]
                raise PascalError(f"unparsed tail in {routine.name}: {leftover!r}")
            self.exec_stmt(block)
            return local.get("Result")
        except Returned as done:
            return done.value
        finally:
            self.scopes.pop()
            for key in added:
                self.routines.pop(key, None)

    def exec_stmt(self, stmt):
        kind = stmt[0]
        if kind == "block":
            for item in stmt[1]:
                self.exec_stmt(item)
            return
        if kind == "if":
            if self.truth(self.eval(stmt[1])):
                self.exec_stmt(stmt[2])
            elif stmt[3] is not None:
                self.exec_stmt(stmt[3])
            return
        if kind == "assign":
            self.assign(stmt[1], self.eval(stmt[2]))
            return
        if kind == "expr":
            self.eval(stmt[1])
            return
        if kind == "exit":
            value = self.eval(stmt[1]) if stmt[1] is not None else self.lookup("Result")
            raise Returned(value)
        if kind == "raise":
            raise PascalError(str(self.eval(stmt[1])))
        if kind == "for":
            var, start, stop, body = stmt[1], stmt[2], stmt[3], stmt[4]
            for value in range(int(self.eval(start)), int(self.eval(stop)) + 1):
                self.scopes[-1][var] = value
                self.exec_stmt(body)
            return
        if kind == "try":
            caught = None
            try:
                for item in stmt[1]:
                    self.exec_stmt(item)
            except (PascalError, AuthFailed) as exc:
                caught = exc
                if stmt[2] is not None:
                    for item in stmt[2]:
                        self.exec_stmt(item)
            finally:
                for item in stmt[3]:
                    self.exec_stmt(item)
            if caught is not None and stmt[2] is None:
                raise caught
            return
        if kind == "with":
            obj = self.eval(stmt[1])
            self.with_stack.append(obj)
            try:
                self.exec_stmt(stmt[2])
            finally:
                self.with_stack.pop()
            return
        raise PascalError(f"bad stmt {kind}")

    def truth(self, value):
        return bool(value)

    def assign(self, target, value):
        if target[0] == "name":
            name = target[1]
            if name.lower() == "result":
                self.scopes[-1]["Result"] = value
                return
            for scope in reversed(self.scopes[1:]):
                for key in list(scope):
                    if key.lower() == name.lower() and key.lower() not in ("self", "result"):
                        scope[key] = value
                        return
            self_obj = self._self()
            if isinstance(self_obj, dict):
                for key in list(self_obj):
                    if key.lower() == name.lower():
                        self_obj[key] = value
                        return
            self.scopes[-1][name] = value
            return
        if target[0] == "dot":
            obj = self.eval(target[1])
            attr = target[2]
            self._set_attr(obj, attr, value)
            return
        if target[0] == "index":
            index = int(self.eval(target[2]))
            if target[1][0] == "name" and target[1][1].lower() == "result":
                text = list(str(self.lookup("Result")))
                text[index - 1] = value
                self.scopes[-1]["Result"] = "".join(text)
                return
            base = self.eval(target[1])
            base[index] = value
            return
        raise PascalError(f"cannot assign {target[0]}")

    def _set_attr(self, obj, attr, value):
        low = attr.lower()
        if isinstance(obj, Connection):
            if low == "connected":
                obj.set_connected(value, self.defs)
                return
            if low == "connectiondefname":
                obj.connection_def = value
                return
            if low in ("driverid", "username", "password", "database"):
                key = {"driverid": "DriverID", "username": "UserName", "password": "Password", "database": "Database"}[low]
                obj.params[key] = value
                return
        if isinstance(obj, dict) and obj.get("__kind") == "params":
            key = {"driverid": "DriverID", "username": "UserName", "password": "Password", "database": "Database"}[low]
            obj["__conn"].params[key] = value
            return
        if isinstance(obj, dict):
            obj[attr] = value
            return
        setattr(obj, attr, value)

    def lookup(self, name):
        if name.lower() == "result":
            return self.scopes[-1].get("Result")
        for scope in reversed(self.scopes):
            if name in scope:
                return scope[name]
            for key, value in scope.items():
                if key.lower() == name.lower():
                    return value
        for obj in reversed(self.with_stack):
            if isinstance(obj, dict) and name in obj:
                return obj[name]
            if isinstance(obj, dict):
                for key, value in obj.items():
                    if key.lower() == name.lower():
                        return value
        self_obj = self._self()
        if isinstance(self_obj, dict):
            for key, value in self_obj.items():
                if key.lower() == name.lower():
                    return value
            mapped = _PROPERTY_GETTERS.get(name.lower())
            if mapped and mapped in self.routines:
                return self._invoke(self.routines[mapped], [], self_obj)
        if name.lower() in self.routines:
            return ("routine", name)
        raise PascalError(f"unknown name {name}")

    def _self(self):
        for scope in reversed(self.scopes):
            if "Self" in scope:
                return scope["Self"]
        return None

    def eval(self, node):
        kind = node[0]
        if kind == "str":
            return node[1]
        if kind == "num":
            return node[1]
        if kind == "name":
            word = node[1]
            low = word.lower()
            if low == "nil":
                return None
            if low == "true":
                return True
            if low == "false":
                return False
            if low == "registryvalues":
                return self._registry_values()
            if low == "inifilevalues":
                return self._ini_values()
            if low == "result":
                return self.lookup("Result")
            try:
                return self.lookup(word)
            except PascalError:
                return ("type", word)
        if kind == "list":
            return [self.eval(item) for item in node[1]]
        if kind == "not":
            return not self.truth(self.eval(node[1]))
        if kind == "neg":
            return -self.eval(node[1])
        if kind == "binop":
            return self._binop(node[1], node[2], node[3])
        if kind == "and":
            return self.truth(self.eval(node[1])) and self.truth(self.eval(node[2]))
        if kind == "or":
            return self.truth(self.eval(node[1])) or self.truth(self.eval(node[2]))
        if kind == "dot":
            obj = self.eval(node[1])
            name = node[2]
            # Delphi allows a parameterless constructor or method call without parentheses.
            if name.lower() in ("create", "free"):
                return self._call_method(obj, name, [])
            return self._get_attr(obj, name)
        if kind == "index":
            base = self.eval(node[1])
            index = self.eval(node[2])
            if isinstance(base, str):
                return base[int(index) - 1]
            if isinstance(base, list):
                return base[int(index) - 1]
            if isinstance(base, dict):
                return base[index]
            raise PascalError("bad index")
        if kind == "call":
            return self._call(node[1], [self.eval(arg) for arg in node[2]])
        raise PascalError(f"bad expr {kind}")

    def _binop(self, op, left, right):
        a = self.eval(left)
        b = self.eval(right)
        if op == "+":
            if isinstance(a, str) or isinstance(b, str):
                return str(a) + str(b)
            return a + b
        if op == "-":
            return a - b
        if op == "=":
            return a == b
        if op == "<>":
            return a != b
        if op == "<":
            return a < b
        if op == ">":
            return a > b
        if op == "<=":
            return a <= b
        if op == ">=":
            return a >= b
        if op == "xor":
            return int(a) ^ int(b)
        if op == "div":
            return int(a) // int(b)
        if op == "*":
            return a * b
        raise PascalError(f"op {op}")

    def _get_attr(self, obj, name):
        low = name.lower()
        if isinstance(obj, tuple) and obj and obj[0] == "routine":
            return ("bound", obj[1], name)
        if isinstance(obj, str) and low == "isnullorwhitespace":
            return ("whitespace", obj)
        if obj == "string" or (isinstance(obj, str) and obj == "string"):
            pass
        if isinstance(obj, Connection):
            if low == "params":
                return {"__kind": "params", "__conn": obj}
            if low == "connected":
                return obj.connected
            return obj.params.get(name)
        if isinstance(obj, dict) and obj.get("__kind") == "params":
            conn = obj["__conn"]
            key = {"driverid": "DriverID", "username": "UserName", "password": "Password", "database": "Database"}[low]
            return conn.params.get(key)
        if isinstance(obj, dict) and name in obj:
            return obj[name]
        if isinstance(obj, StringList):
            return getattr(obj, low)
        if obj is self._params_marker():
            return ("prop", low)
        raise PascalError(f"no attribute {name}")

    def _params_marker(self):
        return self.scopes[-1].get("Self")

    def _call(self, fn, args):
        if isinstance(fn, tuple) and fn[0] == "name":
            return self._call_name(fn[1], args, None)
        if isinstance(fn, tuple) and fn[0] == "dot":
            obj = self.eval(fn[1])
            return self._call_method(obj, fn[2], args)
        if isinstance(fn, tuple) and fn[0] == "whitespace":
            return _is_null_or_whitespace(args[0] if args else fn[1])
        if fn[0] == "name" if False else False:
            pass
        if isinstance(fn, tuple) and fn[0] == "call":
            target = self.eval(fn)
            return target
        # fn was already a name node inside call: Parser stores ("call", callee, args)
        # callee may be ("name", x) or ("dot", ...)
        raise PascalError(f"bad call {fn!r}")

    def _call_name(self, name, args, owner):
        low = name.lower()
        if low == "ansicomparetext":
            return 0 if str(args[0]).lower() == str(args[1]).lower() else 1
        if low == "format":
            return _delphi_format(args[0], args[1])
        if low == "getregistryvalue":
            return self._registry_get(args[0], args[1], args[2], args[4] if len(args) > 4 else "")
        if low == "loadstrfromlocalmachineregistry":
            return self.registry.get(("HKEY_LOCAL_MACHINE", args[0], args[1]), "")
        if low == "aescsharpcompatibledecrypt":
            token = self.registry.get("__decrypt__", {}).get(args[0])
            if token is None:
                # Dependence-preserving stand-in. The empty-secret path does not call this.
                return "decrypted:" + str(args[0])
            return token
        if low == "charxor":
            return self._charxor(args[0])
        if low == "repl":
            return str(args[0]) * int(args[1])
        if low == "length":
            return len(args[0]) if args[0] is not None else 0
        if low == "copy":
            text, start, count = args
            return text[int(start) - 1 : int(start) - 1 + int(count)]
        if low == "ord":
            return ord(args[0])
        if low == "chr":
            return chr(int(args[0]))
        if low == "setlength":
            return None
        if low == "trim":
            return str(args[0]).strip()
        if low == "uppercase":
            return str(args[0]).upper()
        if low in ("exception.create", "exception.createfmt"):
            return args[0] if args else "error"
        if low == "getinifilevaluewithinheritance":
            return self._ini_get(args[1], args[2], args[4] if len(args) > 4 else "")
        if low == "selectvalueasstring":
            return self.oracle.execute(args[0], "IQMS")
        if low == "selectvalueasinteger":
            return self.oracle.execute(args[0], "IQMS")
        if low == "selectvaluefmtasinteger":
            sql = _delphi_format(args[0], args[1])
            return self.oracle.execute(sql, "IQMS")
        if low == "executecommand":
            return self.oracle.execute(args[0], "IQMS")
        if low == "execsqlscalar":
            raise PascalError("ExecSQLScalar needs a connection receiver")
        if low in self.routines:
            return self._invoke(self.routines[low], args, owner or self.lookup("Self") if _has(self, "Self") else None)
        if low in ("getrtboxpassword", "getrtboxconnection", "getiqmspassword", "getiqmsconnection", "getwebiqdatabase"):
            return self._invoke(self.routines[low], args, self.lookup("Self"))
        raise PascalError(f"call {name}")

    def _has_self(self):
        try:
            self.lookup("Self")
            return True
        except PascalError:
            return False

    def _call_method(self, obj, name, args):
        low = name.lower()
        if obj == "string" or (isinstance(obj, tuple) and obj[0] == "name" and obj[1].lower() == "string"):
            if low == "isnullorwhitespace":
                return _is_null_or_whitespace(args[0])
        if isinstance(obj, tuple) and obj[0] == "name" and obj[1].lower() == "string":
            if low == "isnullorwhitespace":
                return _is_null_or_whitespace(args[0])
        if isinstance(obj, tuple) and obj[0] == "prop":
            return self._call_name("get" + obj[1], args, self.lookup("Self"))
        if isinstance(obj, dict) and obj.get("__self__"):
            mapped = {
                "rtboxpassword": "getrtboxpassword",
                "rtboxconnection": "getrtboxconnection",
                "iqmspassword": "getiqmspassword",
                "iqmsconnection": "getiqmsconnection",
                "webiqdatabase": "getwebiqdatabase",
            }.get(low)
            if mapped:
                return self._invoke(self.routines[mapped], args, obj)
        if isinstance(obj, Connection):
            if low == "execsqlscalar":
                if obj.session is None:
                    raise PascalError("query before connect")
                return self.oracle.execute(args[0], obj.session["user"])
            if low == "free":
                return None
        if isinstance(obj, tuple) and obj[0] == "type":
            type_name = obj[1].lower()
            if type_name == "tfdconnection" and low == "create":
                return Connection(self.oracle, "TFDConnection")
            if type_name == "tstringlist" and low == "create":
                return StringList()
            if type_name == "string" and low == "isnullorwhitespace":
                return _is_null_or_whitespace(args[0])
            if type_name == "fdmanager" and low == "isconnectiondef":
                return args[0] in self.defs
            if type_name == "fdmanager" and low == "addconnectiondef":
                self.defs[args[0]] = args[2].items if isinstance(args[2], StringList) else args[2]
                return None
            if type_name == "fdmanager" and low == "modifyconnectiondef":
                self.defs[args[0]] = args[1].items if isinstance(args[1], StringList) else args[1]
                return None
            if type_name == "exception" and low in ("create", "createfmt"):
                return str(args[0]) if args else "error"
            return ("type", obj[1] + "." + name)
        if isinstance(obj, StringList) and low == "add":
            obj.add(args[0])
            return None
        if isinstance(obj, StringList) and low == "free":
            return None
        if low == "free" and obj is None:
            return None
        # Type constructors seen as names inside dot calls are handled above.
        if isinstance(obj, tuple) and obj[0] == "name":
            return self._call_method(obj, name, args)
        raise PascalError(f"method {name} on {type(obj).__name__}")

    def _registry_get(self, root, key, name, default):
        # GetRegistryValue assigns aDefault when the key opens and the value is absent.
        # A missing key leaves the Variant unassigned; callers compare that to ''.
        store = self.registry.get((root, key), None)
        if store is None:
            return ""
        if name not in store:
            return default
        return str(store[name]).strip()

    def _ini_get(self, section, ident, default):
        return self.ini.get((section, ident), default)

    def _registry_values(self):
        if not hasattr(self, "_reg_cache"):
            self._reg_cache = _parse_record_array(self.unit_src, "RegistryValues")
        return self._reg_cache

    def _ini_values(self):
        if not hasattr(self, "_ini_cache"):
            self._ini_cache = _parse_record_array(self.unit_src, "IniFileValues")
        return self._ini_cache

    def _charxor(self, text):
        if self.string_utils is None:
            path = ROOT / "BigWebApp/Components/IQWebCommon/Source/IQMS.Common.StringUtils.pas"
            self.string_utils = path.read_text(encoding="utf-8", errors="replace")
        routine = extract_routine(self.string_utils, "CharXOR")
        repl = extract_routine(self.string_utils, "Repl")
        previous = self.routines.get("charxor"), self.routines.get("repl")
        self.routines["charxor"] = routine
        self.routines["repl"] = repl
        try:
            return self._invoke(routine, [text], None)
        finally:
            if previous[0] is None:
                self.routines.pop("charxor", None)
            else:
                self.routines["charxor"] = previous[0]
            if previous[1] is None:
                self.routines.pop("repl", None)
            else:
                self.routines["repl"] = previous[1]


def _has(env, name):
    try:
        env.lookup(name)
        return True
    except PascalError:
        return False


def _is_null_or_whitespace(value):
    if value is None:
        return True
    return str(value).strip() == ""


def _delphi_format(fmt, args):
    if not isinstance(args, list):
        args = [args]
    out = []
    i = 0
    ai = 0
    while i < len(fmt):
        if fmt[i] == "%":
            if i + 1 < len(fmt) and fmt[i + 1] == "%":
                out.append("%")
                i += 2
                continue
            j = i + 1
            while j < len(fmt) and fmt[j] not in "sdxuf":
                j += 1
            spec = fmt[j] if j < len(fmt) else "s"
            value = args[ai]
            ai += 1
            out.append(str(value))
            i = j + 1
            continue
        out.append(fmt[i])
        i += 1
    return "".join(out)


def _parse_record_array(src: str, name: str):
    clean = strip_comments(src)
    marker = re.search(rf"{name}\s*:\s*array\[\d+\.\.\d+\]\s*of\s+\w+\s*=", clean)
    if not marker:
        raise PascalError(f"const {name} not found")
    i = clean.find("(", marker.end())
    depth = 0
    start = i
    while i < len(clean):
        if clean[i] == "(":
            depth += 1
        elif clean[i] == ")":
            depth -= 1
            if depth == 0:
                body = clean[start + 1 : i]
                break
        elif clean[i] == "'":
            _text, i = _read_string(clean, i)
            continue
        i += 1
    records = []
    current = {}
    # Split top-level records.
    depth = 0
    buf = []
    for ch in body:
        if ch == "(":
            if depth > 0:
                buf.append(ch)
            depth += 1
            continue
        if ch == ")":
            depth -= 1
            if depth == 0:
                records.append("".join(buf))
                buf = []
                continue
            buf.append(ch)
            continue
        if depth >= 1:
            buf.append(ch)
    parsed = []
    for record in records:
        fields = {}
        for part in record.split(";"):
            if ":" not in part:
                continue
            key, value = part.split(":", 1)
            key = key.strip()
            value = value.strip()
            if value.startswith("'"):
                text, _next = _read_string(value, 0)
                fields[key] = text
            else:
                fields[key] = value
        if fields:
            parsed.append(fields)
    return parsed


def read_unit(*parts: str) -> str:
    path = ROOT.joinpath(*parts)
    return path.read_text(encoding="utf-8", errors="replace")


def usable(value) -> bool:
    return isinstance(value, str) and value != ""


def require(condition: bool, message: str) -> None:
    if not condition:
        raise AssertionError(message)

# Spec for the carrier-account save.
#
# These tests fail while SaveOptions interpolates an edit into
# ExecuteCommandFmt. They pass once that update is a bound parameter
# (account text and carrier id) and a crafted account number can no longer
# change the statement. Run from the repository root:
#
#   python3 BigWebApp/Tests/fedex_account_sqli/test_carrier_account_sqli.py
#
# The harness follows the product source it reads. It is not a second copy of
# the SQL string. IQFormat calls System.SysUtils.Format; this file implements
# the %s and %.0f conversions that call uses (string inserted as-is, fixed
# decimal point, no thousands separator). ExecuteCommand copies the formatted
# text into the command after replacing the marker it names, with parameter
# creation left off, and the test executes that command text.

import re
import sqlite3
import unittest
from pathlib import Path


REPO = Path(__file__).resolve().parents[3]
SHIPMAN = REPO / "BigWebApp" / "Modules" / "Iqshipman"
DATALIB = REPO / "BigWebApp" / "Components" / "IQWebVcl" / "Source" / "IQMS.Common.DataLib.pas"
NLS = REPO / "BigWebApp" / "Components" / "IQWebCommon" / "Source" / "IQMS.Common.NLS.pas"
DATACONST = REPO / "BigWebApp" / "Components" / "IQWebCommon" / "Source" / "IQMS.Common.DataConst.pas"
BOOLEAN = REPO / "BigWebApp" / "Components" / "IQWebCommon" / "Source" / "IQMS.Common.Boolean.pas"

UNITS = [
    SHIPMAN / "shipman_account_base.pas",
    SHIPMAN / "shipman_account_fedex.pas",
    SHIPMAN / "shipman_account_fedex_express.pas",
    SHIPMAN / "shipman_account_fedex_smartpost.pas",
    SHIPMAN / "shipman_account_ups.pas",
    SHIPMAN / "shipman_account_usps.pas",
]

AUTHORIZED_ID = 10
OTHER_ID = 99
SECRET = "CUSTOMER-ROW-1"
BENIGN_ACCOUNT = "100200300"
SUBQUERY_ACCOUNT = (
    "' || (select secret from sensitive_data where id = 1) || '"
)
RETARGET_ACCOUNT = "x' where id = %d --" % OTHER_ID


class PasException(Exception):
    pass


class SaveResult:
    def __init__(self, carriers, sensitive, options, sql_log, error):
        self.carriers = carriers
        self.sensitive = sensitive
        self.options = options
        self.sql_log = sql_log
        self.error = error


def read_text(path):
    return path.read_bytes().decode("latin-1")


def delphi_format(fmt, args):
    """System.SysUtils.Format for the specifiers these saves use.

    IQFormat assigns North American format settings and then calls Format.
    %s copies its argument unchanged. %.Nf is a fixed-point number with N
    digits and a '.' decimal separator, without a thousands separator.
    """
    out = []
    i = 0
    arg_index = 0
    while i < len(fmt):
        if fmt[i] != "%":
            out.append(fmt[i])
            i += 1
            continue
        if fmt.startswith("%%", i):
            out.append("%")
            i += 2
            continue
        i += 1
        while i < len(fmt) and fmt[i] in "-+#0 ":
            i += 1
        while i < len(fmt) and fmt[i].isdigit():
            i += 1
        precision = None
        if i < len(fmt) and fmt[i] == ".":
            i += 1
            start = i
            while i < len(fmt) and fmt[i].isdigit():
                i += 1
            precision = int(fmt[start:i] or "0")
        if i >= len(fmt):
            raise PasException("truncated format specifier in %r" % fmt)
        spec = fmt[i]
        i += 1
        if arg_index >= len(args):
            raise PasException("not enough format arguments for %r" % fmt)
        value = args[arg_index]
        arg_index += 1
        if spec == "s":
            out.append("" if value is None else str(value))
        elif spec == "d":
            out.append(str(int(value)))
        elif spec in ("f", "n", "m"):
            digits = 2 if precision is None else precision
            out.append(format(float(value), ".%df" % digits))
        else:
            raise PasException("format specifier %%%s is not used by this path" % spec)
    if arg_index != len(args):
        raise PasException("unused format arguments for %r" % fmt)
    return "".join(out)


def tokenize(text):
    tokens = []
    i = 0
    line = 1
    n = len(text)
    while i < n:
        ch = text[i]
        if ch == "\n":
            line += 1
            i += 1
            continue
        if ch in " \t\r\x0b\x0c":
            i += 1
            continue
        if ch == "/" and text.startswith("//", i):
            i += 2
            while i < n and text[i] != "\n":
                i += 1
            continue
        if ch == "{":
            i += 1
            while i < n and text[i] != "}":
                if text[i] == "\n":
                    line += 1
                i += 1
            i = min(i + 1, n)
            continue
        if ch == "(" and text.startswith("(*", i):
            i += 2
            while i < n and not text.startswith("*)", i):
                if text[i] == "\n":
                    line += 1
                i += 1
            i = min(i + 2, n)
            continue
        if ch == "'":
            i += 1
            chars = []
            while i < n:
                if text[i] == "'":
                    if text.startswith("''", i):
                        chars.append("'")
                        i += 2
                        continue
                    i += 1
                    break
                if text[i] == "\n":
                    line += 1
                chars.append(text[i])
                i += 1
            tokens.append(("string", "".join(chars), line))
            continue
        if ch == "$" and i + 1 < n and text[i + 1] in "0123456789abcdefABCDEF":
            i += 1
            start = i
            while i < n and text[i] in "0123456789abcdefABCDEF":
                i += 1
            tokens.append(("number", float(int(text[start:i], 16)), line))
            continue
        if ch.isdigit():
            start = i
            while i < n and text[i].isdigit():
                i += 1
            if i < n and text[i] == "." and i + 1 < n and text[i + 1].isdigit():
                i += 1
                while i < n and text[i].isdigit():
                    i += 1
                tokens.append(("number", float(text[start:i]), line))
            else:
                tokens.append(("number", float(int(text[start:i])), line))
            continue
        if ch.isalpha() or ch == "_":
            start = i
            i += 1
            while i < n and (text[i].isalnum() or text[i] == "_"):
                i += 1
            tokens.append(("ident", text[start:i], line))
            continue
        for op in (":=", "<>", "<=", ">=", ".."):
            if text.startswith(op, i):
                tokens.append(("op", op, line))
                i += len(op)
                break
        else:
            tokens.append(("op", ch, line))
            i += 1
    tokens.append(("eof", "", line))
    return tokens


class Parser:
    def __init__(self, tokens):
        self.tokens = tokens
        self.i = 0

    def cur(self):
        return self.tokens[self.i]

    def check(self, kind, value=None):
        token = self.cur()
        if token[0] != kind:
            return False
        if value is None:
            return True
        if kind == "ident":
            return token[1].lower() == value.lower()
        return token[1] == value

    def take(self, kind=None, value=None):
        token = self.cur()
        if kind is not None and not self.check(kind, value):
            raise PasException(
                "line %s: expected %s %s, got %s"
                % (token[2], kind, value or "", token)
            )
        self.i += 1
        return token

    def parse_procedure_body(self):
        self.take("ident", "begin")
        statements = []
        while not self.check("ident", "end"):
            statements.append(self.parse_statement())
        self.take("ident", "end")
        return statements

    def finish(self):
        if self.check("op", ";"):
            self.take("op", ";")

    def parse_statement(self):
        if self.check("ident", "begin"):
            self.take()
            statements = []
            while not self.check("ident", "end"):
                statements.append(self.parse_statement())
            self.take("ident", "end")
            self.finish()
            return ("block", statements)
        if self.check("ident", "if"):
            self.take()
            condition = self.parse_expr()
            self.take("ident", "then")
            then_stmt = self.parse_statement()
            else_stmt = None
            if self.check("ident", "else"):
                self.take()
                else_stmt = self.parse_statement()
            return ("if", condition, then_stmt, else_stmt)
        if self.check("ident", "raise"):
            self.take()
            expr = self.parse_expr()
            self.finish()
            return ("raise", expr)
        if self.check("ident", "inherited"):
            self.take()
            name = None
            if self.check("ident") and self.cur()[1].lower() not in (
                "end",
                "else",
            ):
                name = self.take("ident")[1]
                if self.check("op", "("):
                    # inherited Create(...) is not used on this path.
                    self.parse_args()
            self.finish()
            return ("inherited", name)
        if self.check("ident", "try"):
            raise PasException("line %s: try is not part of the save path" % self.cur()[2])
        expr = self.parse_expr()
        if self.check("op", ":="):
            self.take()
            value = self.parse_expr()
            self.finish()
            return ("assign", expr, value)
        self.finish()
        return ("expr", expr)

    def parse_expr(self):
        return self.parse_comparison()

    def parse_comparison(self):
        left = self.parse_add()
        while self.check("op") and self.cur()[1] in ("=", "<>", "<", ">", "<=", ">="):
            op = self.take("op")[1]
            right = self.parse_add()
            left = ("cmp", op, left, right)
        return left

    def parse_add(self):
        left = self.parse_mul()
        while self.check("op") and self.cur()[1] in ("+", "-"):
            op = self.take("op")[1]
            right = self.parse_mul()
            left = ("binop", op, left, right)
        return left

    def parse_mul(self):
        left = self.parse_unary()
        while self.check("op") and self.cur()[1] in ("*", "/"):
            op = self.take("op")[1]
            right = self.parse_unary()
            left = ("binop", op, left, right)
        return left

    def parse_unary(self):
        if self.check("ident", "not"):
            self.take()
            return ("not", self.parse_unary())
        if self.check("op", "-"):
            self.take()
            return ("neg", self.parse_unary())
        return self.parse_postfix()

    def parse_postfix(self):
        expr = self.parse_primary()
        while True:
            if self.check("op", "("):
                args = self.parse_args()
                expr = ("call", expr, args)
            elif self.check("op", "."):
                self.take()
                name = self.take("ident")[1]
                expr = ("dot", expr, name)
            elif self.check("op", "["):
                self.take()
                inner = self.parse_expr()
                self.take("op", "]")
                expr = ("index", expr, inner)
            else:
                break
        return expr

    def parse_primary(self):
        if self.check("string"):
            return ("string", self.take("string")[1])
        if self.check("number"):
            return ("number", self.take("number")[1])
        if self.check("ident"):
            return ("ident", self.take("ident")[1])
        if self.check("op", "("):
            self.take()
            expr = self.parse_expr()
            self.take("op", ")")
            return expr
        if self.check("op", "["):
            return ("array", self.parse_array())
        token = self.cur()
        raise PasException("line %s: unexpected %s" % (token[2], token))

    def parse_args(self):
        self.take("op", "(")
        args = []
        if not self.check("op", ")"):
            args.append(self.parse_expr())
            while self.check("op", ","):
                self.take()
                args.append(self.parse_expr())
        self.take("op", ")")
        return args

    def parse_array(self):
        self.take("op", "[")
        items = []
        if not self.check("op", "]"):
            items.append(self.parse_expr())
            while self.check("op", ","):
                self.take()
                items.append(self.parse_expr())
        self.take("op", "]")
        return items


def procedure_spans(text):
    tokens = tokenize(text)
    spans = []
    for index, token in enumerate(tokens):
        if token[0] != "ident" or token[1].lower() != "procedure":
            continue
        if index + 3 >= len(tokens):
            continue
        cls, dot, name = tokens[index + 1], tokens[index + 2], tokens[index + 3]
        if cls[0] != "ident" or dot != ("op", ".", dot[2]) or name[0] != "ident":
            continue
        cursor = index + 4
        if cursor < len(tokens) and tokens[cursor][0] == "op" and tokens[cursor][1] == "(":
            depth = 0
            while cursor < len(tokens):
                if tokens[cursor][0] == "op" and tokens[cursor][1] == "(":
                    depth += 1
                elif tokens[cursor][0] == "op" and tokens[cursor][1] == ")":
                    depth -= 1
                    if depth == 0:
                        cursor += 1
                        break
                cursor += 1
        while cursor < len(tokens) and not (
            tokens[cursor][0] == "ident" and tokens[cursor][1].lower() == "begin"
        ):
            if tokens[cursor][0] == "ident" and tokens[cursor][1].lower() == "procedure":
                break
            cursor += 1
        else:
            if (
                cursor < len(tokens)
                and tokens[cursor][1].lower() == "begin"
                and name[1].lower() in ("btnokclick", "validateoptions", "saveoptions")
            ):
                body = Parser(tokens[cursor:]).parse_procedure_body()
                spans.append((cls[1], name[1], body))
            continue
        continue
    return spans


class Program:
    def __init__(self):
        self.parents = {}
        self.fields = {}
        self.methods = {}
        self.default_connection = None
        self.replacements = []
        self.format_is_raw = False
        self.bool_to_yn = None
        for path in UNITS:
            text = read_text(path)
            self._classes(text)
            for cls, name, body in procedure_spans(text):
                self.methods[(cls.lower(), name.lower())] = (cls, name, body)
        self._load_runtime()

    def _classes(self, text):
        for match in re.finditer(
            r"(\w+)\s*=\s*class\s*\(\s*(\w+)\s*\)",
            text,
            flags=re.IGNORECASE,
        ):
            self.parents[match.group(1)] = match.group(2)
        for match in re.finditer(
            r"^\s*(\w+)\s*:\s*(TUniEdit|TUniCheckBox|TUniComboBox|TUniDBComboBox)\s*;",
            text,
            flags=re.IGNORECASE | re.MULTILINE,
        ):
            # Field lists are collected per class below.
            pass
        for cls in list(self.parents):
            self.fields.setdefault(cls, {})
        class_names = set(self.parents)
        current = None
        for line in text.splitlines():
            header = re.match(r"\s*(\w+)\s*=\s*class\b", line, flags=re.IGNORECASE)
            if header and header.group(1) in class_names:
                current = header.group(1)
                self.fields.setdefault(current, {})
                continue
            if current and re.match(r"\s*(public|private|protected|published|end)\b", line, flags=re.IGNORECASE):
                if line.strip().lower().startswith("end"):
                    current = None
                continue
            if current:
                field = re.match(
                    r"\s*(\w+)\s*:\s*(TUniEdit|TUniCheckBox|TUniComboBox|TUniDBComboBox)\s*;",
                    line,
                    flags=re.IGNORECASE,
                )
                if field:
                    self.fields[current][field.group(1)] = field.group(2)

    def _load_runtime(self):
        const_text = read_text(DATACONST)
        match = re.search(
            r"cnstFDConnectionName\s*=\s*'([^']*)'",
            const_text,
            flags=re.IGNORECASE,
        )
        if not match:
            raise PasException("cnstFDConnectionName is not in %s" % DATACONST)
        self.default_connection = match.group(1)

        nls = read_text(NLS)
        iq_format = re.search(
            r"function\s+IQFormat\s*\(.*?\)\s*:\s*string\s*;\s*begin(?P<body>.*?)end\s*;",
            nls,
            flags=re.IGNORECASE | re.DOTALL,
        )
        if not iq_format:
            raise PasException("IQFormat was not found")
        body = iq_format.group("body")
        if re.search(r"Result\s*:=\s*Format\s*\(\s*S\s*,\s*Args\s*\)", body, flags=re.IGNORECASE):
            self.format_is_raw = True
        else:
            raise PasException("IQFormat no longer calls Format(S, Args); the harness does not know the new body")

        datalib = read_text(DATALIB)
        replace_at = datalib.lower().find("replacestr")
        command_at = datalib.lower().rfind("procedure executecommand", 0, replace_at)
        body_end = datalib.lower().find("\nend;", replace_at)
        if replace_at < 0 or command_at < 0 or body_end < 0:
            raise PasException("ExecuteCommand(TFDConnection) was not found")
        signature = datalib[command_at:replace_at]
        if not re.search(r"AConnection\s*:\s*TFDConnection", signature, flags=re.IGNORECASE):
            raise PasException("ReplaceStr is not in ExecuteCommand(TFDConnection)")
        body = datalib[command_at:body_end]
        self.replacements = re.findall(
            r"ReplaceStr\s*\(\s*.+?\s*,\s*'((?:''|[^'])*)'\s*,\s*'((?:''|[^'])*)'\s*\)",
            body,
            flags=re.IGNORECASE | re.DOTALL,
        )
        if not self.replacements:
            raise PasException("ExecuteCommand does not show ReplaceStr")
        if not re.search(r"ParamCreate\s*:=\s*FALSE", body, flags=re.IGNORECASE):
            raise PasException("ExecuteCommand no longer forces ParamCreate off")
        if not re.search(r"CommandText\.Text\s*:=", body, flags=re.IGNORECASE):
            raise PasException("ExecuteCommand does not assign CommandText")
        if not re.search(r"\bExecute\s*;", body):
            raise PasException("ExecuteCommand does not call Execute")

        boolean = read_text(BOOLEAN)
        as_yn = re.search(
            r"class\s+function\s+TIQBoolean\.AsYN\s*\(.*?\)\s*:\s*ShortString\s*;\s*begin(?P<body>.*?)end\s*;",
            boolean,
            flags=re.IGNORECASE | re.DOTALL,
        )
        if not as_yn:
            raise PasException("TIQBoolean.AsYN was not found")
        yn_body = as_yn.group("body")
        yes = re.search(r"Result\s*:=\s*'([^']*)'\s*;[^']*else\s*Result\s*:=\s*'([^']*)'", yn_body, flags=re.IGNORECASE | re.DOTALL)
        if not yes:
            # The source is `if Value then Result := 'Y' else Result := 'N'`.
            yes = re.search(
                r"if\s+Value\s+then\s*Result\s*:=\s*'([^']*)'\s*else\s*Result\s*:=\s*'([^']*)'",
                yn_body,
                flags=re.IGNORECASE | re.DOTALL,
            )
        if not yes:
            raise PasException("AsYN does not assign the two result literals this path needs")
        self.bool_to_yn = (yes.group(1), yes.group(2))

    def parent_of(self, class_name):
        for name, parent in self.parents.items():
            if name.lower() == class_name.lower():
                return parent
        return None

    def find_impl(self, class_name, method):
        seen = set()
        current = class_name
        while current and current.lower() not in seen:
            seen.add(current.lower())
            key = (current.lower(), method.lower())
            if key in self.methods:
                return self.methods[key]
            current = self.parent_of(current)
        raise PasException("no body for %s.%s" % (class_name, method))

    def field_map(self, class_name):
        fields = {}
        chain = []
        current = class_name
        seen = set()
        while current and current.lower() not in seen:
            seen.add(current.lower())
            chain.append(current)
            current = self.parent_of(current)
        for name in reversed(chain):
            for cls, declared in self.fields.items():
                if cls.lower() == name.lower():
                    fields.update(declared)
        return fields


class FormSession:
    def __init__(self, program, class_name, edits, checked, carrier_id, connection):
        self.program = program
        self.class_name = class_name
        self.edits = {name.lower(): value for name, value in edits.items()}
        self.checked = {name.lower(): value for name, value in checked.items()}
        self.carrier_id = carrier_id
        self.connection = connection
        self.options = {}
        self.sql_log = []
        self.connected = True

    def press_ok(self):
        _cls, name, body = self.program.find_impl(
            "TFrmShipManAccountBase", "btnOkClick"
        )
        self._statements(body, "TFrmShipManAccountBase", name)

    def _statements(self, statements, lexical_class, method_name):
        for statement in statements:
            self._statement(statement, lexical_class, method_name)

    def _statement(self, statement, lexical_class, method_name):
        kind = statement[0]
        if kind == "block":
            self._statements(statement[1], lexical_class, method_name)
        elif kind == "if":
            if self._eval(statement[1]):
                self._statement(statement[2], lexical_class, method_name)
            elif statement[3] is not None:
                self._statement(statement[3], lexical_class, method_name)
        elif kind == "raise":
            value = self._eval(statement[1])
            raise PasException(str(value))
        elif kind == "inherited":
            parent = self.program.parent_of(lexical_class)
            target = statement[1] or method_name
            cls, name, body = self.program.find_impl(parent, target)
            self._statements(body, cls, name)
        elif kind == "assign":
            target = statement[1]
            if target[0] == "ident" and target[1].lower() == "modalresult":
                return
            self._assign(target, self._eval(statement[2]))
        elif kind == "expr":
            self._call_statement(statement[1], lexical_class, method_name)
        else:
            raise PasException("cannot execute %s" % kind)

    def _call_statement(self, expr, lexical_class, method_name):
        if expr[0] == "ident" and self._has_method(self.class_name, expr[1]):
            cls, name, body = self.program.find_impl(self.class_name, expr[1])
            self._statements(body, cls, name)
            return
        self._eval(expr)

    def _has_method(self, class_name, method):
        try:
            self.program.find_impl(class_name, method)
            return True
        except PasException:
            return False

    def _assign(self, target, value):
        param = self._param_lvalue(target)
        if param is not None:
            code, kind = param
            self.options[code.lower()] = value
            return
        if target[0] == "ident" and target[1].lower() == "modalresult":
            return
        if (
            target[0] == "dot"
            and target[2].lower() == "text"
            and target[1][0] == "ident"
        ):
            self.edits[target[1][1].lower()] = "" if value is None else str(value)
            return
        raise PasException("assignment to %s is not on the save path" % (target,))

    def _param_lvalue(self, target):
        if target[0] != "dot" or target[2].lower() not in ("asstring", "asboolean"):
            return None
        call = target[1]
        if call[0] != "call":
            return None
        callee = call[1]
        if not (callee[0] == "dot" and callee[2].lower() == "parambyname"):
            return None
        code = self._eval(call[2][0])
        return code, target[2].lower()

    def _eval(self, expr):
        kind = expr[0]
        if kind == "string":
            return expr[1]
        if kind == "number":
            return expr[1]
        if kind == "ident":
            name = expr[1]
            lowered = name.lower()
            if lowered == "true":
                return True
            if lowered == "false":
                return False
            if lowered == "fcarrierid":
                return self.carrier_id
            if lowered in self.edits:
                return self.edits[lowered]
            raise PasException("unknown value %s" % name)
        if kind == "dot":
            base, field = expr[1], expr[2]
            if base[0] == "ident" and field.lower() == "text":
                return self.edits.get(base[1].lower(), "")
            if base[0] == "ident" and field.lower() == "checked":
                return self.checked.get(base[1].lower(), False)
            if base[0] == "call" and field.lower() == "asstring":
                code, _kind = self._param_lvalue(("dot", base, "AsString"))
                return self.options.get(str(code).lower(), "")
            raise PasException("unknown field %s" % field)
        if kind == "call":
            return self._call(expr[1], [self._eval(arg) for arg in expr[2]])
        if kind == "array":
            return [self._eval(item) for item in expr[1]]
        if kind == "cmp":
            op, left, right = expr[1], self._eval(expr[2]), self._eval(expr[3])
            return {
                "=": left == right,
                "<>": left != right,
                "<": left < right,
                ">": left > right,
                "<=": left <= right,
                ">=": left >= right,
            }[op]
        if kind == "binop":
            op, left, right = expr[1], self._eval(expr[2]), self._eval(expr[3])
            if op == "+":
                if isinstance(left, str) or isinstance(right, str):
                    return str(left) + str(right)
                return left + right
            if op == "-":
                return left - right
            if op == "*":
                return left * right
            if op == "/":
                return left / right
        if kind == "not":
            return not self._eval(expr[1])
        if kind == "neg":
            return -self._eval(expr[1])
        raise PasException("cannot evaluate %s" % kind)

    def _call(self, callee, args):
        name = self._callee_name(callee).lower()
        if name == "trim":
            return str(args[0]).strip()
        if name in ("exception.create", "exception.createfmt"):
            return args[0]
        if name.endswith("booltoyn"):
            yes, no = self.program.bool_to_yn
            return yes if args[0] else no
        if name.endswith("executecommandfmt"):
            self._execute_command_fmt(args)
            return None
        if name.endswith("executecommandparam"):
            self._execute_command_param(args)
            return None
        if name.endswith("executecommand"):
            self._execute_command(args[0], args[1] if len(args) > 1 else self.program.default_connection)
            return None
        if name == "format":
            return delphi_format(args[0], args[1])
        raise PasException("call %s is not on the save path" % name)

    def _callee_name(self, expr):
        if expr[0] == "ident":
            return expr[1]
        if expr[0] == "dot":
            return self._callee_name(expr[1]) + "." + expr[2]
        raise PasException("callee %s" % (expr,))

    def _execute_command_fmt(self, args):
        if not self.program.format_is_raw:
            raise PasException("IQFormat is not a raw Format call")
        formatted = delphi_format(args[0], list(args[1]))
        connection = args[2] if len(args) > 2 else self.program.default_connection
        self._execute_command(formatted, connection)

    def _execute_command(self, sql, connection):
        if connection != self.program.default_connection:
            raise PasException("save used connection %s" % connection)
        if not self.connected:
            return
        text = sql
        for old, new in self.program.replacements:
            old = old.replace("''", "'")
            new = new.replace("''", "'")
            text = text.replace(old, new)
        self._run_sql(text, {})

    def _execute_command_param(self, args):
        sql = args[0]
        names = args[1]
        values = args[2]
        if not isinstance(names, list) or not isinstance(values, list):
            raise PasException("ExecuteCommandParam arguments are not lists")
        if len(names) != len(values):
            raise PasException("parameter names and values differ")
        bound = {}
        for name, value in zip(names, values):
            bound[str(name).split(";")[0].lower()] = value
        self._run_sql(sql, bound)

    def _run_sql(self, sql, bound):
        self.sql_log.append(sql)
        if bound:
            transformed, ordered = self._bind(sql, bound)
            try:
                self.connection.execute(transformed, ordered)
            except sqlite3.Error as error:
                raise PasException(str(error))
            return
        stripped = sql.strip()
        if ";" in self._outside_literals(stripped):
            raise PasException("the command has more than one statement")
        try:
            self.connection.execute(stripped)
        except sqlite3.Error as error:
            raise PasException(str(error))

    def _bind(self, sql, bound):
        ordered = []

        def replace(match):
            name = match.group(1).lower()
            if name not in bound:
                raise PasException("parameter %s has no value" % name)
            ordered.append(bound[name])
            return "?"

        transformed = re.sub(r":([A-Za-z_][A-Za-z0-9_]*)", replace, sql)
        return transformed, ordered

    def _outside_literals(self, sql):
        marks = []
        i = 0
        in_string = False
        while i < len(sql):
            if sql[i] == "'":
                if in_string and sql.startswith("''", i):
                    i += 2
                    continue
                in_string = not in_string
                i += 1
                continue
            if not in_string and sql[i] == ";":
                marks.append(i)
            i += 1
        return marks


def build_database():
    connection = sqlite3.connect(":memory:")
    connection.execute(
        "create table freight_carrier (id integer primary key, acct text)"
    )
    connection.execute(
        "create table sensitive_data (id integer primary key, secret text)"
    )
    connection.execute(
        "insert into freight_carrier (id, acct) values (?, ?)",
        (AUTHORIZED_ID, "original-%s" % AUTHORIZED_ID),
    )
    connection.execute(
        "insert into freight_carrier (id, acct) values (?, ?)",
        (OTHER_ID, "original-%s" % OTHER_ID),
    )
    connection.execute(
        "insert into sensitive_data (id, secret) values (1, ?)",
        (SECRET,),
    )
    connection.commit()
    return connection


def snapshot(connection):
    carriers = dict(connection.execute("select id, acct from freight_carrier"))
    sensitive = list(connection.execute("select id, secret from sensitive_data"))
    return carriers, sensitive


class TestCarrierAccountSqlInjection(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.program = Program()

    def forms(self):
        return [
            "TFrmShipManAccountFedEx",
            "TFrmShipManAccountFedExExpress",
            "TFrmShipManAccountFedExSmartPost",
            "TFrmShipManAccountUPS",
            "TFrmShipManAccountUSPS",
        ]

    def save(self, class_name, fill):
        program = self.program
        fields = program.field_map(class_name)
        edits = {}
        checked = {}
        for name, type_name in fields.items():
            if type_name.lower() == "tuniedit":
                edits[name] = fill
            elif type_name.lower() == "tunicheckbox":
                checked[name] = False
        connection = build_database()
        before_carriers, before_sensitive = snapshot(connection)
        session = FormSession(
            program,
            class_name,
            edits,
            checked,
            float(AUTHORIZED_ID),
            connection,
        )
        error = None
        try:
            session.press_ok()
        except PasException as exc:
            error = exc
        after_carriers, after_sensitive = snapshot(connection)
        return (
            SaveResult(
                after_carriers,
                after_sensitive,
                dict(session.options),
                list(session.sql_log),
                error,
            ),
            before_carriers,
            before_sensitive,
        )

    def assert_account_is_data(self, class_name, account):
        result, before_carriers, before_sensitive = self.save(class_name, account)
        self.assertEqual(
            result.sensitive,
            before_sensitive,
            "%s changed a table other than the carrier row: %s"
            % (class_name, result.sql_log),
        )
        for carrier_id, acct in before_carriers.items():
            if carrier_id == AUTHORIZED_ID:
                self.assertIn(
                    result.carriers[carrier_id],
                    (acct, account),
                    "%s wrote %r for account %r via %s (error=%s)"
                    % (
                        class_name,
                        result.carriers[carrier_id],
                        account,
                        result.sql_log,
                        result.error,
                    ),
                )
            else:
                self.assertEqual(
                    result.carriers[carrier_id],
                    acct,
                    "%s updated carrier %s via %s"
                    % (class_name, carrier_id, result.sql_log),
                )

    def test_benign_account_is_stored_for_the_open_carrier(self):
        for class_name in self.forms():
            with self.subTest(form=class_name):
                result, _before, _sensitive = self.save(class_name, BENIGN_ACCOUNT)
                self.assertIsNone(result.error, result.error)
                self.assertEqual(
                    result.carriers[AUTHORIZED_ID],
                    BENIGN_ACCOUNT,
                    result.sql_log,
                )
                self.assertEqual(result.carriers[OTHER_ID], "original-%s" % OTHER_ID)
                self.assertTrue(result.sql_log, "save did not update freight_carrier")

    def test_blank_account_does_not_write(self):
        for class_name in self.forms():
            with self.subTest(form=class_name):
                result, before, before_sensitive = self.save(class_name, "   ")
                self.assertEqual(result.carriers, before, result.sql_log)
                self.assertEqual(result.sensitive, before_sensitive)
                self.assertEqual(result.sql_log, [], result.sql_log)

    def test_quote_break_does_not_copy_another_table(self):
        for class_name in self.forms():
            with self.subTest(form=class_name):
                self.assert_account_is_data(class_name, SUBQUERY_ACCOUNT)

    def test_quote_break_does_not_update_a_different_carrier(self):
        for class_name in self.forms():
            with self.subTest(form=class_name):
                self.assert_account_is_data(class_name, RETARGET_ACCOUNT)

    def test_embedded_quote_is_stored_or_refused_without_a_write(self):
        for class_name in self.forms():
            with self.subTest(form=class_name):
                self.assert_account_is_data(class_name, "12'345")


if __name__ == "__main__":
    unittest.main()

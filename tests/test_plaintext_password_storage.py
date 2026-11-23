"""Security spec for sales-account passwords.

The desktop and mobile login forms pass the typed username and password
into TUniMainModule.Login. That method builds a Users query with
System.SysUtils.Format. These tests execute that query and the users-grid
save path.

A saved password must not be recoverable from the Users row. Login with
the typed password must still succeed, login with the stored column must
fail, and two accounts that share a typed password must not share a stored
value. The users grids must not bind the Password column.

Recognized transformations, so a fix can be executed here:

- System.SysUtils.Format placeholders used by these units are %s and %%.
  %s copies the string argument. This matches the Format rules published
  for the Free Pascal SysUtils unit, which documents the same placeholders.
- Assignments of tblUsersPassword.AsString, .Value, or .Text in the
  application directory run in source order when a grid posts a password.
- THashSHA2.GetHashString(text) is SHA-256 over UTF-8, uppercase hex.
  THashMD5.GetHashString(text) is MD5 over UTF-8, uppercase hex.
  LowerCase, UpperCase, and Trim use Unicode case and whitespace rules.
- A string function in the application directory whose body is a single
  Result assignment is called when login or the post path calls it.
  Delphi identifiers are case-insensitive.
- The stored column is limited to the smaller of the TStringField Size and
  the mapping MaxLength for Password. Widen both when the verifier is longer
  than the current width, or login cannot round-trip.

Run:
  python3 -m unittest tests/test_plaintext_password_storage.py -v
"""

from __future__ import annotations

import base64
import hashlib
import re
import sqlite3
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SECRET = "PLACEHOLDER_SECRET"
OTHER_SECRET = "PLACEHOLDER_OTHER"

APP_DIRS = [
    "IVC",
    "Demo",
    "Samples/Hybrid",
    "Samples/Hybrid2",
    "Samples/Hybrid3",
    "Samples/Hybrid4",
    "Samples/Hybrid5",
    "BigWebApp",
]

# Databases shipped next to a sample whose login statement selects a column
# that exists in that file. Demo's statement selects RoleID, and its shipped
# file has no such column, so it is not listed here.
SHIPPED_DATABASES = {
    "Samples/Hybrid2": "Samples/Hybrid2/SQLite_Sales.db",
    "Samples/Hybrid5": "Samples/Hybrid5/SQLite_Sales.db",
}


def strip_comments(src: str) -> str:
    out = []
    i = 0
    n = len(src)
    while i < n:
        if src[i] == "'":
            out.append("'")
            i += 1
            while i < n:
                out.append(src[i])
                if src[i] == "'":
                    if i + 1 < n and src[i + 1] == "'":
                        out.append("'")
                        i += 2
                        continue
                    i += 1
                    break
                i += 1
            continue
        if src.startswith("(*", i):
            end = src.find("*)", i + 2)
            i = n if end < 0 else end + 2
            out.append(" ")
            continue
        if src[i] == "{":
            end = src.find("}", i + 1)
            i = n if end < 0 else end + 1
            out.append(" ")
            continue
        if src.startswith("//", i):
            end = src.find("\n", i)
            i = n if end < 0 else end
            continue
        out.append(src[i])
        i += 1
    return "".join(out)


def read_pascal_string(src: str, i: int) -> tuple[str, int]:
    if src[i] != "'":
        raise ValueError("expected a Pascal string")
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
    raise ValueError("unterminated Pascal string")


def matching_delimiter(src: str, open_at: int, open_ch: str, close_ch: str) -> int:
    if src[open_at] != open_ch:
        raise ValueError(f"expected {open_ch}")
    depth = 0
    i = open_at
    while i < len(src):
        if src[i] == "'":
            _, i = read_pascal_string(src, i)
            continue
        if src[i] == open_ch:
            depth += 1
        elif src[i] == close_ch:
            depth -= 1
            if depth == 0:
                return i
        i += 1
    raise ValueError(f"unbalanced {open_ch}")


class ExprParser:
    def __init__(self, text: str):
        self.text = text
        self.i = 0

    def skip(self) -> None:
        while self.i < len(self.text) and self.text[self.i].isspace():
            self.i += 1

    def parse(self):
        node = self.parse_add()
        self.skip()
        if self.i != len(self.text):
            raise ValueError(f"unparsed expression tail: {self.text[self.i:]!r}")
        return node

    def parse_add(self):
        left = self.parse_atom()
        while True:
            self.skip()
            if self.i >= len(self.text) or self.text[self.i] != "+":
                return left
            self.i += 1
            right = self.parse_atom()
            left = ("+", left, right)

    def parse_atom(self):
        self.skip()
        if self.i >= len(self.text):
            raise ValueError("unexpected end of expression")
        if self.text[self.i] == "(":
            close = matching_delimiter(self.text, self.i, "(", ")")
            inner = ExprParser(self.text[self.i + 1 : close]).parse()
            self.i = close + 1
            return inner
        if self.text[self.i] == "'":
            value, self.i = read_pascal_string(self.text, self.i)
            return ("str", value)
        name = self.read_name()
        self.skip()
        if self.i < len(self.text) and self.text[self.i] == "(":
            close = matching_delimiter(self.text, self.i, "(", ")")
            args_text = self.text[self.i + 1 : close]
            args = [ExprParser(part).parse() for part in split_top(args_text, ",")]
            self.i = close + 1
            return ("call", name, args)
        return ("name", name)

    def read_name(self) -> str:
        self.skip()
        start = self.i
        if self.i >= len(self.text) or not (self.text[self.i].isalpha() or self.text[self.i] == "_"):
            raise ValueError(f"expected a name at {self.text[self.i:]!r}")
        self.i += 1
        while self.i < len(self.text) and (self.text[self.i].isalnum() or self.text[self.i] in "_."):
            self.i += 1
        return self.text[start : self.i]


def split_top(text: str, separator: str) -> list[str]:
    parts = []
    start = 0
    i = 0
    paren = 0
    bracket = 0
    while i < len(text):
        if text[i] == "'":
            _, i = read_pascal_string(text, i)
            continue
        if text[i] == "(":
            paren += 1
        elif text[i] == ")":
            paren -= 1
        elif text[i] == "[":
            bracket += 1
        elif text[i] == "]":
            bracket -= 1
        elif text[i] == separator and paren == 0 and bracket == 0:
            parts.append(text[start:i].strip())
            start = i + 1
        i += 1
    tail = text[start:].strip()
    if tail:
        parts.append(tail)
    return parts


def delphi_format(fmt: str, args: list[str]) -> str:
    """Apply the %s and %% placeholders used by these login statements.

    %s copies the next string argument. %% is a literal percent. The Free
    Pascal SysUtils Format documentation describes those two placeholders the
    same way, and the statements under test contain no other placeholders.
    """
    out = []
    i = 0
    used = 0
    while i < len(fmt):
        if fmt[i] != "%":
            out.append(fmt[i])
            i += 1
            continue
        if i + 1 < len(fmt) and fmt[i + 1] == "%":
            out.append("%")
            i += 2
            continue
        if i + 1 < len(fmt) and fmt[i + 1] in "sS":
            if used >= len(args):
                raise ValueError("not enough format arguments")
            out.append(args[used])
            used += 1
            i += 2
            continue
        raise ValueError("login format uses a placeholder other than %s or %%")
    if used != len(args):
        raise ValueError("unused format arguments")
    return "".join(out)


def sha256_hex(text: str) -> str:
    return hashlib.sha256(text.encode("utf-8")).hexdigest().upper()


def md5_hex(text: str) -> str:
    return hashlib.md5(text.encode("utf-8")).hexdigest().upper()


class StringFunction:
    def __init__(self, params: list[str], body):
        self.params = params
        self.body = body


def eval_expr(node, env: dict, functions: dict) -> str:
    kind = node[0]
    if kind == "str":
        return node[1]
    if kind == "+":
        return eval_expr(node[1], env, functions) + eval_expr(node[2], env, functions)
    if kind == "name":
        key = node[1].lower()
        if key not in env:
            raise KeyError(node[1])
        return env[key]
    if kind == "call":
        name = node[1].lower()
        args = [eval_expr(arg, env, functions) for arg in node[2]]
        if name in {"lowercase", "sysutils.lowercase"}:
            return args[0].lower()
        if name in {"uppercase", "sysutils.uppercase"}:
            return args[0].upper()
        if name in {"trim", "sysutils.trim"}:
            return args[0].strip()
        if name.endswith("gethashstring") and "sha2" in name:
            return sha256_hex(args[0])
        if name.endswith("gethashstring") and "md5" in name:
            return md5_hex(args[0])
        short = name.split(".")[-1]
        if short not in functions:
            raise KeyError(node[1])
        func = functions[short]
        if len(args) != len(func.params):
            raise ValueError(f"{node[1]} argument count")
        local = {param: arg for param, arg in zip(func.params, args)}
        return eval_expr(func.body, local, functions)
    raise ValueError(f"unknown expression {kind}")


def string_param_names(signature: str) -> list[str]:
    names = []
    for part in split_top(signature, ";"):
        part = re.sub(r"^(const|var|out)\s+", "", part.strip(), flags=re.I)
        if ":" not in part:
            continue
        decls, typ = part.rsplit(":", 1)
        if "string" not in typ.lower():
            continue
        for name in decls.split(","):
            name = name.strip()
            if name:
                names.append(name.lower())
    return names


def load_string_functions(directory: Path) -> dict:
    functions = {}
    pattern = re.compile(
        r"^function\s+([\w.]+)\s*\(([^)]*)\)\s*:\s*(?:string|UnicodeString)\s*;(.*?)(?=^function |^procedure |^initialization|\Z)",
        re.I | re.S | re.M,
    )
    for path in sorted(directory.glob("*.pas")):
        text = strip_comments(path.read_text(encoding="utf-8", errors="replace"))
        for match in pattern.finditer(text):
            qual, signature, body = match.group(1), match.group(2), match.group(3)
            result_assignments = re.findall(r"\bResult\s*:=\s*(.*?);", body, flags=re.I | re.S)
            if len(result_assignments) != 1:
                continue
            statements = [
                stmt.strip()
                for stmt in split_top(body, ";")
                if stmt.strip() and not re.match(r"^(begin|end|var)\b", stmt.strip(), re.I)
            ]
            if len(statements) != 1:
                continue
            try:
                expr = ExprParser(result_assignments[0].strip()).parse()
            except ValueError:
                continue
            functions[qual.split(".")[-1].lower()] = StringFunction(
                string_param_names(signature), expr
            )
    return functions


def extract_login(source: str) -> str:
    matches = list(
        re.finditer(
            r"^function\s+TUniMainModule\.Login\b.*?(?=^function |^procedure |^initialization|\Z)",
            source,
            flags=re.I | re.S | re.M,
        )
    )
    if not matches:
        raise AssertionError("TUniMainModule.Login was not found")
    return max(matches, key=lambda item: len(item.group(0))).group(0)


def format_invocation(login_body: str) -> tuple[str, list]:
    lower = login_body.lower()
    start = 0
    found = None
    while True:
        at = lower.find("format", start)
        if at < 0:
            break
        before_ok = at == 0 or not (lower[at - 1].isalnum() or lower[at - 1] == "_")
        after = at + len("format")
        while after < len(login_body) and login_body[after].isspace():
            after += 1
        if before_ok and after < len(login_body) and login_body[after] == "(":
            close = matching_delimiter(login_body, after, "(", ")")
            found = login_body[after + 1 : close]
            break
        start = at + len("format")
    if found is None:
        raise AssertionError("Login does not call Format")
    parts = split_top(found, ",")
    if len(parts) < 2:
        raise AssertionError("Login Format call has no argument list")
    fmt_expr = ExprParser(parts[0]).parse()
    if fmt_expr[0] != "str":
        raise AssertionError("Login format string is not a string literal")
    args_text = parts[1].strip()
    if not (args_text.startswith("[") and args_text.endswith("]")):
        raise AssertionError("Login format arguments are not an open array")
    arg_nodes = []
    for arg in split_top(args_text[1:-1], ","):
        arg_nodes.append(ExprParser(arg).parse())
    return fmt_expr[1], arg_nodes


def local_assignments(login_body: str) -> list[tuple[str, object]]:
    lower = login_body.lower()
    at = lower.find("execsqlscalar")
    if at < 0:
        raise AssertionError("Login does not call ExecSQLScalar")
    head = login_body[:at]
    assignments = []
    for stmt in split_top(head, ";"):
        match = re.match(r"\s*([A-Za-z_]\w*)\s*:=\s*(.*)$", stmt, flags=re.S)
        if not match:
            continue
        name = match.group(1)
        if name.lower() in {"result", "userfound", "isadmin", "fusername", "fisadmin", "fpassword"}:
            continue
        expr = ExprParser(match.group(2).strip()).parse()
        assignments.append((name.lower(), expr))
    return assignments


def password_assignments(directory: Path) -> list:
    nodes = []
    pattern = re.compile(
        r"tblUsersPassword\.(?:AsString|Value|Text)\s*:=\s*(.*?);",
        flags=re.I | re.S,
    )
    for path in sorted(directory.glob("*.pas")):
        text = strip_comments(path.read_text(encoding="utf-8", errors="replace"))
        for match in pattern.finditer(text):
            nodes.append(ExprParser(match.group(1).strip()).parse())
    return nodes


def password_widths(directory: Path) -> list[int]:
    widths = []
    for path in sorted(directory.glob("*.dfm")):
        text = path.read_text(encoding="utf-8", errors="replace")
        for match in re.finditer(
            r"object\s+\w+\s*:\s*T(?:Wide)?StringField\b(.*?)(?=\n\s*object |\n\s*end\b)",
            text,
            flags=re.S | re.I,
        ):
            body = match.group(1)
            if not re.search(r"FieldName\s*=\s*'Password'", body, flags=re.I):
                continue
            size = re.search(r"\bSize\s*=\s*(\d+)", body, flags=re.I)
            if size:
                widths.append(int(size.group(1)))
    for path in sorted(directory.glob("*.xml")):
        text = path.read_text(encoding="utf-8", errors="replace")
        for match in re.finditer(r"<Column\b[^>]*\bName\s*=\s*\"Password\"[^>]*>", text, flags=re.I):
            length = re.search(r"\bMaxLength\s*=\s*\"(\d+)\"", match.group(0), flags=re.I)
            if length:
                widths.append(int(length.group(1)))
    return widths


def grid_password_bindings(directory: Path) -> list[str]:
    found = []
    for path in sorted(directory.glob("*.dfm")):
        text = path.read_text(encoding="utf-8", errors="replace")
        for columns in re.finditer(r"\bColumns\s*=\s*<(.*?)>", text, flags=re.S | re.I):
            for item in re.split(r"\bitem\b", columns.group(1), flags=re.I):
                if re.search(r"FieldName\s*=\s*'Password'", item, flags=re.I):
                    found.append(str(path.relative_to(ROOT)))
    return found


def login_forms(directory: Path) -> list[tuple[str, str, str]]:
    calls = []
    for path in sorted(directory.glob("*.pas")):
        text = strip_comments(path.read_text(encoding="utf-8", errors="replace"))
        for line in text.splitlines():
            if re.search(r"\b(function|procedure)\b", line, flags=re.I):
                continue
            match = re.search(r"\bUniMainModule\.Login\s*\(", line, flags=re.I)
            if not match:
                continue
            open_at = match.end() - 1
            close = matching_delimiter(line, open_at, "(", ")")
            args = split_top(line[open_at + 1 : close], ",")
            if len(args) < 2:
                continue
            calls.append((str(path.relative_to(ROOT)), args[0], args[1]))
    return calls


def retains_typed_password(login_body: str, password_param: str) -> bool:
    return re.search(rf"\bFPassword\s*:=\s*{password_param}\s*;", login_body, flags=re.I) is not None


class SalesApp:
    def __init__(self, folder: str):
        self.folder = folder
        self.directory = ROOT / folder
        source_path = self.directory / "MainModule.pas"
        source = strip_comments(source_path.read_text(encoding="utf-8", errors="replace"))
        self.login_body = extract_login(source)
        signature = self.login_body.split(")", 1)[0]
        signature = signature.split("(", 1)[1]
        params = string_param_names(signature)
        if len(params) < 2:
            raise AssertionError(f"{folder} Login does not take a username and password")
        self.username_param = params[0]
        self.password_param = params[1]
        self.format_string, self.format_args = format_invocation(self.login_body)
        self.assignments = local_assignments(self.login_body)
        self.functions = load_string_functions(self.directory)
        self.field_writes = password_assignments(self.directory)
        widths = password_widths(self.directory)
        self.max_width = min(widths) if widths else None
        self.forms = login_forms(self.directory)
        self.grids = grid_password_bindings(self.directory)
        selected = re.search(r"select\s+(\w+)\s+from\s+users", self.format_string, flags=re.I)
        if not selected:
            raise AssertionError(f"{folder} login query does not read Users")
        self.selected_column = selected.group(1)

    def limit(self, value: str) -> str:
        if self.max_width is not None and len(value) > self.max_width:
            return value[: self.max_width]
        return value

    def store_password(self, username: str, secret: str) -> str:
        env = {
            "tbluserspassword.asstring": secret,
            "tbluserspassword.value": secret,
            "tbluserspassword.text": secret,
            "tblusersusername.asstring": username,
            "tblusersusername.value": username,
            "tblusersusername.text": username,
            "value": secret,
            self.username_param: username,
            self.password_param: secret,
        }
        for expr in self.field_writes:
            stored = eval_expr(expr, env, self.functions)
            for key in ("tbluserspassword.asstring", "tbluserspassword.value", "tbluserspassword.text"):
                env[key] = stored
        return self.limit(env["tbluserspassword.asstring"])

    def compared_password(self, username: str, secret: str) -> str:
        env = {
            self.username_param: username,
            self.password_param: secret,
        }
        for name, expr in self.assignments:
            env[name] = eval_expr(expr, env, self.functions)
        values = [eval_expr(arg, env, self.functions) for arg in self.format_args]
        return values

    def login_sql(self, username: str, secret: str) -> str:
        values = self.compared_password(username, secret)
        return delphi_format(self.format_string, values)

    def typed_credentials(self, username_expr: str, password_expr: str, username: str, secret: str):
        def lookup(name: str) -> str:
            low = name.lower()
            if low.endswith(".text") and "pass" in low:
                return secret
            if low.endswith(".text") and "user" in low:
                return username
            raise KeyError(name)

        def eval_name(node):
            kind = node[0]
            if kind == "str":
                return node[1]
            if kind == "+":
                return eval_name(node[1]) + eval_name(node[2])
            if kind == "name":
                return lookup(node[1])
            if kind == "call":
                args = [eval_name(arg) for arg in node[2]]
                return eval_expr(("call", node[1], [("str", arg) for arg in args]), {}, self.functions)
            raise ValueError(kind)

        return (
            eval_name(ExprParser(username_expr).parse()),
            eval_name(ExprParser(password_expr).parse()),
        )

    def accepts(self, connection: sqlite3.Connection, username: str, secret: str, username_expr: str, password_expr: str) -> bool:
        typed_user, typed_secret = self.typed_credentials(username_expr, password_expr, username, secret)
        sql = self.login_sql(typed_user, typed_secret)
        try:
            row = connection.execute(sql).fetchone()
        except Exception:
            raise AssertionError(f"{self.folder}: login statement failed") from None
        return row is not None


def connect_blank() -> sqlite3.Connection:
    connection = sqlite3.connect(":memory:")
    connection.execute(
        """
        CREATE TABLE Users (
            Username TEXT PRIMARY KEY,
            Password TEXT,
            Admin INTEGER,
            RoleID INTEGER
        )
        """
    )
    return connection


def reversible_forms(secret: str) -> set[str]:
    raw = secret.encode("utf-8")
    return {
        secret,
        secret.lower(),
        secret.upper(),
        secret[::-1],
        base64.b64encode(raw).decode("ascii"),
        raw.hex(),
        raw.hex().upper(),
        sha256_hex(secret),
        sha256_hex(secret).lower(),
        md5_hex(secret),
        md5_hex(secret).lower(),
    }


class PlaintextPasswordStorageTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.apps = [SalesApp(folder) for folder in APP_DIRS]

    def test_saved_password_is_not_the_credential(self):
        for app in self.apps:
            forms = app.forms or [(app.folder, "Username", "Password")]
            for form_path, user_expr, pass_expr in forms:
                with self.subTest(app=app.folder, form=form_path):
                    first = "account-a"
                    second = "account-b"
                    connection = connect_blank()
                    stored_first = app.store_password(first, SECRET)
                    stored_second = app.store_password(second, SECRET)
                    connection.execute(
                        "INSERT INTO Users (Username, Password, Admin, RoleID) VALUES (?, ?, 1, 1)",
                        (first, stored_first),
                    )
                    connection.execute(
                        "INSERT INTO Users (Username, Password, Admin, RoleID) VALUES (?, ?, 1, 1)",
                        (second, stored_second),
                    )
                    self.assertTrue(
                        app.accepts(connection, first, SECRET, user_expr, pass_expr),
                        f"{form_path} rejects the password that was saved",
                    )
                    self.assertFalse(
                        app.accepts(connection, first, OTHER_SECRET, user_expr, pass_expr),
                        f"{form_path} accepts a different password",
                    )
                    self.assertFalse(
                        stored_first in reversible_forms(SECRET),
                        f"{app.folder} stored a recoverable password for {first}",
                    )
                    self.assertNotEqual(
                        stored_first,
                        stored_second,
                        f"{app.folder} stored the same verifier for two accounts",
                    )
                    columns = connection.execute(
                        "SELECT Username, Password, Admin, RoleID FROM Users WHERE Username = ?",
                        (first,),
                    ).fetchone()
                    for column in columns:
                        self.assertNotIn(
                            SECRET,
                            "" if column is None else str(column),
                            f"{app.folder} Users row contains the typed password",
                        )
                    self.assertFalse(
                        app.accepts(connection, first, stored_first, user_expr, pass_expr),
                        f"{form_path} accepts the stored Password column as the credential",
                    )

    def test_user_grids_do_not_bind_the_password_column(self):
        exposed = []
        for app in self.apps:
            exposed.extend(app.grids)
        self.assertEqual(exposed, [], f"password column is bound in {exposed}")

    def test_shipped_database_password_column_does_not_authenticate(self):
        by_folder = {app.folder: app for app in self.apps}
        exercised = 0
        for folder, relative in SHIPPED_DATABASES.items():
            app = by_folder[folder]
            path = ROOT / relative
            self.assertTrue(path.is_file(), relative)
            connection = sqlite3.connect(f"file:{path}?mode=ro", uri=True)
            try:
                columns = {row[1].lower() for row in connection.execute("PRAGMA table_info(Users)")}
                self.assertIn("password", columns)
                self.assertIn("username", columns)
                self.assertIn(
                    app.selected_column.lower(),
                    columns,
                    f"{folder} login reads {app.selected_column}, which this database does not have",
                )
                forms = app.forms
                self.assertTrue(forms, folder)
                _, user_expr, pass_expr = forms[0]
                usernames = [row[0] for row in connection.execute("SELECT Username FROM Users ORDER BY Username")]
                self.assertTrue(usernames, folder)
                for username in usernames:
                    stored = connection.execute(
                        "SELECT Password FROM Users WHERE Username = ?",
                        (username,),
                    ).fetchone()[0]
                    if stored is None or "'" in str(stored) or "%" in str(stored):
                        self.fail(f"{folder} password column for {username} cannot be replayed safely")
                    exercised += 1
                    with self.subTest(app=folder, username=username):
                        self.assertFalse(
                            app.accepts(connection, username, str(stored), user_expr, pass_expr),
                            f"{folder} login accepts the Users.Password column for {username}",
                        )
            finally:
                connection.close()
        self.assertGreater(exercised, 0)

    def test_login_does_not_keep_the_typed_password(self):
        retained = [
            app.folder
            for app in self.apps
            if retains_typed_password(app.login_body, app.password_param)
        ]
        self.assertEqual(retained, [], f"login stores the typed password on {retained}")


if __name__ == "__main__":
    unittest.main()

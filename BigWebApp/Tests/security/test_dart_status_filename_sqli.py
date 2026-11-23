"""Spec for the DART viewer status-filename update.

These tests fail while a status filename from the DART parameters dialog is
spliced into SQL. They pass once that update stores the filename as data:
a bound parameter, or an equivalent quote-escape that keeps the value inside
one string literal. A filename the dialog rejects before any SQL runs may
leave the previous value in place.

Run from the repository root:

    python3 BigWebApp/Tests/security/test_dart_status_filename_sqli.py

The harness reads the Pascal sources and performs every step that changes the
filename on the way to the database:

* TFrmProcess.bbtnOKClick in IQMS.Common.WCProces.pas
* IQFormat, which calls System.SysUtils.Format. For this call site the format
  string is literal text plus one %s. Literals are copied unchanged and %s
  inserts the argument unchanged (no width and no precision).
* ExecuteCommand, which rewrites ::= to := and then runs that text with
  parameter and macro expansion turned off.
* ExecuteCommandParam, which binds the filename and does not concatenate it.
* FixStr, when the OK handler passes the filename through it: backtick
  becomes a quote, then each quote is doubled.
* The read-back query in TFrmProcess.FormCreate.

The SQL is executed by SQLite. This statement uses only a quoted literal,
|| concatenation, and a scalar subquery, which SQLite evaluates the same way
the statement is written. The connection stands in for the shared IQMS
session: after a user proves their own name, the application reconnects as
the IQMS account and later commands, including this update, use that account.
"""

from __future__ import annotations

import re
import sqlite3
import unittest
from pathlib import Path


REPO = Path(__file__).resolve().parents[3]
WCPROCES = REPO / "BigWebApp/Components/IQWebVcl/Source/IQMS.Common.WCProces.pas"
WCPROCES_DFM = REPO / "BigWebApp/Components/IQWebVcl/Source/IQMS.Common.WCProces.dfm"
DARTWIN = REPO / "BigWebApp/Components/IQWebVcl/Source/IQMS.Common.Dartwin.pas"
DATALIB = REPO / "BigWebApp/Components/IQWebVcl/Source/IQMS.Common.DataLib.pas"
STRINGUTILS = REPO / "BigWebApp/Components/IQWebCommon/Source/IQMS.Common.StringUtils.pas"

# Marker stored in a table the status-file dialog does not display.
# Not a credential.
OTHER_TABLE_MARKER = "OTHER-TABLE-MARKER"
BENIGN_STATUS_FILE = r"C:\DartNet\STATUS\Status.STA"
# Closes the opening quote, appends a scalar subquery, and opens a new literal
# so the trailing quote in the format string terminates that literal.
INJECTED_STATUS_FILE = (
    r"C:\DartNet\'||(select secret_value from erp_only where id = 1)||'\Status.STA"
)


class StatusFileUpdateRefused(Exception):
    """The dialog rejected the filename before executing SQL."""


class StatusFileSqlError(Exception):
    """The update was sent to the database and the database rejected it."""


def _read(path: Path) -> str:
    return path.read_text(encoding="latin-1")


def strip_pascal_comments(text: str) -> str:
    out = []
    i = 0
    n = len(text)
    while i < n:
        ch = text[i]
        if ch == "'":
            out.append(ch)
            i += 1
            while i < n:
                out.append(text[i])
                if text[i] == "'":
                    if i + 1 < n and text[i + 1] == "'":
                        out.append(text[i + 1])
                        i += 2
                        continue
                    i += 1
                    break
                i += 1
            continue
        if ch == "{":
            end = text.find("}", i + 1)
            i = n if end < 0 else end + 1
            out.append(" ")
            continue
        if ch == "/" and i + 1 < n and text[i + 1] == "/":
            end = text.find("\n", i)
            i = n if end < 0 else end
            continue
        out.append(ch)
        i += 1
    return "".join(out)


def pascal_string(token: str) -> str:
    """Decode one Pascal string literal, including doubled quotes."""
    if len(token) < 2 or token[0] != "'" or token[-1] != "'":
        raise AssertionError(f"not a Pascal string literal: {token!r}")
    body = token[1:-1]
    return body.replace("''", "'")


def parse_pascal_string_expr(expr: str) -> str:
    """Concatenate adjacent Pascal string literals joined by +."""
    parts = re.findall(r"'(?:''|[^'])*'", expr)
    if not parts or re.sub(r"'(?:''|[^'])*'", "", expr).strip("+ \t\r\n"):
        raise AssertionError(f"unsupported string expression: {expr!r}")
    return "".join(pascal_string(part) for part in parts)


def procedure_body(source: str, qualified_name: str) -> str:
    match = re.search(
        rf"(?m)^procedure {re.escape(qualified_name)}\b.*?\n(?P<body>.*?)^end;",
        source,
        re.S,
    )
    if not match:
        raise AssertionError(f"procedure {qualified_name} not found")
    return strip_pascal_comments(match.group("body"))


def function_body(source: str, name: str) -> str | None:
    match = re.search(
        rf"(?is)^function\s+(?:\w+\.)?{re.escape(name)}\b.*?^end;",
        source,
        re.M,
    )
    if not match:
        return None
    return strip_pascal_comments(match.group(0))


def iq_format(fmt: str, args: list[str]) -> str:
    """System.SysUtils.Format for a literal-plus-%s pattern.

    Delphi's Format copies literal characters unchanged. The s specifier
    inserts the string argument in place of the specifier. This call site
    uses one %s and no width, precision, or index.
    """
    out: list[str] = []
    i = 0
    arg_index = 0
    while i < len(fmt):
        if fmt[i] != "%":
            out.append(fmt[i])
            i += 1
            continue
        if i + 1 < len(fmt) and fmt[i + 1] == "%":
            out.append("%")
            i += 2
            continue
        if i + 1 < len(fmt) and fmt[i + 1] in ("s", "S"):
            if arg_index >= len(args):
                raise AssertionError("Format argument missing for %s")
            out.append(args[arg_index])
            arg_index += 1
            i += 2
            continue
        raise AssertionError(f"unsupported format specifier in {fmt[i:]!r}")
    if arg_index != len(args):
        raise AssertionError("unused Format arguments")
    return "".join(out)


def fix_str(value: str) -> str:
    """IQMS.Common.StringUtils.FixStr: backtick to quote, then double quotes."""
    value = value.replace("\x60", "'")
    value = value.replace("'", "''")
    return value


def trim_delphi(value: str) -> str:
    return value.strip(" \t\r\n\v\f")


def edit_max_length(dfm_text: str) -> int | None:
    block = re.search(
        r"object edStatusFileName:\s*TUniEdit\b(?P<body>.*?)(?:\n\s*object |\n\s*end\b)",
        dfm_text,
        re.S,
    )
    if not block:
        raise AssertionError("edStatusFileName is missing from the form")
    found = re.search(r"(?m)^\s*MaxLength\s*=\s*(\d+)\s*$", block.group("body"))
    if not found:
        return None
    return int(found.group(1))


def filename_as_entered(filename: str) -> str:
    """TUniEdit text. The form sets no character filter. Honor MaxLength when set."""
    limit = edit_max_length(_read(WCPROCES_DFM))
    if limit is None or limit <= 0:
        return filename
    return filename[:limit]


def replace_pair_from_execute_command() -> tuple[str, str]:
    """The ::= rewrite ExecuteCommand applies to the finished SQL text."""
    source = _read(DATALIB)
    match = re.search(
        r"ReplaceStr\(\s*\S*?ASQL,\s*'((?:''|[^'])*)',\s*'((?:''|[^'])*)'\s*\)",
        source,
    )
    if not match:
        raise AssertionError("ExecuteCommand ReplaceStr call not found")
    return pascal_string("'" + match.group(1) + "'"), pascal_string(
        "'" + match.group(2) + "'"
    )


def eval_filename_expr(expr: str, filename: str, locals_: dict[str, str]) -> str:
    expr = expr.strip().rstrip(";")
    if expr in locals_:
        return locals_[expr]
    if re.fullmatch(r"edStatusFileName\.Text", expr, re.I):
        return filename
    wrapped = re.fullmatch(r"FixStr\s*\((.*)\)", expr, re.I | re.S)
    if wrapped:
        return fix_str(eval_filename_expr(wrapped.group(1), filename, locals_))
    wrapped = re.fullmatch(r"Trim\s*\((.*)\)", expr, re.I | re.S)
    if wrapped:
        return trim_delphi(eval_filename_expr(wrapped.group(1), filename, locals_))
    if "+" in expr and "edStatusFileName" not in expr and "FixStr" not in expr and "Trim" not in expr:
        return parse_pascal_string_expr(expr)
    # a + b, either side may be a filename expression or a literal.
    parts = split_top_level_plus(expr)
    if len(parts) > 1:
        return "".join(eval_filename_expr(part, filename, locals_) for part in parts)
    if re.fullmatch(r"'(?:''|[^'])*'", expr):
        return pascal_string(expr)
    raise AssertionError(f"unsupported filename expression: {expr!r}")


def split_top_level_plus(expr: str) -> list[str]:
    parts = []
    buf = []
    i = 0
    depth = 0
    in_str = False
    while i < len(expr):
        ch = expr[i]
        if in_str:
            buf.append(ch)
            if ch == "'":
                if i + 1 < len(expr) and expr[i + 1] == "'":
                    buf.append(expr[i + 1])
                    i += 2
                    continue
                in_str = False
            i += 1
            continue
        if ch == "'":
            in_str = True
            buf.append(ch)
            i += 1
            continue
        if ch == "(":
            depth += 1
        elif ch == ")":
            depth -= 1
        elif ch == "+" and depth == 0:
            parts.append("".join(buf).strip())
            buf = []
            i += 1
            continue
        buf.append(ch)
        i += 1
    tail = "".join(buf).strip()
    if tail:
        parts.append(tail)
    return parts


def _function_rejects(name: str, filename: str, unit_source: str) -> bool | None:
    """Return True/False when the helper is a prefix and quote check, else None."""
    body = function_body(unit_source, name)
    if body is None:
        return None
    # Result := (Pos('''', Arg) = 0) and (Copy(Arg, 1, Length('prefix')) = 'prefix')
    # Accept either order, with optional Trim around the argument.
    quote_safe = None
    if re.search(r"Pos\s*\(\s*''''\s*,", body) or re.search(r"Pos\s*\(\s*#39\s*,", body):
        quote_safe = "'" not in filename and "\x60" not in filename
    prefix = None
    prefix_match = re.search(
        r"Copy\s*\([^,]+,\s*1\s*,\s*(?:Length\s*\(\s*)?'((?:''|[^'])*)'\s*\)?\s*\)\s*=\s*'((?:''|[^'])*)'",
        body,
        re.I,
    )
    if prefix_match:
        expected = pascal_string("'" + prefix_match.group(2) + "'")
        prefix = filename.startswith(expected)
    if quote_safe is None and prefix is None:
        return None
    allowed = True
    if quote_safe is not None:
        allowed = allowed and quote_safe
    if prefix is not None:
        allowed = allowed and prefix
    return not allowed


def _guard_rejects(body_before_sql: str, filename: str, unit_source: str) -> bool:
    """True when a guard before the update raises, aborts, or exits."""
    pattern = re.compile(
        r"if\s+not\s+(\w+)\s*\(\s*(?:Trim\s*\(\s*)?edStatusFileName\.Text\s*\)?\s*\)\s*then\s+(?:raise\b|Abort\b|Exit\b)",
        re.I | re.S,
    )
    for name in pattern.findall(body_before_sql):
        rejected = _function_rejects(name, filename, unit_source)
        if rejected is True:
            return True
    direct = re.search(
        r"if\s+.*Pos\s*\(\s*''''\s*,\s*(?:Trim\s*\(\s*)?edStatusFileName\.Text",
        body_before_sql,
        re.I | re.S,
    )
    if direct and "'" in filename:
        return True
    return False


def _calls_in_order(body: str):
    """Yield (kind, match) for update calls in source order."""
    patterns = [
        ("fmt", re.compile(
            r"ExecuteCommandFmt\s*\(\s*(?P<fmt>(?:'(?:''|[^'])*'\s*(?:\+\s*)?)+)\s*,\s*\[(?P<args>.*?)\]\s*\)",
            re.I | re.S,
        )),
        ("param", re.compile(
            r"ExecuteCommandParam\s*\(\s*(?P<sql>(?:'(?:''|[^'])*'\s*(?:\+\s*)?)+)\s*,\s*\[(?P<names>.*?)\]\s*,\s*\[(?P<vals>.*?)\]\s*\)",
            re.I | re.S,
        )),
        ("exec", re.compile(
            r"ExecuteCommand\s*\(\s*(?P<sql>.*?)\s*\)",
            re.I | re.S,
        )),
    ]
    found = []
    for kind, pattern in patterns:
        for match in pattern.finditer(body):
            found.append((match.start(), kind, match))
    found.sort(key=lambda item: item[0])
    # Drop ExecuteCommand matches that are the prefix of ExecuteCommandFmt/Param.
    filtered = []
    for start, kind, match in found:
        if kind == "exec":
            window = body[max(0, start - 3):start + 20]
            if re.search(r"ExecuteCommand(?:Fmt|Param)\s*\(", window, re.I):
                continue
        filtered.append((start, kind, match))
    return filtered


def plan_status_update(filename: str) -> tuple[str, list | None]:
    """Return (sql, params). params is None when the SQL text is executed literally."""
    unit = _read(WCPROCES)
    body = procedure_body(unit, "TFrmProcess.bbtnOKClick")
    filename = filename_as_entered(filename)
    locals_: dict[str, str] = {}
    for assign in re.finditer(
        r"(?m)^\s*(\w+)\s*:=\s*(.+?);\s*$",
        body,
    ):
        name, expr = assign.group(1), assign.group(2)
        if name.lower() in {"result"}:
            continue
        try:
            locals_[name] = eval_filename_expr(expr, filename, locals_)
        except AssertionError:
            continue

    calls = _calls_in_order(body)
    if not calls:
        raise AssertionError(
            "bbtnOKClick no longer updates dart_status_filename in a recognized call"
        )
    chosen = None
    for start, kind, match in calls:
        if kind == "fmt":
            fmt = parse_pascal_string_expr(match.group("fmt"))
            if "dart_status_filename" not in fmt.lower() and "edStatusFileName" not in match.group("args"):
                continue
            arg_expr = match.group("args").strip()
            if "," in arg_expr:
                raise AssertionError(f"expected one format argument, found {arg_expr!r}")
            value = eval_filename_expr(arg_expr, filename, locals_)
            sql = iq_format(fmt, [value])
            old, new = replace_pair_from_execute_command()
            sql = sql.replace(old, new)
            chosen = (start, sql, None)
        elif kind == "param":
            sql = parse_pascal_string_expr(match.group("sql"))
            if "dart_status_filename" not in sql.lower():
                continue
            names = re.findall(r"'((?:''|[^'])*)'", match.group("names"))
            val_exprs = split_args(match.group("vals"))
            if len(names) != len(val_exprs):
                raise AssertionError("ExecuteCommandParam names and values differ in length")
            params = {}
            for raw_name, val_expr in zip(names, val_exprs):
                param_name = raw_name.split(";", 1)[0].strip()
                params[param_name] = eval_filename_expr(val_expr, filename, locals_)
            chosen = (start, sql, params)
        elif kind == "exec":
            expr = match.group("sql").strip()
            if "dart_status_filename" not in expr.lower() and "edStatusFileName" not in expr and not any(
                "dart_status_filename" in value.lower() for value in locals_.values()
            ):
                try:
                    built = eval_filename_expr(expr, filename, locals_)
                except AssertionError:
                    continue
                if "dart_status_filename" not in built.lower():
                    continue
            else:
                built = eval_filename_expr(expr, filename, locals_)
            old, new = replace_pair_from_execute_command()
            built = built.replace(old, new)
            chosen = (start, built, None)
    if chosen is None:
        raise AssertionError("no dart_status_filename update found in bbtnOKClick")
    start, sql, params = chosen
    if _guard_rejects(body[:start], filename, unit):
        raise StatusFileUpdateRefused(filename)
    return sql, params


def split_args(text: str) -> list[str]:
    args = []
    buf = []
    depth = 0
    in_str = False
    i = 0
    while i < len(text):
        ch = text[i]
        if in_str:
            buf.append(ch)
            if ch == "'":
                if i + 1 < len(text) and text[i + 1] == "'":
                    buf.append(text[i + 1])
                    i += 2
                    continue
                in_str = False
            i += 1
            continue
        if ch == "'":
            in_str = True
            buf.append(ch)
            i += 1
            continue
        if ch == "(":
            depth += 1
        elif ch == ")":
            depth -= 1
        elif ch == "," and depth == 0:
            args.append("".join(buf).strip())
            buf = []
            i += 1
            continue
        buf.append(ch)
        i += 1
    tail = "".join(buf).strip()
    if tail:
        args.append(tail)
    return args


def read_back_sql() -> str:
    body = procedure_body(_read(WCPROCES), "TFrmProcess.FormCreate")
    match = re.search(
        r"SelectValueAsString\(\s*'((?:''|[^'])*)'\s*\)",
        body,
        re.I,
    )
    if not match:
        raise AssertionError("FormCreate does not read dart_status_filename")
    return pascal_string("'" + match.group(1) + "'")


def new_database() -> sqlite3.Connection:
    connection = sqlite3.connect(":memory:")
    connection.execute("create table params (dart_status_filename text)")
    connection.execute("insert into params (dart_status_filename) values ('')")
    connection.execute("create table erp_only (id integer primary key, secret_value text)")
    connection.execute(
        "insert into erp_only (id, secret_value) values (1, ?)",
        (OTHER_TABLE_MARKER,),
    )
    connection.commit()
    return connection


def apply_ok(connection: sqlite3.Connection, filename: str) -> None:
    try:
        sql, params = plan_status_update(filename)
    except StatusFileUpdateRefused:
        return
    try:
        if params is None:
            connection.execute(sql)
        else:
            connection.execute(sql, params)
        connection.commit()
    except sqlite3.Error as exc:
        raise StatusFileSqlError(f"{exc}; sql={sql!r}") from exc


def stored_status_filename(connection: sqlite3.Connection) -> str:
    row = connection.execute(read_back_sql()).fetchone()
    if row is None or row[0] is None:
        return ""
    return row[0]


def dialog_opens_when_status_missing() -> bool:
    """CheckDartWinViewerParameters opens the dialog when any parameter is blank."""
    source = _read(DARTWIN)
    match = re.search(
        r"(?m)^function TDartBase\.AssignDartParameters\b.*?\n(?P<body>.*?)^end;",
        source,
        re.S,
    )
    if not match:
        raise AssertionError("AssignDartParameters not found")
    assign = strip_pascal_comments(match.group("body"))
    if not re.search(
        r"Result\s*:=\s*\(DNetWNT\s*<>\s*''\)\s*and\s*\(DNetStatusFileName\s*<>\s*''\)\s*and\s*\(DNetGraphicName\s*<>\s*''\)",
        assign,
        re.I,
    ):
        raise AssertionError("AssignDartParameters completeness check changed")
    check = re.search(
        r"(?m)^procedure TDartBase\.CheckDartWinViewerParameters\b.*?\n(?P<body>.*?)^end;",
        source,
        re.S,
    )
    if not check or "DoGetDartParameters" not in check.group("body"):
        raise AssertionError("CheckDartWinViewerParameters does not open the dialog")
    # FALSE means missing values do not raise; the boolean is the completeness check.
    if not re.search(r"AssignDartParameters\(\s*FALSE\s*\)", check.group("body"), re.I):
        raise AssertionError("dialog gate no longer uses AssignDartParameters(FALSE)")
    return True


def parameters_complete(command_line: str, status_file: str, graphic_name: str) -> bool:
    if not dialog_opens_when_status_missing():
        raise AssertionError("dialog gate missing")
    return command_line != "" and status_file != "" and graphic_name != ""


class DartStatusFilenameSqlTests(unittest.TestCase):
    def test_benign_status_filename_is_stored_literally(self):
        connection = new_database()
        apply_ok(connection, BENIGN_STATUS_FILE)
        self.assertEqual(stored_status_filename(connection), BENIGN_STATUS_FILE)
        self.assertEqual(
            connection.execute("select secret_value from erp_only where id = 1").fetchone()[0],
            OTHER_TABLE_MARKER,
        )

    def test_typed_filename_cannot_copy_other_table_into_params(self):
        connection = new_database()
        previous = stored_status_filename(connection)
        try:
            apply_ok(connection, INJECTED_STATUS_FILE)
        except StatusFileSqlError as exc:
            self.fail(
                "the status filename was spliced into SQL and the statement failed: "
                + str(exc)
            )
        stored = stored_status_filename(connection)
        leaked = f"C:\\DartNet\\{OTHER_TABLE_MARKER}\\Status.STA"
        self.assertNotEqual(
            stored,
            leaked,
            "confirm stored the subquery result in params.dart_status_filename",
        )
        self.assertNotIn(OTHER_TABLE_MARKER, stored)
        self.assertIn(
            stored,
            {INJECTED_STATUS_FILE, filename_as_entered(INJECTED_STATUS_FILE), previous},
            f"stored {stored!r}; expected the literal filename or the previous value",
        )
        self.assertEqual(
            connection.execute("select secret_value from erp_only where id = 1").fetchone()[0],
            OTHER_TABLE_MARKER,
        )

    def test_uploaded_filename_uses_the_same_unsanitized_update(self):
        body = procedure_body(_read(WCPROCES), "TFrmProcess.ProcessBrowseDialogCompleted")
        self.assertRegex(
            body,
            r"edStatusFileName\.Text\s*:=\s*ProcessBrowseDialog\.Filename\s*;",
        )
        self.assertNotIn("FixStr", body)
        connection = new_database()
        previous = stored_status_filename(connection)
        # The upload completion assigns the client filename, then OK runs.
        try:
            apply_ok(connection, INJECTED_STATUS_FILE)
        except StatusFileSqlError as exc:
            self.fail("uploaded filename was spliced into SQL: " + str(exc))
        stored = stored_status_filename(connection)
        self.assertNotIn(OTHER_TABLE_MARKER, stored)
        self.assertIn(stored, {INJECTED_STATUS_FILE, previous})

    def test_dialog_opens_when_status_file_is_not_configured(self):
        self.assertTrue(dialog_opens_when_status_missing())
        self.assertFalse(parameters_complete(r"C:\DartNet\Viewer\Dnetw32.exe NETVIEW:IQ", "", "PRESS"))
        self.assertFalse(parameters_complete("", "", ""))
        self.assertTrue(
            parameters_complete(
                r"C:\DartNet\Viewer\Dnetw32.exe NETVIEW:IQ",
                BENIGN_STATUS_FILE,
                "PRESS",
            )
        )
        # A configured status file does not open the dialog, so a later filename
        # is not written by this path.
        connection = new_database()
        connection.execute(
            "update params set dart_status_filename = ?",
            (BENIGN_STATUS_FILE,),
        )
        if parameters_complete("viewer", BENIGN_STATUS_FILE, "graphic"):
            stored = stored_status_filename(connection)
        else:
            apply_ok(connection, INJECTED_STATUS_FILE)
            stored = stored_status_filename(connection)
        self.assertEqual(stored, BENIGN_STATUS_FILE)

    def test_readback_query_is_the_form_create_select(self):
        self.assertEqual(
            read_back_sql().lower(),
            "select dart_status_filename from params",
        )


if __name__ == "__main__":
    unittest.main()

#!/usr/bin/env python3
"""Failing tests for unsanitized 1099 year and EIN descriptions.

These tests exercise the new-year confirm path in
BigWebApp/Modules/Ap/Ap1099ny.pas (btnOkClick -> Insert1099) and the
year-combo display in BigWebApp/Modules/Ap/Ap1099.pas (TblYearCalcFields).

They fail while the description typed on the new-year dialog, or the EIN
description selected on that same confirm, is concatenated into SQL.
They pass once those values are passed as data (bound parameters, or an
equivalent quote-safe literal) so a breakout cannot change what is stored
or what ap.Populate_AP1099_Detil receives.

The product is Delphi and is not compiled here. The harness runs the two
procedures from the current source: IQFormat is System.SysUtils.Format
(IQMS.Common.NLS), and ExecuteCommand sends that text to the database
(IQMS.Common.DataLib) with parameter and macro expansion turned off.
SQLite evaluates the same INSERT expression and the same PL/SQL argument
expressions this path builds (string concatenation and a scalar subquery).

Run:
  python3 BigWebApp/Tests/test_ap1099_year_description_sqli.py

Not covered: TFrm1099.sbRecalcClick interpolates TblYearYEAR, which this
insert writes with an integer format, not the dialog description.
"""

from __future__ import annotations

import re
import sqlite3
import unittest
from pathlib import Path


REPO_AP = Path(__file__).resolve().parents[1] / "Modules" / "Ap"
NY_PATH = REPO_AP / "Ap1099ny.pas"
FORM_PATH = REPO_AP / "Ap1099.pas"
RSC_PATH = REPO_AP / "ap_rscstr.pas"

# Placeholder fixture, not a real tax identifier.
VENDOR_TAX_ID = "VENDOR-TAX-ID-FIXTURE"
BREAKOUT = "'||(select fed_tax_id from vendor where id = 1)||'"
YEAR = 2026


def _strip_pascal_comments(src: str) -> str:
    out = []
    i = 0
    n = len(src)
    while i < n:
        ch = src[i]
        if ch == "'":
            out.append(ch)
            i += 1
            while i < n:
                out.append(src[i])
                if src[i] == "'":
                    if i + 1 < n and src[i + 1] == "'":
                        out.append(src[i + 1])
                        i += 2
                        continue
                    i += 1
                    break
                i += 1
            continue
        if ch == "{":
            end = src.find("}", i + 1)
            i = n if end < 0 else end + 1
            continue
        if src.startswith("(*", i):
            end = src.find("*)", i + 2)
            i = n if end < 0 else end + 2
            continue
        if src.startswith("//", i):
            end = src.find("\n", i)
            i = n if end < 0 else end
            continue
        out.append(ch)
        i += 1
    return "".join(out)


def _procedure_body(src: str, qualified_name: str) -> str:
    """Return the begin/end body of a procedure, comments removed."""
    match = re.search(
        rf"\bprocedure\s+{re.escape(qualified_name)}\s*(\([^)]*\))?\s*;",
        src,
        flags=re.IGNORECASE,
    )
    if not match:
        raise AssertionError(f"procedure {qualified_name} not found")
    text = src[match.end() :]
    body_at = None
    depth_word = 0
    i = 0
    n = len(text)
    while i < n:
        if text[i] == "'":
            i += 1
            while i < n:
                if text[i] == "'":
                    if i + 1 < n and text[i + 1] == "'":
                        i += 2
                        continue
                    i += 1
                    break
                i += 1
            continue
        if text[i] == "{":
            end = text.find("}", i + 1)
            i = n if end < 0 else end + 1
            continue
        if text.startswith("(*", i):
            end = text.find("*)", i + 2)
            i = n if end < 0 else end + 2
            continue
        if text.startswith("//", i):
            end = text.find("\n", i)
            i = n if end < 0 else end
            continue
        if re.match(r"\bbegin\b", text[i:], flags=re.IGNORECASE):
            if depth_word == 0 and body_at is None:
                body_at = i
            depth_word += 1
            i += 5
            continue
        if re.match(r"\bend\b", text[i:], flags=re.IGNORECASE):
            depth_word -= 1
            i += 3
            if depth_word == 0 and body_at is not None:
                return _strip_pascal_comments(text[body_at:i])
            continue
        i += 1
    raise AssertionError(f"could not isolate body of {qualified_name}")


def delphi_format(fmt: str, args: list) -> str:
    """System.SysUtils.Format for the specifiers this path uses.

    %s inserts the argument unchanged. %f defaults to 2 fractional digits
    and IQFormat forces a '.' decimal separator before calling Format.
    """
    out = []
    i = 0
    arg_i = 0
    while i < len(fmt):
        if fmt[i] != "%":
            out.append(fmt[i])
            i += 1
            continue
        if i + 1 < len(fmt) and fmt[i + 1] == "%":
            out.append("%")
            i += 2
            continue
        i += 1
        while i < len(fmt) and fmt[i].isdigit():
            i += 1
        if i < len(fmt) and fmt[i] == ":":
            i += 1
        if i < len(fmt) and fmt[i] == "-":
            i += 1
        while i < len(fmt) and fmt[i].isdigit():
            i += 1
        prec = None
        if i < len(fmt) and fmt[i] == ".":
            i += 1
            start = i
            while i < len(fmt) and fmt[i].isdigit():
                i += 1
            prec = int(fmt[start:i] or "0")
        if i >= len(fmt):
            raise AssertionError(f"truncated format specifier in {fmt!r}")
        kind = fmt[i]
        i += 1
        if arg_i >= len(args):
            raise AssertionError(f"not enough arguments for {fmt!r}")
        value = args[arg_i]
        arg_i += 1
        if kind in ("s", "S"):
            out.append("" if value is None else str(value))
        elif kind in ("d", "D", "u", "U"):
            out.append(str(int(value)))
        elif kind in ("f", "F"):
            digits = 2 if prec is None else prec
            out.append(f"{float(value):.{digits}f}")
        else:
            raise AssertionError(f"unsupported format %{kind} in {fmt!r}")
    if arg_i != len(args):
        raise AssertionError(f"unused format arguments for {fmt!r}: {args[arg_i:]!r}")
    return "".join(out)


def _pascal_string_token(src: str, i: int) -> tuple[str, int]:
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
    raise AssertionError("unterminated Pascal string")


def _tokenize(src: str) -> list[tuple]:
    tokens = []
    i = 0
    n = len(src)
    while i < n:
        ch = src[i]
        if ch.isspace():
            i += 1
            continue
        if ch == "'":
            text, i = _pascal_string_token(src, i)
            tokens.append(("str", text))
            continue
        if ch.isdigit() or (ch == "." and i + 1 < n and src[i + 1].isdigit()):
            start = i
            i += 1
            while i < n and (src[i].isdigit() or src[i] == "."):
                i += 1
            tokens.append(("num", src[start:i]))
            continue
        if ch.isalpha() or ch == "_":
            start = i
            i += 1
            while i < n and (src[i].isalnum() or src[i] == "_"):
                i += 1
            word = src[start:i]
            tokens.append(("word", word))
            continue
        for symbol in (":=", "<>", "<=", ">="):
            if src.startswith(symbol, i):
                tokens.append(("sym", symbol))
                i += len(symbol)
                break
        else:
            tokens.append(("sym", ch))
            i += 1
    tokens.append(("eof", ""))
    return tokens


class _Parser:
    def __init__(self, src: str):
        self.tokens = _tokenize(src)
        self.i = 0

    def _tok(self):
        return self.tokens[self.i]

    def _accept_word(self, *words) -> bool:
        kind, value = self._tok()
        if kind == "word" and value.lower() in words:
            self.i += 1
            return True
        return False

    def _expect_word(self, *words):
        if not self._accept_word(*words):
            raise AssertionError(f"expected {'/'.join(words)} at {self._tok()!r}")

    def _accept_sym(self, symbol) -> bool:
        kind, value = self._tok()
        if kind == "sym" and value == symbol:
            self.i += 1
            return True
        return False

    def _expect_sym(self, symbol):
        if not self._accept_sym(symbol):
            raise AssertionError(f"expected {symbol!r} at {self._tok()!r}")

    def parse_block(self):
        self._expect_word("begin")
        stmts = []
        while not self._accept_word("end"):
            while self._accept_sym(";"):
                pass
            if self._accept_word("end"):
                break
            stmts.append(self.parse_stmt())
        return ("block", stmts)

    def parse_stmt(self):
        if self._tok() == ("word", "begin") or (
            self._tok()[0] == "word" and self._tok()[1].lower() == "begin"
        ):
            return self.parse_block()
        if self._accept_word("if"):
            cond = self.parse_expr()
            self._expect_word("then")
            then_stmt = self.parse_stmt()
            else_stmt = None
            if self._accept_word("else"):
                else_stmt = self.parse_stmt()
            return ("if", cond, then_stmt, else_stmt)
        if self._accept_word("with"):
            target = self.parse_expr()
            self._expect_word("do")
            return ("with", target, self.parse_stmt())
        if self._accept_word("raise"):
            expr = self.parse_expr()
            self._accept_sym(";")
            return ("raise", expr)
        if self._accept_word("exit"):
            self._accept_sym(";")
            return ("exit",)
        expr = self.parse_expr()
        if self._accept_sym(":="):
            value = self.parse_expr()
            self._accept_sym(";")
            return ("assign", expr, value)
        # `Insert1099;` is a call with no argument list.
        if expr[0] == "name":
            expr = ("call", expr[1], [])
        self._accept_sym(";")
        return ("call", expr)

    def parse_expr(self):
        return self._parse_or()

    def _parse_or(self):
        left = self._parse_and()
        while self._accept_word("or"):
            left = ("or", left, self._parse_and())
        return left

    def _parse_and(self):
        left = self._parse_cmp()
        while self._accept_word("and"):
            left = ("and", left, self._parse_cmp())
        return left

    def _parse_cmp(self):
        left = self._parse_add()
        kind, value = self._tok()
        if kind == "sym" and value in ("=", "<>", "<", ">", "<=", ">="):
            self.i += 1
            return ("cmp", value, left, self._parse_add())
        return left

    def _parse_add(self):
        left = self._parse_primary()
        while self._accept_sym("+"):
            left = ("add", left, self._parse_primary())
        return left

    def _parse_primary(self):
        kind, value = self._tok()
        if kind == "num":
            self.i += 1
            number = float(value) if "." in value else int(value)
            return ("lit", number)
        if kind == "str":
            self.i += 1
            return ("lit", value)
        if kind == "sym" and value == "(":
            self.i += 1
            expr = self.parse_expr()
            self._expect_sym(")")
            return expr
        if kind == "sym" and value == "[":
            self.i += 1
            items = []
            if not self._accept_sym("]"):
                while True:
                    items.append(self.parse_expr())
                    if self._accept_sym("]"):
                        break
                    self._expect_sym(",")
            return ("list", items)
        if kind != "word":
            raise AssertionError(f"unexpected token {self._tok()!r}")
        self.i += 1
        name = value
        while self._accept_sym("."):
            part_kind, part = self._tok()
            if part_kind != "word":
                raise AssertionError(f"expected field name at {self._tok()!r}")
            self.i += 1
            name += "." + part
        if self._accept_sym("("):
            args = []
            if not self._accept_sym(")"):
                while True:
                    args.append(self.parse_expr())
                    if self._accept_sym(")"):
                        break
                    self._expect_sym(",")
            return ("call", name, args)
        return ("name", name)


class _SaveStopped(Exception):
    pass


class _YearSave:
    """Run TFrm1099NewYear.btnOkClick from the source currently on disk."""

    def __init__(self, connection, description: str, year: int, picker: dict | None):
        self.con = connection
        self.description = description
        self.year = year
        self.picker = picker
        self.with_stack = []
        self.next_id = 1001
        self.executed = []
        self.populate_args = None
        self.vars = {
            "fid": 0.0,
            "feinid": 0.0,
            "feindescrip": "",
            "seyear.value": year,
            "eddescrip.text": description,
        }
        ny = NY_PATH.read_text(encoding="utf-8", errors="replace")
        self.bodies = {
            "tfrm1099newyear.btnokclick": _procedure_body(
                ny, "TFrm1099NewYear.btnOkClick"
            ),
            "tfrm1099newyear.insert1099": _procedure_body(
                ny, "TFrm1099NewYear.Insert1099"
            ),
        }
        self.resources = _resource_strings(RSC_PATH.read_text(encoding="utf-8", errors="replace"))

    def confirm(self):
        self._run_body(self.bodies["tfrm1099newyear.btnokclick"])

    def _run_body(self, body: str):
        parser = _Parser(body)
        stmt = parser.parse_block()
        if parser._tok()[0] != "eof":
            raise AssertionError(f"unparsed trailing tokens: {parser._tok()!r}")
        self._exec(stmt)

    def _exec(self, stmt):
        kind = stmt[0]
        if kind == "block":
            for item in stmt[1]:
                self._exec(item)
            return
        if kind == "if":
            _, cond, then_stmt, else_stmt = stmt
            if self._truth(self._eval(cond)):
                self._exec(then_stmt)
            elif else_stmt is not None:
                self._exec(else_stmt)
            return
        if kind == "with":
            self.with_stack.append(self._eval(stmt[1]))
            try:
                self._exec(stmt[2])
            finally:
                self.with_stack.pop()
            return
        if kind == "assign":
            target = stmt[1]
            if target[0] != "name":
                raise AssertionError(f"bad assignment target {target!r}")
            self.vars[target[1].lower()] = self._eval(stmt[2])
            return
        if kind == "call":
            self._eval(stmt[1])
            return
        if kind == "raise":
            raise _SaveStopped(str(self._eval(stmt[1])))
        if kind == "exit":
            raise _SaveStopped("exit")
        raise AssertionError(f"bad statement {stmt!r}")

    def _truth(self, value) -> bool:
        if isinstance(value, str):
            return value != ""
        return bool(value)

    def _eval(self, expr):
        kind = expr[0]
        if kind == "lit":
            return expr[1]
        if kind == "name":
            key = expr[1].lower()
            if key in self.vars:
                return self.vars[key]
            if key == "pkein":
                return "pkein"
            if key == "execute" and self.with_stack and self.with_stack[-1] == "pkein":
                return self.picker is not None
            if key in self.resources:
                return self.resources[key]
            raise AssertionError(f"unknown name {expr[1]}")
        if kind == "list":
            return [self._eval(item) for item in expr[1]]
        if kind == "or":
            return self._truth(self._eval(expr[1])) or self._truth(self._eval(expr[2]))
        if kind == "and":
            return self._truth(self._eval(expr[1])) and self._truth(self._eval(expr[2]))
        if kind == "cmp":
            op, left, right = expr[1], self._eval(expr[2]), self._eval(expr[3])
            if op == "=":
                return left == right
            if op == "<>":
                return left != right
            if op == "<":
                return left < right
            if op == ">":
                return left > right
            if op == "<=":
                return left <= right
            if op == ">=":
                return left >= right
        if kind == "add":
            return str(self._eval(expr[1])) + str(self._eval(expr[2]))
        if kind == "call":
            return self._call(expr[1], [self._eval(arg) for arg in expr[2]])
        raise AssertionError(f"bad expression {expr!r}")

    def _call(self, name: str, args):
        key = name.lower()
        if key == "inttostr":
            return str(int(args[0]))
        if key == "quotedstr":
            return "'" + str(args[0]).replace("'", "''") + "'"
        if key == "stringreplace":
            text, old, new = str(args[0]), str(args[1]), str(args[2])
            flags = args[3] if len(args) > 3 else []
            if not isinstance(flags, list):
                flags = [flags]
            replace_all = any(str(flag).lower() == "rfreplaceall" for flag in flags)
            return text.replace(old, new) if replace_all else text.replace(old, new, 1)
        if key == "trim":
            return str(args[0]).strip()
        if key == "format":
            return delphi_format(str(args[0]), list(args[1]) if len(args) > 1 else [])
        if key == "exception.create":
            return args[0] if args else "exception"
        if key == "getnextid":
            # Sequence name is derived from the table-name argument, not the description.
            new_id = float(self.next_id)
            self.next_id += 1
            return new_id
        if key == "selectvalueasstring":
            return self._select(args[0], "str")
        if key == "selectvalueasfloat":
            return self._select(args[0], "float")
        if key == "selectvaluefmtasfloat":
            return self._select(delphi_format(args[0], list(args[1])), "float")
        if key == "getvalue":
            if not self.picker:
                raise AssertionError("GetValue without a pick-list selection")
            field = str(args[0]).lower()
            for picker_key, picker_value in self.picker.items():
                if picker_key.lower() == field:
                    return picker_value
            raise AssertionError(f"pick list has no field {args[0]}")
        if key == "insert1099":
            self._run_body(self.bodies["tfrm1099newyear.insert1099"])
            return None
        if key == "close":
            return None
        if key == "executecommandfmt":
            self._execute_command(delphi_format(str(args[0]), list(args[1])))
            return None
        if key == "executecommand":
            self._execute_command(str(args[0]))
            return None
        if key == "executecommandparam":
            self._execute_param(str(args[0]), list(args[1]), list(args[2]))
            return None
        if key == "pkein":
            return "pkein"
        raise AssertionError(f"unsupported call {name}({args!r})")

    def _select(self, sql: str, kind: str):
        executable = sql
        # The iqsys probe is the only statement in this path that uses Oracle rownum.
        # The description is not an argument of that statement.
        probe = "select NVL(SEPARATE_PR_ECOMPANY, 'N') from iqsys where rownum < 2"
        if " ".join(sql.split()).lower() == " ".join(probe.split()).lower():
            executable = "select IFNULL(SEPARATE_PR_ECOMPANY, 'N') from iqsys limit 1"
        try:
            row = self.con.execute(executable).fetchone()
        except sqlite3.Error as exc:
            raise AssertionError(f"select failed: {exc}; sql={sql}") from exc
        if row is None or row[0] is None:
            return "" if kind == "str" else 0.0
        if kind == "str":
            return str(row[0])
        return float(row[0])

    def _execute_command(self, sql: str):
        # ExecuteCommand: ReplaceStr(ASQL, '::=', ':=') then TFDCommand.Execute.
        # ParamCreate, ParamExpand, MacroCreate, MacroExpand, and EscapeExpand are false.
        sql = sql.replace("::=", ":=")
        self.executed.append(sql)
        populate = _match_populate(sql)
        if populate is not None:
            values = [_select_expr(self.con, piece) for piece in populate]
            self.populate_args = values
            self.con.execute(
                "insert into populate_ap1099_call(year_text, year_id, ein_id, ein_descrip) "
                "values (?, ?, ?, ?)",
                [None if value is None else str(value) for value in values],
            )
            return
        try:
            self.con.execute(sql)
        except sqlite3.Error as exc:
            raise AssertionError(f"command failed: {exc}; sql={sql}") from exc

    def _execute_param(self, sql: str, names, values):
        bound = {}
        for raw_name, raw_value in zip(names, values):
            param = str(raw_name).split(";", 1)[0].strip().lstrip(":")
            bound[param] = raw_value
        self.executed.append(("param", sql, bound))
        populate = _match_populate(sql)
        if populate is not None:
            resolved = []
            for piece in populate:
                name = piece.strip()
                if name.startswith(":"):
                    key = name[1:]
                    match = next(
                        (value for param, value in bound.items() if param.lower() == key.lower()),
                        None,
                    )
                    resolved.append(match)
                else:
                    resolved.append(_select_expr(self.con, piece))
            self.populate_args = resolved
            self.con.execute(
                "insert into populate_ap1099_call(year_text, year_id, ein_id, ein_descrip) "
                "values (?, ?, ?, ?)",
                [None if value is None else str(value) for value in resolved],
            )
            return
        try:
            self.con.execute(sql, bound)
        except sqlite3.Error as exc:
            raise AssertionError(f"param command failed: {exc}; sql={sql}; bound={bound!r}") from exc


def _resource_strings(src: str) -> dict:
    found = {}
    for match in re.finditer(
        r"\b(cTXT\d+)\s*=\s*'((?:''|[^'])*)'",
        src,
        flags=re.IGNORECASE,
    ):
        found["ap_rscstr." + match.group(1).lower()] = match.group(2).replace("''", "'")
    return found


def _match_populate(sql: str):
    match = re.match(
        r"\s*begin\s+ap\.Populate_AP1099_Detil\s*\(",
        sql,
        flags=re.IGNORECASE,
    )
    if not match:
        return None
    depth = 1
    i = match.end()
    start = i
    in_string = False
    while i < len(sql):
        ch = sql[i]
        if in_string:
            if ch == "'":
                if i + 1 < len(sql) and sql[i + 1] == "'":
                    i += 2
                    continue
                in_string = False
            i += 1
            continue
        if ch == "'":
            in_string = True
        elif ch == "(":
            depth += 1
        elif ch == ")":
            depth -= 1
            if depth == 0:
                inner = sql[start:i]
                tail = sql[i + 1 :]
                if not re.match(r"\s*;\s*end\s*;\s*$", tail, flags=re.IGNORECASE):
                    raise AssertionError(f"unexpected populate tail {tail!r}")
                return _split_sql_args(inner)
        i += 1
    raise AssertionError(f"unclosed populate call in {sql!r}")


def _split_sql_args(inner: str) -> list[str]:
    parts = []
    buf = []
    depth = 0
    in_string = False
    i = 0
    while i < len(inner):
        ch = inner[i]
        if in_string:
            buf.append(ch)
            if ch == "'":
                if i + 1 < len(inner) and inner[i + 1] == "'":
                    buf.append(inner[i + 1])
                    i += 2
                    continue
                in_string = False
            i += 1
            continue
        if ch == "'":
            in_string = True
            buf.append(ch)
        elif ch == "(":
            depth += 1
            buf.append(ch)
        elif ch == ")":
            depth -= 1
            buf.append(ch)
        elif ch == "," and depth == 0:
            parts.append("".join(buf).strip())
            buf = []
        else:
            buf.append(ch)
        i += 1
    tail = "".join(buf).strip()
    if tail:
        parts.append(tail)
    return parts


def _select_expr(con: sqlite3.Connection, expression: str):
    try:
        row = con.execute(f"select ({expression})").fetchone()
    except sqlite3.Error as exc:
        raise AssertionError(f"could not evaluate {expression!r}: {exc}") from exc
    if row is None:
        return None
    return row[0]


def _year_display_format() -> str:
    """Format string TblYearCalcFields uses to show the year on the 1099 screen."""
    src = _strip_pascal_comments(FORM_PATH.read_text(encoding="utf-8", errors="replace"))
    match = re.search(
        r"TblYearYearDesc\.AsString\s*:=\s*Format\(\s*'((?:''|[^'])*)'\s*,\s*"
        r"\[\s*TblYearYEAR\.asString\s*,\s*Trim\(\s*TblYearDESCRIP\.asString\s*\)\s*\]\s*\)",
        src,
        flags=re.IGNORECASE,
    )
    if not match:
        raise AssertionError("TblYearCalcFields display format not found")
    return match.group(1).replace("''", "'")


def _open_db(*, separate_pr_ecompany: str, eplant_ein: bool) -> sqlite3.Connection:
    con = sqlite3.connect(":memory:")
    con.execute("create table iqsys (separate_pr_ecompany text)")
    con.execute(
        "insert into iqsys(separate_pr_ecompany) values (?)",
        (separate_pr_ecompany,),
    )
    con.execute("create table eplant (id integer, ein_id integer)")
    if eplant_ein:
        con.execute("insert into eplant(id, ein_id) values (1, 5)")
    con.execute(
        "create table ap1099_years (id real, year text, descrip text, ein_id real)"
    )
    con.execute("create table vendor (id integer primary key, fed_tax_id text)")
    con.execute(
        "insert into vendor(id, fed_tax_id) values (1, ?)",
        (VENDOR_TAX_ID,),
    )
    con.execute(
        "create table populate_ap1099_call ("
        "year_text text, year_id text, ein_id text, ein_descrip text)"
    )
    return con


def _displayed(con: sqlite3.Connection, year_id: float) -> str | None:
    row = con.execute(
        "select year, descrip from ap1099_years where id = ?",
        (year_id,),
    ).fetchone()
    if row is None:
        return None
    year_text = "" if row[0] is None else str(row[0])
    descrip = "" if row[1] is None else str(row[1]).strip()
    return delphi_format(_year_display_format(), [year_text, descrip])


class Ap1099YearDescriptionTests(unittest.TestCase):
    def test_plain_description_is_stored_and_shown(self):
        description = "Calendar 2026"
        con = _open_db(separate_pr_ecompany="N", eplant_ein=False)
        save = _YearSave(con, description, YEAR, picker=None)
        save.confirm()
        shown = _displayed(con, 1001.0)
        self.assertEqual(shown, delphi_format(_year_display_format(), [str(YEAR), description]))
        self.assertEqual(
            con.execute("select fed_tax_id from vendor where id = 1").fetchone()[0],
            VENDOR_TAX_ID,
        )

    def test_year_description_breakout_is_not_stored_or_shown(self):
        """Attack path: confirm the new-year dialog with a description that
        closes the quoted literal and appends a scalar subquery."""
        con = _open_db(separate_pr_ecompany="N", eplant_ein=False)
        save = _YearSave(con, BREAKOUT, YEAR, picker=None)
        try:
            save.confirm()
        except _SaveStopped as stopped:
            self.fail(f"confirm stopped before a safe save: {stopped}; sql={save.executed!r}")
        stored = con.execute("select descrip from ap1099_years").fetchall()
        shown = _displayed(con, 1001.0)
        self.assertNotEqual(
            stored,
            [(VENDOR_TAX_ID,)],
            f"year description became the selected tax id; sql={save.executed!r}",
        )
        self.assertTrue(
            stored == [] or stored == [(BREAKOUT,)],
            f"stored description {stored!r} is not the typed text; sql={save.executed!r}",
        )
        if shown is not None:
            self.assertEqual(
                shown,
                delphi_format(_year_display_format(), [str(YEAR), BREAKOUT.strip()]),
            )
            self.assertNotIn(VENDOR_TAX_ID, shown)
        self.assertEqual(
            con.execute("select fed_tax_id from vendor where id = 1").fetchone()[0],
            VENDOR_TAX_ID,
        )

    def test_selected_ein_description_breakout_is_not_a_query(self):
        """Same confirm, when company EIN separation is on: the selected EIN
        description is the fourth argument of ap.Populate_AP1099_Detil."""
        con = _open_db(separate_pr_ecompany="Y", eplant_ein=True)
        save = _YearSave(
            con,
            "Calendar 2026",
            YEAR,
            picker={"ID": 5.0, "DESCRIP": BREAKOUT},
        )
        try:
            save.confirm()
        except _SaveStopped as stopped:
            self.fail(f"confirm stopped before a safe save: {stopped}; sql={save.executed!r}")
        inserted = con.execute("select descrip from ap1099_years").fetchall()
        self.assertEqual(inserted, [("Calendar 2026",)])
        body = save.bodies["tfrm1099newyear.insert1099"]
        if re.search(r"\bFEINDescrip\b", body):
            self.assertIsNotNone(
                save.populate_args,
                f"FEINDescrip is still referenced but no populate call ran; sql={save.executed!r}",
            )
            received = "" if save.populate_args[3] is None else str(save.populate_args[3])
            self.assertEqual(
                received,
                BREAKOUT,
                f"populate EIN description was evaluated as SQL; sql={save.executed!r}",
            )
            self.assertNotEqual(received, VENDOR_TAX_ID)
        calls = con.execute("select ein_descrip from populate_ap1099_call").fetchall()
        for (value,) in calls:
            self.assertNotEqual(value, VENDOR_TAX_ID)


if __name__ == "__main__":
    unittest.main()

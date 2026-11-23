# Spec for the credit-card log disclosure.
#
# These tests execute the gateway command builders, LastRequest / LastResponse,
# ExecuteCommand's log call, and WriteToLog from the product source. They fail
# while a merchant password, PIN, or similar secret is still present in the
# value stored as v_request_data (or v_response_data). They pass once that
# stored text no longer contains the secret and still keeps a masked card
# number when the command included one.
#
# The HTTP gateway call is not performed. ExecuteCommand assigns FLastRequest
# before that call and does not modify it afterward; the stand-in returns an
# empty response and leaves the request unchanged.

import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
EPAY = ROOT / "BigWebApp/Modules/Creditcard/cc_epayment.pas"
CLOG = ROOT / "BigWebApp/Modules/Creditcard/cc_log.pas"
CSHARE = ROOT / "BigWebApp/Modules/Creditcard/cc_share.pas"
STRINGS = ROOT / "BigWebApp/Components/IQWebCommon/Source/IQMS.Common.StringUtils.pas"
MISC = ROOT / "BigWebApp/Components/IQWebVcl/Source/IQMS.Common.Miscellaneous.pas"
RSC = ROOT / "BigWebApp/Modules/Creditcard/cc_rscstr.pas"
CTYPES = ROOT / "BigWebApp/Modules/Creditcard/cc_types.pas"

PAN = "4000000000004242"
CVV = "907"
PASSWORD = "MERCHANT_PASSWORD_PLACEHOLDER"
TRANSACTION_KEY = "TXNKEY_PLACEHOLDER_1234567890123"  # 32 characters
PROFILE_KEY = "PROFILE_KEY_PLACEHOLDER"
TRANS_KEY = "TRANS_KEY_PLACEHOLDER"
SIGNATURE = "SIGNATURE_PLACEHOLDER"
SECURITY_CODE = "SECURITY_CODE_PLACEHOLDER"

assert len(TRANSACTION_KEY) == 32

UNIT_FILES = {
    "cc_epayment": EPAY,
    "cc_log": CLOG,
    "cc_share": CSHARE,
    "iqms.common.stringutils": STRINGS,
    "iqms.common.miscellaneous": MISC,
    "cc_rscstr": RSC,
}


class InterpError(Exception):
    pass


class ReturnSignal(Exception):
    def __init__(self, value):
        self.value = value


class Raised(Exception):
    def __init__(self, message):
        super().__init__(message)
        self.message = message


class Tok:
    def __init__(self, kind, value, line):
        self.kind = kind
        self.value = value
        self.line = line

    def __repr__(self):
        return f"{self.kind}:{self.value!r}@{self.line}"


def tokenize(text):
    toks = []
    i = 0
    n = len(text)
    line = 1
    while i < n:
        c = text[i]
        if c == "\n":
            line += 1
            i += 1
            continue
        if c in " \t\r":
            i += 1
            continue
        if c == "/" and i + 1 < n and text[i + 1] == "/":
            while i < n and text[i] != "\n":
                i += 1
            continue
        if c == "{":
            if i + 1 < n and text[i + 1] == "$":
                i += 2
                while i < n and text[i] != "}":
                    if text[i] == "\n":
                        line += 1
                    i += 1
                i = min(i + 1, n)
                continue
            i += 1
            while i < n and text[i] != "}":
                if text[i] == "\n":
                    line += 1
                i += 1
            i = min(i + 1, n)
            continue
        if c == "(" and i + 1 < n and text[i + 1] == "*":
            i += 2
            while i + 1 < n and not (text[i] == "*" and text[i + 1] == ")"):
                if text[i] == "\n":
                    line += 1
                i += 1
            i = min(i + 2, n)
            continue
        if c == "'":
            i += 1
            buf = []
            while i < n:
                if text[i] == "'":
                    if i + 1 < n and text[i + 1] == "'":
                        buf.append("'")
                        i += 2
                        continue
                    i += 1
                    break
                if text[i] == "\n":
                    line += 1
                buf.append(text[i])
                i += 1
            toks.append(Tok("str", "".join(buf), line))
            continue
        if c == "#":
            i += 1
            if i < n and text[i] == "$":
                i += 1
                h = ""
                while i < n and text[i] in "0123456789abcdefABCDEF":
                    h += text[i]
                    i += 1
                ch = chr(int(h, 16)) if h else ""
            else:
                num = ""
                while i < n and text[i].isdigit():
                    num += text[i]
                    i += 1
                ch = chr(int(num)) if num else ""
            if toks and toks[-1].kind == "str" and toks[-1].line == line:
                toks[-1].value += ch
            elif toks and toks[-1].kind == "char" and toks[-1].line == line:
                toks[-1] = Tok("str", toks[-1].value + ch, line)
            else:
                toks.append(Tok("char", ch, line))
            continue
        if c == "$":
            i += 1
            h = ""
            while i < n and text[i] in "0123456789abcdefABCDEF":
                h += text[i]
                i += 1
            toks.append(Tok("num", int(h, 16) if h else 0, line))
            continue
        if c.isdigit():
            j = i
            while i < n and text[i].isdigit():
                i += 1
            if i < n and text[i] == "." and not (i + 1 < n and text[i + 1] == "."):
                i += 1
                while i < n and text[i].isdigit():
                    i += 1
                toks.append(Tok("num", float(text[j:i]), line))
            else:
                toks.append(Tok("num", int(text[j:i]), line))
            continue
        if c.isalpha() or c == "_":
            j = i
            i += 1
            while i < n and (text[i].isalnum() or text[i] == "_"):
                i += 1
            toks.append(Tok("id", text[j:i], line))
            continue
        if c == ":" and i + 1 < n and text[i + 1] == "=":
            toks.append(Tok("sym", ":=", line))
            i += 2
            continue
        if c == "<" and i + 1 < n and text[i + 1] in "=>":
            toks.append(Tok("sym", c + text[i + 1], line))
            i += 2
            continue
        if c == ">" and i + 1 < n and text[i + 1] == "=":
            toks.append(Tok("sym", ">=", line))
            i += 2
            continue
        if c == "." and i + 1 < n and text[i + 1] == ".":
            toks.append(Tok("sym", "..", line))
            i += 2
            continue
        toks.append(Tok("sym", c, line))
        i += 1
    toks.append(Tok("eof", "", line))
    return toks


class EnumVal:
    def __init__(self, type_name, name, index):
        self.type_name = type_name
        self.name = name
        self.index = index

    def __eq__(self, other):
        return (
            isinstance(other, EnumVal)
            and self.name.lower() == other.name.lower()
        )

    def __hash__(self):
        return hash(self.name.lower())

    def __repr__(self):
        return self.name


class CharSet:
    def __init__(self, items):
        self.items = items

    def contains(self, value):
        if isinstance(value, str) and len(value) == 1:
            value_key = value
        else:
            value_key = value
        for item in self.items:
            if isinstance(item, tuple) and item and item[0] == "range":
                lo, hi = item[1], item[2]
                if isinstance(value_key, str) and isinstance(lo, str):
                    if lo <= value_key <= hi:
                        return True
                elif isinstance(value_key, (int, float)) and isinstance(lo, (int, float)):
                    if lo <= value_key <= hi:
                        return True
            elif isinstance(item, EnumVal) and isinstance(value, EnumVal):
                if item == value:
                    return True
            elif item == value_key or item == value:
                return True
        return False


class StringList:
    def __init__(self):
        self.items = []

    def Add(self, value):
        self.items.append("" if value is None else str(value))

    def Clear(self):
        self.items = []

    @property
    def Text(self):
        if not self.items:
            return ""
        return "\r\n".join(self.items) + "\r\n"

    @property
    def Count(self):
        return len(self.items)

    def __getitem__(self, index):
        return self.items[int(index)]


class CommandString:
    def __init__(self):
        self.Command = ""
        self.ListDelimiter = "&"
        self.HTMLEncoding = False
        self.AllowEmptyValues = True

    def Clear(self):
        self.Command = ""

    def Add(self, value):
        value = "" if value is None else str(value)
        if self.Command == "":
            self.Command = value
        else:
            self.Command = self.Command + str(self.ListDelimiter) + value


class ParamRec:
    def __init__(self, type_name, name, mode):
        self.type_name = type_name
        self.name = name
        self.mode = mode
        self.Value = None
        self.AsFMTBcd = None
        self.AsString = None
        self.AsDateTime = None


class ParamsObj:
    def __init__(self, owner):
        self.owner = owner

    def CreateParam(self, type_name, name, mode):
        rec = ParamRec(type_name, name, mode)
        self.owner.params.append(rec)
        return rec


class StoredProc:
    def __init__(self):
        self.params = []
        self.Params = ParamsObj(self)
        self.StoredProcName = ""
        self.Connection = None

    def Prepare(self):
        return None

    def ExecProc(self):
        return None

    def Free(self):
        return None


class WebService:
    def Execute(self, *args):
        return False

    def ExecuteThroughFirewall(self, *args):
        return False

    def Free(self):
        return None


class SimpleObj:
    def __init__(self, **fields):
        self.__dict__.update(fields)

    def AsNameValues(self, lines):
        return None

    def Reset(self):
        return None

    def Free(self):
        return None
    def GetSummary(self, *args):
        return None


class TypeRef:
    def __init__(self, name):
        self.name = name


class ConstUnit:
    def __init__(self, name):
        self.name = name


BUILTINS_TYPES = {
    "tstringlist": lambda: StringList(),
    "tfdstoredproc": lambda: StoredProc(),
    "twebservice": lambda: WebService(),
    "tcreditcardparams": lambda: SimpleObj(GatewayDescription=""),
    "tformatsettings": lambda: SimpleObj(DecimalSeparator=".", ThousandSeparator=","),
    "exception": lambda: None,
}


class Parser:
    def __init__(self, tokens, index=0):
        self.toks = tokens
        self.i = index

    def cur(self):
        return self.toks[self.i]

    def accept_id(self, *names):
        tok = self.cur()
        if tok.kind == "id" and tok.value.lower() in names:
            self.i += 1
            return tok.value
        return None

    def accept_sym(self, value):
        tok = self.cur()
        if tok.kind == "sym" and tok.value == value:
            self.i += 1
            return True
        return False

    def expect_sym(self, value):
        if not self.accept_sym(value):
            tok = self.cur()
            raise InterpError(f"expected {value} at line {tok.line}, got {tok}")

    def expect_id(self, *names):
        got = self.accept_id(*names)
        if got is None:
            tok = self.cur()
            raise InterpError(f"expected {names} at line {tok.line}, got {tok}")
        return got

    def parse_header_name(self):
        parts = [self.expect_any_id()]
        while self.accept_sym("."):
            parts.append(self.expect_any_id())
        return ".".join(parts)

    def expect_any_id(self):
        tok = self.cur()
        if tok.kind != "id":
            raise InterpError(f"expected identifier at line {tok.line}")
        self.i += 1
        return tok.value

    def parse_routine_header(self):
        kind = self.expect_id("procedure", "function", "constructor", "destructor")
        name = self.parse_header_name()
        params = []
        if self.accept_sym("("):
            if not self.accept_sym(")"):
                while True:
                    modes = []
                    while self.cur().kind == "id" and self.cur().value.lower() in (
                        "const",
                        "var",
                        "out",
                    ):
                        modes.append(self.cur().value.lower())
                        self.i += 1
                    is_var = "var" in modes or "out" in modes
                    names = [self.expect_any_id()]
                    while self.accept_sym(","):
                        names.append(self.expect_any_id())
                    self.expect_sym(":")
                    self.skip_type()
                    default = None
                    if self.accept_sym("="):
                        default = self.parse_expr()
                    for nm in names:
                        params.append({"name": nm, "var": is_var, "default": default})
                    if self.accept_sym(")"):
                        break
                    self.expect_sym(";")
        if kind == "function" or (
            self.cur().kind == "sym" and self.cur().value == ":"
        ):
            if self.accept_sym(":"):
                self.skip_type()
        self.expect_sym(";")
        while self.cur().kind == "id" and self.cur().value.lower() in (
            "overload",
            "override",
            "virtual",
            "abstract",
            "reintroduce",
            "stdcall",
            "inline",
            "forward",
        ):
            self.i += 1
            self.expect_sym(";")
        return {"kind": kind, "name": name, "params": params}

    def skip_type(self):
        if self.accept_id("array"):
            if self.accept_sym("["):
                depth = 1
                while depth:
                    if self.accept_sym("["):
                        depth += 1
                    elif self.accept_sym("]"):
                        depth -= 1
                    else:
                        self.i += 1
            self.accept_id("of")
            self.skip_type()
            return
        if self.cur().kind == "id":
            self.i += 1
            while self.accept_sym("."):
                self.expect_any_id()
            return
        tok = self.cur()
        raise InterpError(f"expected type at line {tok.line}")

    def has_body(self):
        tok = self.cur()
        if tok.kind != "id":
            return False
        return tok.value.lower() in ("begin", "var", "const", "type", "label")

    def parse_routine_body(self, header):
        consts = []
        local_vars = []
        nested = []
        while True:
            if self.accept_id("const"):
                while self.cur().kind == "id" and self.cur().value.lower() not in (
                    "var",
                    "begin",
                    "procedure",
                    "function",
                    "type",
                    "label",
                ):
                    cname = self.expect_any_id()
                    if self.accept_sym(":"):
                        self.skip_type()
                    self.expect_sym("=")
                    consts.append((cname, self.parse_expr()))
                    self.expect_sym(";")
                continue
            if self.accept_id("var"):
                while self.cur().kind == "id" and self.cur().value.lower() not in (
                    "begin",
                    "procedure",
                    "function",
                    "const",
                    "type",
                    "label",
                ):
                    names = [self.expect_any_id()]
                    while self.accept_sym(","):
                        names.append(self.expect_any_id())
                    self.expect_sym(":")
                    self.skip_type()
                    self.expect_sym(";")
                    local_vars.extend(names)
                continue
            if self.accept_id("type"):
                while self.cur().kind == "id" and self.cur().value.lower() not in (
                    "begin",
                    "procedure",
                    "function",
                    "var",
                    "const",
                ):
                    self.expect_any_id()
                    self.expect_sym("=")
                    depth = 0
                    while not (depth == 0 and self.cur().kind == "sym" and self.cur().value == ";"):
                        if self.cur().kind == "sym" and self.cur().value in ("(", "["):
                            depth += 1
                        elif self.cur().kind == "sym" and self.cur().value in (")", "]"):
                            depth -= 1
                        self.i += 1
                    self.expect_sym(";")
                continue
            if self.cur().kind == "id" and self.cur().value.lower() in (
                "procedure",
                "function",
            ):
                nested_header = self.parse_routine_header()
                if not self.has_body():
                    raise InterpError(
                        f"nested routine {nested_header['name']} has no body "
                        f"at line {self.cur().line}"
                    )
                nested.append(self.parse_routine_body(nested_header))
                continue
            break
        self.expect_id("begin")
        statements = self.parse_statements_until({"end"})
        self.expect_id("end")
        self.accept_sym(";")
        return {
            "header": header,
            "consts": consts,
            "vars": local_vars,
            "nested": nested,
            "body": statements,
        }

    def parse_statements_until(self, stop_ids):
        stmts = []
        while not (
            self.cur().kind == "id" and self.cur().value.lower() in stop_ids
        ):
            if self.cur().kind == "eof":
                raise InterpError("unterminated statement block")
            if self.accept_sym(";"):
                continue
            stmts.append(self.parse_stmt())
            self.accept_sym(";")
        return stmts

    def parse_stmt(self):
        if self.accept_id("begin"):
            stmts = self.parse_statements_until({"end"})
            self.expect_id("end")
            return ("block", stmts)
        if self.accept_id("if"):
            cond = self.parse_expr()
            self.expect_id("then")
            then_stmt = self.parse_stmt()
            else_stmt = None
            if self.accept_id("else"):
                else_stmt = self.parse_stmt()
            return ("if", cond, then_stmt, else_stmt)
        if self.accept_id("case"):
            expr = self.parse_expr()
            self.expect_id("of")
            arms = []
            else_stmt = None
            while not (
                self.cur().kind == "id"
                and self.cur().value.lower() in ("else", "end", "otherwise")
            ):
                labels = [self.parse_case_label()]
                while self.accept_sym(","):
                    labels.append(self.parse_case_label())
                self.expect_sym(":")
                stmt = self.parse_stmt()
                self.accept_sym(";")
                arms.append((labels, stmt))
            if self.accept_id("else") or self.accept_id("otherwise"):
                else_stmt = self.parse_stmt()
                self.accept_sym(";")
            self.expect_id("end")
            return ("case", expr, arms, else_stmt)
        if self.accept_id("for"):
            var = self.expect_any_id()
            self.expect_sym(":=")
            start = self.parse_expr()
            direction = self.expect_id("to", "downto")
            stop = self.parse_expr()
            self.expect_id("do")
            body = self.parse_stmt()
            return ("for", var, start, direction.lower(), stop, body)
        if self.accept_id("while"):
            cond = self.parse_expr()
            self.expect_id("do")
            body = self.parse_stmt()
            return ("while", cond, body)
        if self.accept_id("repeat"):
            stmts = self.parse_statements_until({"until"})
            self.expect_id("until")
            cond = self.parse_expr()
            return ("repeat", stmts, cond)
        if self.accept_id("try"):
            try_stmts = self.parse_statements_until({"finally", "except"})
            if self.accept_id("finally"):
                fin = self.parse_statements_until({"end"})
                self.expect_id("end")
                return ("tryfinally", try_stmts, fin)
            self.expect_id("except")
            handlers = []
            if self.cur().kind == "id" and self.cur().value.lower() == "on":
                while self.accept_id("on"):
                    ename = self.expect_any_id()
                    self.expect_sym(":")
                    etype = self.expect_any_id()
                    self.expect_id("do")
                    handlers.append((ename, etype, self.parse_stmt()))
                    self.accept_sym(";")
            else:
                handlers.append((None, None, ("block", self.parse_statements_until({"end"}))))
            self.expect_id("end")
            return ("tryexcept", try_stmts, handlers)
        if self.accept_id("with"):
            expr = self.parse_expr()
            self.expect_id("do")
            body = self.parse_stmt()
            return ("with", expr, body)
        if self.accept_id("raise"):
            expr = self.parse_expr()
            return ("raise", expr)
        if self.accept_id("exit"):
            if self.accept_sym("("):
                expr = self.parse_expr()
                self.expect_sym(")")
                return ("exit", expr)
            return ("exit", None)
        if self.accept_id("inherited"):
            if self.cur().kind == "id":
                name = self.expect_any_id()
                args = []
                if self.accept_sym("("):
                    if not self.accept_sym(")"):
                        while True:
                            args.append(self.parse_expr())
                            if self.accept_sym(")"):
                                break
                            self.expect_sym(",")
                return ("inherited", name, args)
            return ("inherited", None, [])
        expr = self.parse_expr()
        if self.accept_sym(":="):
            value = self.parse_expr()
            return ("assign", expr, value)
        return ("expr", expr)

    def parse_case_label(self):
        left = self.parse_expr()
        if self.accept_sym(".."):
            right = self.parse_expr()
            return ("range", left, right)
        return left

    def parse_expr(self):
        return self.parse_cmp()

    def parse_cmp(self):
        left = self.parse_add()
        while self.cur().kind == "sym" and self.cur().value in (
            "=",
            "<>",
            "<",
            ">",
            "<=",
            ">=",
        ) or (self.cur().kind == "id" and self.cur().value.lower() == "in"):
            if self.cur().kind == "id":
                op = "in"
                self.i += 1
            else:
                op = self.cur().value
                self.i += 1
            right = self.parse_add()
            left = ("bin", op, left, right)
        return left

    def parse_add(self):
        left = self.parse_mul()
        while self.cur().kind == "sym" and self.cur().value in ("+", "-", "or") or (
            self.cur().kind == "id" and self.cur().value.lower() == "or"
        ) or (self.cur().kind == "id" and self.cur().value.lower() == "xor"):
            op = self.cur().value.lower() if self.cur().kind == "id" else self.cur().value
            self.i += 1
            right = self.parse_mul()
            left = ("bin", op, left, right)
        return left

    def parse_mul(self):
        left = self.parse_unary()
        while (
            self.cur().kind == "sym"
            and self.cur().value in ("*", "/")
        ) or (
            self.cur().kind == "id"
            and self.cur().value.lower() in ("and", "div", "mod", "shl", "shr")
        ):
            op = self.cur().value.lower() if self.cur().kind == "id" else self.cur().value
            self.i += 1
            right = self.parse_unary()
            left = ("bin", op, left, right)
        return left

    def parse_unary(self):
        if self.accept_id("not"):
            return ("not", self.parse_unary())
        if self.accept_sym("-"):
            return ("neg", self.parse_unary())
        if self.accept_sym("+"):
            return self.parse_unary()
        return self.parse_postfix()

    def parse_postfix(self):
        expr = self.parse_primary()
        while True:
            if self.accept_sym("."):
                name = self.expect_any_id()
                expr = ("member", expr, name)
                continue
            if self.accept_sym("("):
                args = []
                if not self.accept_sym(")"):
                    while True:
                        args.append(self.parse_expr())
                        if self.accept_sym(")"):
                            break
                        self.expect_sym(",")
                expr = ("call", expr, args)
                continue
            if self.accept_sym("["):
                index = self.parse_expr()
                self.expect_sym("]")
                expr = ("index", expr, index)
                continue
            break
        return expr

    def parse_primary(self):
        tok = self.cur()
        if tok.kind == "str":
            self.i += 1
            return ("lit", tok.value)
        if tok.kind == "char":
            self.i += 1
            return ("lit", tok.value)
        if tok.kind == "num":
            self.i += 1
            return ("lit", tok.value)
        if tok.kind == "id" and tok.value.lower() == "nil":
            self.i += 1
            return ("lit", None)
        if tok.kind == "id" and tok.value.lower() == "true":
            self.i += 1
            return ("lit", True)
        if tok.kind == "id" and tok.value.lower() == "false":
            self.i += 1
            return ("lit", False)
        if tok.kind == "id":
            self.i += 1
            return ("name", tok.value)
        if self.accept_sym("("):
            expr = self.parse_expr()
            if self.accept_sym(","):
                items = [expr]
                while True:
                    items.append(self.parse_expr())
                    if self.accept_sym(")"):
                        break
                    self.expect_sym(",")
                return ("bracket", items)
            self.expect_sym(")")
            return expr
        if self.accept_sym("["):
            items = []
            if not self.accept_sym("]"):
                while True:
                    left = self.parse_expr()
                    if self.accept_sym(".."):
                        right = self.parse_expr()
                        items.append(("range", left, right))
                    else:
                        items.append(left)
                    if self.accept_sym("]"):
                        break
                    self.expect_sym(",")
            return ("bracket", items)
        raise InterpError(f"expected expression at line {tok.line}, got {tok}")


def read_text(path):
    data = path.read_bytes()
    if data.startswith(b"\xef\xbb\xbf"):
        return data.decode("utf-8-sig")
    try:
        return data.decode("utf-8")
    except UnicodeDecodeError:
        return data.decode("cp1252")


class Engine:
    def __init__(self):
        self.token_cache = {}
        self.routine_cache = {}
        self.const_cache = {}
        self.procs = []
        self.logged_request = None
        self.logged_response = None
        self.self_obj = None
        self.class_name = None
        self.parents = {
            "tepaymentmerchantaccountsca": "tepaymentprocessor",
            "tepaymenttsys": "tepaymentprocessor",
            "tepaymentmoneris": "tepaymentprocessor",
            "tepaymentmoneriscanada": "tepaymentmoneris",
            "tepaymentmonerisusa": "tepaymentmoneris",
            "tepaymentelavon": "tepaymentprocessor",
            "tepaymentpaypal": "tepaymentprocessor",
            "tepaymentpayflowpro": "tepaymentprocessor",
            "tepaymentauthorizenet": "tepaymentprocessor",
            "tepaymentmes": "tepaymentprocessor",
            "tepaymentsterling": "tepaymentprocessor",
            "tepaymentfirstdata": "tepaymentprocessor",
            "tepaymentcreditcard": "tobject",
            "tepaymentresponse": "tobject",
            "tepaymentcommandstring": "tobject",
        }
        self.enums = {}
        self._load_enums()

    def _load_enums(self):
        groups = {
            "TTransactionType": [
                "ttSale",
                "ttAuthOnly",
                "ttCapture",
                "ttCredit",
                "ttVoid",
                "ttForce",
                "ttAVSOnly",
                "ttAddToken",
                "ttDeleteToken",
                "ttQueryToken",
            ],
            "TProcessingClass": ["pclNone", "pclLevel2", "pclLevel3"],
            "TCreditCardType": [
                "ccUnknown",
                "ccVisa",
                "ccMasterCard",
                "ccAmex",
                "ccDiscover",
                "ccDinersClub",
                "ccJCB",
                "ccChinaUnionPay",
                "ccMaestro",
            ],
            "THttpContentType": ["ctXML", "ctHTMLForm", "ctJSon"],
            "TLogSource": [
                "lsUnknown",
                "lsAuthorization",
                "lsSettlement",
                "lsPurge",
                "lsCardTypes",
                "lsAttachCard",
                "lsCustCards",
                "lsManualSettlement",
                "lsLog",
            ],
            "TLogClass": [
                "ltUnknown",
                "ltTransaction",
                "ltError",
                "ltScreenAccess",
                "ltAccessDenied",
            ],
            "TResponseClass": [
                "rcNone",
                "rcSuccess",
                "rcFailure",
                "rcError",
                "rcWarning",
                "rcSecurity",
            ],
            "TAVSResponseClass": ["acNone", "acSuccess", "acError", "acWarning"],
        }
        for type_name, names in groups.items():
            for i, name in enumerate(names):
                self.enums[name.lower()] = EnumVal(type_name, name, i)

    def tokens_for(self, path):
        key = str(path)
        if key not in self.token_cache:
            self.token_cache[key] = tokenize(read_text(path))
        return self.token_cache[key]

    def lookup_const(self, name):
        key = name.lower()
        if key in self.const_cache:
            return self.const_cache[key]
        needle = name.lower()
        for path in (RSC, CTYPES, EPAY, CLOG, STRINGS, MISC):
            toks = self.tokens_for(path)
            for i, tok in enumerate(toks):
                if tok.kind == "id" and tok.value.lower() == needle:
                    prev = toks[i - 1] if i else None
                    at_decl = prev is None or (
                        prev.kind == "sym" and prev.value == ";"
                    ) or (prev.kind == "id" and prev.value.lower() == "const")
                    if not at_decl:
                        continue
                    if i + 1 < len(toks) and toks[i + 1].kind == "sym" and toks[i + 1].value == "=":
                        parser = Parser(toks, i + 2)
                        try:
                            expr = parser.parse_expr()
                            value = self.eval_expr(expr, Scope(None, self))
                        except InterpError:
                            continue
                        if isinstance(value, list) and all(isinstance(item, str) for item in value):
                            self.const_cache[key] = value
                            return value
                        if not isinstance(value, (str, int, float, bool)):
                            continue
                        self.const_cache[key] = value
                        return value
                    if (
                        i + 1 < len(toks)
                        and toks[i + 1].kind == "sym"
                        and toks[i + 1].value == ":"
                    ):
                        j = i + 2
                        while j < len(toks) and not (
                            toks[j].kind == "sym" and toks[j].value == "="
                        ):
                            if toks[j].kind == "sym" and toks[j].value == ";":
                                break
                            j += 1
                        if j < len(toks) and toks[j].kind == "sym" and toks[j].value == "=":
                            parser = Parser(toks, j + 1)
                            try:
                                expr = parser.parse_expr()
                                value = self.eval_expr(expr, Scope(None, self))
                            except InterpError:
                                continue
                            if isinstance(value, list) and all(
                                isinstance(item, str) for item in value
                            ):
                                self.const_cache[key] = value
                                return value
                            if not isinstance(value, (str, int, float, bool)):
                                continue
                            self.const_cache[key] = value
                            return value
        return None

    def find_routine(self, unit, name):
        cache_key = (unit, name.lower())
        if cache_key in self.routine_cache:
            return self.routine_cache[cache_key]
        path = UNIT_FILES[unit]
        toks = self.tokens_for(path)
        short = name.split(".")[-1].lower()
        qualified = name.lower()
        found = None
        i = 0
        while i < len(toks):
            tok = toks[i]
            if tok.kind == "id" and tok.value.lower() in (
                "procedure",
                "function",
                "constructor",
                "destructor",
            ):
                parser = Parser(toks, i)
                try:
                    header = parser.parse_routine_header()
                except InterpError:
                    i += 1
                    continue
                hname = header["name"].lower()
                if hname == qualified or hname == short or hname.endswith("." + short):
                    if parser.has_body() and (
                        qualified == hname
                        or ( "." not in name and hname.endswith("." + short))
                        or ( "." not in name and hname == short)
                        or ( "." in name and hname == qualified)
                    ):
                        if "." in name and hname != qualified:
                            i = parser.i
                            continue
                        if "." not in name and "." in hname and not hname.endswith("." + short):
                            i = parser.i
                            continue
                        routine = parser.parse_routine_body(header)
                        found = routine
                        break
                i = parser.i
                continue
            i += 1
        self.routine_cache[cache_key] = found
        return found

    def class_chain(self, class_name):
        seen = []
        cur = class_name.lower() if class_name else None
        while cur and cur not in seen:
            seen.append(cur)
            cur = self.parents.get(cur)
        if "tepaymentprocessor" not in seen and class_name:
            pass
        return seen

    def resolve_routine(self, class_name, method):
        method_l = method.lower()
        chain = self.class_chain(class_name) if class_name else [None]
        for cls in chain:
            if cls:
                routine = self.find_routine(
                    "cc_epayment", f"{cls}.{method_l}" if False else method
                )
                # find by qualified class.method
                qualified = None
                path_tokens = self.tokens_for(EPAY)
                # use cache via find on exact qualified name
                qualified = self._find_qualified(cls, method_l)
                if qualified:
                    return qualified
        for unit in ("cc_epayment", "cc_log", "cc_share", "iqms.common.stringutils", "iqms.common.miscellaneous"):
            routine = self.find_routine(unit, method)
            if routine and "." not in routine["header"]["name"]:
                return routine
            if routine and routine["header"]["name"].split(".")[-1].lower() == method_l:
                # unqualified search may hit a class method; prefer exact short only
                if "." not in method:
                    if routine["header"]["name"].lower() == method_l:
                        return routine
        return None

    def _find_qualified(self, class_name, method):
        key = ("q", class_name, method)
        if key in self.routine_cache:
            return self.routine_cache[key]
        toks = self.tokens_for(EPAY)
        want = f"{class_name}.{method}".lower()
        i = 0
        found = None
        while i < len(toks):
            tok = toks[i]
            if tok.kind == "id" and tok.value.lower() in (
                "procedure",
                "function",
                "constructor",
                "destructor",
            ):
                parser = Parser(toks, i)
                try:
                    header = parser.parse_routine_header()
                except InterpError:
                    i += 1
                    continue
                if header["name"].lower() == want and parser.has_body():
                    found = parser.parse_routine_body(header)
                    break
                i = parser.i
                continue
            i += 1
        self.routine_cache[key] = found
        return found


class Scope:
    def __init__(self, parent, engine, obj=None):
        self.parent = parent
        self.engine = engine
        self.obj = obj
        self.vars = {}
        self.withs = []
        self.locals_set = set()

    def child(self, obj=None):
        return Scope(self, self.engine, obj if obj is not None else self.obj)

    def declare(self, name, value):
        self.vars[name.lower()] = value
        self.locals_set.add(name.lower())

    def assign(self, name, value):
        key = name.lower()
        for obj in reversed(self.withs):
            if self._with_accepts(obj, key):
                self._assign_with(obj, key, name, value)
                return
        scope = self
        while scope is not None:
            if key in scope.locals_set:
                scope.vars[key] = value
                return
            scope = scope.parent
        if self.obj is not None:
            self._assign_field(self.obj, key, value)
            return
        self.vars[key] = value
        self.locals_set.add(key)

    def _with_accepts(self, obj, key):
        if isinstance(obj, ParamRec):
            return key in ("value", "asfmtbcd", "asstring", "asdatetime")
        if isinstance(obj, StoredProc):
            return key in ("connection", "storedprocname", "params")
        if isinstance(obj, CommandString):
            return key in ("command", "listdelimiter", "htmlencoding", "allowemptyvalues")
        return False

    def _assign_with(self, obj, key, name, value):
        if isinstance(obj, ParamRec):
            setattr(obj, name if hasattr(obj, name) else key, value)
            if key == "value":
                obj.Value = value
                if str(obj.name).lower() == "v_request_data":
                    self.engine.logged_request = "" if value is None else str(value)
                if str(obj.name).lower() == "v_response_data":
                    self.engine.logged_response = "" if value is None else str(value)
            return
        if isinstance(obj, StoredProc):
            if key == "connection":
                obj.Connection = value
            elif key == "storedprocname":
                obj.StoredProcName = value
            elif key == "params":
                obj.Params = value
            return
        if isinstance(obj, CommandString):
            mapping = {
                "command": "Command",
                "listdelimiter": "ListDelimiter",
                "htmlencoding": "HTMLEncoding",
                "allowemptyvalues": "AllowEmptyValues",
            }
            setattr(obj, mapping[key], value)

    def _assign_field(self, obj, key, value):
        mirrors = {
            "merchantpassword": "fmerchantpassword",
            "fmerchantpassword": "merchantpassword",
            "merchantlogin": "fmerchantlogin",
            "fmerchantlogin": "merchantlogin",
            "merchantid": "fmerchantid",
            "fmerchantid": "merchantid",
            "merchantdeviceid": "fmerchantdeviceid",
            "fmerchantdeviceid": "merchantdeviceid",
            "merchantoperator": "fmerchantoperator",
            "fmerchantoperator": "merchantoperator",
            "merchanttransactionkey": "fmerchanttransactionkey",
            "fmerchanttransactionkey": "merchanttransactionkey",
            "merchantprofileid": "fmerchantprofileid",
            "fmerchantprofileid": "merchantprofileid",
            "merchantprofilekey": "fmerchantprofilekey",
            "fmerchantprofilekey": "merchantprofilekey",
            "merchanttranskey": "fmerchanttranskey",
            "fmerchanttranskey": "merchanttranskey",
            "merchantsignature": "fmerchantsignature",
            "fmerchantsignature": "merchantsignature",
            "merchantsecuritycode": "fmerchantsecuritycode",
            "fmerchantsecuritycode": "merchantsecuritycode",
            "merchantstoreid": "fmerchantstoreid",
            "fmerchantstoreid": "merchantstoreid",
            "merchantterminalid": "fmerchantterminalid",
            "fmerchantterminalid": "merchantterminalid",
            "merchantuserid": "fmerchantuserid",
            "fmerchantuserid": "merchantuserid",
            "merchantvendor": "fmerchantvendor",
            "fmerchantvendor": "merchantvendor",
            "merchantpartner": "fmerchantpartner",
            "fmerchantpartner": "merchantpartner",
            "testmode": "ftestmode",
            "ftestmode": "testmode",
            "gatewayurl": "fgatewayurl",
            "fgatewayurl": "gatewayurl",
            "gatewayport": "fgatewayport",
            "fgatewayport": "gatewayport",
            "transactionid": "ftransactionid",
            "ftransactionid": "transactionid",
            "transactiontype": "ftransactiontype",
            "ftransactiontype": "transactiontype",
            "flastrequest": "flastrequest",
            "flastresponse": "flastresponse",
            "timeout": "ftimeout",
            "ftimeout": "timeout",
            "creditcardaccountid": "fcreditcardaccountid",
            "fcreditcardaccountid": "creditcardaccountid",
            "transactionamount": "ftransactionamount",
            "ftransactionamount": "transactionamount",
            "taxamount": "ftaxamount",
            "ftaxamount": "taxamount",
            "freightamount": "ffreightamount",
            "ffreightamount": "freightamount",
            "processingclass": "fprocessingclass",
            "fprocessingclass": "processingclass",
            "forcevoiceauthcode": "fforcevoiceauthcode",
            "fforcevoiceauthcode": "forcevoiceauthcode",
            "invoicenumber": "finvoicenumber",
            "finvoicenumber": "invoicenumber",
            "transactiondescription": "ftransactiondescription",
            "ftransactiondescription": "transactiondescription",
            "purchaseordernumber": "fponumber",
            "httpcontenttype": "fhttpcontenttype",
            "fhttpcontenttype": "httpcontenttype",
            "fhttpuagent": "fhttpuseragent",
            "fhttpuseragent": "fhttpuseragent",
        }
        obj.fields[key] = value
        other = mirrors.get(key)
        if other:
            obj.fields[other] = value

    def lookup(self, name):
        key = name.lower()
        if key == "self":
            scope = self
            while scope is not None:
                if scope.obj is not None:
                    return scope.obj
                scope = scope.parent
            raise InterpError("Self is not available")
        scope = self
        while scope is not None:
            if key in scope.vars:
                return scope.vars[key]
            for obj in reversed(scope.withs):
                got = self.engine.read_member(obj, name, scope, missing_ok=True)
                if got is not _MISSING:
                    return got
            scope = scope.parent
        if self.obj is not None:
            got = self.engine.read_member(self.obj, name, self, missing_ok=True)
            if got is not _MISSING:
                return got
        if key in self.engine.enums:
            return self.engine.enums[key]
        const = self.engine.lookup_const(name)
        if const is not None:
            return const
        if key == "locale_user_default":
            return 0
        if key in (
            "tstringlist",
            "tfdstoredproc",
            "twebservice",
            "tcreditcardparams",
            "tformatsettings",
            "exception",
        ):
            return TypeRef(key)
        if key in ("cc_rscstr", "cc_const", "cc_types"):
            return ConstUnit(key)
        if key == "securitymanager":
            guard = SimpleObj()
            guard.fields = {"fusername": "cc-admin", "username": "cc-admin"}
            guard.UserName = "cc-admin"
            return guard
        if key == "unimainmodule":
            module = SimpleObj()
            module.fields = {"fdconnection1": SimpleObj()}
            module.FDConnection1 = module.fields["fdconnection1"]
            return module
        if key in ("nil",):
            return None
        if key.startswith(("ft", "pt")):
            return 0
        if key == "now":
            return "2020-01-01"
        raise InterpError(f"unknown name {name}")


_MISSING = object()


FIELD_ALIASES = {
    "merchantpassword": "fmerchantpassword",
    "merchantlogin": "fmerchantlogin",
    "merchantid": "fmerchantid",
    "merchantdeviceid": "fmerchantdeviceid",
    "merchantoperator": "fmerchantoperator",
    "merchanttransactionkey": "fmerchanttransactionkey",
    "merchantprofileid": "fmerchantprofileid",
    "merchantprofilekey": "fmerchantprofilekey",
    "merchanttranskey": "fmerchanttranskey",
    "merchantsignature": "fmerchantsignature",
    "merchantsecuritycode": "fmerchantsecuritycode",
    "merchantstoreid": "fmerchantstoreid",
    "merchantterminalid": "fmerchantterminalid",
    "merchantuserid": "fmerchantuserid",
    "merchantvendor": "fmerchantvendor",
    "merchantpartner": "fmerchantpartner",
    "testmode": "ftestmode",
    "gatewayurl": "fgatewayurl",
    "gatewayport": "fgatewayport",
    "transactionid": "ftransactionid",
    "lastrequest": "flastrequest",
    "lastresponse": "flastresponse",
    "timeout": "ftimeout",
    "creditcardaccountid": "fcreditcardaccountid",
    "transactionamount": "ftransactionamount",
    "taxamount": "ftaxamount",
    "freightamount": "ffreightamount",
    "processingclass": "fprocessingclass",
    "httpcontenttype": "fhttpcontenttype",
    "transactiondescription": "ftransactiondescription",
    "invoicenumber": "finvoicenumber",
    "purchaseordernumber": "fponumber",
    "cardnumber": "fcardnumber",
    "securitycode": "fsecuritycode",
    "customerid": "fcustomerid",
    "customerfirstname": "fcustomerfirstname",
    "customerlastname": "fcustomerlastname",
    "customeraddress": "fcustomeraddress",
    "customercity": "fcustomercity",
    "customerstate": "fcustomerstate",
    "customerpostalcode": "fcustomerpostalcode",
    "customercountrycode": "fcustomercountrycode",
    "customercompany": "fcustomercompany",
    "customeremail": "fcustomeremail",
    "customertelephone": "fcustomertelephone",
    "customerfax": "fcustomerfax",
    "expiremonth": "fexpiremonth",
    "expireyear": "fexpireyear",
    "istoken": "fistoken",
    "addasnewtoken": "faddasnewtoken",
    "responsedata": "fresponsedata",
    "errortext": "ferrortext",
    "transactiontype": "ftransactiontype",
    "statusdescription": "fstatusdescription",
    "approvalcode": "fapprovalcode",
    "required": "frequired",
    "resolved": "fresolved",
    "host": "fhost",
    "port": "fport",
    "domain": "fdomain",
    "user": "fuser",
    "password": "fpassword",
    "detect": "fdetect",
    "postalcode": "fpostalcode",
    "address1": "faddress1",
    "city": "fcity",
    "country": "fcountry",
    "stateorregion": "fstateorregion",
    "countrycode3digit": "fcountrycode3digit",
    "companyname": "fcompanyname",
    "address2": "faddress2",
    "referencenumber": "freferencenumber",
    "originalamount": "foriginalamount",
    "requestedamount": "frequestedamount",
    "ispartial": "fispartial",
    "ispresettlement": "fispresettlement",
    "dutyamount": "fdutyamount",
    "commoditycode": "fcommoditycode",
    "customertaxid": "fcustomertaxid",
    "merchanttaxid": "fmerchanttaxid",
    "nationaltaxamount": "fnationaltaxamount",
    "localtaxamount": "flocaltaxamount",
    "discountamount": "fdiscountamount",
    "itemization": "fitems",
}


PROP_METHODS = {
    "tepaymentcreditcard": {
        "expiremonthasstr": "GetExpireMonthStr",
        "expireyearasstr": "GetExpireYearAsStr",
        "expire4digityearasstr": "GetExpire4DigitYearAsStr",
        "expirationmmyy": "GetExpirationMMYY",
        "customerfullname": "GetCustomerFullName",
        "getstreetname": "GetStreetName",
        "getstreetnumber": "GetStreetNumber",
    },
    "tepaymentprocessor": {
        "merchantname": "MerchantName",
    },
}


def is_blank(value):
    return value is None or str(value) == ""


def truthy(value):
    if value is None or value is False:
        return False
    if value is True:
        return True
    if isinstance(value, str):
        return value != ""
    if isinstance(value, (int, float)):
        return value != 0
    return True


def as_number(value):
    if isinstance(value, bool):
        return int(value)
    if isinstance(value, (int, float)):
        return value
    if isinstance(value, str):
        try:
            if "." in value:
                return float(value)
            return int(value)
        except ValueError:
            return 0
    return 0


def delphi_format(fmt, args):
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
            while j < len(fmt) and fmt[j] not in "sdufgox":
                j += 1
            spec = fmt[j] if j < len(fmt) else "s"
            val = args[ai] if ai < len(args) else ""
            ai += 1
            if spec == "s":
                out.append("" if val is None else str(val))
            elif spec in "doxu":
                out.append(str(int(as_number(val))))
            elif spec in "fg":
                width = fmt[i + 1 : j]
                if width.startswith("."):
                    prec = int(width[1:] or "0")
                    out.append(f"{float(as_number(val)):.{prec}f}")
                else:
                    out.append(str(val))
            else:
                out.append(str(val))
            i = j + 1
            continue
        out.append(fmt[i])
        i += 1
    return "".join(out)


def format_float(fmt, value):
    number = float(as_number(value))
    if "." not in fmt:
        width = fmt.count("0")
        return f"{int(round(number)):0{width}d}"
    decimals = len(fmt.split(".")[-1].replace(",", ""))
    use_comma = "," in fmt
    text = f"{number:.{decimals}f}"
    if use_comma:
        whole, frac = text.split(".")
        sign = ""
        if whole.startswith("-"):
            sign = "-"
            whole = whole[1:]
        groups = []
        while whole:
            groups.append(whole[-3:])
            whole = whole[:-3]
        whole = ",".join(reversed(groups))
        text = sign + whole + "." + frac
    return text


def left_str(s, n):
    s = "" if s is None else str(s)
    n = int(as_number(n))
    if n <= 0:
        return ""
    return s[:n]


def right_str(s, n):
    s = "" if s is None else str(s)
    n = int(as_number(n))
    if n <= 0:
        return ""
    return s[-n:] if n < len(s) else s


def delphi_copy(s, index, count):
    s = "" if s is None else str(s)
    index = int(as_number(index))
    count = int(as_number(count))
    if index < 1 or count <= 0:
        return ""
    return s[index - 1 : index - 1 + count]


def delphi_pos(find, source):
    find = "" if find is None else str(find)
    source = "" if source is None else str(source)
    if find == "":
        return 0
    at = source.find(find)
    return 0 if at < 0 else at + 1


class Processor(SimpleObj):
    def __init__(self, engine, class_name):
        super().__init__()
        self.engine = engine
        self.class_name = class_name
        self.fields = {}


def new_processor(engine, class_name):
    proc = Processor(engine, class_name)
    card = SimpleObj()
    card.class_name = "TEPaymentCreditCard"
    card.fields = {
        "fcardnumber": PAN,
        "fsecuritycode": CVV,
        "fexpiremonth": 1,
        "fexpireyear": 2030,
        "fcustomerfirstname": "Test",
        "fcustomerlastname": "Cardholder",
        "fcustomeraddress": "1 Main",
        "fcustomercity": "Austin",
        "fcustomerstate": "TX",
        "fcustomerpostalcode": "78701",
        "fcustomercountrycode": "US",
        "fcustomercompany": "Example Co",
        "fcustomeremail": "buyer@example.test",
        "fcustomertelephone": "5125550100",
        "fcustomerfax": "",
        "fcustomerid": "CUST1",
        "fistoken": False,
        "faddasnewtoken": False,
        "fcardtype": engine.enums["ccvisa"],
        "fnumericsonly": CharSet([]),
    }
    response = SimpleObj()
    response.class_name = "TEPaymentResponse"
    response.fields = {
        "fresponsedata": "",
        "ferrortext": "",
        "ftransactiontype": "",
        "fstatusdescription": "",
        "fapprovalcode": "",
        "freturncode": "",
        "fstatusclass": None,
    }
    firewall = SimpleObj()
    firewall.fields = {
        "fdetect": False,
        "fhost": "",
        "fport": 0,
        "fdomain": "",
        "fuser": "",
        "fpassword": "",
    }
    command = CommandString()
    if class_name.lower() == "tepaymenttsys":
        command.ListDelimiter = "\r"
    reversal = SimpleObj()
    reversal.fields = {
        "freferencenumber": "REF1",
        "foriginalamount": 0,
        "frequestedamount": 0,
        "fispartial": False,
        "fispresettlement": False,
    }
    level3 = SimpleObj()
    items = SimpleObj()
    items.fields = {"fcount": 0}
    items.Count = 0
    level3.fields = {
        "fitems": items,
        "fdutyamount": 0,
        "fcommoditycode": "",
        "fcustomertaxid": "",
        "fmerchanttaxid": "",
        "fnationaltaxamount": 0,
        "flocaltaxamount": 0,
        "fdiscountamount": 0,
    }
    timeout_status = SimpleObj()
    timeout_status.fields = {"frequired": False, "fresolved": False}
    destination = SimpleObj()
    destination.fields = {
        "fpostalcode": "78701",
        "faddress1": "1 Main",
        "faddress2": "",
        "fcity": "Austin",
        "fcountry": "US",
        "fstateorregion": "TX",
        "fcountrycode3digit": "USA",
        "fcompanyname": "Example Co",
    }
    sender = SimpleObj()
    sender.fields = {"fpostalcode": "78701", "fcountry": "US"}
    proc.fields.update(
        {
            "creditcard": card,
            "response": response,
            "firewall": firewall,
            "fcommand": command,
            "reversaldata": reversal,
            "level3options": level3,
            "timeoutreversalstatus": timeout_status,
            "destination": destination,
            "sender": sender,
            "fmerchantpassword": PASSWORD,
            "fmerchantlogin": "MERCHANT_LOGIN_PLACEHOLDER",
            "fmerchantid": "MERCHANT_ID_PLACEHOLDER",
            "fmerchantdeviceid": "DEVICEIDPLACEX",  # 14 chars, within 14..15
            "fmerchantoperator": "OPERATOR_PLACEHOLDER",
            "fmerchanttransactionkey": TRANSACTION_KEY,
            "fmerchantprofileid": "PROFILE_ID_PLACEHOLDER",
            "fmerchantprofilekey": PROFILE_KEY,
            "fmerchanttranskey": TRANS_KEY,
            "fmerchantsignature": SIGNATURE,
            "fmerchantsecuritycode": SECURITY_CODE,
            "fmerchantstoreid": "STORE_PLACEHOLDER",
            "fmerchantterminalid": "TERM0001",
            "fmerchantuserid": "USER_PLACEHOLDER",
            "fmerchantvendor": "VENDOR_PLACEHOLDER",
            "fmerchantpartner": "PARTNER_PLACEHOLDER",
            "fmerchantname": "Merchant Name Placeholder",
            "ftestmode": False,
            "fgatewayurl": "",
            "fgatewayport": 0,
            "ftransactionid": "TXN1",
            "ftimeout": 60,
            "fcreditcardaccountid": 0,
            "ftransactionamount": 10,
            "ftaxamount": 0,
            "ffreightamount": 0,
            "fprocessingclass": engine.enums["pclnone"],
            "ftransactiontype": engine.enums["ttsale"],
            "fforcevoiceauthcode": "",
            "ftransactiondescription": "Goods",
            "finvoicenumber": "",
            "fponumber": "",
            "fsalesordernumber": "SO1",
            "fhttpcontenttype": engine.enums["cthtmlform"],
            "fhttpuseragent": "test-agent",
            "flastrequest": "",
            "flastresponse": "",
            "fgeneratingtransactionkey": False,
            "fnonreferencedcreditsallowed": False,
            "fcountrycodeformat": None,
            "originalresponse": SimpleObj(fields={"items": SimpleObj()}),
        }
    )
    # device id must be 14 or 15 characters for the TSYS element helper
    proc.fields["fmerchantdeviceid"] = "DEVICEIDPLACE12"
    return proc


class EngineEval(Engine):
    pass


# Methods are attached below on Engine via assignment after the class body
# to keep the evaluator next to the helpers. Rebind by subclassing through
# monkeypatch of the methods defined as functions.


def read_member(self, obj, name, scope, missing_ok=False):
    if obj is None:
        if missing_ok:
            return _MISSING
        raise InterpError(f"member {name} on nil")
    if isinstance(obj, ConstUnit):
        value = self.lookup_const(name)
        if value is None:
            value = ""
        return value
    key = name.lower()
    if isinstance(obj, TypeRef):
        if name.lower() == "create":
            return self.construct(obj.name, [], scope)
        return ("typemember", obj, name)
    if isinstance(obj, str):
        if key == "isempty":
            return obj == ""
        if key == "isnullorwhitespace":
            return obj.strip() == ""
        if missing_ok:
            return _MISSING
        raise InterpError(f"string has no member {name}")
    if isinstance(obj, CommandString):
        if key in obj.__dict__ or key in ("command", "listdelimiter", "htmlencoding", "allowemptyvalues"):
            mapping = {
                "command": "Command",
                "listdelimiter": "ListDelimiter",
                "htmlencoding": "HTMLEncoding",
                "allowemptyvalues": "AllowEmptyValues",
            }
            attr = mapping.get(key, name)
            if hasattr(obj, attr):
                return getattr(obj, attr)
        if hasattr(obj, name) and callable(getattr(obj, name)):
            return ("bound", obj, name)
        if missing_ok:
            return _MISSING
        raise InterpError(f"command has no member {name}")
    if isinstance(obj, StringList):
        if key == "text":
            return obj.Text
        if key == "count":
            return obj.Count
        if key in ("add", "clear"):
            return ("bound", obj, name)
        if missing_ok:
            return _MISSING
        raise InterpError(f"string list has no member {name}")
    if isinstance(obj, (StoredProc, WebService, ParamRec, ParamsObj, SimpleObj, Processor)):
        if not isinstance(obj, Processor):
            attr = getattr(obj, name, None)
            if callable(attr):
                return ("bound", obj, name)
        class_name = getattr(obj, "class_name", None)
        if class_name and not key.startswith("f"):
            routine = self._find_qualified(class_name, key)
            if routine is None:
                for parent in self.class_chain(class_name)[1:]:
                    routine = self._find_qualified(parent, key)
                    if routine:
                        break
            if routine:
                return ("routine", routine, obj)
        fields = getattr(obj, "fields", None)
        if isinstance(fields, dict):
            if key in fields:
                return fields[key]
            alias = FIELD_ALIASES.get(key)
            if alias and alias in fields:
                return fields[alias]
        if hasattr(obj, name) and not key.startswith("__"):
            attr = getattr(obj, name)
            if key == "gatewaydescription":
                return obj.GatewayDescription
            if callable(attr):
                return ("bound", obj, name)
            return attr
        class_name = getattr(obj, "class_name", None)
        if class_name and key in PROP_METHODS.get(class_name.lower(), {}):
            method = PROP_METHODS[class_name.lower()][key]
            return ("calllater", class_name, method, obj)
        if class_name:
            routine = self._find_qualified(class_name, key)
            if routine:
                return ("routine", routine, obj)
            for parent in self.class_chain(class_name)[1:]:
                routine = self._find_qualified(parent, key)
                if routine:
                    return ("routine", routine, obj)
        if key == "isempty" and fields is not None:
            return True
        if missing_ok:
            return _MISSING
        raise InterpError(f"{getattr(obj, 'class_name', type(obj).__name__)} has no member {name}")
    if missing_ok:
        return _MISSING
    raise InterpError(f"cannot read {name} on {type(obj).__name__}")


def eval_expr(self, expr, scope):
    kind = expr[0]
    if kind == "lit":
        return expr[1]
    if kind == "name":
        return scope.lookup(expr[1])
    if kind == "not":
        return not truthy(self.eval_expr(expr[1], scope))
    if kind == "neg":
        return -as_number(self.eval_expr(expr[1], scope))
    if kind == "bin":
        op, left_e, right_e = expr[1], expr[2], expr[3]
        if op == "and":
            left = self.eval_expr(left_e, scope)
            if not truthy(left):
                return False
            return truthy(self.eval_expr(right_e, scope))
        if op == "or":
            left = self.eval_expr(left_e, scope)
            if truthy(left) and not isinstance(left, str):
                return True
            right = self.eval_expr(right_e, scope)
            if isinstance(left, str) or isinstance(right, str):
                return str(left) + str(right)
            return truthy(left) or truthy(right)
        left = self.eval_expr(left_e, scope)
        right = self.eval_expr(right_e, scope)
        if op == "+":
            if isinstance(left, str) or isinstance(right, str):
                return ("" if left is None else str(left)) + (
                    "" if right is None else str(right)
                )
            return as_number(left) + as_number(right)
        if op == "-":
            return as_number(left) - as_number(right)
        if op == "*":
            return as_number(left) * as_number(right)
        if op == "/":
            return as_number(left) / as_number(right) if as_number(right) else 0
        if op == "div":
            r = as_number(right)
            return int(as_number(left) // r) if r else 0
        if op == "mod":
            r = as_number(right)
            return int(as_number(left) % r) if r else 0
        if op == "=":
            return _eq(left, right)
        if op == "<>":
            return not _eq(left, right)
        if op in ("<", ">", "<=", ">="):
            return _cmp(op, left, right)
        if op == "in":
            if isinstance(right, CharSet):
                return right.contains(left)
            if isinstance(right, (list, tuple)):
                return any(_eq(left, item) for item in right)
            return False
        raise InterpError(f"operator {op}")
    if kind == "member":
        qual = flatten_qual(expr)
        if qual:
            mapped = QUALIFIED.get(qual.lower())
            tail = qual.split(".")[-1].lower()
            if mapped or tail in (
                "stof",
                "siif",
                "floattoansistr",
                "gettaxrateapplied",
                "getipaddress",
                "getmachinename",
                "getmachineuser",
                "getguid",
                "getguidalphanumeric",
                "strinlist",
                "nextreferencenumber",
                "countrycodefor",
                "iqerror",
                "getownerform",
                "iqgetuid",
                "iqassert",
            ):
                return self.eval_call(expr, [], scope)
        base = self.eval_expr(expr[1], scope)
        return self.invoke_value(self.read_member(base, expr[2], scope), scope)
    if kind == "index":
        base = self.eval_expr(expr[1], scope)
        index = self.eval_expr(expr[2], scope)
        if isinstance(base, str):
            i = int(as_number(index))
            if i < 1 or i > len(base):
                return "\0"
            return base[i - 1]
        if isinstance(base, (list, tuple)):
            if isinstance(index, EnumVal):
                return base[index.index]
            return base[int(as_number(index))]
        if isinstance(base, StringList):
            return base.items[int(as_number(index))]
        if isinstance(base, CharSet):
            return base.contains(index)
        raise InterpError(f"cannot index {type(base).__name__}")
    if kind == "bracket":
        items = []
        for item in expr[1]:
            if isinstance(item, tuple) and item and item[0] == "range":
                lo = self.eval_expr(item[1], scope)
                hi = self.eval_expr(item[2], scope)
                items.append(("range", lo, hi))
            else:
                items.append(self.eval_expr(item, scope))
        if any(isinstance(it, tuple) and it and it[0] == "range" for it in items):
            return CharSet(items)
        # Sets of enums or chars are also brackets without ranges.
        if items and all(
            isinstance(it, (EnumVal, str)) and not (isinstance(it, str) and len(it) > 1)
            for it in items
        ):
            return CharSet(items)
        if items and all(isinstance(it, EnumVal) for it in items):
            return CharSet(items)
        return items
    if kind == "call":
        return self.eval_call(expr[1], expr[2], scope)
    if kind == "range":
        return ("range", self.eval_expr(expr[1], scope), self.eval_expr(expr[2], scope))
    raise InterpError(f"bad expr {kind}")


def _eq(left, right):
    if isinstance(left, str) or isinstance(right, str):
        return str(left if left is not None else "") == str(right if right is not None else "")
    if isinstance(left, EnumVal) or isinstance(right, EnumVal):
        return left == right
    if isinstance(left, bool) or isinstance(right, bool):
        return truthy(left) == truthy(right)
    if isinstance(left, (int, float)) or isinstance(right, (int, float)):
        return as_number(left) == as_number(right)
    return left == right


def _cmp(op, left, right):
    if isinstance(left, str) or isinstance(right, str):
        l = "" if left is None else str(left)
        r = "" if right is None else str(right)
    else:
        l = as_number(left)
        r = as_number(right)
    if op == "<":
        return l < r
    if op == ">":
        return l > r
    if op == "<=":
        return l <= r
    if op == ">=":
        return l >= r
    raise InterpError(op)


def flatten_qual(expr):
    parts = []
    while isinstance(expr, tuple) and expr and expr[0] == "member":
        parts.append(expr[2])
        expr = expr[1]
    if isinstance(expr, tuple) and expr and expr[0] == "name":
        parts.append(expr[1])
        return ".".join(reversed(parts))
    return None


QUALIFIED = {
    "system.strutils.leftstr": "leftstr",
    "system.strutils.rightstr": "rightstr",
    "system.sysutils.charinset": "charinset",
    "ansistrings.leftstr": "leftstr",
    "iqms.common.stringutils.leftstr": "source:iqms.common.stringutils:leftstr",
    "iqms.common.stringutils.rightstr": "source:iqms.common.stringutils:rightstr",
    "iqms.common.stringutils.strtranstrict": "source:iqms.common.stringutils:strtranstrict",
    "iqms.common.stringutils.repl": "source:iqms.common.stringutils:repl",
    "iqms.common.miscellaneous.iqassert": "iqassert",
    "iqms.common.miscellaneous.iqgetuid": "source:iqms.common.miscellaneous:iqgetuid",
    "cc_share.getmaskedaccount": "source:cc_share:getmaskedaccount",
    "cc_log.writetolog": "source:cc_log:writetolog",
}


def eval_call(self, callee_expr, arg_exprs, scope):
    qual = flatten_qual(callee_expr)
    if qual:
        mapped = QUALIFIED.get(qual.lower())
        prefixes = (
            ("iqms.common.stringutils.", "iqms.common.stringutils"),
            ("iqms.common.miscellaneous.", "iqms.common.miscellaneous"),
            ("cc_share.", "cc_share"),
            ("cc_log.", "cc_log"),
        )
        for prefix, unit in prefixes:
            if qual.lower().startswith(prefix):
                short = qual.split(".")[-1]
                routine = self.find_routine(unit, short)
                if routine:
                    return self.exec_routine(routine, arg_exprs, scope, self.self_obj)
        if mapped:
            if mapped.startswith("source:"):
                _, unit, short = mapped.split(":")
                routine = self.find_routine(unit, short)
                if routine is None:
                    raise InterpError(f"missing {qual}")
                return self.exec_routine(routine, arg_exprs, scope, self.self_obj)
            return self.call_builtin(mapped, arg_exprs, scope)
        tail = qual.split(".")[-1].lower()
        if tail in (
            "stof",
            "siif",
            "floattoansistr",
            "gettaxrateapplied",
            "getipaddress",
            "getmachinename",
            "getmachineuser",
            "getguid",
            "getguidalphanumeric",
            "strinlist",
            "nextreferencenumber",
            "countrycodefor",
            "iqerror",
            "getownerform",
        ):
            return self.call_builtin(tail, arg_exprs, scope)
    # Built-in names and type constructors are resolved before a general call.
    if callee_expr[0] == "name":
        lname = callee_expr[1].lower()
        nested_scope = scope
        while nested_scope is not None:
            nested = nested_scope.vars.get("__nested__", {}).get(lname)
            if nested:
                return self.exec_routine(nested, arg_exprs, scope, self.self_obj)
            nested_scope = nested_scope.parent
        if lname in (
            "length",
            "trim",
            "pos",
            "copy",
            "chr",
            "ord",
            "inttostr",
            "format",
            "formatfloat",
            "formatdatetime",
            "assigned",
            "freeandnil",
            "high",
            "low",
            "min",
            "repl",
            "strtranstrict",
            "getmaskedaccount",
            "leftstr",
            "rightstr",
            "charinset",
            "stringreplace",
            "iqassert",
        ):
            return self.call_builtin(lname, arg_exprs, scope)
    if callee_expr[0] == "member":
        base = self.eval_expr(callee_expr[1], scope)
        member = callee_expr[2]
        if isinstance(base, TypeRef) or (
            callee_expr[1][0] == "name" and callee_expr[1][1].lower() in (
                "tstringlist",
                "tfdstoredproc",
                "twebservice",
                "tcreditcardparams",
                "tformatsettings",
                "exception",
            )
        ):
            type_name = callee_expr[1][1].lower() if callee_expr[1][0] == "name" else base.name.lower()
            if member.lower() == "create":
                return self.construct(type_name, arg_exprs, scope)
        if isinstance(base, str) and member.lower() == "isnullorwhitespace":
            args = [self.eval_expr(a, scope) for a in arg_exprs]
            return str(args[0]).strip() == ""
        if member.lower() == "create" and callee_expr[1][0] == "name" and callee_expr[1][1].lower() == "exception":
            args = [self.eval_expr(a, scope) for a in arg_exprs]
            return Raised(str(args[0]) if args else "")
    args = [self.eval_expr(a, scope) for a in arg_exprs]
    try:
        if callee_expr[0] == "member":
            base = self.eval_expr(callee_expr[1], scope)
            callee = self.read_member(base, callee_expr[2], scope)
        else:
            callee = self.eval_expr(callee_expr, scope)
    except InterpError:
        if len(args) == 1 and callee_expr[0] == "name":
            return args[0]
        raise
    if isinstance(callee, tuple) and callee and callee[0] == "bound":
        obj, method = callee[1], callee[2]
        fn = getattr(obj, method)
        if method.lower() in ("execute", "executethroughfirewall"):
            # Out-parameter response is the last argument when it is a name.
            if arg_exprs and arg_exprs[-1][0] == "name":
                scope.assign(arg_exprs[-1][1], "")
            return False
        return fn(*args)
    if isinstance(callee, tuple) and callee and callee[0] == "routine":
        routine, obj = callee[1], callee[2]
        return self.exec_routine(routine, arg_exprs, scope, obj)
    if isinstance(callee, tuple) and callee and callee[0] == "calllater":
        class_name, method, obj = callee[1], callee[2], callee[3]
        routine = self._find_qualified(class_name, method.lower())
        if routine is None:
            raise InterpError(f"no getter {class_name}.{method}")
        return self.exec_routine(routine, [], scope, obj)
    if isinstance(callee, tuple) and callee and callee[0] == "typemember":
        raise InterpError(f"unhandled type member {callee[2]}")
    if callable(callee):
        return callee(*args)
    raise InterpError(f"not callable: {callee_expr}")


def call_builtin(self, name, arg_exprs, scope):
    if name == "freeandnil":
        if arg_exprs and arg_exprs[0][0] == "name":
            scope.assign(arg_exprs[0][1], None)
        elif arg_exprs and arg_exprs[0][0] == "member":
            self.assign_member(arg_exprs[0], None, scope)
        return None
    args = [self.eval_expr(a, scope) for a in arg_exprs]
    if name == "length":
        if args[0] is None:
            return 0
        return len(str(args[0]))
    if name == "trim":
        return "" if args[0] is None else str(args[0]).strip()
    if name == "pos":
        return delphi_pos(args[0], args[1])
    if name == "copy":
        return delphi_copy(args[0], args[1], args[2])
    if name == "chr":
        return chr(int(as_number(args[0])))
    if name == "ord":
        if isinstance(args[0], EnumVal):
            return args[0].index
        if isinstance(args[0], str) and args[0]:
            return ord(args[0][0])
        return int(as_number(args[0]))
    if name == "inttostr":
        return str(int(as_number(args[0])))
    if name == "format":
        bracket = args[1]
        seq = bracket if isinstance(bracket, list) else [bracket]
        return delphi_format(str(args[0]), seq)
    if name == "formatfloat":
        return format_float(str(args[0]), args[1])
    if name == "formatdatetime":
        return "2020-01-01"
    if name == "assigned":
        return args[0] is not None
    if name == "high":
        if isinstance(args[0], EnumVal):
            return args[0].index
        return len(args[0]) - 1
    if name == "low":
        return 0
    if name == "min":
        return min(as_number(args[0]), as_number(args[1]))
    if name == "charinset":
        ch = args[0]
        bag = args[1]
        if isinstance(bag, CharSet):
            return bag.contains(ch)
        return False
    if name == "leftstr":
        return left_str(args[0], args[1])
    if name == "rightstr":
        return right_str(args[0], args[1])
    if name == "stringreplace":
        source = "" if args[0] is None else str(args[0])
        return source.replace(str(args[1]), str(args[2]))
    if name == "stof":
        return as_number(args[0]) if args else 0
    if name == "siif":
        return args[1] if truthy(args[0]) else args[2]
    if name == "floattoansistr":
        return f"{float(as_number(args[0])):.{int(as_number(args[2])) if len(args) > 2 else 2}f}"
    if name == "gettaxrateapplied":
        return 0
    if name == "getipaddress":
        if arg_exprs and arg_exprs[0][0] == "name":
            scope.assign(arg_exprs[0][1], "")
        return False
    if name == "getmachinename":
        return "MACHINE"
    if name == "getmachineuser":
        return "USER"
    if name in ("getguid", "getguidalphanumeric"):
        return "GUIDPLACEHOLDER"
    if name == "strinlist":
        return False
    if name == "nextreferencenumber":
        return "1"
    if name == "countrycodefor":
        return "US"
    if name in ("iqerror", "getownerform"):
        return None
    if name == "iqassert":
        if not truthy(args[0]):
            raise Raised(str(args[1]))
        return None
    if name in ("repl", "strtranstrict", "getmaskedaccount"):
        routine = None
        unit = {
            "repl": "iqms.common.stringutils",
            "strtranstrict": "iqms.common.stringutils",
            "getmaskedaccount": "cc_share",
        }[name]
        routine = self.find_routine(unit, name)
        if routine is None:
            raise InterpError(f"could not load {name}")
        return self.exec_routine(routine, arg_exprs, scope, self.self_obj)
    raise InterpError(name)


def construct(self, type_name, arg_exprs, scope):
    if type_name == "exception":
        args = [self.eval_expr(a, scope) for a in arg_exprs]
        return Raised(str(args[0]) if args else "")
    if type_name == "twebservice":
        return WebService()
    if type_name == "tfdstoredproc":
        proc = StoredProc()
        self.procs.append(proc)
        return proc
    if type_name == "tcreditcardparams":
        return SimpleObj(GatewayDescription="")
    if type_name == "tstringlist":
        return StringList()
    if type_name == "tformatsettings":
        return SimpleObj(DecimalSeparator=".", ThousandSeparator=",")
    raise InterpError(f"cannot construct {type_name}")


def assign_member(self, member_expr, value, scope):
    base = self.eval_expr(member_expr[1], scope)
    name = member_expr[2]
    key = name.lower()
    if isinstance(base, CommandString):
        mapping = {
            "command": "Command",
            "listdelimiter": "ListDelimiter",
            "htmlencoding": "HTMLEncoding",
            "allowemptyvalues": "AllowEmptyValues",
        }
        setattr(base, mapping.get(key, name), value)
        return
    if isinstance(base, ParamRec):
        setattr(base, name if name in ("Value", "AsFMTBcd", "AsString", "AsDateTime") else name, value)
        if key == "value":
            base.Value = value
            if str(base.name).lower() == "v_request_data":
                self.logged_request = "" if value is None else str(value)
            if str(base.name).lower() == "v_response_data":
                self.logged_response = "" if value is None else str(value)
        elif key == "asfmtbcd":
            base.AsFMTBcd = value
        elif key == "asstring":
            base.AsString = value
        elif key == "asdatetime":
            base.AsDateTime = value
        return
    if isinstance(base, StoredProc):
        if key == "connection":
            base.Connection = value
        elif key == "storedprocname":
            base.StoredProcName = value
        else:
            setattr(base, name, value)
        return
    fields = getattr(base, "fields", None)
    if isinstance(fields, dict):
        fields[key] = value
        alias = FIELD_ALIASES.get(key)
        if alias:
            fields[alias] = value
        reverse = {v: k for k, v in FIELD_ALIASES.items()}
        if key in reverse:
            fields[reverse[key]] = value
        return
    setattr(base, name, value)


def exec_routine(self, routine, arg_exprs, caller, obj):
    header = routine["header"]
    scope = Scope(None, self, obj if obj is not None else self.self_obj)
    # Keep outer globals visible through caller for constants via engine.
    scope.parent = caller
    # Locals must shadow the caller. Mark every parameter and local as local
    # so assignments do not leak into the processor fields.
    if header["kind"] == "function":
        scope.declare("result", None)
    for name in routine["vars"]:
        scope.declare(name, None)
    for const_name, const_expr in routine["consts"]:
        scope.declare(const_name, self.eval_expr(const_expr, scope))
    params = header["params"]
    if len(arg_exprs) > len(params):
        raise InterpError(
            f"{header['name']} expected {len(params)} args, got {len(arg_exprs)}"
        )
    for index, param in enumerate(params):
        if index < len(arg_exprs):
            value = self.eval_expr(arg_exprs[index], caller)
        elif param["default"] is not None:
            value = self.eval_expr(param["default"], scope)
        else:
            value = None
        scope.declare(param["name"], value)
    nested_map = {}
    for nested in routine["nested"]:
        nested_map[nested["header"]["name"].lower()] = nested
    scope.vars["__nested__"] = nested_map
    previous = self.self_obj
    if obj is not None:
        self.self_obj = obj
    try:
        self.exec_block(routine["body"], scope)
        result = scope.vars.get("result")
    except ReturnSignal as sig:
        result = sig.value if sig.value is not _MISSING else scope.vars.get("result")
    except InterpError as exc:
        raise InterpError(f"{header['name']}: {exc}") from None
    finally:
        self.self_obj = previous
    for index, param in enumerate(params):
        if param["var"] and index < len(arg_exprs):
            self.assign_target(arg_exprs[index], scope.vars[param["name"].lower()], caller)
    return result


def assign_target(self, expr, value, scope):
    if expr[0] == "name":
        scope.assign(expr[1], value)
        return
    if expr[0] == "member":
        self.assign_member(expr, value, scope)
        return
    raise InterpError("bad assignment target")


def invoke_value(self, value, scope):
    """Delphi evaluates a parameterless method or property read when the name is used."""
    if isinstance(value, tuple) and value and value[0] == "routine":
        routine, obj = value[1], value[2]
        if not routine["header"]["params"]:
            return self.exec_routine(routine, [], scope, obj)
        return value
    if isinstance(value, tuple) and value and value[0] == "bound":
        return getattr(value[1], value[2])()
    if isinstance(value, tuple) and value and value[0] == "calllater":
        class_name, method, obj = value[1], value[2], value[3]
        routine = self._find_qualified(class_name, method.lower())
        if routine and not routine["header"]["params"]:
            return self.exec_routine(routine, [], scope, obj)
        return value
    return value


def invoke_if_method(self, value, scope):
    if isinstance(value, tuple) and value and value[0] == "bound":
        getattr(value[1], value[2])()
        return
    if isinstance(value, tuple) and value and value[0] == "routine":
        self.exec_routine(value[1], [], scope, value[2])
        return
    if isinstance(value, tuple) and value and value[0] == "calllater":
        class_name, method, obj = value[1], value[2], value[3]
        routine = self._find_qualified(class_name, method.lower())
        if routine:
            self.exec_routine(routine, [], scope, obj)


def exec_block(self, stmts, scope):
    for stmt in stmts:
        self.exec_stmt(stmt, scope)


def exec_stmt(self, stmt, scope):
    kind = stmt[0]
    if kind == "block":
        self.exec_block(stmt[1], scope)
        return
    if kind == "if":
        cond = self.eval_expr(stmt[1], scope)
        if truthy(cond):
            self.exec_stmt(stmt[2], scope)
        elif stmt[3] is not None:
            self.exec_stmt(stmt[3], scope)
        return
    if kind == "assign":
        value = self.eval_expr(stmt[2], scope)
        self.assign_target(stmt[1], value, scope)
        return
    if kind == "expr":
        value = self.eval_expr(stmt[1], scope)
        self.invoke_if_method(value, scope)
        return
    if kind == "exit":
        if stmt[1] is None:
            raise ReturnSignal(scope.vars.get("result", None) if False else _MISSING)
        raise ReturnSignal(self.eval_expr(stmt[1], scope))
    if kind == "raise":
        value = self.eval_expr(stmt[1], scope)
        if isinstance(value, Raised):
            raise value
        raise Raised(str(value))
    if kind == "tryfinally":
        try:
            self.exec_block(stmt[1], scope)
        finally:
            self.exec_block(stmt[2], scope)
        return
    if kind == "tryexcept":
        try:
            self.exec_block(stmt[1], scope)
        except Raised as exc:
            handled = False
            for ename, etype, body in stmt[2]:
                if ename:
                    scope.declare(ename, exc)
                self.exec_stmt(body, scope)
                handled = True
                break
            if not handled:
                raise
        return
    if kind == "with":
        obj = self.eval_expr(stmt[1], scope)
        scope.withs.append(obj)
        try:
            self.exec_stmt(stmt[2], scope)
        finally:
            scope.withs.pop()
        return
    if kind == "for":
        var, start, direction, stop, body = stmt[1], stmt[2], stmt[3], stmt[4], stmt[5]
        begin_v = int(as_number(self.eval_expr(start, scope)))
        end_v = int(as_number(self.eval_expr(stop, scope)))
        step = 1 if direction == "to" else -1
        if var.lower() not in scope.locals_set:
            scope.declare(var, begin_v)
        current = begin_v
        while (current <= end_v) if step > 0 else (current >= end_v):
            scope.vars[var.lower()] = current
            self.exec_stmt(body, scope)
            current += step
        return
    if kind == "while":
        while truthy(self.eval_expr(stmt[1], scope)):
            self.exec_stmt(stmt[2], scope)
        return
    if kind == "repeat":
        while True:
            self.exec_block(stmt[1], scope)
            if truthy(self.eval_expr(stmt[2], scope)):
                break
        return
    if kind == "case":
        value = self.eval_expr(stmt[1], scope)
        matched = False
        for labels, body in stmt[2]:
            for label in labels:
                if isinstance(label, tuple) and label and label[0] == "range":
                    lo = self.eval_expr(label[1], scope)
                    hi = self.eval_expr(label[2], scope)
                    if as_number(lo) <= as_number(value) <= as_number(hi):
                        matched = True
                else:
                    label_v = self.eval_expr(label, scope) if isinstance(label, tuple) else label
                    if _eq(value, label_v):
                        matched = True
                if matched:
                    break
            if matched:
                self.exec_stmt(body, scope)
                return
        if stmt[3] is not None:
            self.exec_stmt(stmt[3], scope)
        return
    if kind == "inherited":
        name = stmt[1]
        if name is None or self.self_obj is None:
            return
        parent = self.parents.get(self.self_obj.class_name.lower())
        if not parent:
            return
        routine = self._find_qualified(parent, name.lower())
        if routine is None:
            return
        self.exec_routine(routine, stmt[2], scope, self.self_obj)
        return
    if kind == "exit":
        return
    raise InterpError(f"bad stmt {kind}")


# Bind the functions as Engine methods.
Engine.read_member = read_member
Engine.invoke_value = invoke_value
Engine.eval_expr = eval_expr
Engine.eval_call = eval_call
Engine.call_builtin = call_builtin
Engine.construct = construct
Engine.assign_member = assign_member
Engine.exec_routine = exec_routine
Engine.assign_target = assign_target
Engine.invoke_if_method = invoke_if_method
Engine.exec_block = exec_block
Engine.exec_stmt = exec_stmt


def call_method(engine, proc, method, arg_exprs=None):
    routine = None
    for class_name in engine.class_chain(proc.class_name):
        routine = engine._find_qualified(class_name, method.lower())
        if routine:
            break
    if routine is None:
        raise InterpError(f"{proc.class_name}.{method} was not found")
    engine.self_obj = proc
    scope = Scope(None, engine, proc)
    return engine.exec_routine(routine, arg_exprs or [], scope, proc)


def prepare(engine, class_name):
    proc = new_processor(engine, class_name)
    engine.self_obj = proc
    engine.class_name = class_name
    scope = Scope(None, engine, proc)
    # Run the product's URL selection so ExecuteCommand does not return early.
    url = ""
    port = 0
    # GetURL writes var parameters. Call it through a tiny wrapper scope.
    routine = engine._find_qualified(class_name, "geturl")
    if routine:
        holder = Scope(None, engine, proc)
        holder.declare("aurl", "")
        holder.declare("aport", 0)
        engine.exec_routine(
            routine,
            [("name", "aurl"), ("name", "aport")],
            holder,
            proc,
        )
        url = holder.vars["aurl"]
        port = holder.vars["aport"]
    proc.fields["fgatewayurl"] = url
    proc.fields["fgatewayport"] = port
    return proc


def run_operation(class_name, method):
    engine = Engine()
    proc = prepare(engine, class_name)
    call_method(engine, proc, method)
    return engine


class SecretLogTests(unittest.TestCase):
    def assert_redacted(self, engine, secrets, require_masked_pan):
        logged = engine.logged_request
        self.assertIsNotNone(logged, "ExecuteCommand did not store a request")
        self.assertNotEqual(logged, "", "stored request is empty")
        for secret in secrets:
            self.assertNotIn(
                secret,
                logged,
                f"stored request still contains {secret}",
            )
        self.assertNotIn(PAN, logged, "stored request still contains the card number")
        self.assertNotIn(CVV, logged, "stored request still contains the security code")
        if require_masked_pan:
            masked = "*" * (len(PAN) - 4) + PAN[-4:]
            self.assertIn(
                masked,
                logged,
                "stored request dropped the masked card number",
            )

    def test_string_helpers_follow_the_source(self):
        engine = Engine()
        scope = Scope(None, engine, None)
        masked = engine.call_builtin(
            "getmaskedaccount", [("lit", PAN)], scope
        )
        self.assertEqual(masked, "*" * 12 + "4242")
        replaced = engine.call_builtin(
            "strtranstrict",
            [
                ("lit", f"<CardNumber>{PAN}</CardNumber>"),
                ("lit", PAN),
                ("lit", masked),
            ],
            scope,
        )
        self.assertNotIn(PAN, replaced)
        self.assertIn(masked, replaced)

    def test_merchant_accounts_sale_log_redacts_password(self):
        engine = run_operation("TEPaymentMerchantAccountsCa", "Sale")
        self.assert_redacted(engine, [PASSWORD], True)

    def test_merchant_accounts_capture_log_redacts_password(self):
        engine = run_operation("TEPaymentMerchantAccountsCa", "Capture")
        logged = engine.logged_request
        self.assertIsNotNone(logged)
        self.assertNotIn(PASSWORD, logged)
        self.assertIn("Passphrase", logged)

    def test_merchant_accounts_authorize_and_void_log_redacts_password(self):
        for method, masked in (("Authorize", True), ("Void", False)):
            with self.subTest(method=method):
                engine = run_operation("TEPaymentMerchantAccountsCa", method)
                if masked:
                    self.assert_redacted(engine, [PASSWORD], True)
                else:
                    self.assertIsNotNone(engine.logged_request)
                    self.assertNotIn(PASSWORD, engine.logged_request)
                    self.assertIn("Passphrase", engine.logged_request)

    def test_tsys_sale_log_redacts_transaction_key(self):
        engine = run_operation("TEPaymentTSYS", "Sale")
        self.assert_redacted(engine, [TRANSACTION_KEY, PASSWORD], True)

    def test_tsys_level2_sale_log_redacts_password(self):
        engine = Engine()
        proc = prepare(engine, "TEPaymentTSYS")
        proc.fields["fprocessingclass"] = engine.enums["pcllevel2"]
        call_method(engine, proc, "Sale")
        self.assert_redacted(engine, [PASSWORD, TRANSACTION_KEY], True)

    def test_tsys_generate_key_log_redacts_password(self):
        engine = Engine()
        proc = prepare(engine, "TEPaymentTSYS")
        scope = Scope(None, engine, proc)
        scope.declare("aerrortext", "")
        routine = engine._find_qualified("tepaymenttsys", "generatetransactionkey")
        engine.exec_routine(routine, [("name", "aerrortext")], scope, proc)
        self.assertIsNotNone(engine.logged_request)
        self.assertNotIn(PASSWORD, engine.logged_request)

    def test_sterling_sale_log_redacts_security_code(self):
        engine = run_operation("TEPaymentSterling", "Sale")
        self.assert_redacted(engine, [SECURITY_CODE], True)

    def test_mes_sale_log_redacts_profile_key(self):
        engine = run_operation("TEPaymentMES", "Sale")
        self.assert_redacted(engine, [PROFILE_KEY], True)

    def test_authorizenet_sale_log_redacts_transaction_key(self):
        engine = run_operation("TEPaymentAuthorizeNet", "Sale")
        self.assert_redacted(engine, [TRANS_KEY], True)

    def test_moneris_canada_sale_log_redacts_password(self):
        engine = run_operation("TEPaymentMonerisCanada", "Sale")
        self.assert_redacted(engine, [PASSWORD], True)

    def test_moneris_usa_sale_log_redacts_password(self):
        engine = run_operation("TEPaymentMonerisUSA", "Sale")
        self.assert_redacted(engine, [PASSWORD], True)

    def test_elavon_sale_log_redacts_pin(self):
        engine = run_operation("TEPaymentElavon", "Sale")
        self.assert_redacted(engine, [PASSWORD], True)

    def test_paypal_sale_log_redacts_password_and_signature(self):
        engine = run_operation("TEPaymentPayPal", "Sale")
        self.assert_redacted(engine, [PASSWORD, SIGNATURE], True)

    def test_payflowpro_sale_log_redacts_password(self):
        engine = run_operation("TEPaymentPayFlowPro", "Sale")
        self.assert_redacted(engine, [PASSWORD], True)

    def test_logged_response_redacts_echoed_secret(self):
        engine = Engine()
        proc = prepare(engine, "TEPaymentMerchantAccountsCa")
        echoed = (
            f"<Passphrase>{PASSWORD}</Passphrase>"
            f"<CardNumber>{PAN}</CardNumber>"
            f"<CardIDNumber>{CVV}</CardIDNumber>"
        )
        proc.fields["flastresponse"] = echoed
        scope = Scope(None, engine, proc)
        routine = engine._find_qualified("tepaymentprocessor", "lastresponse")
        masked = engine.exec_routine(routine, [], scope, proc)
        self.assertNotIn(PASSWORD, str(masked))
        self.assertNotIn(PAN, str(masked))
        self.assertNotIn(CVV, str(masked))
        self.assertIn("*" * 12 + "4242", str(masked))


if __name__ == "__main__":
    unittest.main(verbosity=2)

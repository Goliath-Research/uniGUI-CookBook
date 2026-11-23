"""Login forms must not take the account password from the query string.

These tests fail while a login form copies the password query parameter into
the password edit or submits that value to Login. They pass once those forms
stop using the query string as a credential.

Run from the repository root:

    python3 tests/test_password_query_not_initialized.py
"""

import subprocess
import tempfile
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]

# Login forms whose OK handler submits the password edit, plus LoginFrm.
# GoogleApiLogin/GoogleLoginForm.pas is an OAuth form and is not part of this
# password-query path. Lotus Notes, IQMS dbtrans, and Hybrid4 ADLoginDM do not
# read a password query parameter; they are not exercised here.
FORM_UNITS = [
    "Samples/Hybrid/_dLoginForm.pas",
    "Samples/Hybrid/_mLoginForm.pas",
    "Samples/Hybrid2/_dLoginForm.pas",
    "Samples/Hybrid2/_mLoginForm.pas",
    "Samples/Hybrid3/_dLoginForm.pas",
    "Samples/Hybrid3/_mLoginForm.pas",
    "Samples/Hybrid4/_dLoginForm.pas",
    "Samples/Hybrid4/_mLoginForm.pas",
    "Samples/Hybrid5/_dLoginForm.pas",
    "Samples/Hybrid5/_mLoginForm.pas",
    "IVC/_dLoginForm.pas",
    "IVC/_mLoginForm.pas",
    "Demo/_dLoginForm.pas",
    "Demo/_mLoginForm.pas",
    "BigWebApp/_dLoginForm.pas",
    "BigWebApp/_mLoginForm.pas",
    "BigWebApp/LoginFrm.pas",
]


def _skip_trivia(text, index):
    length = len(text)
    while index < length:
        if text[index] in " \t\r\n":
            index += 1
            continue
        if text.startswith("//", index):
            newline = text.find("\n", index)
            index = length if newline < 0 else newline + 1
            continue
        if text.startswith("(*", index):
            close = text.find("*)", index + 2)
            index = length if close < 0 else close + 2
            continue
        if text.startswith("{", index):
            close = text.find("}", index + 1)
            index = length if close < 0 else close + 1
            continue
        break
    return index


def _implementation(text):
    marker = "\nimplementation"
    lower = text.lower()
    start = lower.find(marker)
    if start < 0:
        raise AssertionError("unit has no implementation section")
    return text[start + 1 :]


def _read_word(text, index):
    index = _skip_trivia(text, index)
    if index >= len(text):
        return "", index
    if text[index].isalpha() or text[index] == "_":
        end = index + 1
        while end < len(text) and (text[end].isalnum() or text[end] == "_"):
            end += 1
        return text[index:end], end
    return "", index


def _extract_procedures(text):
    """Return implementation procedures as (short_name, params, full_text)."""
    source = _implementation(text)
    procedures = []
    index = 0
    while True:
        word, next_index = _read_word(source, index)
        if not word:
            if next_index >= len(source):
                break
            index = next_index + 1
            continue
        if word.lower() != "procedure":
            index = next_index
            continue
        header_start = index
        # Header runs through the semicolon that closes the parameter list.
        cursor = next_index
        paren = 0
        while cursor < len(source):
            character = source[cursor]
            if character == "(":
                paren += 1
            elif character == ")":
                paren -= 1
            elif character == ";" and paren == 0:
                cursor += 1
                break
            cursor += 1
        header = source[header_start:cursor]
        after = _skip_trivia(source, cursor)
        next_word, _ = _read_word(source, after)
        if next_word.lower() != "begin":
            index = cursor
            continue
        depth = 0
        scan = after
        end_at = None
        while scan < len(source):
            scan = _skip_trivia(source, scan)
            if scan >= len(source):
                break
            if source[scan] == "'":
                scan += 1
                while scan < len(source):
                    if source[scan] == "'":
                        if scan + 1 < len(source) and source[scan + 1] == "'":
                            scan += 2
                            continue
                        scan += 1
                        break
                    scan += 1
                continue
            token, after_token = _read_word(source, scan)
            if token and after_token == scan + len(token):
                lowered = token.lower()
                if lowered in ("begin", "try", "case", "record"):
                    depth += 1
                elif lowered == "end":
                    depth -= 1
                    if depth == 0:
                        end_at = after_token
                        if end_at < len(source) and source[end_at] == ";":
                            end_at += 1
                        break
                scan = after_token
                continue
            scan += 1
        if end_at is None:
            raise AssertionError("procedure body did not close: " + header)
        body = source[header_start:end_at]
        short_name, params = _split_header(header)
        procedures.append((short_name, params, _rewrite_header(body, short_name)))
        index = end_at
    return procedures


def _split_header(header):
    # procedure ClassName.Name(params);
    without = header.strip()
    if without.endswith(";"):
        without = without[:-1]
    without = without[len("procedure") :].strip()
    paren = without.find("(")
    if paren < 0:
        name_part = without
        params = ""
    else:
        name_part = without[:paren].strip()
        params = without[paren:].strip()
    short_name = name_part.split(".")[-1]
    return short_name, params


def _rewrite_header(body, short_name):
    semicolon = body.find(";")
    params_start = body.find("(")
    if 0 <= params_start < semicolon:
        params = body[params_start:semicolon]
    else:
        params = ""
    return "procedure " + short_name + params + body[semicolon:]


def _parse_dfm(text):
    """Return (on_create, password_name, password_text, edit_texts)."""
    on_create = None
    password_name = None
    password_text = ""
    edit_texts = {}
    stack = []
    for raw_line in text.splitlines():
        line = raw_line.strip()
        if line.lower().startswith("object ") or line.lower().startswith("inherited "):
            parts = line.split(None, 2)
            name = parts[1].split(":")[0]
            stack.append({"name": name, "props": {}})
            continue
        if line.lower() == "end":
            if not stack:
                continue
            obj = stack.pop()
            props = obj["props"]
            if "PasswordChar" in props and props["PasswordChar"] == "'*'":
                password_name = obj["name"]
                password_text = _dfm_string(props.get("Text", "''"))
            if "Text" in props:
                edit_texts[obj["name"]] = _dfm_string(props["Text"])
            if len(stack) == 0 and "OnCreate" in props:
                on_create = props["OnCreate"]
            elif len(stack) == 1 and "OnCreate" in obj["props"] and on_create is None:
                on_create = obj["props"]["OnCreate"]
            continue
        if not stack or "=" not in line:
            continue
        key, value = line.split("=", 1)
        stack[-1]["props"][key.strip()] = value.strip()
    # OnCreate is stored on the root. The root is popped last, and at that
    # moment the stack is empty, so capture it before treating it as a control.
    return on_create, password_name, password_text, edit_texts


def _dfm_string(literal):
    literal = literal.strip()
    if len(literal) >= 2 and literal[0] == "'" and literal[-1] == "'":
        return literal[1:-1].replace("''", "'")
    return ""


def _pascal_string(value):
    return "'" + value.replace("'", "''") + "'"


def _hex_decode(value):
    if value == "":
        return ""
    return bytes.fromhex(value).decode("utf-8")


STUB = r"""
program loginprobe;
{$mode delphi}
uses SysUtils, Classes;

type
  TEdit = class
    Text: string;
  end;
  TMsgDlgBtn = (mbYes, mbNo, mbOK, mbCancel, mbAbort, mbRetry, mbIgnore,
    mbAll, mbNoToAll, mbYesToAll, mbHelp, mbClose);
  TMsgDlgButtons = set of TMsgDlgBtn;
  TMsgDlgType = (mtWarning, mtError, mtInformation, mtConfirmation, mtCustom);
  TUniGUIApplication = class
    Parameters: TStringList;
  end;
  TMainModule = class
    function Login(const AUser, APassword: string; ADesktop: Boolean): Boolean; overload;
    function Login(const AUser, APassword, AExtra: string): Boolean; overload;
  end;
  TLogin = class
    class procedure CheckRecordFailedLogin(const AUser, ADatabase: string);
  end;

var
  GApp: TUniGUIApplication;
  GModule: TMainModule;
  GLoginLog: TStringList;
  edtUsername: TEdit;
  edtPassword: TEdit;
  UserNameEdit: TEdit;
  PasswordEdit: TEdit;
  DatabaseComboBox: TEdit;
  FLoginAttemptsCounter: Integer;
  ModalResult: Integer;

const
  mrNone = 0;
  mrOk = 1;
  mrCancel = 2;

function HexOf(const S: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
    Result := Result + IntToHex(Ord(S[I]), 2);
end;

procedure NoteLogin(const APassword: string);
begin
  GLoginLog.Add(HexOf(APassword));
end;

function TMainModule.Login(const AUser, APassword: string; ADesktop: Boolean): Boolean;
begin
  NoteLogin(APassword);
  Result := False;
end;

function TMainModule.Login(const AUser, APassword, AExtra: string): Boolean;
begin
  NoteLogin(APassword);
  Result := False;
end;

class procedure TLogin.CheckRecordFailedLogin(const AUser, ADatabase: string);
begin
end;

function UniApplication: TUniGUIApplication;
begin
  Result := GApp;
end;

function UniMainModule: TMainModule;
begin
  Result := GModule;
end;

procedure ShowMessage(const S: string);
begin
end;

procedure MessageDlg(const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons);
begin
end;

procedure LoadQuery(const AValue: string);
var
  StartAt, Cursor: Integer;
  Segment, Decoded, HexDigits: string;
  Index: Integer;
begin
  // Same shape as Indy's TIdHTTPRequestInfo.DecodeAndSetParams: split on
  // '&', treat '+' as a space, percent-decode, and store each pair.
  GApp.Parameters.Clear;
  StartAt := 1;
  while StartAt <= Length(AValue) do
  begin
    Cursor := StartAt;
    while (Cursor <= Length(AValue)) and (AValue[Cursor] <> '&') do
      Inc(Cursor);
    Segment := Copy(AValue, StartAt, Cursor - StartAt);
    Segment := StringReplace(Segment, '+', ' ', [rfReplaceAll]);
    Decoded := '';
    Index := 1;
    while Index <= Length(Segment) do
    begin
      if (Segment[Index] = '%') and (Index + 2 <= Length(Segment)) then
      begin
        HexDigits := '$' + Copy(Segment, Index + 1, 2);
        Decoded := Decoded + Chr(StrToIntDef(HexDigits, 63));
        Inc(Index, 3);
      end
      else
      begin
        Decoded := Decoded + Segment[Index];
        Inc(Index);
      end;
    end;
    if Decoded <> '' then
      GApp.Parameters.Add(Decoded);
    StartAt := Cursor + 1;
  end;
end;

function CurrentPasswordText: string;
begin
  Result := PASSWORD_EDIT.Text;
end;

PROCEDURES_HERE

begin
  GApp := TUniGUIApplication.Create;
  GApp.Parameters := TStringList.Create;
  GApp.Parameters.CaseSensitive := False;
  GApp.Parameters.NameValueSeparator := '=';
  GModule := TMainModule.Create;
  GLoginLog := TStringList.Create;
  edtUsername := TEdit.Create;
  edtPassword := TEdit.Create;
  UserNameEdit := TEdit.Create;
  PasswordEdit := TEdit.Create;
  DatabaseComboBox := TEdit.Create;
  FLoginAttemptsCounter := 0;
  ModalResult := mrNone;
  INITIAL_TEXTS
  LoadQuery(ParamStr(1));
  CALLS
  Writeln('FIELD=', HexOf(CurrentPasswordText));
  Writeln('LOGINS=', GLoginLog.Text);
  Writeln('MODAL=', ModalResult);
end.
"""


def _compile_and_run(unit_path, query):
    source = unit_path.read_text(encoding="latin-1")
    dfm_path = unit_path.with_suffix(".dfm")
    dfm = dfm_path.read_text(encoding="latin-1")
    on_create, password_name, _password_text, edit_texts = _parse_dfm(dfm)
    if not password_name:
        raise AssertionError(f"{unit_path} has no password edit")
    procedures = _extract_procedures(source)
    by_name = {name.lower(): (name, params, body) for name, params, body in procedures}

    selected = []
    calls = []
    if on_create:
        match = by_name.get(on_create.lower())
        if match is None:
            raise AssertionError(f"{unit_path} OnCreate {on_create} has no body")
        selected.append(match)
        calls.append(f"  {match[0]}(nil);")
    for name, params, body in procedures:
        if ".Login(" not in body and ".login(" not in body.lower():
            continue
        if params.replace(" ", "").lower() != "(sender:tobject)":
            continue
        if all(existing[0].lower() != name.lower() for existing in selected):
            selected.append((name, params, body))
        calls.append(f"  {name}(nil);")

    initial_lines = []
    for edit_name, edit_text in edit_texts.items():
        if edit_name in ("edtUsername", "edtPassword", "UserNameEdit", "PasswordEdit", "DatabaseComboBox"):
            initial_lines.append(
                f"  {edit_name}.Text := {_pascal_string(edit_text)};"
            )
    if not any(line.startswith(f"  {password_name}.Text") for line in initial_lines):
        initial_lines.append(f"  {password_name}.Text := {_pascal_string(edit_texts.get(password_name, ''))};")

    program = STUB.replace("PASSWORD_EDIT", password_name)
    program = program.replace(
        "PROCEDURES_HERE",
        "\n\n".join(body for _name, _params, body in selected),
    )
    program = program.replace(
        "INITIAL_TEXTS",
        "\n".join(initial_lines) if initial_lines else "  { no dfm text }",
    )
    program = program.replace("CALLS", "\n".join(calls) if calls else "  { no handlers }")

    with tempfile.TemporaryDirectory(prefix="loginprobe-") as temp:
        work = Path(temp)
        source_path = work / "loginprobe.pas"
        source_path.write_text(program, encoding="ascii", errors="strict")
        compiled = subprocess.run(
            ["fpc", "-Mdelphi", "-v0", str(source_path)],
            cwd=work,
            capture_output=True,
            text=True,
        )
        if compiled.returncode != 0:
            raise AssertionError(
                f"probe failed to compile for {unit_path}\n{compiled.stdout}\n{compiled.stderr}\n{program}"
            )
        ran = subprocess.run(
            [str(work / "loginprobe"), query],
            cwd=work,
            capture_output=True,
            text=True,
        )
        if ran.returncode != 0:
            raise AssertionError(f"probe failed for {unit_path}\n{ran.stdout}\n{ran.stderr}")
        field = ""
        logins = []
        for line in ran.stdout.splitlines():
            if line.startswith("FIELD="):
                field = _hex_decode(line[len("FIELD=") :])
            elif line.startswith("LOGINS="):
                continue
            elif line and all(character in "0123456789abcdefABCDEF" for character in line):
                logins.append(_hex_decode(line))
        # TStringList.Text writes each item on its own line after LOGINS= only
        # when the list text is printed as one writeln. Split that block.
        if "LOGINS=" in ran.stdout:
            block = ran.stdout.split("LOGINS=", 1)[1]
            block = block.split("MODAL=", 1)[0]
            logins = [_hex_decode(item) for item in block.splitlines() if item]
        return field, logins


class PasswordQueryInitializationTest(unittest.TestCase):
    def test_query_password_does_not_initialize_login(self):
        for relative in FORM_UNITS:
            unit_path = ROOT / relative
            self.assertTrue(unit_path.is_file(), relative)
            with self.subTest(form=relative):
                first_query = "username=placeholder-user&password=placeholder-alpha"
                second_query = "username=placeholder-user&password=placeholder-beta"
                field_a, logins_a = _compile_and_run(unit_path, first_query)
                field_b, logins_b = _compile_and_run(unit_path, second_query)
                self.assertEqual(
                    field_a,
                    field_b,
                    f"{relative} copied the password query parameter into the password edit",
                )
                self.assertEqual(
                    logins_a,
                    logins_b,
                    f"{relative} submitted the password query parameter to Login",
                )
                encoded_a = "username=placeholder-user&password=placeholder%2Dalpha"
                encoded_b = "username=placeholder-user&password=placeholder%2Dbeta"
                encoded_field_a, encoded_logins_a = _compile_and_run(unit_path, encoded_a)
                encoded_field_b, encoded_logins_b = _compile_and_run(unit_path, encoded_b)
                self.assertEqual(
                    encoded_field_a,
                    encoded_field_b,
                    f"{relative} copied a percent-encoded password query parameter into the password edit",
                )
                self.assertEqual(
                    encoded_logins_a,
                    encoded_logins_b,
                    f"{relative} submitted a percent-encoded password query parameter to Login",
                )
                mixed_case_a = "username=placeholder-user&Password=placeholder-alpha"
                mixed_case_b = "username=placeholder-user&Password=placeholder-beta"
                case_field_a, case_logins_a = _compile_and_run(unit_path, mixed_case_a)
                case_field_b, case_logins_b = _compile_and_run(unit_path, mixed_case_b)
                self.assertEqual(
                    case_field_a,
                    case_field_b,
                    f"{relative} copied a differently cased password query parameter into the password edit",
                )
                self.assertEqual(
                    case_logins_a,
                    case_logins_b,
                    f"{relative} submitted a differently cased password query parameter to Login",
                )


if __name__ == "__main__":
    unittest.main()

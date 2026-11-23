"""Spec for the compiled RTBox service credential.

These tests fail while the product still resolves a database password without
a configured secret. They pass once that password is no longer compiled into
the login unit, the settings unit, the service-account provisioning statement,
or a design-time connection file.

Run:

    python3 -m unittest tests.test_service_account_credential

Oracle password comparison follows Oracle Database 12.1 SQL Language
Reference, CREATE USER, IDENTIFIED BY: a later connect must use the same
case written in that statement. The runner executes the product routines;
it does not reimplement their branches.
"""

from __future__ import annotations

import re
import unittest
from tests.pascal_rt import (
    ROOT,
    AuthFailed,
    Env,
    Oracle,
    PascalError,
    extract_routine,
    read_unit,
    require,
    strip_comments,
    usable,
)


LOGIN_UNITS = (
    "BigWebApp/Libraries/IQMS.Common.Login.pas",
    "Delphi4Web/Components/Libraries/IQMS.Common.Login.pas",
)
PARAMS_UNITS = (
    "BigWebApp/Libraries/IQMS.Common.Params.pas",
    "Delphi4Web/Components/Libraries/IQMS.Common.Params.pas",
)
STRING_UTILS = "BigWebApp/Components/IQWebCommon/Source/IQMS.Common.StringUtils.pas"
MISCELLANEOUS = "BigWebApp/Components/IQWebVcl/Source/IQMS.Common.Miscellaneous.pas"
SCHEMA_PLACEHOLDER = "schema-owner-placeholder"

def params_env(relative: str, oracle: Oracle | None = None, registry: dict | None = None) -> Env:
    source = read_unit(relative)
    env = Env(source, oracle or Oracle(), registry or {}, {})
    for name in (
        "TIQMS_Params.GetWebIQDatabase",
        "TIQMS_Params.GetRTBoxPassword",
        "TIQMS_Params.GetRTBoxConnection",
        "TIQMS_Params.GetIQMSPassword",
        "TIQMS_Params.GetIQMSConnection",
    ):
        env.load_routine(name)
    env.routines["getwebiqdatabase"] = env.routines["tiqms_params.getwebiqdatabase"]
    env.routines["getrtboxpassword"] = env.routines["tiqms_params.getrtboxpassword"]
    env.routines["getrtboxconnection"] = env.routines["tiqms_params.getrtboxconnection"]
    env.routines["getiqmspassword"] = env.routines["tiqms_params.getiqmspassword"]
    env.routines["getiqmsconnection"] = env.routines["tiqms_params.getiqmsconnection"]
    return env


def login_env(relative: str, oracle: Oracle | None = None) -> Env:
    source = read_unit(relative)
    env = Env(source, oracle or Oracle(), {}, {})
    for name in ("TLogin.GetRTBoxPassword", "TLogin.GetIQMSPassword"):
        env.load_routine(name)
    return env


def self_params() -> dict:
    return {"__self__": True, "FIqmsConnection": None}


def resolve_login_password(relative: str, connection_name: str = "IQORA"):
    env = login_env(relative)
    try:
        value = env.call("TLogin.GetRTBoxPassword", [connection_name], {"__self__": True})
    except (PascalError, AuthFailed):
        return None
    return value


def resolve_params_password(relative: str, registry: dict | None = None):
    oracle = Oracle()
    env = params_env(relative, oracle, registry or {})
    try:
        value = env.call("TIQMS_Params.GetRTBoxPassword", [], self_params())
    except (PascalError, AuthFailed):
        return None
    return value


def charxor(env: Env, text: str) -> str:
    return env._charxor(text)


def iqms_log_sql(relative: str) -> str:
    source = read_unit(relative)
    routine = extract_routine(source, "TIQMS_Params.GetIQMSPassword")
    marker = "ExecSQLScalar("
    start = routine.body.find(marker)
    if start < 0:
        raise AssertionError("schema-password query was not found in the settings routine")
    literal = routine.body[start + len(marker) :]
    literal = literal[literal.find("'") :]
    text, _end = _read_pascal_string(literal)
    return text


def _read_pascal_string(src: str):
    assert src[0] == "'"
    i = 1
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
    raise AssertionError("unterminated query string")


def provision_service_account(oracle: Oracle) -> None:
    source = read_unit(MISCELLANEOUS)
    env = Env(source, oracle, {}, {})
    env.load_routine("CheckRTBOXUserCreated")
    env.call("CheckRTBOXUserCreated", ["IQFD"], None)


def seed_schema_password(env: Env, oracle: Oracle) -> None:
    oracle.iqms_log = charxor(env, SCHEMA_PLACEHOLDER)
    oracle.users["IQMS"] = SCHEMA_PLACEHOLDER


def session_chain_reaches_connection() -> bool:
    main = strip_comments(read_unit("BigWebApp/Main.pas"))
    session = strip_comments(read_unit("BigWebApp/Registration/IQWeb.Session.Registration.pas"))
    server = strip_comments(read_unit("BigWebApp/Registration/IQWeb.Server.Registration.pas"))
    framework = strip_comments(
        read_unit("BigWebApp/Implementations/IQWeb.Session.FrameworkServices.FireDAC.pas")
    )
    services = strip_comments(
        read_unit("BigWebApp/Implementations/IQWeb.Server.DataServices.FireDAC.pas")
    )
    create = _routine_body(main, "TMainForm.UniFormCreate")
    reg_session = _routine_body(session, "RegSessionWeb")
    reg_server = _routine_body(server, "TIQServerRegistration.RegServerWeb")
    constructor = _routine_body(framework, "TIQFrameworkServicesFireDAC_Oracle.Create")
    get_connection = _routine_body(services, "TIQDataServicesFireDAC_Oracle.GetIQMSConnection")
    return (
        "RegSessionWeb" in create
        and "IIQFrameworkServices" in reg_session
        and "TIQFrameworkServicesFireDAC_Oracle" in reg_server
        and "IIQFrameworkServices" in reg_server
        and "GetIQMSConnection" in constructor
        and "IQMSConnection" in get_connection
    )


def _routine_body(src: str, signature: str) -> str:
    try:
        return extract_routine(src, signature).body
    except PascalError:
        return ""


def dfm_hits() -> list[str]:
    """Form files that store a non-empty password next to the schema or service user."""
    hits = []
    user = re.compile(r"User_Name=(IQMS|RTBOX)\b", re.IGNORECASE)
    secret = re.compile(r"Password=([^'\r\n]+)")
    for path in sorted(ROOT.rglob("*.dfm")):
        lines = path.read_text(encoding="utf-8", errors="replace").splitlines()
        for index, line in enumerate(lines):
            if not user.search(line):
                continue
            window = "\n".join(lines[max(0, index - 4) : index + 5])
            match = secret.search(window)
            if match and match.group(1).strip():
                hits.append(str(path.relative_to(ROOT)))
                break
    return hits


class ServiceAccountCredentialTests(unittest.TestCase):
    def test_session_startup_reaches_the_settings_connection(self):
        require(
            session_chain_reaches_connection(),
            "session startup no longer reaches the settings connection; the harness cannot see that path",
        )

    def test_login_password_is_not_usable_without_a_secret(self):
        for relative in LOGIN_UNITS:
            value = resolve_login_password(relative)
            require(
                not usable(value),
                f"{relative} resolved a service password with no secret configured",
            )

    def test_settings_password_is_not_usable_without_a_secret(self):
        for relative in PARAMS_UNITS:
            # Key opens and the service value is absent, so the routine takes its default branch.
            registry = {("HKEY_LOCAL_MACHINE", "SOFTWARE\\IQMS\\Shared\\IQORA"): {}}
            value = resolve_params_password(relative, registry)
            require(
                not usable(value),
                f"{relative} resolved a service password when the registry value was absent",
            )

    def test_missing_registry_key_does_not_resolve_a_service_password(self):
        for relative in PARAMS_UNITS:
            value = resolve_params_password(relative, {})
            require(
                not usable(value),
                f"{relative} resolved a service password when the registry key was absent",
            )

    def test_provisioned_service_account_rejects_the_login_password(self):
        oracle = Oracle()
        provision_service_account(oracle)
        env = login_env(LOGIN_UNITS[0], oracle)
        password = resolve_login_password(LOGIN_UNITS[0])
        session = oracle.connect("RTBox", password, "IQORA")
        recovered = False
        if session is not None and oracle.has_select(session["user"], "IQORDER2"):
            seed_schema_password(env, oracle)
            column = oracle.execute(iqms_log_sql(PARAMS_UNITS[0]), session["user"])
            recovered = charxor(env, column) == SCHEMA_PLACEHOLDER
        require(
            session is None or not recovered,
            "the login-unit password opened the provisioned service account and recovered the schema password",
        )

    def test_settings_connection_does_not_recover_the_schema_password(self):
        for relative in PARAMS_UNITS:
            oracle = Oracle()
            env = params_env(relative, oracle, {})
            password = resolve_params_password(relative, {})
            if usable(password):
                oracle.users["RTBOX"] = password
            seed_schema_password(env, oracle)
            # The grant in the provisioning routine is what lets this account read the column.
            oracle.grants.add(("RTBOX", "SELECT", "IQORDER2"))
            recovered = False
            try:
                env.call("TIQMS_Params.GetIQMSConnection", [], self_params())
            except (PascalError, AuthFailed):
                recovered = False
            else:
                recovered = any(
                    attempt["accepted"] and str(attempt["user"]).upper() == "IQMS"
                    for attempt in oracle.attempts
                )
            require(
                not recovered,
                f"{relative} connected as the schema owner using a service password resolved with no secret",
            )

    def test_provisioning_does_not_install_a_compiled_service_password(self):
        oracle = Oracle()
        provision_service_account(oracle)
        source = strip_comments(read_unit(MISCELLANEOUS))
        routine = extract_routine(source, "CheckRTBOXUserCreated")
        literals = _string_literals(routine.body)
        installed = oracle.users.get("RTBOX")
        compiled = installed is not None and any(installed in literal for literal in literals)
        require(
            not compiled,
            "service-account provisioning installed a password literal from the routine",
        )

    def test_blank_stored_schema_password_is_not_replaced_by_a_literal(self):
        for relative in LOGIN_UNITS:
            oracle = Oracle()
            oracle.iqms_log = ""
            env = login_env(relative, oracle)
            try:
                value = env.call("TLogin.GetIQMSPassword", [], {"__self__": True})
            except (PascalError, AuthFailed):
                value = None
            require(
                not usable(value),
                f"{relative} returned a schema password when the stored column was blank",
            )

    def test_design_time_connections_do_not_store_a_schema_or_service_password(self):
        hits = dfm_hits()
        require(
            not hits,
            "design-time connection files store a schema or service password: " + ", ".join(hits),
        )

def _string_literals(src: str) -> set[str]:
    found = set()
    i = 0
    while i < len(src):
        if src[i] == "'":
            text, relative = _read_pascal_string(src[i:])
            found.add(text)
            i += relative
            continue
        i += 1
    return found


if __name__ == "__main__":
    unittest.main()

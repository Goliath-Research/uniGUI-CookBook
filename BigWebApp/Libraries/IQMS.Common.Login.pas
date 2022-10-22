unit IQMS.Common.Login;

interface

uses
  Classes,
  SysUtils,
  DB,
  FireDAC.Comp.Client;

type
  TWrongUserNameOrPassword = class(Exception)
  end;

  TSameUserLoggedIn = class(Exception)
  end;

  TMaxFailedLoginAttemptExceeded = class(Exception)
  end;

  TNewUserWithExpiredTempPassword = class(Exception)
  end;

  TPasswordChangeRequired = class(Exception)
  end;

  TInvalidLogin = class(Exception)
  end;

  TPasswordAboutToExpire = class(Exception)
  end;

  ILogin = interface
    ['{8A042701-E4A7-455F-BFBC-7EEEC7547FCA}']
    function Login(aConnection : TFDConnection; aUserName, aPassword : string) : boolean;
  end;

  TLogin = class(TInterfacedObject, ILogin)
  private
    FConnection : TFDConnection;

    {$REGION 'Get password methods'}
    function GetRTBoxPassword( ConnectionName : string ) : string;
    {$ENDREGION}

    {$REGION 'Main Post-login methods'}
    procedure SyncSessionWithUser(const aUserName, aPassword : string);
    procedure CheckOptionalLoginRestrictions(const aUserName: string);
    procedure CheckChangePassword(var aPassword: string);
    {$ENDREGION}

    {$REGION 'Miscellaneous Post-login methods'}
    procedure CheckResetNewUserFlag(const aUserName: string);
    procedure CheckDenySameUserLogin(const aUserName: string);
    procedure CheckNewUserWithExpiredTempPassword(const aUserName: string);
    procedure SaveIQMSUserPassword(const NewIQMSPassword: string);
    {$ENDREGION}

    {$REGION 'Getters/Setters'}
    function  GetTrackLogin                   : boolean;
    function  GetPreventSameLogin             : boolean;
    function  GetNewUserExpirePassword        : boolean;
    procedure SetNewUserExpirePassword        (aExpirePassword : boolean);
    function  GetForcePasswordChange          (aUserName: string): boolean;
    procedure SetForcePasswordChange          (aUserName: string; aPasswordChange: boolean);
    function  GetIQMSPassword                 : string;
    procedure SetIQMSPassword                 (aPassword: string);
    function  GetNewUser                      (aUserName: string): boolean;
    procedure SetNewUser                      (aUserName: string; aNewUser : boolean);
    function  GetNewUserPasswordExpired       (aUserName: string): boolean;
    function  GetPasswordGraceTime            (aUserName: string): double;
    function  GetIsPasswordAboutToExpire      (aUserName: string; var aMsg : string): boolean;
    function  GetPreventSameLoginUserSpecific (aUserName: string): string;
    {$ENDREGION}

    procedure DatabaseLogout;
    function  TryDatabaseLogin                (aUserName, aPassword : string) : boolean;
    procedure RecordTooManyFailedLoginAttempts(aUserName: string);
    procedure AssociateCurrentSessionWithUser (aUserName: string);
    function  IsUserAlreadyLoggedIn           (aUserName: string): boolean;
    procedure SyncUserConnectionInfoInDB(const aUserName, aPassword : string);

    property  NewUserExpirePassword                   : boolean read GetNewUserExpirePassword   write SetNewUserExpirePassword;
    property  IQMSPassword                            : string  read GetIQMSPassword            write SetIQMSPassword;
    property  NewUser            [aUserName : string] : boolean read GetNewUser                 write SetNewUser;
    property  PasswordGraceTime  [aUserName : string] : double  read GetPasswordGraceTime;
    property  ForcePasswordChange[aUserName : string] : boolean read GetForcePasswordChange     write SetForcePasswordChange;
  public
    function Login(aConnection : TFDConnection; aUserName, aPassword : string) : boolean;
    class procedure GetCurrentSessionInfo(var ASid, ASerial: Real; var AProcess, AProgram: string; var ALogInTimeStamp: TDateTime);
    class procedure CheckRecordFailedLogin(aUserName : string; AConnectionName : string);
  end;

implementation

uses
  StrUtils,
  Variants,
  IQMS.Common.ApplicationSet,
  IQMS.Common.DataConst,
  IQMS.Common.DataServices,
  IQMS.Common.StringUtils,
  IQMS.Common.ResStrings,
  IQMS.WebVcl.SecurityManager,
  IQMS.WebVcl.ResourceStrings,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.StandardExceptions;

const
  CRLF = #13#10;

{ TLogin }

class procedure TLogin.GetCurrentSessionInfo( var ASid, ASerial: Real; var AProcess, AProgram: string; var ALogInTimeStamp: TDateTime );
var
  A: Variant;
begin
  A:= SelectValueArray( 'select sid, serial#, process, program, logon_time from v$session where audsid=sys_context(''userenv'',''SESSIONID'')' );
  IQAssert( VarArrayDimCount( A ) > 0, 'Failed to obtain session information while processing a login' );  {s/n happen}

  ASid           := A[ 0 ];
  ASerial        := A[ 1 ];
  AProcess       := A[ 2 ];
  AProgram       := A[ 3 ];
  ALogInTimeStamp:= A[ 4 ];
end;

class procedure TLogin.CheckRecordFailedLogin(aUserName: string; AConnectionName : string);
var
  aLogin         : TLogin;
  ASysDate       : TDateTime;
  ASid           : Real;
  ASerial        : Real;
  AProcess       : string;
  AProgram       : string;
  ALogInTimeStamp: TDateTime;

begin
  aLogin := TLogin.Create;
  with aLogin do
  try
    if not GetTrackLogin() then
      EXIT;

    GetCurrentSessionInfo( ASid, ASerial, AProcess, AProgram, ALogInTimeStamp );

    ASysDate:= SelectValueAsFloat('select sysdate from dual');

    ExecuteCommandFmt('insert into s_user_login                                                   ' + CRLF +
                      '      ( userid, timestamp, auto_locked_out, program, sid, serial, process) ' + CRLF +
                      'values                                                                     ' + CRLF +
                      '      ( ''%s'',                                                            ' + CRLF +
                      '        to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''),                        ' + CRLF +
                      '        to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''),                        ' + CRLF +
                      '        ''%s'',                                                            ' + CRLF +
                      '        %f,                                                                ' + CRLF +
                      '        %f,                                                                ' + CRLF +
                      '        ''%s'')                                                            ',
                      [ UpperCase( AUserName ),
                        FormatDateTime('mm/dd/yyyy hh:nn:ss', ASysDate),
                        FormatDateTime('mm/dd/yyyy hh:nn:ss', ASysDate),
                        Trim(AProgram),
                        ASid,
                        ASerial,
                        AProcess ]);

      {'User %s has exceeded max allowed failed login attempts. Aborting operation...'}
      raise TMaxFailedLoginAttemptExceeded.CreateFmt( IQMS.Common.ResStrings.cTXT0000342, [ UpperCase(AUserName) ]);
  except
    on E: TMaxFailedLoginAttemptExceeded do
       raise;
    on E: Exception do
       ;{walk away}
  end;
end;

function TLogin.Login(aConnection: TFDConnection; aUserName, aPassword: string): boolean;
begin
  if AnsiCompareText(Trim(aUserName), 'RTBOX') = 0 then
    raise TInvalidLogin.Create(IQMS.Common.ResStrings.cTXT0000056);

  FConnection := aConnection;

  if TryDatabaseLogin(aUserName, aPassword) then
  try
    try
      // during login attempt
      CheckOptionalLoginRestrictions(aUserName); // raises errors

  (*UG_rem_AMB - temporarily removed because loading this dialog before mainmodule is
    initialized caused the landing page to render improperly.  This probably needs to be reworked
    to let the user know when they get to the landing page, but not before.
    In fact, we may be unable to surface any dialogs here.*)
      CheckChangePassword(aPassword);  // dialog

      SyncSessionWithUser(aUserName, aPassword);
    except
      DatabaseLogout;
      raise;
    end;
  finally
    //reset for when user logs in again from within the session
  end;

end;

procedure TLogin.DatabaseLogout;
begin
  FConnection.Connected := false;
end;

function TLogin.TryDatabaseLogin(aUserName, aPassword: string) : boolean;
var
  cUserName : string;
  cPassword : string;
begin
  Result := false;

  // The IQMS and RTBox usernames and passwords are procssed by the TIQMS_Params
  // object in the framework.

  // By the time we get to this code, we are already connected using IQMS
  // username and have already processed RTBox passwords. Since we are already
  // connected using IQMS username so we need to save that information temporarily
  // so we can again connect later.

  cUserName := FConnection.Params.UserName; //IQMS user
  cPassword := FConnection.Params.Password; //IQMS password
  FConnection.Connected := false;

  // Verify user credentials
  FConnection.Params.UserName := aUserName; // UserName typed into the login dialog
  FConnection.Params.Password := aPassword; // Password typed into the login dialog
  try
    try
      // attempt to connect using the credentials typed in
      FConnection.Connected := true;
      Result := true;

      // disconnect after a successful connect
      FConnection.Connected := false;
    except
      // TODO -oUXCoreTeam -cLogin: We should expand on this information instead of only displaying "bad credentials"
      // for example, the user account could be locked
      raise TWrongUserNameOrPassword.Create(IQMS.Common.ResStrings.cTXT0000056);
    end;
  finally
    //Now reconnect as IQMS
    FConnection.Connected := false;
    FConnection.Params.UserName := cUserName; //IQMS user
    FConnection.Params.Password := cPassword; //IQMS password
    FConnection.Connected := true;
  end;
end;

function TLogin.GetTrackLogin: Boolean;
begin
  try
    Result := SelectValueAsString( 'select sec_track_login from params') = 'Y';
  except
    Result := false;
  end;
end;

function TLogin.GetPreventSameLogin: Boolean;
begin
  try
    Result := SelectValueAsString('select sec_prevent_same_user_login from params') = 'Y';
  except
    Result := false;
  end;
end;

procedure TLogin.CheckChangePassword(var aPassword: string);
begin
  // ***AFTER create security manager, in IQ_Login function IQLoginBox(
  //       {Optional change password}
//  if chkChangePassword.Checked or IsPasswordExpiresWantsToChangeNow then
//    APasswordChanged:= DoChangeUserPassword;                               {ChangPsw.pas}
//
//  {Check force password change}
//  CheckForcePasswordChange( APasswordChanged );


// TODO: if we allow user IQMS to change the password, this is what we need to do
//  if the USer = IQMS then
//    SaveIQMSUserPassword(aPassword);
end;

procedure TLogin.CheckDenySameUserLogin(const aUserName: string);
var
  A: Variant;
  ASid           : Real;
  ASerial        : Real;
  AProcess       : string;
  AProgram       : string;
  ALogInTimeStamp: TDateTime;
  AUserSpecific  : string;

  procedure _check_same_login;
  const
    cSQLScalar =
       'select 1                                    ' + CRLF +
       '  from v$session v, s_user_login s          ' + CRLF +
       ' where                                      ' + CRLF +
       '       rtrim(upper(v.username)) = ''IQMS''  ' + CRLF +
       '   and v.type = ''USER''                    ' + CRLF +
       '   and v.status <> ''KILLED''               ' + CRLF +
       '   and v.sid <> %f                          ' + CRLF +
       '   and v.serial# <> %f                      ' + CRLF +
       '   and v.process <> ''%s''                  ' + CRLF +
       '   and upper(v.program) = upper(''%s'')     ' + CRLF +
       '   and v.sid = s.sid                        ' + CRLF +
       '   and v.serial# = s.serial                 ' + CRLF +
       '   and v.process = s.process                ' + CRLF +
       '   and upper(v.program) = upper(s.program)  ' + CRLF +
       '   and s.logged_out is null                 ' + CRLF +
       '   and s.userid = ''%s''                    ';
  begin
    GetCurrentSessionInfo( ASid, ASerial, AProcess, AProgram, ALogInTimeStamp );

    if SelectValueFmtAsInteger( cSQLScalar, [ ASid, ASerial, AProcess, AProgram, UpperCase(TrimRight(aUserName)) ]) = 1
    then
      {'User %s is already logged in - cannot log in the same user more than once. Access denied...'}
      raise TSameUserLoggedIn.CreateFmt( IQMS.Common.ResStrings.cTXT0000343,
                              [ Uppercase(aUserName) ])
  end;

begin
  AUserSpecific:= GetPreventSameLoginUserSpecific(aUserName);

  if AUserSpecific = 'N' then
     EXIT;

  if AUserSpecific = 'Y' then
  begin
    _check_same_login;
    EXIT;
  end;

  if not GetPreventSameLogin() then
    EXIT;

  _check_same_login;
end;

procedure TLogin.CheckNewUserWithExpiredTempPassword(const aUserName: string);
var
  ANewUserExpiredPassword: Boolean;
begin
  if IQMS.Common.ApplicationSet.IsNonIQMSSchema then
    Exit;

  try
    ANewUserExpiredPassword:= (SelectValueAsString('select sec_new_user_expire_pwd from params') = 'Y')
                              and
                              (SelectValueFmtAsFloat( 'select 1 from s_user_general where upper(user_name) = ''%s'' and is_new_user = ''Y'' and new_user_timestamp + 1 < sysdate',
                                          [ Uppercase(aUserName) ]) = 1);
  except
    EXIT;  {walk away - fields do not exist}
  end;

 if ANewUserExpiredPassword then
  // IQMS.Common.ResourceStrings.cTXT0000344 =
  // 'The temporary 24hr password for user %s has expired. Access denied...'
  raise EIQMSExpiredTemporaryPassword.CreateFmt(
    IQMS.Common.ResStrings.cTXT0000344, [Uppercase(aUserName)]);
end;

procedure TLogin.SaveIQMSUserPassword(const NewIQMSPassword: string);
var
  AField : TField;
begin
  if IQMS.Common.ApplicationSet.IsNonIQMSSchema then
    Exit;

  ExecuteCommandFmt('update iqorder2 set iqms_log = ''%s'' where rownum < 2', [ CharXOR(NewIQMSPassword) ]);
end;

procedure TLogin.CheckOptionalLoginRestrictions(const aUserName: string);
begin
  CheckDenySameUserLogin(aUserName);
  CheckNewUserWithExpiredTempPassword(aUserName);
end;

procedure TLogin.CheckResetNewUserFlag(const aUserName: string);
const
  SqlExec =
    'update s_user_general '            + CRLF +
    '   set is_new_user = ''N'' '       + CRLF +
    ' where upper(user_name) = ''%s'' ' + CRLF +
    '   and is_new_user = ''Y''';
begin
  try
    ExecuteCommandFmt( SqlExec, [ UpperCase(aUserName) ]);
  except
    EXIT;  {walk away - fields do not exist}
  end;
end;

function TLogin.GetForcePasswordChange(aUserName: string): boolean;
const
  SqlQuery =
    'select                           ' + CRLF +
    '  force_password_change          ' + CRLF +
    'from s_user_general              ' + CRLF +
    'where upper(user_name) = ''%s''';
begin
  try
    Result := SelectValueFmtAsString(SqlQuery, [ UpperCase(aUserName) ]) = 'Y';
  except
    Result := false;
  end;
end;

procedure TLogin.SetForcePasswordChange(aUserName: string; aPasswordChange: boolean);
const
  SqlCmd =
    'update s_user_general            ' + CRLF +
    'set                              ' + CRLF +
    '  force_password_change = ''%s'' ' + CRLF +
    'where upper(user_name) = ''%s''';
begin
  ExecuteCommandFmt(SqlCmd, [IfThen(aPasswordChange, 'Y', 'N'), UpperCase(aUserName)]);
end;

function TLogin.GetNewUserExpirePassword: boolean;
begin
  Result := SelectValueAsString('select sec_new_user_expire_pwd from params') = 'Y';
end;

procedure TLogin.SetNewUserExpirePassword(aExpirePassword: boolean);
begin
  ExecuteCommandFmt('update params set sec_new_user_expire_pwd = ''%s''', [IfThen(aExpirePassword, 'Y', 'N')]);
end;

procedure TLogin.SyncSessionWithUser(const aUserName, aPassword : string);
begin
  SyncUserConnectionInfoInDB(aUserName, aPassword);
  CheckResetNewUserFlag(aUserName);
  if GetTrackLogin then
    AssociateCurrentSessionWithUser(aUserName);
end;

procedure TLogin.SyncUserConnectionInfoInDB(const aUserName, aPassword : string);
var
  AUseThisConnection: TFDConnection;
begin
  // TODO -oUXCoreTeam -cLogin: We need to investigate why we are
  try
    // reset
    TIQCommonDataServices.ExecuteSql('BEGIN iqms.misc.reset_client_info(); END;');

    // user name
    TIQCommonDataServices.ExecuteSql(Format('BEGIN iqms.misc.set_username(''%s''); END;',
      [aUserName]));

    // eplant_id
    TIQCommonDataServices.ExecuteSql(Format('BEGIN iqms.misc.set_eplant_id(%.0f, ''%s''); END;',
      [SecurityManager(aUserName, aPassword).EPlant_ID_AsFloat, SecurityManager(aUserName, aPassword).EPlant_Name]));

  // TODO -oUXCoreTeam -cLogin: Need to deal with license manager first
    // jobshop
//    TIQCommonDataServices.ExecuteSql(Format('BEGIN misc.set_jobshop2_licensed( %d ); END; ',
//      [ IfThen(SecurityManager.IsModuleLicensed(IQAppsNames[apJobShop2]), 1, 0) ]));
  except
  end;
end;

function TLogin.GetIQMSPassword: string;
begin
  Result := SelectValueAsString('select iqms_log from iqms.iqorder2');
  if string.IsNullOrWhiteSpace(Result) then
    Exit('iqms');
  Result := CharXOR(Result);
end;

procedure TLogin.SetIQMSPassword(aPassword: string);
begin
  ExecuteCommandFmt('update iqms.iqorder2 set iqms_log = ''%s''', [CharXOR(aPassword)]);
end;

function TLogin.GetNewUser(aUserName: string): boolean;
begin
  Result := SelectValueFmtAsString('select is_new_user from s_user_general where upper(user_name) = ''%s''', [UpperCase(aUserName)]) = 'Y';
end;

procedure TLogin.SetNewUser(aUserName: string; aNewUser: boolean);
begin
  ExecuteCommandFmt('update s_user_general set is_new_user = ''%s'' where upper(user_name) = ''%s''', [IfThen(aNewUser, 'Y', 'N'), UpperCase(aUserName)]);
end;

function TLogin.GetNewUserPasswordExpired(aUserName: string): boolean;
const
  SqlQuery =
    'select count(*)                      ' + CRLF +
    'from s_user_general                  ' + CRLF +
    'where                                ' + CRLF +
    '  upper(user_name) = ''%s'' and      ' + CRLF +
    '  is_new_user = ''Y'' and            ' + CRLF +
    '  new_user_timestamp + 1 < sysdate';
begin
  Result := SelectValueFmtAsInteger(SqlQuery, [UpperCase(aUserName)]) > 0;
end;

function TLogin.GetPasswordGraceTime(aUserName: string): double;
const
  SqlQuery =
    'select                                                                       ' + CRLF +
    '  p.limit                                                                    ' + CRLF +
    'from dba_users u  inner join dba_profiles p on u.profile = p.profile         ' + CRLF +
    'where                                                                        ' + CRLF +
    '  u.username = ''%s'' and                                                    ' + CRLF +
    '  p.resource_name = ''PASSWORD_GRACE_TIME'' and resource_type = ''PASSWORD''';
var
  limit : string;
begin
  aUserName := UpperCase(aUserName);

  limit := SelectValueFmtAsString(SqlQuery, [aUserName]);

  if limit = 'UNLIMITED' then
    Result := -1    // Unlimited
  else
    if limit = 'DEFAULT' then
      if aUserName = 'IQMS' then
        Result := -1
      else
        Result := GetPasswordGraceTime('IQMS')
    else
      try
        Result := StrToFloat(limit);
      except
        Result := 0;
      end;
end;

function TLogin.GetIsPasswordAboutToExpire(aUserName: string; var aMsg : string): boolean;
var
  ExpiryDate : Variant;
  AccountStatus : string;
begin
  Result := false;

  aUserName := UpperCase(aUserName);

  ExpiryDate := SelectValueFmtAsDateTime('select expiry_date from dba_users where username = ''%s''', [aUserName]);
  if not VarIsNull(ExpiryDate) then
  begin
    AccountStatus := SelectValueFmtAsString('select account_status from dba_users where username = ''%s''', [aUserName]);

    if AccountStatus = 'EXPIRED(GRACE)' then
    begin
      Result := true;

      if GetPasswordGraceTime(aUserName) = -1 then
        aMsg := IQMS.Common.ResStrings.cTXT0000401
      else
        aMsg := Format( IQMS.Common.ResStrings.cTXT0000402, [trunc(ExpiryDate - Date())]);
    end;
  end;
end;

function TLogin.GetPreventSameLoginUserSpecific(aUserName: string): string;
const
  SqlQuery =
    'select                           ' + CRLF +
    '  sec_prevent_same_user_login    ' + CRLF +
    'from s_user_general              ' + CRLF +
    'where upper(user_name) = ''%s''';
begin
  Result := 'D';  // Default
  try
    Result := SelectValueFmtAsString(SqlQuery, [UpperCase(aUserName)]);
  except
  end;
end;

function TLogin.GetRTBoxPassword(ConnectionName: string): string;
var
  ATmp:String;
begin
  if AnsiCompareText(ConnectionName, 'IQWIN95') = 0 then
    raise Exception.Create( IQMS.WebVcl.ResourceStrings.cTXT0000426 ); // 'The IQWIN95 BDE Alias is incompatible with Service User authentication.

  //EIQ-2434 IQAlert, EServer, IQClock, allow RTBox to use Service User Pwd set via IQStatus AB 03-06-14
  Result:= 'IQMS'; //Default for users not using Service User Password in IQStatus ;
//
(*UG_rem_AMB*)
//This needs to be read in from an encrypted ini file or something. The part below
//is what we did for the IQStatus "service user authentication" feature for GE

//  ATmp:= LoadStrFromLocalMachineRegistry(
//    Format('%siqms\shared\%s', [ RegPathSoftwareCheckWow6432Node, AAlias ] ), 'ServiceUser' );
//  if ATmp = '' then
//    EXIT;
//
//  ATmp:= AESCSharpCompatibleDecrypt(ATmp);
//  if ATmp = '' then
//    EXIT;
//
//  Result:= ATmp;
end;

procedure TLogin.RecordTooManyFailedLoginAttempts(aUserName: string);
const
  SqlCmd =
    'insert into s_user_login(userid, timestamp, auto_locked_out, program, sid, serial, process)' + CRLF +
    '  select                                                                                   ' + CRLF +
    '    ''%s'' as userid,                                                                      ' + CRLF +
    '    sysdate as timestamp,                                                                  ' + CRLF +
    '    sysdate as auto_locked_out,                                                            ' + CRLF +
    '    program,                                                                               ' + CRLF +
    '    sid,                                                                                   ' + CRLF +
    '    serial# as serial,                                                                     ' + CRLF +
    '    process                                                                                ' + CRLF +
    '  from v$session                                                                           ' + CRLF +
    '  where audsid = sys_context(''userenv'',''SESSIONID'')';

begin
  ExecuteCommandFmt( SqlCmd, [UpperCase(aUserName)]);
end;


procedure TLogin.AssociateCurrentSessionWithUser(aUserName: string);
const
  SqlCmd =
    'insert into s_user_login(userid, timestamp, logged_in, program, sid, serial, process)' + CRLF +
    '  select                                                                             ' + CRLF +
    '    ''%s'' as userid,                                                                ' + CRLF +
    '    sysdate as timestamp,                                                            ' + CRLF +
    '    logon_time as logged_in,                                                         ' + CRLF +
    '    program,                                                                         ' + CRLF +
    '    sid,                                                                             ' + CRLF +
    '    serial# as serial,                                                               ' + CRLF +
    '    process                                                                          ' + CRLF +
    '  from v$session                                                                     ' + CRLF +
    '  where audsid = sys_context(''userenv'',''SESSIONID'')';

begin
  {associate iqms session with UserName in IQMS secure login table}
  ExecuteCommandFmt( SqlCmd, [UpperCase(aUserName)]);
end;

function TLogin.IsUserAlreadyLoggedIn(aUserName: string): boolean;
const
  SqlQuery =
    'with SessionInfo as                                      ' + CRLF +
    '(                                                        ' + CRLF +
    '  select                                                 ' + CRLF +
    '    sid,                                                 ' + CRLF +
    '    serial#,                                             ' + CRLF +
    '    process,                                             ' + CRLF +
    '    program                                              ' + CRLF +
    '  from v$session                                         ' + CRLF +
    '  where audsid=sys_context(''userenv'',''SESSIONID'')    ' + CRLF +
    ')                                                        ' + CRLF +
    'select count(*)                                          ' + CRLF +
    'from                                                     ' + CRLF +
    '  v$session v                                            ' + CRLF +
    '    inner join s_user_login s on                         ' + CRLF +
    '          v.sid = s.sid                                  ' + CRLF +
    '      and v.serial# = s.serial                           ' + CRLF +
    '      and v.process = s.process                          ' + CRLF +
    '      and upper(v.program) = upper(s.program)            ' + CRLF +
    '      and s.logged_out is null                           ' + CRLF +
    '    inner join SessionInfo i on                          ' + CRLF +
    '          v.sid <> i.sid                                 ' + CRLF +
    '      and v.serial# <> i.serial#                         ' + CRLF +
    '      and v.process <> i.process                         ' + CRLF +
    '      and upper(v.program) = upper(i.program)            ' + CRLF +
    'where                                                    ' + CRLF +
    '      rtrim(upper(v.username)) = ''IQMS''                ' + CRLF +
    '  and v.type   = ''USER''                                ' + CRLF +
    '  and v.status <> ''KILLED''                             ' + CRLF +
    '  and s.userid = ''%s''';
begin
  Result := SelectValueFmtAsInteger(SqlQuery, [UpperCase(aUserName)]) > 0;
end;

end.

unit IQMS.Common.OracleShared;

interface

uses
  Winsock,
  Vcl.Dialogs,
  Winapi.Windows,
  System.Classes,
  System.SysUtils,
  Winapi.Messages,
  IQMS.Common.SHFileOp,
  IQMS.Common.Dialogs,
  IQMS.Common.FileUtils,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  FireDAC.UI.Intf;

type
  TUpdateInstallationStatus = procedure(s: string; ADontLog: Boolean = false)
    of object;


procedure ReplaceLine(fileName, searchParam, newLine: String);

procedure AddLine(fileName, newLine: String); overload;
procedure AddLine(fileName, newLine: String; place: Integer); overload;
procedure AddText(fileName: String; newText: TStringList); overload;
procedure AddText(fileName: String; newText: TStringList;
  place: Integer); overload;

function GetFirstMatchingLine(fileName, searchParam: String): String;
function IQCopyFiles(source, outDir: String): Boolean;
function IQInformation( const AMessageText: string ): Word;
function AddBackSlash(folderName: String): String;
function RemoveBackSlash(folderName: String): String;

procedure ReplaceLineFirstOnly(fileName, searchParam, newLine: String);
  overload;
procedure ReplaceLineFirstOnly(fileName, searchParam, newLine: String;
  first: Boolean; AdditionalSearchParams: array of string;
  AddLineIfNotFound: Boolean = false); overload;
function GetOracleClientInstallerVersion(path: String): String;

procedure CommentLine(fileName, searchParam: String);
procedure CommentLineFirstOnly(fileName, searchParam: String);
overload procedure CommentLineFirstOnly(fileName, searchParam: String;
  first: Boolean);
overload;

function DeleteLine(fileName, searchParam: String): Integer; overload;
function DeleteLine(fileName, searchParam: String; searchAnywhere: Boolean)
  : Integer; overload;

function GetAliases: TStringList; overload;
function GetAliases(const AOraHomes: TStringList): TStringList; overload;
function ListenerSidFound(sid, oracleHome: String): Boolean;
procedure ListenerAddSid(sid, oracleHome: String);

procedure DeleteBlankLine(fileName: String; lineNumber: Integer);

function IsLocalDrive(drive: String): Boolean;
function FindOracleHomes: TStringList;
function FindOracleHome: String;
procedure RemoveStrFromPath(path: String);
procedure StrToFrontOfPath(path: String);
function Split(aString, aSeparator: String): TStringList;
function Combine(aList: TStringList; aSeparator: String): String;
procedure ReloadEnvironment;

procedure Bomb(s: String); overload;
procedure Bomb(s: String; Append: Integer); overload;
procedure Bomb(s: string; Append: Boolean); overload;

function WinExecAndWait32(fileName: String; Visibility: Integer): Integer;
procedure GetAllExtraExes(MasterHome: String; var AFiles: TStringList);
procedure GetAllUserModules(MasterHome: String; var AModulesList: TStringList);
// function FindFiles(const filespec: TFileName; attributes: integer = faReadOnly Or faHidden Or faSysFile Or faArchive): TStringList;
function FindDirs(dirName: String): TStringList;
function GetHostName: string;
function GetEnvironmentVariable(param: String): String;
procedure FlattenEnvironmentVariable(varName: String);
procedure RemoveAliasFromTnsNamesFile(TnsNamesFileName: String; TnsName: String);
procedure AddAlias(aliasName, aliasHost, serviceName: String; aliasPort: Integer);
function GetLocalIPAddress: string;
function UnixSlashes(const Original: String): String;
procedure CopyOraNetFiles(iqmsOraHome, ohsOraHome: String);
function queryParam(v_query, v_sysPassword, v_alias: String): String;
function checkDBLogin(v_user, v_password, v_alias: String): Boolean;
function runSQLAndVerify(v_sql, v_user, v_password, v_alias, v_validateString
  : String): Boolean;
function runSQL(v_sql, v_user, v_password, v_alias: String)
  : TStringList; overload;
function runSQL(v_sql, v_user, v_password, v_alias: String;
  feedback_on: Boolean): TStringList; overload;
procedure runSQLScript(v_sqlScript, v_user, v_password, v_alias: String);
// function statspackSetup( sys_pwd, oraHome, oradataDir, oraAlias : String ): Boolean;
function runSQLScriptwithParams(v_sqlScript, v_user, v_password, v_alias,
  v_params: String): TStringList;
function InstallText(sys_pwd, oraAlias: String): Boolean;
function GetMajorMinorVersion(AFullVersionStr: String): String;
procedure CheckEnsureFirstInSysPath(APath: String);
function IsNTSAuthenticationSpecified: Boolean;
procedure FixOraclePermissions( AIsClientInstall : boolean; AOraHome, AProgramFilesDir, ALogDir: String);
function PathCombine(a, b: String): String;
procedure InstallOdpNetClient(AOdpClientDirectory, ATargetDrive: string;
  AIsServerInstall: Boolean; AStatusCallback: TUpdateInstallationStatus);
procedure CheckCreateDirectory(ADir: string);
function IsEnterpriseEdition: Boolean;
procedure CommentSSLConfinHttpd(AFileName, ASearchText : string; APort : integer);
function WrapinQuotes( AString : string ) : string;
function EnsureReposConnectionsInTNSNames( var AMissingReposAlias : string ) : boolean;
/// <summary> Similar to save icon in IQStatus - adds/updates a connection
/// </summary>
procedure AppendTNSNametoOraFile( const ACnxnName, AServiceName, AHostName : string; const APort : integer );
procedure SyncTNSNames( const AtnsNamesOraFile : string );
procedure InstallerLog(  const ALogFileName, ALine : String  );


function OracleInstallerVersionFull:String;
function OracleInstallerVersionMajorMinor:String;
function OracleInstallerVersionClientResponseFileName:String;

const
  C_SOFTWARE_ORACLE_REGKEY = '\Software\Oracle';
  C_SOFTWARE_WOW6432Node_ORACLE_REGKEY = '\Software\Wow6432Node\Oracle';


implementation

uses
  //IQMS.Common.Strings,
  IQMS.Common.Miscellaneous,
  Vcl.Forms,
  //IQRegistry,
  IQMS.Common.Registry,
  IQMS.Common.Numbers,
  System.Math,
  System.IOUtils,
  //IQMS.Common.IQMS.Common.Console,
  IQMS.Common.DataLib,
  IQMS.Common.DataConst;


const
  C_Oracle_Current_Version = '12.1.0.2';
  C_Oracle_Current_version_client_response_filename = 'iq121020.rsp';
  C_ORA_Current_VERSION_SHORT  = '12.1';

procedure ReplaceLine(fileName, searchParam, newLine: String);
begin
  ReplaceLineFirstOnly(fileName, searchParam, newLine, false, [], false);
end;

procedure ReplaceLineFirstOnly(fileName, searchParam, newLine: String);
begin
  ReplaceLineFirstOnly(fileName, searchParam, newLine, True, [], false);
end;

procedure ReplaceLineFirstOnly(fileName, searchParam, newLine: String;
  first: Boolean; AdditionalSearchParams: array of string;
  AddLineIfNotFound: Boolean = false);
var
  aList: TStringList;
  p, i, ALength: Integer;
  s: String;
  AFound, AFindAdditionalParams: Boolean;
begin
  aList := TStringList.Create; // badtstring -- fixed
  try
    aList.LoadFromFile(fileName);
    ALength := Length(searchParam);
    AFound := false;
    AFindAdditionalParams := Length(AdditionalSearchParams) > 0;

    for i := 0 to aList.Count - 1 do
    begin
      s := UpperCase(Trim(aList.Strings[i]));

      if AFindAdditionalParams then
      begin

        if UpperCase(searchParam) <> Copy(s, 1, ALength) then
          continue;

        for p := Low(AdditionalSearchParams) to High(AdditionalSearchParams) do
        begin
          //AFound := IQString.Occurances(UpperCase(AdditionalSearchParams[p]), s) > 0;
          if not AFound then
            break; // for p := Low(AdditionalSearchParams) to High(AdditionalSearchParams) do
        end;

        if AFound then
        begin
          aList.Strings[i] := newLine;
          if first then
            break;
        end;
      end

      else
      begin
        if (UpperCase(searchParam) <> Copy(s, 1, ALength)) then
          continue;

        aList.Strings[i] := newLine;
        AFound := True;
        if first then
          break;
      end;

    end;

    if AddLineIfNotFound and not AFound then
      aList.Add(newLine);

    if AFound or (AddLineIfNotFound and not AFound) then
      aList.SaveToFile(fileName);
  finally
    aList.Free;
  end;
end;

procedure CommentLine(fileName, searchParam: String);
begin
  CommentLineFirstOnly(fileName, searchParam, false);
end;

procedure CommentLineFirstOnly(fileName, searchParam: String);
begin
  CommentLineFirstOnly(fileName, searchParam, True);
end;

procedure CommentLineFirstOnly(fileName, searchParam: String; first: Boolean);
var
  aList: TStringList;
  i, ALength: Integer;
  s: String;
begin
  aList := TStringList.Create;
  try // badtstring --fixed
    aList.LoadFromFile(fileName);
    ALength := Length(searchParam);

    for i := 0 to aList.Count - 1 do
    begin
      s := UpperCase(Trim(aList.Strings[i]));
      if (UpperCase(searchParam) = Copy(s, 1, ALength)) then
      begin
        aList.Strings[i] := '# ' + aList.Strings[i];
        if first then
          break;
      end;
    end;

    aList.SaveToFile(fileName);
  finally
    aList.Free;
  end;
end;

procedure CommentSSLConfinHttpd(AFileName, ASearchText : string; APort : integer);
const
  C_ConfigSSLLine =
  'include "${ORACLE_INSTANCE}/config/${COMPONENT_TYPE}/${COMPONENT_NAME}/ssl.conf"';
var
  aList: TStringList;
  i, ALength: Integer;
  s: string;
  ACommentedString: string;

  (*SYST-166 Apache Configurator - not defaulting to Standard HTTP protocol setting

    To fix issue caused by the IT script “apache_auto_config.bat”. Which deletes all commented lines
    in the httpd.conf file, including the text in above constant, C_ConfigSSLLine.
    Per SYST-166 we're to make it work whether that line is missing or not. The only way to
    do that is to add this line back in if it doesn't exist already... AB 11-03-14 *)

  procedure _EnsureSSLLineExists;
  var
    aList: TStringList;
    i : integer;
    AFound : Boolean;
  begin
    AFound:= False;
    aList:= TStringList.Create;

    try
      aList.LoadFromFile(AFileName);
      for i:= 0 to aList.Count -1 do
      begin
        //AFound:= ( Occurances( C_ConfigSSLLine, aList.Strings[i]) > 0 );
        if AFound then
          break;
      end;

      if not AFound then
      begin
        //Rewrite the missing line. Port 80 comments the line, port 443 leaves it active
        //aList.Append(Format('%s %s ', [ IQNumber.SIIF( APort = 80, '#', '' ), C_ConfigSSLLine ]));
        //Resave it
        aList.SaveToFile(AFileName);
      end;

    finally
      aList.Free;
    end;
  end;

begin

  _EnsureSSLLineExists;

  aList := TStringList.Create;
  try
    aList.LoadFromFile(AFileName);

    for i := 0 to aList.Count - 1 do
    begin
      s := UpperCase(Trim(aList.Strings[i]));
//      if (Occurances(ASearchText, s) > 0) and (APort = 80) and (Occurances('#', s) < 1) then
//      begin
//        aList.Strings[i] := '#' + aList.Strings[i];  // if Http mode and not commented, comment it
//      end;
//      if (Occurances(ASearchText,s) > 0) and (APort = 443) and (Occurances( '#', s) > 0) then
//      begin
//        aList.Strings[i] := StrTran(aList.Strings[i], '#', '');  // if SSL mode and  commented, uncomment
//      end;
    end;
    aList.SaveToFile(AFileName);
  finally
    aList.Free
  end;
end;

procedure AddLine(fileName, newLine: String);
begin
  AddLine(fileName, newLine, -1);
end;

procedure AddLine(fileName, newLine: String; place: Integer);
var
  aList: TStringList;
begin
  aList := TStringList.Create; // badtstring   -- fixed
  try
    aList.Add(newLine);
    AddText(fileName, aList, place);
  finally
    aList.Free;
  end;
end;

procedure AddText(fileName: String; newText: TStringList);
begin
  AddText(fileName, newText, -1);
end;

procedure AddText(fileName: String; newText: TStringList; place: Integer);
var
  aList: TStringList;
begin
//  AList.Create;  // badtstring --fixed
//  with AList do
//    try
//      LoadFromFile(fileName);
//
//      if (place >= 0) and (place < aList.Count - 1) then
//        Insert(place, newText.Text)
//      else
//        Add(newText.Text);
//
//      SaveToFile(fileName);
//    finally
//      aList.Free;
   try
      aList := TStringList.Create;
      aList.LoadFromFile( fileName );

      if ( place >= 0 ) and ( place < aList.Count - 1 ) then
         aList.Insert( place, newText.Text )
      else
         aList.Add( newText.Text );

      AList.SaveToFile( fileName );
   finally
      if Assigned( AList ) then
         FreeAndNil( AList );
    end;
end;

function GetFirstMatchingLine(fileName, searchParam: String): String;
var
  aList: TStringList;
  i, ALength: Integer;
  s: String;
begin
  aList := TStringList.Create; // badtstring  --fixed
  try
    aList.LoadFromFile(fileName);
    ALength := Length(searchParam);

    for i := 0 to aList.Count - 1 do
    begin
      s := Trim(aList.Strings[i]);
      if UpperCase(searchParam) = UpperCase(Copy(s, 1, ALength)) then
      begin
        Result := s;
        break;
      end;
    end;
  finally
    aList.Free;
  end;
end;

function DeleteLine(fileName, searchParam: String): Integer;
begin
  Result := DeleteLine(fileName, searchParam, false);
end;

function DeleteLine(fileName, searchParam: String;
  searchAnywhere: Boolean): Integer;
var
  aList: TStringList;
  i, ALength: Integer;
  s: String;
  found: Boolean;
begin
  Result := -1;
  aList := TStringList.Create; // badtstring -- fixed
  try
    aList.LoadFromFile(fileName);
    ALength := Length(searchParam);
    found := false;

    for i := 0 to aList.Count - 1 do
    begin
      s := UpperCase(Trim(aList.Strings[i]));
      if UpperCase(searchParam) = Copy(s, 1, ALength) then
        // check for a match at the
        found := True; // beginning of each line

      if searchAnywhere and (Pos(searchParam, s) <> 0) then
        // if searching the whole line for the string
        found := True; // check for any other matches

      if found then
      begin // if we find a match, delete the line and exit
        aList.Delete(i);
        Result := i;
        break;
      end;
    end;

    aList.SaveToFile(fileName);
  finally
    aList.Free;
  end;
end;

procedure DeleteBlankLine(fileName: String; lineNumber: Integer);
var
  aList: TStringList;
begin
   if lineNumber <> -1 then
      try
         aList:=TStringList.Create;
         aList.LoadFromFile( fileName );

         if Trim( aList.Strings[lineNumber] ) = '' then
         begin
            aList.Delete( lineNumber );
            aList.SaveToFile( fileName );
         end;
      finally
         if Assigned( aList ) then
            FreeAndNil( aList );
  end;
end;



function IQInformation( const AMessageText: string ): Word;
var
  temp: Integer;
begin
 Result := 0;
 temp := MessageDlg(AMessageText, mtInformation, [ mbOK ], 0 );
end;

function IQCopyFiles(source, outDir: String): Boolean;
//var
//  fileop: TShellFileOp;
begin
  Result := false;
//  fileop := TShellFileOp.Create(nil);
//  fileop.NoConfirmation := True;
//  fileop.Animate := True;

  if FileExists(source) then
//    fileop.addtarget(source)
  else if DirectoryExists(source) then
//    fileop.addtarget(AddBackSlash(source) + '*.*')
  else
  begin
    IQInformation('The file/folder "' + source + '" is invalid.  Copy failed.');
    exit;
  end;

  if not DirectoryExists(outDir) then
  begin
    IQInformation(outDir + 'not found.  Copy failed.');
    exit;
  end;

//  fileop.CopyFiles(outDir);
//  fileop.Free;
  Result := True;
end;

function AddBackSlash(folderName: String): String;
begin
  Result := folderName;
  if not(Copy(Result, Length(Result), 1) = '\') then
    Result := Result + '\'
end;

function RemoveBackSlash(folderName: String): String;
begin
  if not(Copy(folderName, Length(folderName), 1) = '\') then
    Result := folderName
  else
    Result := Copy(folderName, 1, Length(folderName) - 1);
end;

function IsLocalDrive(drive: String): Boolean;
var
  s: String;
begin
  s := Copy(drive, 1, 3);
  if (GetDriveType(PChar(s)) = DRIVE_FIXED) and DirectoryExists(s) then
    Result := True
  else
    Result := false;
end;

function SoftwareOracleRegKey: string;
begin
  Result := C_SOFTWARE_ORACLE_REGKEY;
end;

function SoftwareOracleWoW6432RegKey: string;
begin
  Result := C_SOFTWARE_WOW6432Node_ORACLE_REGKEY;
end;

function FindOracleHome: String;
var
  OracleHome: String;
begin
  Result := '';

  for OracleHome in FindOracleHomes do
  begin
    if FileExists(OracleHome) then
      Result := OracleHome;
      break;
  end;
end;

function FindOracleHomes: TStringList;
const
  c_OraHome = 'ORACLE_HOME';

  {---------------------------------------------------------------}
  function GetOracleHomeKeyValue( ARootKey : HKEY; const Key : String) : TStringList;
  var
    //OracleKey: TIQRegistry;
    SubKeyNames: TStringList;
    SubKeyName: string;
    OpenKeyResult: Boolean;
    KeyValueExists: Boolean;
  begin
    Result := TStringList.Create;
    //OracleKey := TIQRegistry.Create;

    try
      //OracleKey.RootKey := ARootKey;

      //OpenKeyResult := OracleKey.OpenKeyReadOnly( Key );

      if OpenKeyResult then
      begin
        // start by defining it according to the one at the root of the Oracle key
        //KeyValueExists := OracleKey.ValueExists( c_OraHome );

        if KeyValueExists then
          //Result.Add(OracleKey.ReadString( c_OraHome ));

        SubKeyNames := TStringList.Create;

      try
          //OracleKey.GetKeyNames( SubKeyNames );

          // if there are sub-keys under Oracle key, then search for ORACLE_HOME there
          for SubKeyName in SubKeyNames do
        begin


            //OpenKeyResult := OracleKey.OpenKeyReadOnly( Key + '\' + SubKeyName );

            if OpenKeyResult then
          begin
              //KeyValueExists := OracleKey.ValueExists( c_OraHome );

              // take the first one located under the Oracle sub-keys
              if KeyValueExists then
                //Result.Add(OracleKey.ReadString( c_OraHome ));
          end;
        end;
      finally
          SubKeyNames.Free;
        end;
      end;
    finally
      //OracleKey.Free;
    end;
  end;

  {---------------------------------------------------------------}

begin
  Result:= GetOracleHomeKeyValue( HKEY_LOCAL_MACHINE, '\Software\Oracle' );
  //IQInformation('1. GetOracleHomeKeyValue ( "\Software\Oracle" ): ' + Result);

  if ( Result.Count = 0 ) then
  begin
    Result:= GetOracleHomeKeyValue( KEY_WOW64_64KEY, '\Software\Wow6432Node\Oracle' );
    IQInformation('Found ' + IntToStr(Result.Count) + ' Oracle Home paths.');
  end;
end;

function IsNTSAuthenticationSpecified: Boolean;
var
  ASqlnetFileName: string;
  OracleHomes: TStringList;
  OracleHome: String;
  i: Integer;
  ASqlnetContents: TStringList;
begin
  Result := false;
  ASqlnetFileName := '';
  OracleHomes := FindOracleHomes();

  for OracleHome in OracleHomes do
  begin
    ASqlnetFileName := OracleHome + '\network\admin\sqlnet.ora';

    if FileExists(ASqlnetFileName) then
    begin

  ASqlnetContents := TStringList.Create;
  with ASqlnetContents do
    try
      LoadFromFile(ASqlnetFileName);
      for i := 0 to ASqlnetContents.Count - 1 do
//        if leftStr(lowerCase(TrimLeft(ASqlnetContents[i])),
//          Length('sqlnet.authentication_services'))
//          = 'sqlnet.authentication_services' then
//          if Occurances('nts', lowerCase(ASqlnetContents[i])) > 0 then
          begin
            Result := True;
            break;
          end;
    finally
      if Assigned(ASqlnetContents) then
        FreeAndNil(ASqlnetContents);
    end;
end;
    end;
end;

function GetPathEnvironmentVariable(var APath: String): Boolean;
begin
  APath := LoadStrFromLocalMachineRegistry
    ('\System\CurrentControlSet\Control\Session Manager\Environment', 'PATH');
  Result := TrimLeft(APath) <> '';
end;

procedure SetPathEnvironmentVariable(ANewPath: String);
begin
  SaveStrToLocalMachineRegistry
    ('\System\CurrentControlSet\Control\Session Manager\Environment', 'PATH',
    ANewPath);
end;

procedure CheckEnsureFirstInSysPath(APath: String);
var
  ANewPathEnvVar, APathEnvVar: String;
  APaths: TStringList;
  i, AIndexOfDbPath: Integer;
begin
  if (APath = '') or not DirectoryExists(APath) then
    exit;

  if not GetPathEnvironmentVariable(APathEnvVar) then
    exit;

  APaths := TStringList.Create; // badtstring -- fixed
  try
    APaths.CaseSensitive := false;
    APaths.Delimiter := ';';
    //IQString.Tokenize(APathEnvVar, [APaths.Delimiter], APaths);

    AIndexOfDbPath := APaths.IndexOf(APath);
    if AIndexOfDbPath > 0 then
    begin
      APaths.Move(AIndexOfDbPath, 0);
      //ANewPathEnvVar := StringListToStr(APaths);

      // extra safe, ensure we have same length string and it is not zero
      if (Length(ANewPathEnvVar) = Length(APathEnvVar)) and
        (Length(APathEnvVar) <> 0) then
      begin
        SetPathEnvironmentVariable(ANewPathEnvVar);
        ReloadEnvironment;
      end;
    end;
  finally
    APaths.Free;
  end;
end;

procedure RemoveStrFromPath(path: String);
var
  s: String;
  aList: TStringList;
  i: Integer;
begin
  s := LoadStrFromLocalMachineRegistry
    ('\System\CurrentControlSet\Control\Session Manager\Environment', 'PATH');
  aList := Split(s, ';');
  for i := 0 to aList.Count - 1 do // remove the matching entry
    if UpperCase(aList[i]) = UpperCase(path) then
    begin
      aList.Delete(i);
      break;
    end;

  s := '';
  for i := 0 to aList.Count - 1 do
    // combine the entries back into a single string
    if s = '' then
      s := aList[i]
    else
      s := s + ';' + aList[i];

  SaveStrToLocalMachineRegistry
    ('\System\CurrentControlSet\Control\Session Manager\Environment',
    'PATH', s);
  ReloadEnvironment;
end;

procedure StrToFrontOfPath(path: String);
var
  s: String;
begin
  s := LoadStrFromLocalMachineRegistry
    ('\System\CurrentControlSet\Control\Session Manager\Environment', 'PATH');
  if s = '' then // first verify that we can read %PATH%
    exit;

  RemoveStrFromPath(path); // remove the path in question from %PATH%
  s := LoadStrFromLocalMachineRegistry
    ('\System\CurrentControlSet\Control\Session Manager\Environment', 'PATH');
  if s = '' then // again verify we can read %PATH%
    exit;

  SaveStrToLocalMachineRegistry
    ('\System\CurrentControlSet\Control\Session Manager\Environment', 'PATH',
    path + ';' + s);
  FlattenEnvironmentVariable('PATH');
  ReloadEnvironment; // save %PATH% and reload it
end;

procedure FlattenEnvironmentVariable(varName: String);
var
  Acontents: TStringList;
  i: Integer;
  s: String;
  inEnv: PChar;
  outEnv: array [0 .. 255] of Char;
begin
  s := LoadStrFromLocalMachineRegistry
    ('\System\CurrentControlSet\Control\Session Manager\Environment', varName);
  if s = '' then // first verify that we can read %PATH%
    exit;

  Acontents := TStringList.Create; // badtstring   -- fixed
  try
    Acontents := Split(s, ';');
    if Acontents.Count = 0 then
      exit;

    for i := 0 to Acontents.Count - 1 do
    begin
      s := Acontents[i];
      inEnv := PChar(s);
      ExpandEnvironmentStrings(inEnv, outEnv, 256);
      s := StrPas(outEnv);
      Acontents[i] := s;
    end;

    s := Combine(Acontents, ';');

    SaveStrToLocalMachineRegistry
      ('\System\CurrentControlSet\Control\Session Manager\Environment',
      varName, s);
  finally
    Acontents.Free;
  end;
end;

procedure AddStrToPath(aString: String);
var
  s: String;
begin
  s := LoadStrFromLocalMachineRegistry
    ('\System\CurrentControlSet\Control\Session Manager\Environment', 'PATH');
  SaveStrToLocalMachineRegistry
    ('\System\CurrentControlSet\Control\Session Manager\Environment', 'PATH',
    aString + ';' + s);
  ReloadEnvironment;
end;

function Split(aString, aSeparator: String): TStringList;
var
  i: Integer;
  AFront, ABack: String;
begin
  Result := TStringList.Create;
  repeat
    AFront := Copy(aString, 1, Length(aSeparator));
    ABack := Copy(aString, Length(aString) - Length(aSeparator) + 1,
      Length(aSeparator));

    if aSeparator = AFront then
      aString := Copy(aString, Length(aSeparator) + 1,
        Length(aString) - Length(aSeparator))
    else if aSeparator = ABack then
      aString := Copy(aString, 1, Length(aString) - Length(aSeparator))
    else
    begin
      i := Pos(aSeparator, aString);
      if i <> 0 then
      begin
        AFront := Copy(aString, 1, i - 1);
        Result.Add(AFront);
        aString := Copy(aString, i + Length(aSeparator),
          Length(aString) - Length(aSeparator) - i + 1);
      end
      else
      begin
        if Length(aString) <> 0 then
          Result.Add(aString);
        break;
      end;
    end;
  until false;
end;

function Combine(aList: TStringList; aSeparator: String): String;
var
  i: Integer;
begin
  Result := '';
  if aList.Count = 0 then
    exit;

  for i := 0 to aList.Count - 1 do
    if Result = '' then
      Result := aList[i]
    else
      Result := Result + aSeparator + aList[i];
end;

procedure ReloadEnvironment;
var
  lParam, wParam: Integer; { Integers that indicate pointers to parameters }
  Buf: Array [0 .. 10] of Char;
  { Buffer used to indicate what setting we have changed. }
  aResult: Cardinal; { Error Number returned from API Call }
begin
  { Now comes the interesting part. }
  { Environment is the section of global settings we want the system to update }
  Buf := 'Environment';
  wParam := 0;
  { ,This gives us a pointer to the Buffer for Windows to read. }
  lParam := Integer(@Buf[0]);
  { Here we make a call to SendMessageTimeout to Broadcast a message to the
    entire system telling every application (including explorer) to update
    its settings }
  // SendMessageTimeout(HWND_BROADCAST, WM_SETTINGCHANGE, 0, LParam(PChar('Environment')), SMTO_ABORTIFHUNG, 5000, rv);

  SendMessageTimeout(HWND_BROADCAST, WM_SETTINGCHANGE, wParam, lParam, SMTO_NORMAL, 4000, aResult);
  { Display windows lasterror if the result is an error. }
  if aResult <> 0 then
    SysErrorMessage(aResult);
end;

procedure Bomb(s: String);
begin
  Bomb(s, false);
end;

procedure Bomb(s: String; Append: Integer);
begin
  if Append = 1 then
    Bomb(s, True)
  else
    Bomb(s, false);
end;

procedure Bomb(s: string; Append: Boolean);
var
  AppendText: String;
begin
  AppendText :=
    '.  Write down or capture this error, and contact IQMS technical support for assistance.';
  if Append then
    s := s + AppendText;

  IQError(s);
  halt;
end;

function GetMajorMinorVersion(AFullVersionStr: String): String;
var
  aList: TStringList;
begin
  Result := '';
  aList := TStringList.Create; // badtstring --fixed
  try
    //Tokenize(AFullVersionStr, ['.'], aList);
    if not aList.Count >= 2 then
      exit;

    Result := Format('%s.%s', [aList[0], aList[1]]);
  finally
    aList.Free;
  end;
end;

function WinExecAndWait32(fileName: String; Visibility: Integer): Integer;
var
  zAppName: array [0 .. 512] of Char;
  zCurDir: array [0 .. 255] of Char;
  WorkDir: String;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  Resultado: DWord;
begin
  StrPCopy(zAppName, fileName);
  GetDir(0, WorkDir);
  StrPCopy(zCurDir, WorkDir);
  FillChar(StartupInfo, Sizeof(StartupInfo), #0);
  StartupInfo.cb := Sizeof(StartupInfo);

  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := Visibility;
  if not CreateProcess(nil, zAppName, { pointer to command line string }
    nil, { pointer to process security attributes }
    nil, { pointer to thread security attributes }
    false, { handle inheritance flag }
    CREATE_NEW_CONSOLE or { creation flags }
    NORMAL_PRIORITY_CLASS, nil, { pointer to new environment block }
    nil, { pointer to current directory name }
    StartupInfo, { pointer to STARTUPINFO }
    ProcessInfo) then
    Result := -1 { pointer to PROCESS_INF }

  else
  begin
    repeat
      sleep(250);
      GetExitCodeProcess(ProcessInfo.hProcess, Resultado);
      Result := Resultado;
    until (Result <> STILL_ACTIVE);
  end;
end;

procedure GetAllExtraExes(MasterHome: String; var AFiles: TStringList);
var
  i: Integer;

  function StringInArray(const AValue: string; Strings: array of string): Boolean;
  var
    i : integer;
  begin
    Result := False;
    for i := Low(Strings) to High(Strings) do
    begin
      Result := AnsiCompareText(Strings[i], AValue) = 0;
      if Result then Exit;
    end;
  end;

begin
  FindFiles(AddBackSlash(MasterHome), '*.exe', AFiles);

  for i := AFiles.Count - 1 downto 0 do
  begin
//    AFiles[i] := (FileNameNoExt(AFiles[i])); //Unable to manipulate a sorted list

    if StringInArray( AFiles[i], [ 'IQWIN32.exe',
                                   'IQSTATUS.exe',
                                   'TREGSVR.exe',
                                   'IQINST.exe',
                                   'LABELSERVER.exe',
                                   'IQACTIVE.exe',
                                   'HHUPD.exe' ] ) then AFiles.Delete(i);


//    if (AFiles[i] = 'IQWIN32') or (AFiles[i] = 'IQSTATUS') or
//      (AFiles[i] = 'TREGSVR') or (AFiles[i] = 'IQINST') or
//      (AFiles[i] = 'LABELSERVER') or (AFiles[i] = 'IQACTIVE') or
//      (AFiles[i] = 'HHUPD') then
//      AFiles.Delete(i);
  end;
end;

procedure GetAllUserModules(MasterHome: String; var AModulesList: TStringList);
var
  i: Integer;
begin
  GetAllExtraExes(MasterHome, AModulesList);
  for i := AModulesList.Count - 1 downto 0 do
    if (AModulesList[i] = 'ESERVER') or (AModulesList[i] = 'LABEL_ID') or
      (AModulesList[i] = 'RT_WD') or (AModulesList[i] = 'UPSLINK') or
      (AModulesList[i] = 'LABELSERVER') or (AModulesList[i] = 'EDIMONITOR') or
      (AModulesList[i] = 'DD') or (AModulesList[i] = 'IQPALLETWRAP') or
      (AModulesList[i] = 'IQPRA') or (AModulesList[i] = 'IQMATRIX') or
      (AModulesList[i] = 'IQPURGE') or (AModulesList[i] = 'SCAN_ID') or
      (AModulesList[i] = 'IQVOICE') or (AModulesList[i] = 'SCANLINE') or
      (AModulesList[i] = 'RTLABEL') or (AModulesList[i] = 'IQGATE') or
      (AModulesList[i] = 'SHOPDATA') or (AModulesList[i] = 'IQRF') or
      (AModulesList[i] = 'IQFAX') or (AModulesList[i] = 'IQALERT') or
      (AModulesList[i] = 'FABDATA') or (AModulesList[i] = 'IQ_CLOCK') or
      (AModulesList[i] = 'DISPOSVR') or (AModulesList[i] = 'RTSERVER') then
      AModulesList.Delete(i);
end;

{
  function FindFiles(const filespec: TFileName; attributes: integer): TStringList;
  var
  spec: string;
  list: TStringList;

  procedure RFindFile(const folder: TFileName);
  var
  SearchRec: TSearchRec;
  begin
  // Locate all matching files in the current
  // folder and add their names to the list
  if FindFirst(folder + spec, attributes, SearchRec) = 0 then begin
  try
  repeat
  if (SearchRec.Attr and faDirectory = 0) or
  (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then
  list.Add(folder + SearchRec.Name);
  until FindNext(SearchRec) <> 0;
  except
  FindClose(SearchRec);
  raise;
  end;
  FindClose(SearchRec);
  end;
  // Now search the subfolders
  if FindFirst(folder + '*', attributes
  Or faDirectory, SearchRec) = 0 then
  begin
  try
  repeat
  if ((SearchRec.Attr and faDirectory) <> 0) and
  (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then
  RFindFile(folder + SearchRec.Name + '\');
  until FindNext(SearchRec) <> 0;
  except
  FindClose(SearchRec);
  raise;
  end;
  FindClose(SearchRec);
  end;
  end; // procedure RFindFile inside of FindFile

  begin // function FindFile
  list := TStringList.Create;
  try
  spec := ExtractFileName(filespec);
  RFindFile(ExtractFilePath(filespec));
  Result := list;
  except
  list.Free;
  raise;
  end;
  end;
}

function FindDirs(dirName: String): TStringList;
var
  SearchRec: TSearchRec;
begin
  Result := TStringList.Create;
  Result.Clear;

  // Locate all matching directories
  if FindFirst(dirName, faDirectory, SearchRec) = 0 then
  begin
    try
      repeat
        if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then
          Result.Add(AddBackSlash(ExtractFilePath(dirName)) + SearchRec.Name);
      until FindNext(SearchRec) <> 0;
    except
      FindClose(SearchRec);
      raise;
    end;
    FindClose(SearchRec);
  end;
end;

function GetHostName: string;
var
  buffer: array [0 .. 255] of Char;
  size: DWord;
begin
  size := 256;
  if GetComputerName(buffer, size) then
    Result := buffer
  else
    Result := ''
end;

function GetEnvironmentVariable(param: String): String;
var
  inEnv: PChar;
  outEnv: array [0 .. 255] of Char;
  partial: Boolean;
begin
  if (Copy(param, 1, 1) = '%') or (Pos('%', param) > 0) then
    partial := false
  else
    partial := True;

  if partial then
    inEnv := PChar('%' + UpperCase(param) + '%')
  else
    inEnv := PChar(param);
  ExpandEnvironmentStrings(inEnv, outEnv, 256);
  Result := StrPas(outEnv);
  if Result = inEnv then
    if partial then
      Result := param;
end;

function OracleInstallerVersionFull:String;
begin
  Result:= C_Oracle_Current_Version;
end;

function OracleInstallerVersionMajorMinor:String;
begin
  Result:= C_ORA_Current_VERSION_SHORT;
end;

function OracleInstallerVersionClientResponseFileName:String;
begin
  Result:= C_Oracle_Current_version_client_response_filename;
end;

function GetOracleClientInstallerVersion(path: String): String;
begin
  // if FileExists( AddBackSlash( path ) + '32_client\response\iq10GR2.rsp' )
  // and FileExists( AddBackSlash( path ) + '32_client\Vista_patch\oui\Disk1\install\setup.exe' )
  // and FileExists( AddBackSlash( path ) + '32_10.2.0.3.0\response\iqpatch.rsp' ) then
  // Result := '10.2.0.3.0'
  if FileExists(AddBackSlash(path) + 'response\'+  OracleInstallerVersionClientResponseFileName) then
    Result := C_Oracle_Current_Version
  else if FileExists(AddBackSlash(path) + 'response\iq121010.rsp') then
    Result := '12.1.0.1'
  else if FileExists(AddBackSlash(path) + 'response\iq112030.rsp') then
    Result := '11.2.0.3.0'
  else if FileExists(AddBackSlash(path) + 'response\iq112010.rsp') then
    Result := '11.2.0.1.0'
  else if FileExists(AddBackSlash(path) + 'response\iq111070.rsp') then
    Result := '11.1.0.7.0'
  else if FileExists(AddBackSlash(path) + 'response\iq10203.rsp') then
    Result := '10.2.0.3.0'
  else if FileExists(AddBackSlash(path) + 'response\iq10GR2.rsp') then
    Result := '10.2.0.1.0'
  else if FileExists(AddBackSlash(path) + 'iqstage\iqstandard.rsp') then
    Result := '9i'
  else
    Result := '';
end;

function GetAliases: TStringList;
begin
  Result := TStringList.Create;
  Result.Text := GetAliases(FindOracleHomes).Text;
end;

function GetAliases(const aOraHomes: TStringList): TStringList;
var
  i: Integer;
  OracleHome: String;
  aList: TStringList;
  s, first: String;
begin
  for OracleHome in FindOracleHomes do
  begin
    if not FileExists(AddBackSlash(OracleHome) + 'network\admin\tnsnames.ora') then
    EXIT(nil);

    Result := TStringList.Create;
    AList := TStringList.Create;
    try
        AList.LoadFromFile(AddBackSlash(OracleHome) + 'network\admin\tnsnames.ora');
      for i := 0 to aList.Count - 1 do
      begin
        s := Trim(aList.Strings[i]);
        first := Copy(s, 1, 1);
        if not((first = '#') or (first = '') or (first = ')') or
          (first = '(')) then
          if not(('INST1_HTTP' = UpperCase(Copy(s, 1, 10))) or
            ('EXTPROC_CONNECTION_DATA' = UpperCase(Copy(s, 1, 23)))) then
            Result.Add(Trim(Copy(s, 1, Length(s) - 1)));
      end;
    finally
      Alist.Free;   //was Alist.free
    end;

      break;
end;
end;

function ListenerSidFound(sid, oracleHome: String): Boolean;
var
  i: Integer;
  listenerOra: TStringList;
  listenerOraFile: String;
  s: String;
begin
  Result := false;

  listenerOra := TStringList.Create; // badtstring  -- fixed
  try
    listenerOraFile := AddBackSlash(oracleHome) + 'network\admin\listener.ora';

    if not FileExists(listenerOraFile) then
      exit;

    listenerOra.LoadFromFile(listenerOraFile);
    for i := 0 to listenerOra.Count - 1 do
    begin
      s := Trim(listenerOra.Strings[i]);
      if Pos('SID_NAME', s) > 0 then
        if UpperCase(Copy(s, 13, Length(s) - 13)) = UpperCase(sid) then
          Result := True;
    end;
  finally
    listenerOra.Free;
  end;
end;

procedure ListenerAddSid(sid, oracleHome: String);
var
  i: Integer;
  listenerOra: TStringList;
  listenerOraFile: String;
begin

  if ListenerSidFound(sid, oracleHome) then
    exit;

  listenerOraFile := AddBackSlash(oracleHome) + 'network\admin\listener.ora';

  listenerOra := TStringList.Create; // badtstring   -- fixed
  try
    listenerOra.LoadFromFile(listenerOraFile);
    for i := 0 to listenerOra.Count - 1 do
      if Pos('SID_LIST ', listenerOra.Strings[i]) > 0 then
      begin
        listenerOra.Insert(i + 1, '    (SID_DESC =');
        listenerOra.Insert(i + 2, '      (GLOBAL_DBNAME = ' + sid + ')');
        listenerOra.Insert(i + 3, '      (ORACLE_HOME = ' + oracleHome + ')');
        listenerOra.Insert(i + 4, '      (SID_NAME = ' + sid + ')');
        listenerOra.Insert(i + 5, '    )');
      end;
    listenerOra.SaveToFile(listenerOraFile);
  finally
    listenerOra.Free;
  end;
end;

procedure RemoveAliasFromTnsNamesFile(TnsNamesFileName: String; TnsName: String);
var
  i: Integer;
  s, first: String;
  OracleHome: String;
  foundAlias: Boolean;
  TnsNames: TStringList;
begin

  foundAlias := false;

    if FileExists(TnsNamesFileName) then
    begin
      TnsNames := TStringList.Create;

      try
        tnsNames.LoadFromFile(TnsNamesFileName);
    i := 0;
    if tnsNames.Count <> 0 then
      repeat
        s := Trim(tnsNames[i]);
            if (UpperCase(TnsName) = UpperCase(Copy(s, 1, Length(TnsName)))) then
          repeat
            foundAlias := True;
            tnsNames.Delete(i);
            if tnsNames.Count - 1 < i then
              break
            else
              first := Copy(Trim(tnsNames[i]), 1, 1);
              until not((first = '#') or (first = '') or (first = ')') or (first = '('))
        else if tnsNames.Count - 1 < i then
          break
        else
          Inc(i);

        if foundAlias then
          break;
      until false;

    if foundAlias then
          tnsNames.SaveToFile(TnsNamesFileName);
  finally
    tnsNames.Free;
  end;
end;
end;

procedure AddAlias(aliasName, aliasHost, serviceName: String; aliasPort: Integer);
var
  i: Integer;
  //tnsNamesFile: String;
  aliases: TStringList;
  OracleHome: String;
  foundAlias: Boolean;
  TnsDirectoryName: String;
  TnsFileName: string;
begin

  foundAlias := false;

  for OracleHome in FindOracleHomes do
  begin
    TnsDirectoryName := AddBackSlash(OracleHome) + 'network\admin\';

    // make sure the directory structure exists before we try to write to the file
    ForceDirectories(TnsDirectoryName);

    TnsFileName := TnsDirectoryName + 'tnsnames.ora';

    // write the TNS Names to every path found in under Oracle key even if it doesn't exist there yet
    if FileExists(TnsFileName) then
    begin
      //IQInformation('3. TnsNamesFile Exists (true): ' + TnsFileName);

      //SYST-464 attempt this only if the tnsnames ora file already exists.
      aliases := GetAliases;

      try
        if aliases.Count <> 0 then
          for i := 0 to aliases.Count - 1 do
          begin
            if UpperCase(aliases[i]) = UpperCase(aliasName) then
              foundAlias := True;
          end;

          if foundAlias then
            RemoveAliasFromTnsNamesFile(TnsFileName, aliasName);

      finally
        aliases.Free;
      end;
    end;

    //IQInformation('4. TnsNamesFile: ' + TnsFileName);

    //Append to TNSNames.ora, then save the file.
    with TStringList.Create do
      try
        //Make sure it exists prior to loading...
          if FileExists(TnsFileName) then
            LoadFromFile(TnsFileName);

        Add('');
        Add(UpperCase(aliasName) + ' =');
        Add('  (DESCRIPTION =');
        Add('    (ADDRESS_LIST =');
          Add('      (ADDRESS = (PROTOCOL = TCP)(HOST = ' + UpperCase(aliasHost) + ')(PORT = ' + IntToStr(aliasPort) + '))');
        Add('    )');
        Add('    (CONNECT_DATA =');
        Add('      (SERVICE_NAME = ' + serviceName + ')');
        Add('    )');
        Add('  )');

          SaveToFile(TnsFileName);
      finally
        Free;
      end;
  end;
end;

function GetLocalIPAddress: string;
var
  wsdata: TWSAData;
  he: PHostEnt;
  ss: PAnsiChar;
  ip: TInAddr;
  i: Cardinal;
  co: AnsiString;
begin
  i := MAX_COMPUTERNAME_LENGTH + 1;
  SetLength(co, i);
  GetComputerName(PChar(co), i);
  WSAStartup(MakeWord(1, 1), wsdata);
  he := gethostbyname(PAnsiChar(co));
  if he <> nil then
  begin
    ip.S_addr := Integer(pointer(he^.h_addr_list^)^);
    ss := inet_ntoa(ip);
    Result := string(ss);
  end;
  WSACleanup;
  if Result = '127.0.0.1' then
    Bomb('Verify the local IP address. The address ''' + Result +
      ''' is unacceptable for the Oracle installation.  Exiting.');
  if Result = '' then
    Bomb('IP address not detected.  Exiting.');
end;

function UnixSlashes(const Original: String): String;
var
  s: String;
  i: Integer;
begin
  s := Original;
  repeat
    i := Pos('\', s);
    if i <> 0 then
      s := Copy(s, 1, i - 1) + '/' + Copy(s, i + 1, Length(s));
  until i = 0;
  Result := s;
end;

procedure CopyOraNetFiles(iqmsOraHome, ohsOraHome: String);
var
  tnsNames: String;
  sqlnet: String;
  ohsAdminDir: String;
  //fileop: TShellFileOp;

begin

  tnsNames := AddBackSlash(iqmsOraHome) + 'network\admin\tnsnames.ora';
  sqlnet := AddBackSlash(iqmsOraHome) + 'network\admin\sqlnet.ora';
  ohsAdminDir := AddBackSlash(ohsOraHome) + 'network\admin';

  if not DirectoryExists(ohsAdminDir) then
    WinExecAndWait32('cmd.exe /c mkdir "' + ohsAdminDir + '"', 0);

  if DirectoryExists(ohsAdminDir) then
  begin
//    fileop := TShellFileOp.Create(nil);
//    try
//      fileop.NoConfirmation := True;
//      fileop.Animate := True;
//
//      if FileExists(tnsNames) then
//        fileop.addtarget(tnsNames);
//      if FileExists(sqlnet) then
//        fileop.addtarget(sqlnet);
//
//      fileop.CopyFiles(ohsAdminDir);
//    finally
//      fileop.Free;
//    end;
  end;
end;

function queryParam(v_query, v_sysPassword, v_alias: String): String;
var
  ALogFile: String;
  ABatFile: String;
  ASQLFile: String;
  ASQLFileList, ABatFileList, ALogFileList: TStringList;
  OracleHome: String;
begin

  for OracleHome in FindOracleHomes do
begin
  // set file paths
    ALogFile := OracleHome + 'paramquery.log';
    ASQLFile := OracleHome + 'paramquery.sql';
    ABatFile := OracleHome + 'paramquery.bat';

  // write the sql file
  ASQLFileList := TStringList.Create; // badtstring --fixed
  with ASQLFileList do
    try
      Add('conn sys/' + v_sysPassword + '@' + v_alias + ' as sysdba');
      Add('set serveroutput on');
      Add('set feedback off');
      Add('spool ' + ALogFile);
      Add('begin');
      Add('  for c in ( ' + v_query + ' )');
      Add('  loop');
      Add('    dbms_output.put_line( c.AVal );');
      Add('  end loop;');
      Add('end;');
      Add('/');
      Add('exit');

      SaveToFile(ASQLFile);

    finally
      ASQLFileList.Free;
    end;
  // write the bat file
  ABatFileList := TStringList.Create;
  with ABatFileList do // badtstring   -- fixed
    try
        Add(OracleHome + 'bin\sqlplus.exe /nolog @' + ASQLFile);
      Add('exit');
      SaveToFile(ABatFile);
    finally
      ABatFileList.Free;
    end;

  // execute the bat file
  WinExecAndWait32(ABatFile, 0);

  if FileExists(ALogFile) then
  begin
    ALogFileList := TStringList.Create; // badtstring  -- fixed
    try
      ALogFileList.LoadFromFile(ALogFile);
      Result := Trim(ALogFileList.Strings[0]);

      if (UpperCase(Copy(Result, 1, 4)) = 'SP2-') then
        Result := 'not connected';

      if (UpperCase(Copy(Result, 1, 10)) = 'FOR C IN (') then
      begin
        Result := 'ORAERROR';
          ALogFileList.SaveToFile(AddBackSlash(OracleHome) +
          'queryParam.Log');
      end
    finally
      ALogFileList.Free;
    end
  end
  else
    IQInformation('The parameters were not retrieved.');

  DeleteFile(ALogFile);
  DeleteFile(ASQLFile);
  DeleteFile(ABatFile);

    break;
  end;
end;
// Screen.Cursor:= crDefault;
// end;

function checkDBLogin(v_user, v_password, v_alias: String): Boolean;
begin
  Result := runSQLAndVerify('select ''thisbetterwork'' from dual', v_user,
    v_password, v_alias, 'thisbetterwork');
end;

function runSQLAndVerify(v_sql, v_user, v_password, v_alias, v_validateString
  : String): Boolean;
var
  SQLLog: TStringList;
  s: String;
  i: Integer;
begin
  SQLLog := TStringList.Create; // badtstring  -- fixed
  try
    SQLLog := runSQL(v_sql, v_user, v_password, v_alias, True);

    Result := false;
    for i := 0 to SQLLog.Count - 1 do
    begin
      s := UpperCase(Trim(SQLLog.Strings[i]));
      if Copy(s, 1, Length(v_validateString)) = UpperCase(v_validateString) then
      begin
        Result := True;
        exit;
      end;
    end;

  finally
    SQLLog.Free;
  end;
end;

function runSQL(v_sql, v_user, v_password, v_alias: String): TStringList;
begin
  Result := runSQL(v_sql, v_user, v_password, v_alias, false);
end;

function runSQL(v_sql, v_user, v_password, v_alias: String; feedback_on: Boolean): TStringList;
var
  ALogFile: String;
  ASQLFile: String;
  SQLFile: TStringList;
  OracleHome: String;
  Command: String;
begin

  for OracleHome in FindOracleHomes do
begin
  // set file paths
    ALogFile := OracleHome + 'runSQL.log';
    ASQLFile := OracleHome + 'runSQL.sql';

  // write the sql file
  SQLFile := TStringList.Create; // badtstring -- fixed
  with SQLFile do
    try
      if UpperCase(v_user) = 'SYS' then
        Add('conn ' + v_user + '/' + v_password + '@' + v_alias + ' as sysdba')
      else
        Add('conn ' + v_user + '/' + v_password + '@' + v_alias);
      Add('set serveroutput on');
      Add('set echo off');
      if feedback_on then
        Add('set feedback on')
      else
        Add('set feedback off');
      Add('set pagesize 1000');
      Add('spool ' + ALogFile);
      Add(v_sql);
      Add('/');
      Add('exit');
      SaveToFile(ASQLFile);

        Command := OracleHome + 'bin\sqlplus.exe /nolog @' + ASQLFile;

      // execute the bat file
        WinExecAndWait32(Command, 0);

      Result := TStringList.Create;

      if FileExists(ALogFile) then
        Result.LoadFromFile(ALogFile);

    finally
      begin
          //if FileExists( ALogFile ) then System.SysUtils.DeleteFile(ALogFile);
          //if FileExists( ASQLFile)  then System.SysUtils.DeleteFile(ASQLFile);
        SQLFile.Free;
      end;
    end;

      break;
  end;
end;

procedure runSQLScript(v_sqlScript, v_user, v_password, v_alias: String);
var
  ALogFile: String;
  ASQLFile: String;
  SQLFile: TStringList;
  OracleHome: String;
begin

  if not FileExists(v_sqlScript) then
    exit;

  for OracleHome in FindOracleHomes do
  begin
    ALogFile := OracleHome + 'runSQLScript.log';
    ASQLFile := OracleHome + 'runSQLScript.sql';

  // write the sql file
  SQLFile := TStringList.Create; // badtstring -- fixed
  with SQLFile do
    try
      if UpperCase(v_user) = 'SYS' then
        Add('conn ' + v_user + '/' + v_password + '@' + v_alias + ' as sysdba')
      else
        Add('conn ' + v_user + '/' + v_password + '@' + v_alias);
      Add('set serveroutput on');
      Add('set feedback off');
      Add('set pagesize 1000');
      Add('spool ' + ALogFile);
      Add('@' + v_sqlScript);
      Add('exit');
      SaveToFile(ASQLFile);

      // execute the bat file
        WinExecAndWait32(OracleHome + 'bin\sqlplus.exe /nolog @' + ASQLFile, 0);

      DeleteFile(ALogFile);
      DeleteFile(ASQLFile);
    finally
      SQLFile.Free;
    end;

      break;
  end;
end;

function runSQLScriptwithParams(v_sqlScript, v_user, v_password, v_alias,
  v_params: String): TStringList;
var
  ALogFile: String;
  ASQLFile: String;
  SQLFile: TStringList;
  OracleHome: String;
begin
  if not FileExists(v_sqlScript) then
    exit;

  for OracleHome in FindOracleHomes do
  begin
    ALogFile := OracleHome + 'runSQLScript.log';
    ASQLFile := OracleHome + 'runSQLScript.sql';

  // write the sql file
  SQLFile := TStringList.Create;
  with SQLFile do
    try // badtstring -- fixed
      if UpperCase(v_user) = 'SYS' then
        Add('conn ' + v_user + '/' + v_password + '@' + v_alias + ' as sysdba')
      else
        Add('conn ' + v_user + '/' + v_password + '@' + v_alias);
      Add('set serveroutput on');
      Add('set feedback on');   //was off
      Add('set pagesize 1000');
      Add('set termout on');
      Add('set echo on');
      Add('spool ' + ALogFile);
      if v_params <> '' then
        Add('@' + WrapinQuotes(v_sqlScript) +' ' + v_params) //wrap with ' ' in case path has spaces
      else
        SQLFile.Add('@' + WrapinQuotes(v_sqlScript)); //wrap with ' ' in case path has spaces
      Add('exit');
      SaveToFile(ASQLFile);

      // execute the bat file
        WinExecAndWait32(OracleHome + 'bin\sqlplus.exe /nolog @' + ASQLFile, 0);

      Result := TStringList.Create;
      if FileExists(ALogFile) then
        Result.LoadFromFile(ALogFile);

      DeleteFile(ALogFile);
      DeleteFile(ASQLFile);
    finally
      SQLFile.Free;
    end;

      break;
  end;
  end;


function InstallText(sys_pwd, oraAlias: String): Boolean;
var
  SQLLog: TStringList;
  OracleHome: String;
begin
  SQLLog := TStringList.Create; // badtstring -- fixed

  try
    for OracleHome in FindOracleHomes do
    begin
      SQLLog := runSQLScriptwithParams(AddBackSlash(OracleHome) +
      'ctx\admin\catctx.sql', 'SYS', sys_pwd, oraAlias,
      sys_pwd + ' SYSAUX TEMP, NOLOCK');

    // IQInformation( SQLLog.Text ); shouldn't give user a popup here

      runSQLScript(AddBackSlash(OracleHome) + 'ctx\admin\default\drdefus.sql', 'CTXSYS', sys_pwd, oraAlias);

      break;
    end;
  finally
    SQLLog.Free;
  end;
end;

procedure FixOraclePermissions( AIsClientInstall : boolean; AOraHome, AProgramFilesDir, ALogDir : string);
var
  ABatFile,
  AIniFile,
  FRoot,
  FCommonFilesDir : string;

  function _winver: string;
  var
  ver: TOSVersionInfo;
  begin
    ver.dwOSVersionInfoSize := SizeOf(ver);
    if GetVersionEx(ver) then
    with ver do
      result := IntToStr(dwMajorVersion) + '.' + IntToStr(dwMinorVersion);
  end;

begin
(*ASource is specified as SERVER or SILENT*)
  if ALogDir = '' then
    raise Exception.Create('Log path is blank!  Unable to fix Oracle permissions!');

  // Set the System Drive
  FRoot := GetEnvironmentVariable( 'SYSTEMDRIVE' );
  if not DirectoryExists( FRoot ) then
    if not DirectoryExists( 'C:\' ) then
      Bomb( 'SYSTEMDRIVE not detected, and C:\ does not exist.  Exiting.', 0 )
    else
      FRoot := 'C:\';
  FRoot := AddBackSlash( FRoot );

  //Set Common files based on passed AProgramFilesDir
  FCommonFilesDir := PathCombine( AProgramFilesDir, 'Common Files' );
   if not DirectoryExists( FCommonFilesDir ) then
     Bomb( 'Common Files not detected.  Exiting.', 0 );

  // create bat file to reset file and registry permissions
  ABatFile := PathCombine(ALogDir, 'oracle\FixPerm.bat');
  AIniFile := PathCombine(ALogDir, 'oracle\FixPerm.ini');  {Called by FixPerms.bat file}

  with TStringList.Create do
    try
      Clear;
    {<add unconditionally>}
      Add('@echo off');
    {</add unconditionally>}

    //Windows Vista and higher support icacls -- cacls is deprecated
    if StrToFloat(_winver) >= 6 then
    begin
      {<add unconditionally>}
      Add('icacls "' + PathCombine(FRoot, 'oracle') + '\*.*" /grant Everyone:(f) /T');
      {/<add unconditionally>}
      if AIsClientInstall then
      begin
        Add('icacls "' + AProgramFilesDir + '\iqms\*.*" /grant Everyone:(f) /T');
        Add('icacls "' + FCommonFilesDir + '\Borland Shared\BDE\*.*" /grant Everyone:(f) /T');
//        Add('icacls "' + FCommonFilesDir + '\Crystal Decisions" /grant Everyone:(f)');
        Add('icacls "' + FCommonFilesDir + '\SAP BusinessObjects\*.*" /grant Everyone:(f) /T');
      end;
    end
    else
    begin
    //Windows versions before Vista use cacls
       {<add unconditionally>}
       Add('cacls "' + PathCombine(FRoot, 'oracle') + '" /T /E /G everyone:F');
       {/<add unconditionally>}
       if AIsClientInstall then
       begin
         Add('cacls "' + AProgramFilesDir + '\iqms" /T /E /G everyone:F');
         Add('cacls "' + AProgramFilesDir + '\oracle" /T /E /G everyone:F');
         Add('cacls "' + FCommonFilesDir + '\Borland Shared\BDE" /T /E /G everyone:F');
//         Add('cacls "' + FCommonFilesDir + '\Crystal Decisions" /T /E /G everyone:F');
         Add('cacls "' + FCommonFilesDir + '\SAP BusinessObjects" /T /E /G everyone:F');
       end;
    end;

    {<add these unconditionally>}
      Add('regini "' + AIniFile + '"');
    {</add these unconditionally>}
      SaveToFile(ABatFile);

      Clear;
    {<add these unconditionally>}
      Add(Format('\Registry\Machine%s[1 5 7 17]', [SoftwareOracleRegKey]));
    Add('\Registry\Machine\Software\Oracle[1 5 7 17]');
    //64 bit
    Add(Format('\Registry\Machine%s[1 5 7 17]', [SoftwareOracleWoW6432RegKey]));
    Add('\Registry\Machine\Software\Wow6432Node\Oracle[1 5 7 17]');
    {</add these unconditionally>}

    if AIsClientInstall then
    begin
      Add('\Registry\Machine\Software\IQMS[1 5 7 17]');
      Add('\Registry\Machine\Software\Borland[1 5 7 17]');
      Add('\Registry\Machine\Software\IQMS\IQWIN32[1 5 7 17]');
      Add('\Registry\Machine\Software\Borland\BLW32[1 5 7 17]');
      Add('\Registry\Machine\Software\Borland\DATABASE ENGINE[1 5 7 17]');
      Add('\Registry\Machine\Software\Borland\DATABASE ENGINE\Settings[1 5 7 17]');
      Add('\Registry\Machine\Software\Borland\DATABASE ENGINE\Settings\Drivers[1 5 7 17]');
      Add('\Registry\Machine\Software\Borland\DATABASE ENGINE\Settings\Drivers\DBASE[1 5 7 17]');
      Add('\Registry\Machine\Software\Borland\DATABASE ENGINE\Settings\Drivers\DBASE\INIT[1 5 7 17]');
      Add('\Registry\Machine\Software\Borland\DATABASE ENGINE\Settings\Drivers\DBASE\TABLE CREATE[1 5 7 17]');
      Add('\Registry\Machine\Software\Borland\DATABASE ENGINE\Settings\Drivers\FOXPRO[1 5 7 17]');
      Add('\Registry\Machine\Software\Borland\DATABASE ENGINE\Settings\Drivers\FOXPRO\INIT[1 5 7 17]');
      Add('\Registry\Machine\Software\Borland\DATABASE ENGINE\Settings\Drivers\FOXPRO\TABLE CREATE[1 5 7 17]');
      Add('\Registry\Machine\Software\Borland\DATABASE ENGINE\Settings\Drivers\MSACCESS[1 5 7 17]');
      Add('\Registry\Machine\Software\Borland\DATABASE ENGINE\Settings\Drivers\MSACCESS\INIT[1 5 7 17]');
      Add('\Registry\Machine\Software\Borland\DATABASE ENGINE\Settings\Drivers\MSACCESS\DB OPEN[1 5 7 17]');
      Add('\Registry\Machine\Software\Borland\DATABASE ENGINE\Settings\Drivers\ORACLE[1 5 7 17]');
      Add('\Registry\Machine\Software\Borland\DATABASE ENGINE\Settings\Drivers\ORACLE\INIT[1 5 7 17]');
      Add('\Registry\Machine\Software\Borland\DATABASE ENGINE\Settings\Drivers\ORACLE\DB OPEN[1 5 7 17]');
      Add('\Registry\Machine\Software\Borland\DATABASE ENGINE\Settings\Drivers\PARADOX[1 5 7 17]');
      Add('\Registry\Machine\Software\Borland\DATABASE ENGINE\Settings\Drivers\PARADOX\INIT[1 5 7 17]');
      Add('\Registry\Machine\Software\Borland\DATABASE ENGINE\Settings\Drivers\PARADOX\TABLE CREATE[1 5 7 17]');
      Add('\Registry\Machine\Software\Borland\DATABASE ENGINE\Settings\REPOSITORIES[1 5 7 17]');
      Add('\Registry\Machine\Software\Borland\DATABASE ENGINE\Settings\SYSTEM[1 5 7 17]');
      Add('\Registry\Machine\Software\Borland\DATABASE ENGINE\Settings\SYSTEM\FORMATS[1 5 7 17]');
      Add('\Registry\Machine\Software\Borland\DATABASE ENGINE\Settings\SYSTEM\FORMATS\DATE[1 5 7 17]');
      Add('\Registry\Machine\Software\Borland\DATABASE ENGINE\Settings\SYSTEM\FORMATS\NUMBER[1 5 7 17]');
      Add('\Registry\Machine\Software\Borland\DATABASE ENGINE\Settings\SYSTEM\FORMATS\TIME[1 5 7 17]');
      Add('\Registry\Machine\Software\Borland\DATABASE ENGINE\Settings\SYSTEM\INIT[1 5 7 17]');

      //SYST-15 Silent and Oracle installer permission fix to accomodate UAC turned on, Adding 64 bit permissions
      Add('\Registry\Machine\Software\Wow6432Node\IQMS[1 5 7 17]');
      Add('\Registry\Machine\Software\Wow6432Node\Borland[1 5 7 17]');
      Add('\Registry\Machine\Software\Wow6432Node\IQMS\IQWIN32[1 5 7 17]');
      Add('\Registry\Machine\Software\Wow6432Node\Borland\BLW32[1 5 7 17]');
      Add('\Registry\Machine\Software\Wow6432Node\Borland\Database Engine[1 5 7 17]');
      Add('\Registry\Machine\Software\Wow6432Node\Borland\Database Engine\Settings[1 5 7 17]');
      Add('\Registry\Machine\Software\Wow6432Node\Borland\Database Engine\Settings\Drivers[1 5 7 17]');
      Add('\Registry\Machine\Software\Wow6432Node\Borland\Database Engine\Settings\Drivers\DBASE[1 5 7 17]');
      Add('\Registry\Machine\Software\Wow6432Node\Borland\Database Engine\Settings\Drivers\DBASE\INIT[1 5 7 17]');
      Add('\Registry\Machine\Software\Wow6432Node\Borland\Database Engine\Settings\Drivers\DBASE\TABLE CREATE[1 5 7 17]');
      Add('\Registry\Machine\Software\Wow6432Node\Borland\Database Engine\Settings\Drivers\FOXPRO[1 5 7 17]');
      Add('\Registry\Machine\Software\Wow6432Node\Borland\Database Engine\Settings\Drivers\FOXPRO\INIT[1 5 7 17]');
      Add('\Registry\Machine\Software\Wow6432Node\Borland\Database Engine\Settings\Drivers\FOXPRO\TABLE CREATE[1 5 7 17]');
      Add('\Registry\Machine\Software\Wow6432Node\Borland\Database Engine\Settings\Drivers\MSACCESS[1 5 7 17]');
      Add('\Registry\Machine\Software\Wow6432Node\Borland\Database Engine\Settings\Drivers\MSACCESS\DB OPEN[1 5 7 17]');
      Add('\Registry\Machine\Software\Wow6432Node\Borland\Database Engine\Settings\Drivers\MSACCESS\INIT[1 5 7 17]');
      Add('\Registry\Machine\Software\Wow6432Node\Borland\Database Engine\Settings\Drivers\ORACLE[1 5 7 17]');
      Add('\Registry\Machine\Software\Wow6432Node\Borland\Database Engine\Settings\Drivers\ORACLE\DB OPEN[1 5 7 17]');
      Add('\Registry\Machine\Software\Wow6432Node\Borland\Database Engine\Settings\Drivers\ORACLE\INIT[1 5 7 17]');
      Add('\Registry\Machine\Software\Wow6432Node\Borland\Database Engine\Settings\Drivers\PARADOX[1 5 7 17]');
      Add('\Registry\Machine\Software\Wow6432Node\Borland\Database Engine\Settings\Drivers\PARADOX\INIT[1 5 7 17]');
      Add('\Registry\Machine\Software\Wow6432Node\Borland\Database Engine\Settings\Drivers\PARADOX\TABLE CREATE[1 5 7 17]');
      Add('\Registry\Machine\Software\Wow6432Node\Borland\Database Engine\Settings\REPOSITORIES[1 5 7 17]');
      Add('\Registry\Machine\Software\Wow6432Node\Borland\Database Engine\Settings\SYSTEM[1 5 7 17]');
      Add('\Registry\Machine\Software\Wow6432Node\Borland\Database Engine\Settings\SYSTEM\FORMATS[1 5 7 17]');
      Add('\Registry\Machine\Software\Wow6432Node\Borland\Database Engine\Settings\SYSTEM\FORMATS\DATE[1 5 7 17]');
      Add('\Registry\Machine\Software\Wow6432Node\Borland\Database Engine\Settings\SYSTEM\FORMATS\NUMBER[1 5 7 17]');
      Add('\Registry\Machine\Software\Wow6432Node\Borland\Database Engine\Settings\SYSTEM\FORMATS\TIME[1 5 7 17]');
      Add('\Registry\Machine\Software\Wow6432Node\Borland\Database Engine\Settings\SYSTEM\FORMATS\INIT[1 5 7 17]');
    end;

      SaveToFile(AIniFile);
    finally
    FREE;
    end;

  // issue the command to install the Oracle client. The bat file also calls the .ini
  WinExecAndWait32(ABatFile, 0);

end;

function PathCombine(a, b: String): String;
begin
//  Result := StrTran(a + '\' + b, '\\', '\');
//  while IQString.Occurances('\\', Result) > 0 do
//    Result := StrTran(Result, '\\', '\');
end;

procedure CheckCreateDirectory(ADir: string);
begin
  if not DirectoryExists(ADir) then
    MkDir(ADir);
end;

procedure InstallOdpNetClient(AOdpClientDirectory, ATargetDrive: string;
  AIsServerInstall: Boolean; AStatusCallback: TUpdateInstallationStatus);
var
  ACommand, AParams: string;
begin
  if not FileExists(PathCombine(ATargetDrive, 'oracle\x86\oci.dll')) then
  begin
    if Assigned(AStatusCallback) then
      AStatusCallback('Installing odp x86 client');

    CheckCreateDirectory(PathCombine(ATargetDrive, 'oracle'));
    CheckCreateDirectory(PathCombine(ATargetDrive, 'oracle\x86'));

    if AIsServerInstall then
      ACommand := Format('%s x86 %s',
        [PathCombine(AOdpClientDirectory, 'iqms_install.bat'),
        PathCombine(ATargetDrive, 'oracle\x86')])
    else
      ACommand := Format('%s x86 %s',
        [PathCombine(AOdpClientDirectory, 'iqms_install.bat'),
        PathCombine(ATargetDrive, 'oracle\x86')]);

    if Assigned(AStatusCallback) then
      AStatusCallback(Format('Executing Command: %s', [ACommand]));

//    with TProcessConsole.Create(ACommand, false) do
//      try
//        while not Finished do
//        begin
//          sleep(100);
//          Application.ProcessMessages;
//        end;
//      finally
//        Free;
//      end;

    if Assigned(AStatusCallback) then
      AStatusCallback('Installing odp x86 client - Finished');

    CheckEnsureFirstInSysPath(PathCombine(ATargetDrive, 'oracle\x86'));
    ReloadEnvironment;
  end;

  if Is64bit and not FileExists(PathCombine(ATargetDrive,
    'oracle\x64\oci.dll')) then
  begin
    // check oracle\x64\oci.dll exists, if so, we out
    // check HKLM\Software\Oracle\odp.net\4.112.1.2 exists, if so, we out
    if Assigned(AStatusCallback) then
      AStatusCallback('Installing odp x64 client');

    CheckCreateDirectory(PathCombine(ATargetDrive, 'oracle'));
    CheckCreateDirectory(PathCombine(ATargetDrive, 'oracle\x64'));

    //ACommand := PathCombine(iqmisc.ExpandEnvironment('%windir%'), 'Sysnative\cmd.exe');

    if AIsServerInstall then
      AParams := Format('/c "%s x64 %s"',
        [PathCombine(AOdpClientDirectory, 'iqms_install.bat'),
        PathCombine(ATargetDrive, 'oracle\x64')])
    else
      AParams := Format('/c "%s x64 %s"',
        [PathCombine(AOdpClientDirectory, 'iqms_install.bat'),
        PathCombine(ATargetDrive, 'oracle\x64')]);

    if Assigned(AStatusCallback) then
      AStatusCallback(Format('Executing Command: %s %s', [ACommand, AParams]));

    //iqmisc.ExecuteProgramW(ACommand, SW_SHOWMINNOACTIVE, PWideChar(AParams));

    if Assigned(AStatusCallback) then
      AStatusCallback('Installing odp x64 client - Finished');

    ReloadEnvironment;
  end;
end;

function IsEnterpriseEdition: Boolean;
begin
  Result := SelectValue ('select 1 from v$version where upper(banner) like ''%ENTERPRISE%''') = 1
end;

function WrapinQuotes( AString : string ) : string;
begin
  Result := ''''+ AString +'''';
end;

function EnsureReposConnectionsInTNSNames( var AMissingReposAlias : string ) : boolean;
var
  i : integer;
  AQry : TFDQuery;
  A_AliasesList : TStringList;
  ACheckedAlias : string;
begin
  {requires DB connection!}
  Result := False;
  if SelectValueAsFloat('select id from doc_library where repository_alias is not null') = 0
    then Exit(True); {No repos found, don't bother checking}

  { Repositories found, check TNSNAMES.ORA file }
  AQry := TFDQuery.Create(nil);
  with AQry, A_AliasesList do
    try
      A_AliasesList := GetAliases;
      //AQry.ConnectionName := IQMS.Common.DataConstants.cnstFDConnectionName;

      AQry.SQL.Add
        ('select repository_alias from doc_library where repository_alias is not null');
      AQry.Open;
      while not AQry.EoF do
      begin
        ACheckedAlias:= AQry.Fields[0].asString;

        for i := 0 to A_AliasesList.Count - 1 do
          if AnsiCompareText(ACheckedAlias, A_AliasesList.Strings[i]) = 0 then
          begin
            Result := true;
            break;
          end;

        if not Result then
        begin
          AMissingReposAlias := ACheckedAlias;
          Exit(false); // we failed to find one of them, don't keep going
        end;

        AQry.Next;
      end;
    finally
      AQry.Free;
      A_AliasesList.Free;
    end;
end;

procedure AppendTNSNametoOraFile( const ACnxnName, AServiceName, AHostName : string; const APort : integer );
const
  (*Copied from private readonly string _aliasTemplate in C# class NetManager.cs

      @"{0} =
        (DESCRIPTION =
          (ADDRESS_LIST =
              (ADDRESS = (PROTOCOL = TCP)(HOST = {1})(PORT = {2}))
          )
          (CONNECT_DATA =
              (SERVICE_NAME = {3})
          )
        )" + Environment.NewLine + Environment.NewLine;

  *)
  c_NumLines = 10; //number of lines allotted per connection
  //Delphi equivalent of _aliasTemplate in C# class NetManager.cs
  c_AliasTemplate  =
      '%s ='#13#10+
      '  (DESCRIPTION ='#13#10+
      '    (ADDRESS_LIST ='#13#10+
      '        (ADDRESS = (PROTOCOL = TCP)(HOST = %s)(PORT = %d))'#13#10+
      '    )'#13#10+
      '    (CONNECT_DATA ='#13#10+
      '        (SERVICE_NAME = %s)'#13#10+
      '    )'#13#10+
      '  )'#13#10;
type
  TRWMethod = (wAppend, wInsert);
var
  OracleHome: String;
  aFileName: String;
  aAlphaStrBefore: String;
  aAlphaStrAfter : String;

  aExistingConnections,
  aFileContents : TStringList;

  aTNSNamesOraFileHadData,
  aReplacingExistingCnxn : Boolean;

  i,
  iTargetIndex,
  aIndexofExisting,
  aAlphaIndexBefore,
  aAlphaIndexAfter       : integer;

  procedure _DeleteConnectionStartingAt( const AIndex : integer );
  var
    i2 : integer;
  begin
    for i2:= 1 to c_NumLines do
      aFileContents.Delete(AIndex);
  end;

  function _FindIndexOfExistCnxnName( const AConnectionName : string ) : integer;
  var
    i3 : integer;
  begin
    Result:= 0;
    for i3:= 0 to aFileContents.Count -1 do
    begin
//      if (IQString.Occurances('=', aFileContents[i3]) = 1) and
//         (IQString.Occurances('(', aFileContents[i3]) = 0) and
//         (Trim(StrTran(aFileContents[i3], '=', '')) = AConnectionName ) then
      begin
        Result:= i3;
        break;
      end;
    end;
  end;

  procedure _WriteToTNSNamesOraFile( aRWMethod : TRWMethod; AIndex : integer = 0 );
  begin
    if aRWMethod = wAppend then
      (*Simply append the main passed connection - the tnsnames.ora file was empty.*)
      aFileContents.Append(Format( c_AliasTemplate,
                             [ UpperCase(Trim(ACnxnName))    (*Connection Name*),
                               UpperCase(Trim(AHostName))    (*HOST*),
                               APort                         (*PORT*),
                               UpperCase(Trim(AServiceName)) (*SERVICE_NAME*) ] ))

    else if aRWMethod = wInsert then
       (*Insert the connection in the correct position in the file*)
       aFileContents.Insert( AIndex, Format( c_AliasTemplate,
                                       [ UpperCase(Trim(ACnxnName))    (*Connection Name*),
                                         UpperCase(Trim(AHostName))    (*HOST*),
                                         APort                         (*PORT*),
                                         UpperCase(Trim(AServiceName)) (*SERVICE_NAME*)
                                       ] ));

  end;

begin
  (*EIQ-10213 FireDAC - move to FireDAC, no more BDE AMB 01-15-16*)
  //init
  aTNSNamesOraFileHadData:= False;
  aIndexofExisting       := -1;
  aReplacingExistingCnxn := False;

  for OracleHome in FindOracleHomes do
  begin
    IQAssert(OracleHome <> '', 'Unable to save connection. Oracle home was not found!');

    aFileName:= OracleHome + '\network\admin\tnsnames.ora';

  if not DirectoryExists(ExtractFileDir(aFileName)) then
  begin
    MkDir( ExtractFileDir(aFileName)); //admin
    //MkDir( ExtractFileDir(IQFile.UpOneLevel(ExtractFileDir(aFileName))) + '\' + 'network');
  end;

  IQAssert( FileExists(aFileName), Format('Unable to save connection. File %s not found!', [ aFileName ]));

  aFileContents := TStringList.Create;
  try
    aFileContents.LoadFromFile( aFileName );

    aExistingConnections:= TStringList.Create;
    try
      (*Get list of existing connections and add them*)
      for i:= 0 to aFileContents.Count -1 do
      begin
        aTNSNamesOraFileHadData:= TRUE;
        (*If this is a connection name line, add it.*)

//        if (IQString.Occurances('=', aFileContents[i]) = 1) and (IQString.Occurances('(', aFileContents[i]) = 0)
//        then
//          (*If the connection being saved is already in the file, we're just going
//            to update the connection string data. *)
//          if Trim(StrTran(aFileContents[i], '=', '')) = ACnxnName then
//          begin
//            aReplacingExistingCnxn:= True;
//            aIndexofExisting:= i;
//            aExistingConnections.Append(Format('%s <REPLACE!>', [ Trim(StrTran(aFileContents[i], '=', '')  )] ) );
//          end
//          else
//            aExistingConnections.Append( Trim(StrTran(aFileContents[i], '=', '')));
      end;

      (*Replace existing connection string*)
      if aIndexofExisting > -1 then
      begin
        _DeleteConnectionStartingAt(aIndexofExisting);
        _WriteToTNSNamesOraFile( wInsert, aIndexofExisting );
      end

      (*tnsnames.ora file had data, but the connection being added wasn't in it.
        need to add the new connection in alphabetical order!*)
      else if aTNSNamesOraFileHadData then
      begin
        //alphabetize the connection list to determine where the new connection should go
        aExistingConnections.Sorted:= True;
        for i:= 0 to aExistingConnections.Count -1 do
        begin
          aAlphaIndexBefore:= System.Math.Max(i - 1, 0);
            aAlphaStrBefore:= aExistingConnections[aAlphaIndexBefore];
          aAlphaIndexAfter := System.Math.Min(aFileContents.Count, i + 1);
            aAlphaStrAfter := aExistingConnections[aAlphaIndexAfter];

          if (AnsiCompareText( aAlphaStrBefore, aCnxnName ) < 0) and
             (AnsiCompareText( aAlphaStrAfter,  aCnxnName ) > 0)
          then
            Break; //found the index where it should be inserted
        end;

        iTargetIndex:= _FindIndexOfExistCnxnName(aAlphaStrAfter);
        _WriteToTNSNamesOraFile( wInsert, iTargetIndex );
      end

      else
        (*Simply insert*)
        _WriteToTNSNamesOraFile( wAppend );

    finally
      aExistingConnections.Free;
    end;

    aFileContents.SaveToFile( aFileName );
    TFile.SetLastWriteTime( aFileName, Now );
    SyncTNSNames( aFileName );
  finally
    aFileContents.Free;
  end;

    break;
   end;
end;

procedure SyncTNSNames( const AtnsNamesOraFile : string );
begin
  CopyFile(PChar(AtnsNamesOraFile),PChar('c:\oracle\x86\network\admin\' + ExtractFileName(AtnsNamesOraFile)), False);
  CopyFile(PChar(AtnsNamesOraFile),PChar('c:\oracle\x64\network\admin\' + ExtractFileName(AtnsNamesOraFile)), False);
end;

procedure InstallerLog(  const ALogFileName, ALine : String  );
begin
  with TStringList.Create do
  try
    // determine if the file needs to be created
    if FileExists( ALogFileName ) then
      LoadFromFile( ALogFileName )
    else
      begin
        Add( 'Oracle Client installation' );
        Add( 'Installation Date:' + FormatDateTime( 'mmmm d, yyyy', Now ) );
        Add( '' );
        Add( '' );
      end;

    Add( FormatDateTime('yyyy-mm-dd hh:nn:ss ', Now ) + ALine );

  finally
    SaveToFile( ALogFileName );
    FREE;
  end;

end;

end.

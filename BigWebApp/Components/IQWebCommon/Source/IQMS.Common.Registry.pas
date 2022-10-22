unit IQMS.Common.Registry;

{$R-}

interface

uses Winapi.Windows, System.Classes, System.SysUtils, FireDAC.Comp.Client, IQMS.Common.DataConst, Vcl.Forms;

  {$REGION '<Global wrapper methods>'}

    {$REGION '<User setting string get/set wrappers'}
    function LoadStrFromCurrentUserRegistry( const APath, AKey: string ):string;
    procedure SaveStrToCurrentUserRegistry( const APath, AKey, AValue: string );
    function LoadStrFromLocalMachineRegistry( const APath, AKey: string ):string;
    procedure SaveStrToLocalMachineRegistry( const APath, AKey, AValue: string );
    {$ENDREGION '<User setting string get/set wrappers'}


    {$REGION '<Windows registry wrappers'}
    function CanWriteToRoot( ARootKey: HKey ): Boolean;
    function Is64Bit: Boolean;
    function RegPathSoftwareCheckWow6432Node:String;
    function GetEnvVariable(Name: string; User: Boolean = True): string;
    procedure SetEnvVariable(Name, Value: string; User: Boolean = TRUE);
    {$ENDREGION '<Windows registry wrappers'}

  {$ENDREGION '<Global wrapper methods>'}

/// <summary> This type is a wrapper for getting/setting user setting values maintained
///  in Oracle.  These used to be persisted in the Windows registry, hence the naming.
///  These methods call procedures & functions in the
/// </summary>
type
  TIQWebRegistry = class(TObject)
  private
    FAccess     : LongWord; // not used in this unit
    FRootKey    : HKEY;
    FRegset_HKEY : String; // HKCU, HKLM, etc..
    FRegset_Route_KEY_PATH : String; // '\Software\IQMS\IQWin32\CRM\'
    FRegset_USERNAME   : String; // 'IQMS' etc..
    FRegset_APPNAME    : String; // 'WebIQ.exe'  etc...
    function GetRootKeyStr : String;
    procedure SetRootKey(const Value: HKEY);
  protected
    procedure WriteError(const Name: string);
    procedure ReadError(const Name: string);

  public
    constructor Create; virtual;
    constructor CreateRO; virtual;
    destructor Destroy; override;

    /// <summary> Resets the FOpenKeyStr to null
    /// </summary>
    procedure CloseKey;

    /// <summary> Deletes values that belong to a REGSET_ROUTE grouping based on a KEY_PATH mask.  Filtered to appname and user.
    /// </summary>
    function DeleteKey(const Key: string): Boolean;

    /// <summary> Gets list of KEY_PATHs based on base string FOpenKeyStr using a wildcard on KEY_PATH
    /// </summary>
    procedure GetKeyNames(Strings: TStrings);

    /// <summary> Gets list of KEY_NAMES based on FOpenKeyStr
    /// </summary>
    procedure GetValueNames(Strings: TStrings);

    /// <summary> Indicates whether or not a key path already exists
    /// </summary>
    function KeyExists(const Key: string): Boolean;

    function OpenKey(const Key: string; CanCreate: Boolean): Boolean;
    function OpenKeyReadOnly(const Key: String): Boolean;
    function ValueExists(const Name: string): Boolean;

    {$REGION '<Settings Read methods>'}
    function ReadString(const Name: string): string;
    function ReadBool(const Name: string): Boolean;
    function ReadDate(const Name: string): TDateTime;
    function ReadDateTime(const Name: string): TDateTime;
    function ReadFloat(const Name: string): Double;
    function ReadInteger(const Name: string): Integer;
   {$ENDREGION}


    {$REGION '<Settings Write methods>'}
    procedure WriteString(const Name, Value: string);
    procedure WriteBool(const Name: string; Value: Boolean);
    procedure WriteDate(const Name: string; Value: TDateTime);
    procedure WriteDateTime(const Name: string; Value: TDateTime);
    procedure WriteFloat(const Name: string; Value: Double);
    procedure WriteInteger(const Name: string; Value: Integer);
   {$ENDREGION}


    property Access: LongWord read FAccess write FAccess;
    property RootKey: HKEY read FRootKey write SetRootKey;
    property RootKeyStr : String read GetRootKeyStr;


  end;


implementation

uses
  System.RTLConsts,
  IQMS.Common.ResStrings,
  IQMS.Common.DataServices,
  Data.DB;

const
  {$REGION '<Database persisted user settings constants>'}
  cnstUserSettingsMasterTable         = 'REGSET';
  cnstUserSettingsRoutingTable        = 'REGSET_ROUTE';
  cnstUserSettingsRoutingValuesTable  = 'REGSET_ROUTE_VALUES';

  cnstUserSettingsPackage             = 'IQMS.WEBIQ_USER_SETTINGS';

  //Stored in REGSET.HKEY, represents the level the setting was stored at in IQWin32
  cnstHKC   = 'HKCR'; //'HKEY_CLASSES_ROOT';
  cnstHKCU  = 'HKCU'; //'HKEY_CURRENT_USER';
  cnstHKLM  = 'HKLM'; //'HKEY_LOCAL_MACHINE';
  cnstHKU   = 'HKUS'; //'HKEY_USERS';
  cnstHKCC  = 'HKCC'; //'HKEY_CURRENT_CONFIG';
  {$ENDREGION '<Database persisted user settings constants>'}


  {$REGION '<Windows Registry Constants>'}
  KEY_ALL_ACCESS_IQ  = (KEY_READ or                 {Added}
                        KEY_WRITE or                {Added}
                        {STANDARD_RIGHTS_ALL or}    {Taken out}
                        KEY_QUERY_VALUE or
                        KEY_SET_VALUE or
                        KEY_CREATE_SUB_KEY or
                        KEY_ENUMERATE_SUB_KEYS or
                        KEY_NOTIFY {or}
                        {KEY_CREATE_LINK}           {Taken out}
                        ) and not
                        SYNCHRONIZE;

  KEY_ALL_ACCESS_IQ_64  = (KEY_READ or
                           KEY_WRITE or
                           KEY_QUERY_VALUE or
                           KEY_SET_VALUE or
                           KEY_CREATE_SUB_KEY or
                           KEY_ENUMERATE_SUB_KEYS or
                           $100 or                   //KEY_WOW64_64KEY
                           KEY_NOTIFY
                          ) and not
                           SYNCHRONIZE;

  KEY_RO_ACCESS_IQ = (  KEY_READ or
                        KEY_ENUMERATE_SUB_KEYS or
                        KEY_QUERY_VALUE or
                        KEY_NOTIFY
                     )
                     and not
                     SYNCHRONIZE;

  KEY_RO_ACCESS_IQ_64 = (  KEY_READ or
                           KEY_ENUMERATE_SUB_KEYS or
                           KEY_QUERY_VALUE or
                           KEY_NOTIFY or
                           $100 //KEY_WOW64_64KEY
                        )
                        and not
                        SYNCHRONIZE;
  {$ENDREGION '<Windows Registry Constants>'}


procedure SaveStrToCurrentUserRegistry( const APath, AKey, AValue: string );
begin
  with TIQWebRegistry.Create do
  try
    RootKey:= HKEY_CURRENT_USER;
    if not OpenKey( APath, TRUE ) then
       // 'Unable to open or create the Registry Key, %s.'
       raise Exception.CreateFmt( IQMS.Common.ResStrings.cTXT0000172, [ APath ]);
    WriteString( AKey, AValue );
  finally
    Free;
  end;
end;

function LoadStrFromCurrentUserRegistry( const APath, AKey: string ):string;
begin
  Result:= '';
  with TIQWebRegistry.Create do
  try
    RootKey:= HKEY_CURRENT_USER;
    if OpenKey( APath, FALSE ) and ValueExists( AKey ) then
       Result:= ReadString( AKey );
  finally
    Free;
  end;
end;

procedure SaveStrToLocalMachineRegistry( const APath, AKey, AValue: string );
begin
  with TIQWebRegistry.Create do
  try
    RootKey:= HKEY_LOCAL_MACHINE;
    if not OpenKey( APath, TRUE ) then
       // 'Unable to open or create the Registry Key, %s.'
       raise Exception.CreateFmt(IQMS.Common.ResStrings.cTXT0000172, [ APath ]);
    WriteString( AKey, AValue );
  finally
    Free;
  end;
end;

function LoadStrFromLocalMachineRegistry( const APath, AKey: string ):string;
begin
  Result:= '';
  with TIQWebRegistry.Create do
  try
    RootKey:= HKEY_LOCAL_MACHINE;
    if OpenKey( APath, FALSE ) and ValueExists( AKey ) then
       Result:= ReadString( AKey );
  finally
    Free;
  end;
end;

function CanWriteToRoot( ARootKey: HKey ): Boolean;
const
  cKey_Name = '\IQMS_PERMISSION_TEST';
var
  Reg: TIQWebRegistry;
begin
  Reg:= TIQWebRegistry.Create;
  try
    Reg.RootKey:= HKEY_CLASSES_ROOT;
    Result:= Reg.OpenKey( cKey_Name, TRUE ) and Reg.DeleteKey( cKey_Name );  {note we create and immediately delete that key on-fly}
  finally
    Reg.Free;
  end;
end;

function Is64Bit: Boolean;
type
  TIsWow64Process = function( // Type of IsWow64Process API fn
    Handle: THandle;
    var Res: BOOL
  ): BOOL; stdcall;
var
  IsWow64Result: BOOL;              // result from IsWow64Process
  IsWow64Process: TIsWow64Process;  // IsWow64Process fn reference
begin
   // Try to load required function from kernel32
   IsWow64Process := GetProcAddress( GetModuleHandle('kernel32'), 'IsWow64Process');
   if Assigned(IsWow64Process) then
      begin
         // Function is implemented: call it
         if not IsWow64Process(GetCurrentProcess, IsWow64Result) then
            raise Exception.Create('Bad process handle');
         // Return result of function
         Result := IsWow64Result;
      end
   else
      // Function not implemented: can't be running on Wow64
      Result := False;
end;

function RegPathSoftwareCheckWow6432Node:String;
begin
  Result:= 'SOFTWARE\';
  if Is64Bit then
    Result:= 'SOFTWARE\Wow6432Node\';
end;

function GetEnvVariable(Name: string; User: Boolean = True): string;
var
  Str: array[0..255] of char;
begin
  with TIQWebRegistry.Create do
  try
    if User then
    begin
      RootKey := HKEY_CURRENT_USER;
      //OpenKey('Environment', False);
      OpenKeyReadOnly('Environment');
    end
    else
    begin
      RootKey := HKEY_LOCAL_MACHINE;
      //OpenKey('SYSTEM\CurrentControlSet\Control\Session ' +
      //  'Manager\Environment', False);
      OpenKeyReadOnly('SYSTEM\CurrentControlSet\Control\Session ' +
        'Manager\Environment');
    end;
    Result := ReadString(Name);
    ExpandEnvironmentStrings(PChar(Result), Str, 255);
    Result := Str;
  finally
    Free;
  end;
end;

procedure SetEnvVariable(Name, Value: string; User: Boolean = TRUE);
var
  rv: DWORD;
begin
  with TIQWebRegistry.Create do
  try
   if User then
   begin
     RootKey := HKEY_CURRENT_USER;
     OpenKey('Environment', False);
     WriteString(Name, Value);
   end
   else
   begin
     RootKey := HKEY_LOCAL_MACHINE;
     OpenKey('SYSTEM\CurrentControlSet\Control\Session ' +
       'Manager\Environment', False);
   end;
   WriteString(Name, Value);
//   SendMessageTimeout(HWND_BROADCAST, WM_SETTINGCHANGE, 0, LParam
//     (PChar('Environment')), SMTO_ABORTIFHUNG, 5000, rv);
  finally
   Free;
  end;
end;


{ TIQWebRegistry }

procedure TIQWebRegistry.CloseKey;
begin
  FRegset_Route_KEY_PATH:= '';
end;

constructor TIQWebRegistry.Create;
begin
  inherited Create;
  FRegset_APPNAME  := ExtractFileName(Application.ExeName);
  FRegset_USERNAME := 'IQMS'; (*UG_rem_AMB*) //obviously this should get the current user logged in, not just IQMS.
end;

constructor TIQWebRegistry.CreateRO;
begin
  //just a placeholder
  Create;
end;

function TIQWebRegistry.DeleteKey(const Key: string): Boolean;
var
  aProc : TFDStoredProc;
  aKey : String;
begin
  Result := False;
  {
   procedure delete_key
    ( p_appname   varchar2,
      p_hkey      varchar2,
      p_key_path  varchar2 );
  }
  if (RootKeyStr = cnstHKCU) or (RootKeyStr = cnstHKLM) then
  begin
    aProc :=  TFDStoredProc.Create(nil);
    aKey := Key;
    with aProc do
    try
      ConnectionName:= cnstFDConnectionName;
      PackageName := cnstUserSettingsPackage;
      StoredProcName := 'DELETE_KEY';
      Prepare;
      ParamByName('p_appname'    ).Value := FRegset_APPNAME;
      ParamByName('p_hkey'       ).Value := RootKeyStr;
      ParamByName('p_key_path'   ).Value := aKey;
      ExecProc;
    finally
      Free;
    end;
    Result := True;
  end;
end;

destructor TIQWebRegistry.Destroy;
begin
end;


procedure TIQWebRegistry.GetKeyNames(Strings: TStrings);
begin
//  Example FOpenKeyStr: '\Software\IQMS\IQWin32\'
//  Returns:
//      '\Software\IQMS\IQWin32\FrmA\'
//      '\Software\IQMS\IQWin32\FrmA\Panel01\GridABC\'
//      '\Software\IQMS\IQWin32\FrmB\'
//      '\Software\IQMS\IQWin32\FrmC\'

  Strings.Clear;
  with TIQCommonDataServices.InitQuery(
    Format('select KEY_PATH '+
           '  from %s ROUTE '+
           '   inner join   '+
           '       %s HDR on ROUTE.%s_ID = HDR.ID '+
           ' where ROUTE.KEY_PATH like ''%s%%''   '+
           '   and ROUTE.KEY_PATH <> ''%s''       '+
           '   and HDR.USERNAME = ''%s''          '+
           '   and HDR.APPNAME  = ''%s''          '+
           ' order by ROUTE.id asc ',
    [ cnstUserSettingsRoutingTable,
      cnstUserSettingsMasterTable,
      cnstUserSettingsMasterTable,
      FRegset_Route_KEY_PATH,// + '%',
      FRegset_Route_KEY_PATH,
      FRegset_USERNAME,
      FRegset_APPNAME  ])) do
    while not EOF do
    begin
      Strings.Add(Fields[0].asString);
      Next;
    end;
end;

function TIQWebRegistry.GetRootKeyStr: String;
begin

  case RootKey of
    HKEY_CLASSES_ROOT:
      Result := cnstHKC;

    HKEY_CURRENT_USER:
      Result := cnstHKCU;

    HKEY_LOCAL_MACHINE:
      Result := cnstHKLM;

    HKEY_USERS:
      Result := cnstHKU;

    HKEY_CURRENT_CONFIG:
      Result := cnstHKCC;
  else
    Result:= cnstHKCU; //default
  end;

end;

procedure TIQWebRegistry.GetValueNames(Strings: TStrings);
begin
  Strings.Clear;
  with TIQCommonDataServices.InitQuery(
    Format('select KEY_NAME '+
           '  from %s VALS  '+
           '    inner join  '+
           '       %s ROUTE on VALS.%s_ID = ROUTE.ID '+
           '    inner join  '+
           '       %s HDR   on ROUTE.%s_ID = HDR.ID  '+
           ' where ROUTE.KEY_PATH = ''%s'' '+
           '   and HDR.USERNAME   = ''%s'' '+
           '   and HDR.APPNAME    = ''%s'' '+
           ' order by VALS.id asc ',

    [ cnstUserSettingsRoutingValuesTable,
      cnstUserSettingsRoutingTable, cnstUserSettingsRoutingTable,
      cnstUserSettingsMasterTable, cnstUserSettingsMasterTable,
      FRegset_Route_KEY_PATH,
      FRegset_USERNAME,
      FRegset_APPNAME  ])) do
    while not EOF do
    begin
      Strings.Add(Fields[0].asString);
      Next;
    end;
end;

function TIQWebRegistry.KeyExists(const Key: string): Boolean;
var
  aProc : TFDStoredProc;
  aKey : String;
begin
  Result := False;
 { function key_exists
     ( p_appname   varchar2,
       p_hkey      varchar2,
       p_key_path  varchar2 ) return number;
 }
 if (RootKeyStr = cnstHKCU) or (RootKeyStr = cnstHKLM) then
 begin
  aProc := TFDStoredProc.Create(nil);
  aKey := Key;
  with aProc do
  try
    ConnectionName:= cnstFDConnectionName;
    PackageName := cnstUserSettingsPackage;
    StoredProcName := 'KEY_EXISTS';
    Prepare;
    ParamByName( 'p_appname'    ).Value := FRegset_APPNAME;
    ParamByName( 'p_hkey'       ).Value := RootKeyStr;
    ParamByName( 'p_key_path'   ).Value := aKey;
    ExecProc;
    Result:= ParamByName('result').asInteger = 1;
  finally
    Free;
  end;
 end;
end;

function TIQWebRegistry.OpenKey(const Key: string; CanCreate: Boolean): Boolean;
begin
  Result := True;
  FRegset_Route_KEY_PATH:= Key;
end;

function TIQWebRegistry.OpenKeyReadOnly(const Key: String): Boolean;
begin
  Result := OpenKey(Key, True);
end;

function TIQWebRegistry.ReadBool(const Name: string): Boolean;
begin
  Result := ReadInteger(Name) <> 0;
end;

function TIQWebRegistry.ReadDate(const Name: string): TDateTime;
begin
  Result := ReadDateTime(Name);
end;

function TIQWebRegistry.ReadDateTime(const Name: string): TDateTime;
var
  s: string;
begin
  s := ReadString(Name);
  if not TryStrToDateTime(s, Result) then
    ReadError(Name);
end;

procedure TIQWebRegistry.ReadError(const Name: string);
begin
  raise Exception.CreateResFmt(@SInvalidRegType, [Name]);
end;

function TIQWebRegistry.ReadFloat(const Name: string): Double;
var
  s: string;
begin
  s := ReadString(Name);
  if not TryStrToFloat(s, Result) then
    ReadError(Name);
end;

function TIQWebRegistry.ReadInteger(const Name: string): Integer;
var
  s: string;
begin
  s := ReadString(Name);
  if not TryStrToInt(s, Result) then
    ReadError(Name);
end;

function TIQWebRegistry.ReadString(const Name: string): string;
var
  aProc : TFDStoredProc;
  aName, aValue, aRootKeystr : string;
begin
  Result:= '';

{ function read_string
    ( p_appname   varchar2,
      p_hkey      varchar2,
      p_key_path  varchar2,
      p_key_name  varchar2 ) return varchar2;
}
  aName:=   Name;
  aRootKeystr:= RootKeyStr;

 if (RootKeyStr = cnstHKCU) or (RootKeyStr = cnstHKLM) then
 begin
    aProc:=  TFDStoredProc.Create(nil);
    with aProc do
    try
      ConnectionName:= cnstFDConnectionName;
      PackageName := cnstUserSettingsPackage;
      StoredProcName := 'READ_STRING';
      Prepare;
      ParamByName('p_appname').Value := FRegset_APPNAME;
      ParamByName('p_hkey').Value := aRootKeyStr;
      ParamByName('p_key_path').Value  := FRegset_Route_KEY_PATH;
      ParamByName('p_key_name').Value  := aName;
      ExecProc;
      Result:= ParamByName('result').AsString;
      if String.IsNullOrEmpty(Result) then
        Result := '';
    finally
      Free;
    end;
 end;
end;

procedure TIQWebRegistry.SetRootKey(const Value: HKEY);
begin
  FRootKey := Value;
end;

function TIQWebRegistry.ValueExists(const Name: string): Boolean;
var
  aProc : TFDStoredProc;
  aName, aRootKeyStr : String;
begin
  Result:= False;
{ function value_exists
    ( p_appname   varchar2,
      p_hkey      varchar2,
      p_key_path  varchar2,
      p_key_name  varchar2 ) return number;
}
  if (RootKeyStr = cnstHKCU) or (RootKeyStr = cnstHKLM) then
  begin
    aProc := TFDStoredProc.Create(nil);
    aName := Name;
    aRootKeyStr := RootKeyStr;
    with aProc do
    try
      ConnectionName:= cnstFDConnectionName;
      PackageName := cnstUserSettingsPackage;
      StoredProcName := 'VALUE_EXISTS';
      Prepare;
      ParamByName('p_appname').Value := FRegset_APPNAME;
      ParamByName('p_hkey').Value := aRootKeyStr;
      ParamByName('p_key_path').Value := FRegset_Route_KEY_PATH;
      ParamByName('p_key_name').Value := aName;
      ExecProc;
      Result := ParamByName('result').Value = 1;
    finally
      Free;
    end;
  end;
end;

procedure TIQWebRegistry.WriteBool(const Name: string; Value: Boolean);
begin
  WriteInteger(Name, Integer(Value));
end;

procedure TIQWebRegistry.WriteDate(const Name: string; Value: TDateTime);
var
  aFmtDateTime : String;
begin
  DateTimeToString(aFmtDateTime, 'mm/dd/yyyy', Value);
  WriteString(Name, aFmtDateTime);
end;

procedure TIQWebRegistry.WriteDateTime(const Name: string; Value: TDateTime);
var
  aFmtDateTime : String;
begin
  DateTimeToString(aFmtDateTime, 'c', Value);
  WriteString(Name, aFmtDateTime);
end;

procedure TIQWebRegistry.WriteError(const Name: string);
begin
  raise Exception.CreateResFmt(@SInvalidRegType, [Name]);
end;

procedure TIQWebRegistry.WriteFloat(const Name: string; Value: Double);
begin
  WriteString(Name, FloatToStr(Value));
end;

procedure TIQWebRegistry.WriteInteger(const Name: string; Value: Integer);
begin
  WriteString(Name, IntToStr(Value));
end;

procedure TIQWebRegistry.WriteString(const Name, Value: string);
var
  aProc : TFDStoredProc;
  aName, aValue, aRootKeystr : string;
begin
  {
  procedure write_settings
  ( p_appname   varchar2,
    p_key_path  varchar2,
    p_key_name  varchar2,
    p_data_str  varchar2,
    p_hkey      varchar2 )

  }
  if (RootKeyStr = cnstHKCU) or (RootKeyStr = cnstHKLM) then
  begin
    aName:=   Name;
    aValue:=  Value;
    aRootKeystr:= RootKeyStr;
    aProc := TFDStoredProc.Create(nil);
    with aProc do
    try
      ConnectionName:= cnstFDConnectionName;
      PackageName := cnstUserSettingsPackage;
      StoredProcName := 'WRITE_SETTINGS';
      Prepare;
      ParamByName('p_appname').Value :=  FRegset_APPNAME;
      ParamByName('p_key_path').Value := FRegset_Route_Key_PATH;
      ParamByName('p_key_name').Value := aName;
      ParamByName('p_data_str').Value := aValue;
      ParamByName('p_hkey' ).Value := aRootKeystr;
      ExecProc;
    finally
      Free;
    end;
  end;
end;

end.


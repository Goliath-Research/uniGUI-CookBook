unit IQMS.Common.CreateOracleDSN;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.Common.Registry,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniEdit,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.VCLUI.Wait, Data.DB, Vcl.Controls;

type
  { TOracleVersion }
  TOracleVersion = (ovUnknown, ovOracle7, ovOracle8, ovOracle9i, ovOracle10G,
   ovOracle11G, ovOracle12C);

  { TDSNType }
  TDSNType = (snUnknown, snMicrosoftODBC, snOracleInstantClient,
   snDataDirectConnect, snDataDirectConnectWire);

  { TDSNCargo }
  TDSNCargo = class
   DriverDLL: String; // ODBC Driver DLL
   SetupDLL: String; // ODBC Configuration DLL
   DSNType: TDSNType; // We can automatically configure this driver
   constructor Create(ADriverDLL, ASetupDLL: String; ADSNType: TDSNType);
  end;

  { TFrmIQCreateDSN }
  TFrmIQCreateDSN = class(TUniForm)
    Panel1: TUniPanel;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    lblOraVersion: TUniLabel;
    cmbOraVersion: TUniComboBox;
    lblServer: TUniLabel;
    edtServer: TUniEdit;
    lblDriver: TUniLabel;
    cmbDriver: TUniComboBox;
    PnlButtonsInner: TUniPanel;
    btnCreate: TUniButton;
    edtDSNName: TUniEdit;
    Label1: TUniLabel;
    TestDatabase: TFDConnection;
    lblUserName: TUniLabel;
    lblPassword: TUniLabel;
    edtUserName: TUniEdit;
    edtPassword: TUniEdit;
    chkAutoLogin: TUniCheckBox;
    Bevel1: TUniPanel;
    Bevel2: TUniPanel;
    Label2: TUniLabel;
    edtSID: TUniEdit;
    procedure DoCreateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkAutoLoginClick(Sender: TObject);
    procedure DoLoginEditBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DoStandardCtrlKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    function ProcessExec: Boolean; // returns TRUE if succesful

    procedure InitOraVersion;
    procedure LoadDriverList;
    procedure SetControls;

    // Informational routines
    function OracleVersion: TOracleVersion;
    function DriverName: String;
    function DriverFileName: TFileName;
    function DSNType: TDSNType;
    function DSNDescription: String;
    function AutoLogin: Boolean;

    // Configuration routines
    procedure RemoveDSN;
    procedure ConfigureOracleDTC;
    procedure ConfigureMicrosoftODBCForOracle;
    procedure ConfigureOracleODBCInstant;
    procedure ConfigureDataDirectOracle;
    procedure AddDSNToDataSources;
    function TestDSN: Boolean;
    procedure ConfigureDataDirectOracleWire;
    function MSDTC_REGPATH: String;
    function WINDOWS_ODBC_DATASOURCES_REGPATH: String;
    function WINDOWS_ODBC_DRIVERS_REGPATH: String;
    function WINDOWS_ODBC_REGPATH: String;

  public
    { Public declarations }
  end;

  procedure DoCreateIQMSOracleDSN;

const
  //MSODBC_ORACLE_DRIVERNAME = 'Microsoft ODBC for Oracle';
  //ORACLE_INSTANT_DRIVERNAME = 'Oracle in iqms';
  //DATA_DIRECT_DRIVERNAME = 'DataDirect 5.3 Oracle';
  //DATA_DIRECT_WIRE_DRIVERNAME = 'DataDirect 5.3 Oracle Wire Protocol';

{
  MSDTC_REGPATH = '\SOFTWARE\Microsoft\MSDTC\MTxOCI\'; // HKEY_LOCAL_MACHINE
  WINDOWS_ODBC_REGPATH = '\SOFTWARE\ODBC\ODBC.INI\'; // HKEY_LOCAL_MACHINE
  WINDOWS_ODBC_DATASOURCES_REGPATH = '\SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources\'; // HKEY_LOCAL_MACHINE
  WINDOWS_ODBC_DRIVERS_REGPATH = '\SOFTWARE\ODBC\ODBCINST.INI\'; // HKEY_LOCAL_MACHINE
}

  Oracle8Dlls: array[0..2] of String = ('oraclient8.dll','orasql8.dll','oci.dll');
  Oracle9Dlls: array[0..2] of String = ('oraclient9.dll','orasql9.dll','oci.dll');
  Oracle10GDlls: array[0..2] of String = ('oraclient10.dll','orasql10.dll','oci.dll');
  Oracle11GDlls: array[0..2] of String = ('oraclient11.dll','orasql11.dll','oci.dll');
  Oracle12CDlls: array[0..2] of String = ('oraclient12.dll','orasql12.dll','oci.dll');

resourcestring
  cDSN_Name = 'IQMS Database';
  cTXT000001 = 'The required ODBC driver could not be found:';
  cTXT000002 = 'Cannot find driver DLL file:';
  cTXT000003 = 'Done!  DSN created successfully.';
  cTXT000004 = 'DSN created, but test failed.  Please check your DLL.';
  //cTXT000005 = 'Test ODBC Connection';
  cTXT000006 = 'Connection to the %s database.';
  cTXT000007 = 'The new datasource was created, but is not in the list of recognized DSNs.  '#13 +
               'Please ensure the ODBC driver has been registered.';
var
  FrmIQCreateDSN: TFrmIQCreateDSN;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils;

procedure DoCreateIQMSOracleDSN;
begin
  TFrmIQCreateDSN.Create(uniGUIApplication.UniApplication).ShowModal;
end;

{ TDSNCargo }

constructor TDSNCargo.Create(ADriverDLL, ASetupDLL: String;
 ADSNType: TDSNType);
begin
  DriverDLL := ADriverDLL;
  SetupDLL := ASetupDLL;
  DSNType := ADSNType;
end;

{ TFrmIQCreateDSN }

procedure TFrmIQCreateDSN.FormCreate(Sender: TObject);
begin
  cmbDriver.ItemIndex := 0;
  edtServer.Text := IQMS.Common.Miscellaneous.IQGetServerName; // 'IQORA';
  edtSID.Text := SelectValueAsString('SELECT UPPER(instance_name) AS sid FROM v$instance WHERE ROWNUM < 2');

  //cmbOraVersion.ItemIndex := 1;
  InitOraVersion;
  edtDSNName.Text := cDSN_Name;
  SetControls;

  // The following is currently unused because we have a hard-coded
  // list of supported drivers.
  LoadDriverList;
end;

procedure TFrmIQCreateDSN.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmIQCreateDSN.InitOraVersion;
var
   S: String;
   i, x: Integer;
begin
   S := SelectValueAsString('SELECT version FROM v$instance');
   S := IQMS.Common.StringUtils.GetToken(S, '.', 1);
   i := 1;
   if IQMS.Common.Numbers.IsStringValidInteger(S,i) then
      begin
        case i of
         8:  x := 0;
         9:  x := 1;
         10: x := 2;
         11: x := 3;
         12: x := 4;
        else x := 4;
        end;
        cmbOraVersion.ItemIndex := x;
      end;
end;

procedure TFrmIQCreateDSN.DoCreateClick(Sender: TObject);
begin
  if ProcessExec then
     Close;  // close the form; we're done
end;

function TFrmIQCreateDSN.OracleVersion: TOracleVersion;
begin
  case cmbOraVersion.ItemIndex of
  0: Result := ovOracle8; //Oracle 8
  1: Result := ovOracle9i; // Oracle 9i
  2: Result := ovOracle10G; // Oracle 10g
  3: Result := ovOracle11G; // Oracle 11g
  4: Result := ovOracle12C; // Oracle 12c
  else Result := ovUnknown;
  end;
end;

function TFrmIQCreateDSN.DSNDescription: String;
begin
  // 'Connection to the %s database.'
  Result := Format(cTXT000006, [edtServer.Text]);
end;

function TFrmIQCreateDSN.DriverName: String;
begin
  // The name of the driver
  Result := cmbDriver.Text;
end;

function TFrmIQCreateDSN.DriverFileName: TFileName;
var
   AOracleHome: String;
begin
  // Returns the driver DLL file name

  // Initialize
  Result := '';

  if (cmbDriver.ItemIndex > -1) and
     Assigned(cmbDriver.Items.Objects[cmbDriver.ItemIndex]) then
     Result := TDSNCargo(cmbDriver.Items.Objects[cmbDriver.ItemIndex]).DriverDLL;

  {NOTE:  The standard driver msorcl32.dll in the System directory.  The System
          directory might be under WINNT or Winapi.Windows, depending on operating
          system.  Normally, msorcl32.dll should work, but sometimes it does
          not.  The SQORA32.DLL in 'C:\oracle\iqms\BIN\' will also work as a
          driver.}

  {case DSNType of
   snMicrosoftODBC: Result := IQMS.Common.Miscellaneous.GetSpecialPath(evSystem) + 'msorcl32.dll';
   snOracleInstantClient: begin
        // Get the Oracle home path
        AOracleHome := LoadStrFromLocalMachineRegistry('\Software\Oracle','ORACLE_HOME');
        if (AOracleHome > '') and DirectoryExists(AOracleHome) then
           Result := iqfile.GetDirectoryName(AOracleHome) + 'BIN\SQORA32.DLL';
      end;
  else
    Result := cmbDriver.Text;
  end; // end case }

end;

function TFrmIQCreateDSN.DSNType: TDSNType;
begin
  // Returns user selected DSN type
  Result := snUnknown; // default
  if (cmbDriver.ItemIndex > -1) and
     Assigned(cmbDriver.Items.Objects[cmbDriver.ItemIndex]) then
     Result := TDSNCargo(cmbDriver.Items.Objects[cmbDriver.ItemIndex]).DSNType;
end;

function TFrmIQCreateDSN.ProcessExec: Boolean;
begin
  // let button click finish
  Application.ProcessMessages;

  try
     // disable controls temporarily
     IQMS.Common.Controls.IQEnableControl([edtDSNName,cmbOraVersion,cmbDriver,btnCreate],FALSE);
     // initial
     Result := FALSE;

     RemoveDSN;

     // Configure the way Oracle connects through ODBC
     ConfigureOracleDTC;

     // Create the "Microsoft ODBC for Oracle" DSN
     case DSNType of
      snMicrosoftODBC: ConfigureMicrosoftODBCForOracle;
      snOracleInstantClient: ConfigureOracleODBCInstant;
      snDataDirectConnect: ConfigureDataDirectOracle;
      snDataDirectConnectWire: ConfigureDataDirectOracleWire;
     else raise Exception.Create('Application Error:  DSN Type unknown.');
     end;


     // Add the new DSN to the list of data sources
     AddDSNToDataSources;

     // Now, test the connection
     Result := TestDSN;

  finally
     // enable controls
     IQMS.Common.Controls.IQEnableControl([edtDSNName,cmbOraVersion,cmbDriver,btnCreate],TRUE);
  end;
end;

function TFrmIQCreateDSN.TestDSN: Boolean;
var
   AList: TStringList;
   ASession: TFDManager;
begin
  // Test the connection

  ASession := NIL;

  with TestDatabase do
  try
     // Ensure we are disconnected
     if Connected then Connected := FALSE;
     Params.Clear;
     Params.Add('DriverID=Ora');
     Params.Add(Format('Database=%s',[edtDSNName.Text]));
     Params.Add(Format('User_Name=%s', [edtUserName.Text]));
     Params.Add(Format('Password=%s', [edtPassword.Text]));
     LoginPrompt := not AutoLogin;

     AList:= TStringList.Create;
     ASession.GetConnectionDefNames(AList);
     if AList.IndexOf(edtDSNName.Text) = -1 then
        {'The new datasource was created, but is not in the list of recognized DSNs.  '#13 +
         'Please ensure the ODBC driver has been registered.'}
        raise Exception.Create(cTXT000007);

     Connected := True;

     // Finally, pass result to our function
     Result := Connected;

     // Inform the user of the result
     if Result then
        IQInformation(cTXT000003 {'Done!  DSN created successfully.'})
     else
        IQError(cTXT000004 {'DSN created, but test failed.  Please check your DLL.'});
  finally
    //Free; // Free database connection
    if Connected then Connected := FALSE;



    if (ASession <> NIL) and Assigned(ASession) then
       ASession.Free;

  end;
end;

procedure TFrmIQCreateDSN.AddDSNToDataSources;
begin
  // This method adds a DSN to the list of Data Sources that will appear
  // in login screens and in the ODBC Administrator.  It is not enough to
  // add the DSN configuration to the Registry; it must also be listed
  // among the datasources.
  with TIQWebRegistry.Create do
  try
     RootKey := HKEY_LOCAL_MACHINE; // TRegistry
     if OpenKey(WINDOWS_ODBC_DATASOURCES_REGPATH, FALSE) then
        WriteString(edtDSNName.Text, DriverName);
     CloseKey;
  finally
     Free;
  end;
end;

procedure TFrmIQCreateDSN.ConfigureOracleDTC;
begin
  // Modify Registry
  with TIQWebRegistry.Create do
  try
     RootKey := HKEY_LOCAL_MACHINE; // TRegistry

     // Ensure the correct DLL's are being used for this Oracle version
     // These lines amount to a configuration of how Oracle uses ODBC.
     if OpenKey(MSDTC_REGPATH, FALSE) then
        begin
         case OracleVersion of
          ovOracle8: // Oracle 8
            begin
              WriteString('OracleXaLib',  Oracle8Dlls[0]);
              WriteString('OracleSqlLib', Oracle8Dlls[1]);
              WriteString('OracleOciLib', Oracle8Dlls[2]);
            end;
          ovOracle9i: // Oracle 9i
            begin
              WriteString('OracleXaLib',  Oracle9Dlls[0]);
              WriteString('OracleSqlLib', Oracle9Dlls[1]);
              WriteString('OracleOciLib', Oracle9Dlls[2]);
            end;
          ovOracle10G: // Oracle 10G
            begin
              WriteString('OracleXaLib',  Oracle10GDlls[0]);
              WriteString('OracleSqlLib', Oracle10GDlls[1]);
              WriteString('OracleOciLib', Oracle10GDlls[2]);
            end;
          ovOracle11G: // Oracle 11G
            begin
              WriteString('OracleXaLib',  Oracle11GDlls[0]);
              WriteString('OracleSqlLib', Oracle11GDlls[1]);
              WriteString('OracleOciLib', Oracle11GDlls[2]);
            end;
          ovOracle12C: // Oracle 12C
            begin
              WriteString('OracleXaLib',  Oracle12CDlls[0]);
              WriteString('OracleSqlLib', Oracle12CDlls[1]);
              WriteString('OracleOciLib', Oracle12CDlls[2]);
            end;
          end; // end case
        end;

     CloseKey;

  finally
    Free;
  end;
end;

procedure TFrmIQCreateDSN.ConfigureMicrosoftODBCForOracle;
var
   ADSNName: String;
   ADriverFileName: TFileName;
begin
  // Get values for use in configuration
  ADSNName := edtDSNName.Text;
  ADriverFileName := DriverFileName;
  if not FileExists(ADriverFileName) then
     raise Exception.Create(cTXT000002 {'Cannot find driver DLL file:'} + #13#13 + ADriverFileName);

  // Modify Registry
  with TIQWebRegistry.Create do
  try
     RootKey := HKEY_LOCAL_MACHINE; // TRegistry

     // Add the DSN details
     if OpenKey(WINDOWS_ODBC_REGPATH, FALSE) and
        OpenKey(WINDOWS_ODBC_REGPATH + ADSNName, TRUE) then
        begin
         WriteString('Driver', ADriverFileName);
         WriteString('DSN', ADSNName);
         WriteString('Description', DSNDescription);
         WriteString('GuessTheColDef', '0');
         WriteString('PWD', sIIf(AutoLogin, UpperCase(edtPassword.Text), ''));
         WriteString('Remarks', '0');
         WriteString('SERVER', edtServer.Text);
         WriteString('BufferSize', '65535');
         WriteString('StdDayOfWeek', '1');
         WriteString('StripTrailingZero', '0');
         WriteString('SynonymColumns', '1');
         WriteString('Trusted_Connection', 'Yes');
         WriteString('UID', sIIf(AutoLogin, UpperCase(edtUserName.Text), ''));
        end;

     CloseKey;

  finally
    Free;
  end;

end;

procedure TFrmIQCreateDSN.ConfigureOracleODBCInstant;
var
   ADSNName: String;
   ADriverFileName: TFileName;
begin

  // Get values for use in configuration
  ADSNName := edtDSNName.Text;
  ADriverFileName := DriverFileName;
  if not FileExists(ADriverFileName) then
     raise Exception.Create(cTXT000002 {'Cannot find driver DLL file:'} + #13#13 + ADriverFileName);

  // Modify Registry
  with TIQWebRegistry.Create do
  try
     RootKey := HKEY_LOCAL_MACHINE; // TRegistry

     // Add the DSN details
     if OpenKey(WINDOWS_ODBC_REGPATH, FALSE) and
        OpenKey(WINDOWS_ODBC_REGPATH + ADSNName, TRUE) then
        begin

         WriteString('Driver', 'C:\oracle\iqms\BIN\SQORA32.DLL');
         WriteString('Translation DLL', '');
         WriteString('Translation Option', '0');
         WriteString('Attributes', 'W');
         WriteString('PrefetchCount', '10');
         WriteString('ForceWCHAR', 'F');  // * T
         WriteString('FailoverDelay', '10');
         WriteString('FailoverRetryCount', '10');
         WriteString('MetadataIdDefault', 'F');
         WriteString('Longs', 'T');
         WriteString('CloseCursor', 'T');
         WriteString('EXECSchemaOpt', '');
         WriteString('EXECSyntax', 'F');
         WriteString('Application Attributes', 'T');
         WriteString('SQLGetData extensions', 'T');
         WriteString('ResultSets', 'T');
         WriteString('QueryTimeout', 'T');
         WriteString('Failover', 'T');
         WriteString('Lobs', 'T');
         WriteString('DisableMTS', 'F');
         WriteString('BatchAutocommitMode', 'AllSuccessful');
         WriteString('Description', DSNDescription);
         WriteString('ServerName', edtServer.Text);
         WriteString('Password', sIIf(AutoLogin, UpperCase(edtPassword.Text), ''));
         WriteString('UserID', sIIf(AutoLogin, UpperCase(edtUserName.Text), ''));
         WriteString('DSN', ADSNName);

         {WriteString('DisableRULEHint', 'T');
         WriteString('FetchBufferSize', '64000');
         WriteString('NumericSetting', 'NLS');
         WriteString('BindAsFLOAT', 'F');
         WriteString('BindAsDATE', 'F');
         WriteString('DisableDPM', 'F'); }

        end;

     CloseKey;

  finally
    Free;
  end;

end;

procedure TFrmIQCreateDSN.ConfigureDataDirectOracle;
var
   ADSNName: String;
   ADriverFileName: TFileName;
begin
  // Get values for use in configuration
  ADSNName := edtDSNName.Text;
  ADriverFileName := DriverFileName;
  if not FileExists(ADriverFileName) then
     raise Exception.Create(cTXT000002 {'Cannot find driver DLL file:'} + #13#13 + ADriverFileName);

  // Modify Registry
  with TIQWebRegistry.Create do
  try
     RootKey := HKEY_LOCAL_MACHINE; // TRegistry

     // Add the DSN details
     if OpenKey(WINDOWS_ODBC_REGPATH, FALSE) and
        OpenKey(WINDOWS_ODBC_REGPATH + ADSNName, TRUE) then
        begin
         WriteString('AlternateServers', '');
         WriteString('ApplicationUsingThreads', '1');
         WriteString('ArraySize', '60000');
         WriteString('CatalogIncludesSynonyms', '1');
         WriteString('CatalogOptions', '0');
         WriteString('ClientVersion', cmbOraVersion.Text);
         WriteString('ConnectionRetryCount', '1');
         WriteString('ConnectionRetryDelay', '3');
         WriteString('DefaultLongDataBuffLen', '1024');
         WriteString('DescribeAtPrepare', '0');
         WriteString('Description', 'Data Direct Connect Oracle Driver');
         WriteString('Driver', 'C:\Program Files\DataDirect\ODBC32v53\Drivers\IVOR823.DLL');
         WriteString('EnableDescribeParam', '0');
         WriteString('EnableNcharSupport', '0');
         WriteString('EnableScrollableCursors', '0');
         WriteString('EnableStaticCursorsForLongData', '0');
         WriteString('EnableTimestampWithTimeZone', '0');
         WriteString('LoadBalancing', '0');
         WriteString('LocalTimeZoneOffset', '');
         WriteString('LockTimeOut', '-1');
         WriteString('LogonID', sIIf(AutoLogin, UpperCase(edtUserName.Text), ''));
         WriteString('OptimizeLongPerformance', '0');
         WriteString('ProcedureRetResults', '0');
         WriteString('ReportCodepageConversionErrors', '0');
         WriteString('ReportRecycleBin', '0');
         WriteString('ServerName', edtServer.Text);
         WriteString('Servers', '');
         WriteString('TimestampEscapeMapping', '');
         WriteString('UseCurrentSchema', '1');
        end;

     CloseKey;

  finally
    Free;
  end;


end;

procedure TFrmIQCreateDSN.ConfigureDataDirectOracleWire;
var
   ADSNName: String;
   ADriverFileName: TFileName;
begin
  // Get values for use in configuration
  ADSNName := edtDSNName.Text;
  ADriverFileName := DriverFileName;
  if not FileExists(ADriverFileName) then
     // 'Cannot find driver DLL file:'
     raise Exception.Create(cTXT000002 + #13#13 + ADriverFileName);

  // Modify Registry
  with TIQWebRegistry.Create do
  try
     RootKey := HKEY_LOCAL_MACHINE; // TRegistry

     // Add the DSN details
     if OpenKey(WINDOWS_ODBC_REGPATH, FALSE) and
        OpenKey(WINDOWS_ODBC_REGPATH + ADSNName, TRUE) then
        begin
         WriteString('Driver', ADriverFileName);
         WriteString('ArraySize', '60000');
         WriteString('CatalogOptions', '0');
         WriteString('Description', '');
         WriteString('LockTimeOut', '-1');
         WriteString('LogonID', '');
         WriteString('ProcedureRetResults', '0');
         WriteString('HostName', '');
         WriteString('ServerName', '');
         WriteString('TNSNamesFile', '');
         WriteString('PortNumber', '');
         WriteString('SID', edtSID.Text);
         WriteString('ServiceName', '');
         WriteString('EnableStaticCursorsForLongData', '0');
         WriteString('CatalogIncludesSynonyms', '1');
         WriteString('UseCurrentSchema', '1');
         WriteString('ApplicationUsingThreads', '1');
         WriteString('EnableScrollableCursors', '1');
         WriteString('EnableDescribeParam', '0');
         WriteString('DefaultLongDataBuffLen', '1024');
         WriteString('LocalTimeZoneOffset', '');
         WriteString('EnableNcharSupport', '0');
         WriteString('EnableTimestampWithTimeZone', '0');
         WriteString('ReportRecycleBin', '0');
         WriteString('DescribeAtPrepare', '0');
         WriteString('CachedCursorLimit', '32');
         WriteString('CachedDescLimit', '0');
         WriteString('LoadBalancing', '0');
         WriteString('ConnectionRetryCount', '0');
         WriteString('ConnectionRetryDelay', '3');
         WriteString('AlternateServers', '');
         WriteString('ReportCodepageConversionErrors', '0');
         WriteString('TimestampEscapeMapping', '0');
         WriteString('ServerType', '0');
         WriteString('WireProtocolMode', '1');
         WriteString('GSSClient', 'native');
         WriteString('AuthenticationMethod', '1');
         WriteString('EncryptionMethod', '0');
         WriteString('TrustStore', '');
         WriteString('TrustStorePassword', '');
         WriteString('KeyStore', '');
         WriteString('KeyStorePassword', '');
         WriteString('KeyPassword', '');
         WriteString('HostNameInCertificate', '');
         WriteString('ValidateServerCertificate', '1');
         WriteString('InitializationString', '');
        end;

     CloseKey;

  finally
    Free;
  end;


end;

procedure TFrmIQCreateDSN.RemoveDSN;
var
   ADSNName, AKey: String;
begin
  if DriverName = '' then Exit;

  ADSNName := edtDSNName.Text;

  if ADSNName = '' then Exit;

  with TIQWebRegistry.Create do
  try
     RootKey := HKEY_LOCAL_MACHINE; // TRegistry

     // Remove the DSN list reference
     if OpenKey(WINDOWS_ODBC_DATASOURCES_REGPATH, FALSE) and
        ValueExists(ADSNName) then
        begin
          DeleteKey(ADSNName);
          CloseKey;
        end;

     // Remove the DSN configuration
     AKey := WINDOWS_ODBC_REGPATH + ADSNName;
     if OpenKey(AKey, FALSE) then
        begin
          CloseKey;
          DeleteKey(AKey);
        end;

     CloseKey;
  finally
     Free;
  end;

end;

procedure TFrmIQCreateDSN.chkAutoLoginClick(Sender: TObject);
begin
  Application.ProcessMessages;
  SetControls;
end;

procedure TFrmIQCreateDSN.SetControls;
begin
  IQMS.Common.Controls.IQEnableControl([lblUserName,lblPassword,edtUserName,edtPassword],chkAutoLogin.Checked);
end;

function TFrmIQCreateDSN.AutoLogin: Boolean;
begin
  Result := chkAutoLogin.Checked and
            (Trim(edtUserName.Text) > '') and
            (Trim(edtPassword.Text) > '');
end;

procedure TFrmIQCreateDSN.DoLoginEditBoxKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) and
     (AutoLogin and (Trim(edtUserName.Text) > '') and (Trim(edtPassword.Text) > '')) then
     begin
       DoCreateClick(Sender);
       Key := 0;
     end;
end;

procedure TFrmIQCreateDSN.DoStandardCtrlKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     begin
       DoCreateClick(Sender);
       Key := 0;
     end;
end;

procedure TFrmIQCreateDSN.LoadDriverList;
const
 REG_PATH = '';

var
   AKeys: TStringList;
   i: Integer;
   ADSNType: TDSNType;
   APath,
   ACaption, ADriverDLL, ASetupDLL: String;

   // --------------------------------------------------------------------------
   procedure _AddDSN;
   begin
    cmbDriver.Items.AddObject(ACaption, TDSNCargo.Create(ADriverDLL, ASetupDLL, ADSNType));
   end;
   // --------------------------------------------------------------------------
   function _SupportedDrv: TDSNType;
   var
      ADLL: String;
   begin
     // initial
     Result := snUnknown;

     // get DLL file name
     ADLL := ExtractFileName(ADriverDLL);

     // Eval
     if (UpperCase(IQMS.Common.StringUtils.LeftStr(ADLL, 8)) = 'MSORCL32') then // Microsoft
        begin
          Result := snMicrosoftODBC;
          Exit;
        end;

     if (UpperCase(IQMS.Common.StringUtils.LeftStr(ADLL, 7)) = 'SQORA32') then // Oracle ODBC
        begin
          Result := snOracleInstantClient;
          Exit;
        end;

     if (UpperCase(IQMS.Common.StringUtils.LeftStr(ADLL, 5)) = 'IVORA') then // DataDirect Connect
        begin
          Result := snDataDirectConnectWire;
          Exit;
        end;

     if (UpperCase(IQMS.Common.StringUtils.LeftStr(ADLL, 4)) = 'IVOR') then // DataDirect Connect
        begin
          Result := snDataDirectConnect;
          Exit;
        end;

   end;
   // --------------------------------------------------------------------------
begin
  // initial
  AKeys := NIL;

  // Cycle Registry keys and add list of potential, Oracle ODBC drivers
  with TIQWebRegistry.Create do
  try
     // holder for key names
     AKeys := TStringList.Create;

     RootKey := HKEY_LOCAL_MACHINE; // TRegistry

     if OpenKey(WINDOWS_ODBC_DRIVERS_REGPATH, FALSE) then
        begin
         GetKeyNames(AKeys);
         for i := 0 to AKeys.Count - 1 do
          begin
            APath := Format( '%s\%s', [WINDOWS_ODBC_DRIVERS_REGPATH, AKeys[i]]);
            // The SQLLevel must = 1
            if OpenKey(APath, FALSE)
               and (ReadString('SQLLevel') = '1')
               and (ReadString('APILevel') = '1') then
               begin
                 // Get values
                 ACaption := AKeys[i]; // Driver Name
                 ADriverDLL := ExpandEnvironment(ReadString('Driver')); // ODBC Driver
                 ASetupDLL := ReadString('Setup'); // Setup DLL
                 ADSNType := _SupportedDrv;
                 if ADSNType <> snUnknown then
                    // Add to the list
                    _AddDSN;
               end;
          end;
        end;
     CloseKey;
  finally
     Free;
     if Assigned(AKeys) then AKeys.Free;
  end;

  // select the first one
  if (cmbDriver.Items.Count > 0) then
     cmbDriver.ItemIndex := 0;

end;

function TFrmIQCreateDSN.MSDTC_REGPATH:String;
begin
  Result:= IQMS.Common.StringUtils.strTran(Format(
  '\%s\Microsoft\MSDTC\MTxOCI\',
                   [ IQMS.Common.Registry.RegPathSoftwareCheckWow6432Node ] ), '\\','\'); // HKEY_LOCAL_MACHINE
end;

function TFrmIQCreateDSN.WINDOWS_ODBC_REGPATH:String;
begin
  Result:= IQMS.Common.StringUtils.strTran(Format(
  '\%s\ODBC\ODBC.INI\',
                   [ IQMS.Common.Registry.RegPathSoftwareCheckWow6432Node ]), '\\','\'); // HKEY_LOCAL_MACHINE
end;

function TFrmIQCreateDSN.WINDOWS_ODBC_DATASOURCES_REGPATH:String;
begin
  Result:= IQMS.Common.StringUtils.strTran(Format(
  '\%s\ODBC\ODBC.INI\ODBC Data Sources\',
                   [ IQMS.Common.Registry.RegPathSoftwareCheckWow6432Node ]), '\\','\') ; // HKEY_LOCAL_MACHINE
end;

function TFrmIQCreateDSN.WINDOWS_ODBC_DRIVERS_REGPATH:String;
begin
  Result:= IQMS.Common.StringUtils.strTran(Format(
  '\%s\ODBC\ODBCINST.INI\',
                   [ IQMS.Common.Registry.RegPathSoftwareCheckWow6432Node ]), '\\','\') ; // HKEY_LOCAL_MACHINE
end;

end.

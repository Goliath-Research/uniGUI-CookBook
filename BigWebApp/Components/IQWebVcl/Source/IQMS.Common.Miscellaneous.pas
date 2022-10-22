{ TODO
  ResetConnection - uncomment EnsureCurrentIQMSPassword when unit is converted to FireDAC

}

unit IQMS.Common.Miscellaneous;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, DB, ExtCtrls, DBCtrls, Printers,
  Menus, RichEdit, IQMS.Common.Registry, ShellAPI, ShlObj, SyncObjs,
//  wwriched,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Stan.Param, FireDAC.Phys, FireDAC.Phys.Intf,
  FireDAC.DatS, FireDAC.DApt, FireDAC.DApt.Intf, FireDAC.UI.Intf,
  FireDAC.Phys.OracleWrapper, IQMS.Common.DataConst;

const
  SKIP_SEQ_CANCEL = 'CANCEL';
  SKIP_SEQ_CHANGE = 'CHANGE';
  SKIP_SEQ_ERROR  = 'ERROR';
  SKIP_SEQ_DELETE = 'DELETE'; 

type  
  TWebUserType = (utUnknown, utCustomer, utSupplier, utEmployee);
  TSpecialFolder = ( evWindows, evSystem, evTemp, evProgramFiles,
                     evPrograms, evProgramsCommon,                     
                     evStartMenu, evStartMenuCommon,
                     evDesktop,  evDesktopCommon,
                     evFavorites, evPersonal {a.k.a., My Documents},
                     evNetHood, evFonts, evTemplates );

function IQGetUID(const AConnectionName: string = 'IQFD'):string;
function IQGetServerName(const AConnectionName: string = 'IQFD'):string;
function IQGetPassword(const AConnectionName: string = 'IQFD'):string;
function ServerNameByAlias( const AALiasName: string ):string; deprecated 'Obsolete method.'
function GetServerNameParam(const AConnection: TFDConnection): string;

function Is_Center_RT( nCntrID: Real ):Boolean;
function IsWinNT4 : Boolean;
procedure IQPrintRichEdit(RE:TRichEdit; const Caption:String);
//procedure IQPrintWWdbRichEdit(RE:TwwDBRichEdit; const Caption:String);

// Does the Oracle database support Unicode?
function IsOracleUnicode: Boolean;
function GetOracleLanguage: string;
function GetOracleTerritory: string;
function GetOracleCharSet: string;

procedure WriteEventLog( s:string; DB: string = 'IQFD' );
procedure WriteEventLogEx( AClass, AText: string; DB: string = 'IQFD' );
procedure WriteEventLogFmt( const S : string; const Args : array of const );

function GetDefaultGLYear:Real;
procedure ShowID( var Key: Word; Shift: TShiftState; DataSet: TDataSet; ADataSetName: string = '' );
function MutexAppRun( const CommandLine: string; const MutexName: string ): Integer;
function IsModal( AForm: TForm ):Boolean;
function IQGetReportsPath:string;
function IQGetImagesPath:string;
function IQGetLocalHomePath:string;
function IQGetMasterHomePath:string;
function IQGetUNCMasterHomePath:string;
function IQGetSmartPageHomePath:string;
function IQGetIISServerBaseURL:string;
function IQGetIISServerBaseURLWebDirect:string;
function IQGetHelpPath:string;
function IQInvokedLocaly:Boolean;
function IQGetCRWDate(ADate:TDateTime):String;
function IQGetEMailAddr( DB: string = 'IQFD' ): string;
function IQGetEMailSMTPServerName( DB: string = 'IQFD' ): string;
function IQUseOutlook( DB: string = 'IQFD' ): Boolean;
function IQUseLotusNotes( DB: string = 'IQFD' ): Boolean;
function IQUseSMTPOnly( DB: string = 'IQFD' ): Boolean;
function IQSMTPSettingsAssigned( DB: string = 'IQFD' ): Boolean;
function IQGetCountryCode_2Char: string;
function IQGetCountryCode_3Char: string;
function IQGetCountryCode_3Digit: string;
procedure IQGetCountryCode(var ACountry, A2Char, A3Char: string;
 var A3Digit: Integer);
function IQGetState: string;

function IQGetGlobalSetting(const ASetting: String; var AValue: String): Boolean;
procedure IQSetGlobalSetting(const ASetting, AValue: String);
function ExecuteProgramW( const AFileName: String; const AShowOption: Integer = SW_SHOWDEFAULT;
                         const ACommandLineParameters: PWideChar = NIL ): Boolean;
function ExecuteProgram( const AFileName: String; const AShowOption: Integer = SW_SHOWDEFAULT;
                         const ACommandLineParameters: PAnsiChar = NIL ): Boolean;

function ExecuteProgramExA( ACommandLine: string ): Integer;
function ExecuteProgramExB( ACommandLine: string; AWait: Boolean ): Integer;
procedure OpenWith_NotePad(AFileName: string);
procedure OpenWith_MSWord(AFileName: string);

procedure IQAssert( ACondition: Boolean; AMesg: string );
function LoadWNetComputersNames( AList: TStrings; ANetResource: PNetResource ): DWord;
function GetLocalComputerName : string;

procedure Record_Skipped_Seq(AModule, ATable, AField, AValue, ANewValue, AAction:String);

procedure IQDeleteUser( AUserName: string );
procedure IQWebGrant( AUserName, ATableName: string; AToGrant: Boolean = TRUE );
// function GetWebUserType: TWebUserType;
function GetWebRepDefApp_ID( AArcusto_ID: Real; AUserType: TWebUserType = utCustomer ): string;

function GetRandomID: string;
function GetRandomName: string;
function GetTempFileName(const AExt: string): string;

function IQGetAppServerURL( DataBaseName: string = cnstFDConnectionName ): string;

procedure ResetConnection( ADB: string = 'IQFD' );
function EnsureConnectionExists( ADB: string = 'IQFD' ): Boolean;
function CheckResetCursorOver( APercent: Real ): Boolean;

//procedure AssignBDEConfig( ASetting: string; DB: string = 'IQ' );
function IsEIQInvokedByJumpFile: Boolean;

{Special Folders.
 Returns path to special folder (see enumerated type declaration above).
 Examples:
     S := GetSpecialPath( evWindows );
     S := GetSpecialPath( evSystem );
     S := GetSpecialPath( evTemp );
     ...
}
function GetSpecialPath( AFolder: TSpecialFolder ): String;

{ This method returns a prior path.
  For example:
    IN:   C:\My Documents\IQMS Documents\
    OUT:  C:\My Documents\
}
function GetPriorPath(const ADirectory: String): String;

{Support for bookmark files from windows explorer and web browser}
procedure RegisterFileType( AExtension, AFiletype, ADescription, AVerb, AServerApp: string );
procedure UnRegisterFileType( AExtension, AFiletype: string );
function FileTypeIsRegistered( AExtension, AFiletype: string ): Boolean;
procedure EnsureExistsInTrustedZone( AURLType, AServerName: string );
function EnsureMasterHomeIsMapped: Integer;
procedure ChangeWindowsDefaultPrinter(const APrinterName: string) ;
function GetPrinterJobsCount( APrinterName: string = ''): Integer; 
procedure EnsureZeroJobsInPrintQueue;
function ExpandEnvironment(const strValue: string): string;

function ExtractInLineParam( AParamName: string; var AValue: string ): Boolean;
function SmartPageWantsLauncherHidden: Boolean;
procedure CheckSmartPageMakeLauncherHidden(AImmediate: Boolean = FALSE);
function IsWindowsVista: Boolean;   
function IgnoreCOMRaisedEAbort(E: Exception): Boolean;

procedure Delay(dwMilliseconds: LongInt; AMessage: String = '');
function GetIndexNameFromForeignKeyConstraint( AParentTableName, AChildTableName: string; var AIndexName: string ): Boolean;

function GetLongPathName(const ShortPath: String): String;
function GetOSAuthenticationUserName:String;

// Returns true if Internet Explorer is installed
function IE_Installed: Boolean;
procedure CheckRTBOXUserCreated( ADatabase: string = 'IQFD' );
procedure EnsureCurrentIQMSPassword( ADBase: TFDConnection; A_Alias:String = 'IQORA' );

// Prompt user to "Cancel changes?"
procedure CheckCancelChanges;

//Oracle queries
function UserHasWebDirectRole( AUserID : string ) : boolean;

procedure ValidateColumnName( AColumnName: string );
procedure ValidateComponentName( AName: string );
function IQUseIISGateway( DB: string = 'IQFD' ): Boolean;
         
var
  MaxCursorsCount: Integer;
  CS_Connection  : TCriticalSection;
  FPrinterIndexOnStartUp: Integer;


implementation

uses IQMS.Common.DataLib,
     IQMS.Common.Dialogs,
     IQMS.Common.StringUtils,
//     PanelMsg,
//     IQSecMan,
     IQMS.Common.Numbers,
//     IQAppSet,
     IQMS.Common.NLS,
//     IQMS.Common.CheckPoint,
     IQMS.Common.ResStrings,
     FileCtrl,
     Variants,
     WinSpool,
     IQMS.Common.JumpConstants,
//     IQInfoBox,
     WinSock,
//     DB_DM,
     Character;


type 
  TGetLongPathName = function(lpszShortPath, lpszLongPath: PChar; cchBuffer: DWORD): DWORD; stdcall;

     
function Is_Center_RT( nCntrID: Real ):Boolean;
begin
  with TFDQuery.Create(nil) do
  try
    ConnectionName := 'IQFD';
    SQL.Add( IQFormat('select is_rt from work_center where id = %f', [ nCntrID ] ));
    Open;
    result:= Fields[0].asString = 'Y';
  finally
    Free;
  end;
end;

function IsOracleUnicode: Boolean;
const
  c_unicode_format: string = 'AL32UTF8';
begin
 Result := CompareText(GetOracleCharSet, c_unicode_format) = 0;
end;

function GetOracleLanguage: string;
begin
  // Return the Oracle database language.  The default is 'AMERICAN'
  SelectValueAsString('SELECT value FROM nls_database_parameters ' +
   'WHERE parameter = ''NLS_LANGUAGE''');
end;

function GetOracleTerritory: string;
begin
  // Return the Oracle database territory.  The default is 'AMERICA'
  SelectValueAsString('SELECT value FROM nls_database_parameters ' +
   'WHERE parameter = ''NLS_TERRITORY''');
end;

function GetOracleCharSet: string;
begin
  // Return the Oracle database charset.  The default is 'AL32UTF8'
  SelectValueAsString('SELECT value FROM nls_database_parameters ' +
   'WHERE parameter = ''NLS_CHARACTERSET''');
end;

procedure WriteEventLog( s:string; DB: string);
begin
  // 12/06/2012 Changed this to parameter query (Byron).  Errors
  // may occur if s contains characters Delphi doesn't like.
  ExecuteCommandParam(
    'INSERT INTO eventlog( event_time, userid, text ) VALUES ( SYSDATE, user, :TEXT )',
    ['TEXT;S'],
    [s],
    DB);
end;

procedure WriteEventLogEx( AClass, AText: string; DB: string);
begin
  ExecuteCommandFmt(
    'INSERT INTO eventlog( class, event_time, userid, text ) ' +
    'VALUES ( ''%s'', SYSDATE, user, ''%s'' )',
    [AClass, AText],
    DB);
end;

procedure WriteEventLogFmt( const S : string; const Args : array of const );
var
   AText : String;
begin
  AText := Format( S, Args );
  ExecuteCommandFmt(
    'INSERT INTO eventlog( event_time, userid, text ) ' +
    'VALUES ( SYSDATE, user, ''%s'' )',
    [AText]);
end;


function IQGetUID( const AConnectionName: string ):string;
//var
//  AConnection:  TFDCustomConnection;
begin
  Result := '';
//  Result := db_dm.FIQMS_UserName;

{ if (CompareText(AConnectionName, 'IQ') = 0) or
    (CompareText(AConnectionName, 'IQFD') = 0) then
    Result := db_dm.DB_DataModule.FDConnection1.Params.Values['User_Name']
  else
    begin
      AConnection := FDManager.FindConnection(AConnectionName);
      if Assigned(AConnection) and AConnection.Connected then
        Result := AConnection.Params.Values['User_Name']
    end;}
end;

function IQGetPassword( const AConnectionName: string ):string;
//var
//  AConnection:  TFDCustomConnection;
begin
  // Get the database owner password (usually, the "IQMS" password)
  Result := '';
//  Result := db_dm.FIQMS_Password;

{  if (CompareText(AConnectionName, 'IQ') = 0) or
    (CompareText(AConnectionName, 'IQFD') = 0) then
    Result := db_dm.DB_DataModule.FDConnection1.Params.Values['Password']
  else
    begin
      AConnection := FDManager.FindConnection(AConnectionName);
      if Assigned(AConnection) and AConnection.Connected then
        Result := AConnection.Params.Values['Password']
    end; }
end;

function IQGetServerName( const AConnectionName: string ):string;
//var
//  AConnection:  TFDCustomConnection;
begin
  Result := '';
//  Result := db_dm.FServerName;

{  if (CompareText(AConnectionName, 'IQ') = 0) or
    (CompareText(AConnectionName, 'IQFD') = 0) then
    Result := db_dm.DB_DataModule.FDConnection1.Params.Values['Database']
  else
    begin
      AConnection := FDManager.FindConnection(AConnectionName);
      if Assigned(AConnection) and AConnection.Connected then
        Result := AConnection.Params.Values['Database']
    end; }
end;

function GetOSAuthenticationUserName:String;
begin
  Result:= UpperCase( Format( 'OPS$%s\%s',
                      [ GetEnvironmentVariable( 'USERDOMAIN' ),
                        GetEnvironmentVariable( 'USERNAME' ) ] ) );
end;

function ServerNameByAlias( const AALiasName: string ):string;
var
  I: Integer;
begin
  for i:= 0 to FDManager.ConnectionCount - 1 do
  begin
    if CompareText(FDManager.Connections[i].ConnectionName, AAliasName ) = 0 then
    begin
      Result:= FDManager.Connections[i].Params.Values[ cnstFDDatabaseParam ];
      EXIT;
    end;
  end;
  raise Exception.CreateFmt('Unable to find connection identified by ConnectionName ''%s''', [ AAliasName ]);
end;

function GetServerNameParam(const AConnection: TFDConnection): string;
begin
  Result := '';
  if Assigned(AConnection) then
    Result := AConnection.Params.Values[cnstFDDatabaseParam];
end;

function IsWinNT4 : Boolean;
var
  Osi : TOSVersionInfo;
begin
  Osi.dwOSVersionInfoSize := sizeof(Osi);
  GetVersionEx(Osi);
  if (Osi.dwPlatformID = Ver_Platform_Win32_NT) and (Osi.dwMajorVersion >= 4) then
    Result := True
  else
    Result := False;
end;

//procedure IQPrintRichEdit(RichEdit:TRichEdit; const Caption:String);
//var
//  MyFile:TextFile;
//  lPlainText:Boolean;
//  i:Integer;
//begin
//  lPlainText := RichEdit.PlainText;
//  RichEdit.PlainText := True;
//  AssignPrn(MyFile);
//  Rewrite(MyFile);
//  try
//    Printer.Canvas.Font := RichEdit.Font;
//    Printer.Title := Caption;
//    for i := 0 to RichEdit.Lines.Count - 1 do
//      Writeln(MyFile, RichEdit.Lines[i]);
//  finally
//    CloseFile(MyFile);
//    RichEdit.PlainText := lPlainText;
//  end;
//end;

//procedure IQPrintWWdbRichEdit( RE:TwwDBRichEdit; const Caption:String);
//begin
//  // IQPrintRichEdit( TRichEdit( RE ), Caption )
//  RE.PrintMargins.Top := 0;
//  RE.PrintMargins.Left:= 0;
//  RE.Print( Caption );
//end;

procedure IQPrintRichEdit( RE:TRichEdit; const Caption:String);
var
  Range: TFormatRange;
  LastChar, MaxLen, LogX, LogY, OldMap: Integer;
begin
  FillChar(Range, SizeOf(TFormatRange), 0);
  with Printer, Range do
  begin
    BeginDoc;
    hdc := Handle;
    hdcTarget := hdc;
    LogX := GetDeviceCaps(Handle, LOGPIXELSX);
    LogY := GetDeviceCaps(Handle, LOGPIXELSY);
    if IsRectEmpty(RE.PageRect) then
    begin
      rc.right := PageWidth * 1440 div LogX;
      rc.bottom := PageHeight * 1440 div LogY;
    end
    else begin
      rc.left := RE.PageRect.Left * 1440 div LogX;
      rc.top := RE.PageRect.Top * 1440 div LogY;
      rc.right := RE.PageRect.Right * 1440 div LogX;
      rc.bottom := RE.PageRect.Bottom * 1440 div LogY;
    end;
    rcPage := rc;
    Title := Caption;
    LastChar := 0;
    MaxLen := RE.GetTextLen;
    chrg.cpMax := -1;
    // ensure printer DC is in text map mode
    OldMap := SetMapMode(hdc, MM_TEXT);
    SendMessage(Handle, EM_FORMATRANGE, 0, 0);    // flush buffer
    try
      repeat
        chrg.cpMin := LastChar;
        LastChar := SendMessage(RE.Handle, EM_FORMATRANGE, 1, Longint(@Range));
        if (LastChar < MaxLen) and (LastChar <> -1) then NewPage;
      until (LastChar >= MaxLen) or (LastChar = -1);
      EndDoc;
    finally
      SendMessage(Handle, EM_FORMATRANGE, 0, 0);  // flush buffer
      SetMapMode(hdc, OldMap);       // restore previous map mode
    end;
  end;
end;

function GetDefaultGLYear: Real;
var
  AEplantID: Int64;
begin
  AEplantID := SelectValueAsInt64('select misc.geteplantid from dual');
  if AEplantID = 0 then
    Result:= SelectValueAsInt64('select glyear_id from iqsys')
  else
  begin
    Result:= SelectValueFmtAsInt64(
      'select id from glyear where eplant_id = %f and trunc(sysdate) ' +
      'between start_date and end_date', [AEplantID]);
    if Result = 0 then
      Result:= SelectValueAsInt64('select glyear_id from iqsys')
  end;
end;

procedure ShowID( var Key: Word; Shift: TShiftState; DataSet: TDataSet; ADataSetName: string = '' );
var
  ATableName : string;
  AField: TField;
  AList : TStringList;
begin
  if (Key = VK_F1) and (ssAlt in Shift) then
  begin
    AField:= DataSet.FindField('ID');
    if DataSet is TFDTable then
       ATableName:= (DataSet as TFDTable).TableName
    else if DataSet is TFDQuery then
       ATableName:= (DataSet as TFDQuery).UpdateOptions.UpdateTableName
    else if ADataSetName > '' then
       ATableName:= UpperCase(TrimRight(ADataSetName))
    else                         
       ATableName:= IQMS.Common.ResStrings.cTXT0000145; {'SQL Query'}
       
    if Assigned( AField ) then
    begin
      AList:= TStringList.Create;
      try
         AList.Add(Format('ID=%d', [ AField.AsLargeInt ]));
         AList.Add(Format('Table=%s',[ ATableName ]));
//         IQInfoBox.DoShowInfoBox_Ex( nil, AList, 'Show ID' ); {IQInfoBox.pas}
      finally
        AList.Free;
      end;
    end;
    Key:= 0;
  end;
end;

function MutexAppRun( const CommandLine: string; const MutexName: string ): Integer;
var
  MutHandle  : THandle;
  Success    : LongBool;
  StartUpInfo: TStartUpInfo; 
  ProcessInfo: TProcessInformation;
  StartTime  : TDateTime;
//  PanelMsg   :TPanelMesg;
begin
  MutHandle:= OpenMutex( MUTEX_ALL_ACCESS, FALSE, PChar(MutexName) );
  if MutHandle > 0 then
  begin
    {Mutex object has been created, meaning that previous instance has been created}
    CloseHandle( MutHandle );
    Result:= 0;
    EXIT;
  end;

  FillChar(StartupInfo, SizeOf(TStartupInfo), 0);
  with StartupInfo do begin
    cb := SizeOf(TStartupInfo); 
    dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
    wShowWindow := sw_SHOWNORMAL;
  end;
  
  Success:= CreateProcess( nil, PChar(CommandLine), nil, nil, False,
                          NORMAL_PRIORITY_CLASS, nil, nil, StartupInfo, ProcessInfo);
  if Success then
    with ProcessInfo do
    begin
      WaitForInputIdle(hProcess, INFINITE);  // Wait until the process is in idle
      CloseHandle(hThread);                  // Free the hThread  handle
      CloseHandle(hProcess);                 // Free the hProcess handle
      Result := 0;                           // Set Result to 0, meaning successful
    end
  else
  begin
    Result:= GetLastError;                   // Set result to the error code.
    EXIT;
  end;

  {start 15 secs loop to see if mutex appeared}
  StartTime:= Now;
//  try
//     PanelMsg:= TPanelMesg.Create(Application, IQMS.Common.ResStrings.cTXT0000147 {'Launching application.  Please wait...'} );
//     PanelMsg.Show;
//     repeat
//       MutHandle:= OpenMutex( MUTEX_ALL_ACCESS, FALSE, PChar(MutexName) );
//       if MutHandle <= 0 then
//          Sleep(1000);
//       Application.ProcessMessages;
//     until (MutHandle > 0) or ((Now - StartTime) * 86400 > 15);
//  finally
//     PanelMsg.Free;
//  end;

  if MutHandle > 0 then
    begin
      CloseHandle( MutHandle );
      Result:= 0;
    end
  else
    begin
      IQError( Format( IQMS.Common.ResStrings.cTXT0000148 {'Time expired waiting for application %s to setup mutex %s handshake.'},
                       [CommandLine, MutexName ]));
      Result:= 1;
    end;
end;

function IsModal( AForm: TForm ):Boolean;
var
  I:Integer;
begin
  Result:= Assigned(AForm) and (fsModal in AForm.FormState);
  EXIT;

  // obsolete
  with Screen do
    for I:= 0 to FormCount - 1 do
      if (Forms[ I ] <> AForm) and not IsWindowEnabled( Forms[ I ].Handle ) then
      begin
        Result:= TRUE;
        Exit;
      end;
  Result:= FALSE;
end;

function IQGetReportsPath:string;
begin
  Result:= '';
//  with TIQRegistry.Create do
//  try
//    RootKey := HKEY_LOCAL_MACHINE;
//    if OpenKey('\Software\IQMS\IQWin32', FALSE) then
//      if ValueExists( 'Reports' ) then
//        Result:= SysUtils.IncludeTrailingPathDelimiter(ReadString( 'Reports' ));
//  finally
//    Free;
//  end;
end;

function IQGetImagesPath:string;
begin
  Result:= '';
//  with TIQRegistry.Create do
//  try
//    RootKey := HKEY_LOCAL_MACHINE;
//    if OpenKey('\Software\IQMS\IQWin32', FALSE) then
//      if ValueExists( 'Images' ) then
//        Result:= SysUtils.IncludeTrailingPathDelimiter(ReadString( 'Images' ));
//  finally
//    Free;
//  end;
end;

function IQGetLocalHomePath:string;
begin
  Result:= '';
//  with TIQRegistry.Create do
//  try
//    RootKey := HKEY_LOCAL_MACHINE;
//    if OpenKey('\Software\IQMS\IQWin32', FALSE) then
//      if ValueExists( 'IQMS_LOCAL_HOME' ) then
//        Result:= SysUtils.IncludeTrailingPathDelimiter(ReadString( 'IQMS_LOCAL_HOME' ));
//  finally
//    Free;
//  end;
end;

function IQGetMasterHomePath:string;
begin
  Result:= '';
//  with TIQRegistry.Create do
//  try
//    RootKey := HKEY_LOCAL_MACHINE;
//    if OpenKey('\Software\IQMS\IQWin32', FALSE) then
//      if ValueExists( 'IQMS_MASTER_HOME' ) then
//        Result:= SysUtils.IncludeTrailingPathDelimiter(ReadString( 'IQMS_MASTER_HOME' ));
//  finally
//    Free;
//  end;
end;

function IQGetUNCMasterHomePath:string;
var
  S: string;
begin
  Result:= '';
//  with TIQRegistry.Create do
//  try
//    RootKey := HKEY_LOCAL_MACHINE;
//    if OpenKey('\Software\IQMS\IQWin32', FALSE) then
//      if ValueExists( 'IQMS_UNC_MASTER_HOME' ) then
//        Result:= SysUtils.IncludeTrailingPathDelimiter(ReadString( 'IQMS_UNC_MASTER_HOME' ));
//  finally
//    Free;
//  end;
end;

function IQGetSmartPageHomePath:string;
begin
  Result:= '';
//  with TIQRegistry.Create do
//  try
//    RootKey := HKEY_LOCAL_MACHINE;
//    if OpenKey('\Software\IQMS\IQWin32', FALSE) then
//      if ValueExists( 'SMART_PAGE_HOME' ) then
//        Result:= SysUtils.IncludeTrailingPathDelimiter(ReadString( 'SMART_PAGE_HOME' ));
//  finally
//    Free;
//  end;
end;

function IQGetIISServerBaseURL:string;
var
   AData: Variant;
   APort: Integer;
   AServer: String;
begin
(*NOT to be used for WebDirect base URL construction. For WebDirect base URL use IQGetIISServerBaseURLWebDirect *)

  // Initialization
  Result := '';
  APort := 0;
  AServer := '';

  //EIQ-4977 System Parameters - Web - Use IIS Gateway AMB 12-11-14
  if IQUseIISGateway then
  begin
    Result:= SelectValueAsString('select web_misc.get_iis_url from dual');
    Exit;
  end;

  // If logged into an eplant, get the property values from the eplant.
//  if (SecurityManager <> nil) and
//     (SecurityManager.EPlant_ID_AsInteger > 0) then
//     begin
//       AData := SelectValueArrayFmt(
//        'select iis_server_url, iis_port from eplant where id = %d',
//        [SecurityManager.EPlant_ID_AsInteger]);
//       if Variants.VarArrayDimCount(AData) > 0 then
//          begin
//            AServer := Trim(Variants.VarToStr(AData[0]));
//            APort := Variants.VarAsType(AData[1], varInteger);
//          end;
//     end;

  // If the values are still empty -- even if we are logged into an eplant --
  // get the values from the main company record.
  if (AServer = '') then
     begin
       AData := SelectValueArray(
         'select iis_server_url, iis_port from iqsys2 where rownum < 2');
       if Variants.VarArrayDimCount(AData) > 0 then
          begin
            AServer := Trim(Variants.VarToStr(AData[0]));
            APort := Variants.VarAsType(AData[1], varInteger);
          end;
     end;

  // Default to port 80, if none is provided
  if (APort = 0) then
     APort := 80;

  // Now, if the values exist, piece together the final URL.
  if (AServer > '') then
     begin
       if (Pos('http://',LowerCase(AServer)) > 0) or
          (Pos('https://',LowerCase(AServer)) > 0) then
          Result := Format('%s:%d/', [AServer, APort])
          // 10/28/11 - JS - we need the port! Reinstated this line above Result := AServer
       else
          Result := Format('http://%s:%d/', [AServer, APort]);
          // 10/28/11 - JS - we need the port! Reinstated this line above Result := Format('http://%s/', [AServer]);
     end;

end;

function IQGetHelpPath:string;
begin
  Result:= '';
//  with TIQRegistry.Create do
//  try
//    RootKey := HKEY_LOCAL_MACHINE;
//    if OpenKey('\Software\IQMS\IQWin32', FALSE) then
//      if ValueExists( 'IQMS_MASTER_HOME' ) then
//        Result:= StrTran( ReadString( 'IQMS_MASTER_HOME' ) + '\', '\\', '\');
//  finally
//    Free;
//  end;
end;

function IQInvokedLocaly:Boolean;
var
  LocalPath: string;
begin
//  if AppType = atCom then
//  begin
//     Result:= TRUE;
//     EXIT;
//  end;
  LocalPath:= IQGetLocalHomePath;
  Result:= (LocalPath = '') or (CompareText( LocalPath,  ExtractFilePath( Application.ExeName)) = 0);
end;

function IQGetCRWDate(ADate:TDateTime):String;
var
  Year, Month, Day: Word;
begin
  DecodeDate(ADate, Year, Month, Day);
  Result := Format('Date(%d,%d,%d)', [ Year, Month, Day ]);
end;

function IQGetEMailAddr(DB: string): string;
begin
  Result := '';
//  Result := SelectValueFmtAsString(
//    'select email from s_user_general where user_name = ''%s''',
//    [SecurityManager.UserName], DB);
//  if Result = '' then
//    Result := SelectValueAsString('select email from iqsys', DB);
end;

function IQGetEMailSMTPServerName(DB: string): string;
begin
  Result := '';
//  with SecurityManager do
//    begin
//      if EPlant_ID <> 'NULL' then
//        Result := SelectValueFmtAsString(
//          'select smtp_server from eplant where id = %s',
//          [EPlant_ID], DB);
//
//      if Result = '' then
//        Result := SelectValueAsString(
//          'select smtp_server from iqsys', DB);
//    end;
end;

function IQUseOutlook(DB: string): Boolean;
begin
  Result := SelectValueAsString(
    'SELECT NVL( use_outlook, ''N'' ) ' +
    'FROM iqsys WHERE ROWNUM < 2', DB) = 'Y';
end;

function IQUseLotusNotes(DB: string): Boolean;
begin
  Result := SelectValueAsString(
    'SELECT NVL( use_lotusnotes, ''N'' ) ' +
    'FROM iqsys WHERE ROWNUM < 2', DB) = 'Y';
end;

function IQUseSMTPOnly(DB: string): Boolean;
begin
  Result := IQSMTPSettingsAssigned(DB) and not IQUseOutlook(DB) and
    not IQUseLotusNotes(DB);
end;

function IQSMTPSettingsAssigned(DB: string): Boolean;
begin
  Result := (IQGetEMailSMTPServerName(DB) > '') and (IQGetEMailAddr(DB) > '');
end;

function IQGetCountryCode_2Char: string;
begin
  Result := '';
//  if SecurityManager.EPlant_ID_AsFloat > 0 then
//    result := SelectValueFmtAsString(
//      'SELECT iqms.country_code.get2charcountrycode(country) ' +
//      'FROM eplant WHERE id = %d',
//      [SecurityManager.EPlant_ID_AsInteger])
//  else
//    result := SelectValueAsString(
//      'SELECT iqms.country_code.get2charcountrycode(country) ' +
//      'FROM iqsys WHERE ROWNUM < 2');
end;

function IQGetCountryCode_3Char: string;
begin
  Result := '';
//  if SecurityManager.EPlant_ID_AsFloat > 0 then
//    result := SelectValueFmtAsString(
//      'SELECT iqms.country_code.get3charcountrycode(country) ' +
//      'FROM eplant WHERE id = %d',
//      [SecurityManager.EPlant_ID_AsInteger])
//  else
//    result := SelectValueAsString(
//      'SELECT iqms.country_code.get3charcountrycode(country) ' +
//      'FROM iqsys WHERE ROWNUM < 2');
end;

function IQGetCountryCode_3Digit: string;
begin
  Result := '';
//  if SecurityManager.EPlant_ID_AsFloat > 0 then
//    result := SelectValueFmtAsString(
//      'SELECT iqms.country_code.get3digitcountrycode(country) ' +
//      'FROM eplant WHERE id = %d',
//      [SecurityManager.EPlant_ID_AsInteger])
//  else
//    result := SelectValueAsString(
//      'SELECT iqms.country_code.get3digitcountrycode(country) ' +
//      'FROM iqsys WHERE ROWNUM < 2');
end;

procedure IQGetCountryCode(var ACountry, A2Char, A3Char: string;
 var A3Digit: Integer);
var
  AData: Variant;
begin
  // Initialization
  ACountry := '';
  A2Char   := '';
  A3Char   := '';
  A3Digit  := 0;
  AData := Unassigned;

//  if SecurityManager.EPlant_ID_AsInteger > 0 then
//    AData := SelectValueArrayFmt(
//      'SELECT iqms.country_code.getvalidcountryname(country) AS country, ' +
//      '       iqms.country_code.get2charcountrycode(country) AS char2, ' +
//      '       iqms.country_code.get3charcountrycode(country) AS char3, ' +
//      '       iqms.country_code.get3digitcountrycode(country) AS digit3 ' +
//      'FROM eplant WHERE id = %d', [Trunc(SecurityManager.EPlant_ID_AsFloat)])
//  else
//    AData := SelectValueArray(
//      'SELECT iqms.country_code.getvalidcountryname(country) AS country,' +
//      '       iqms.country_code.get2charcountrycode(country) AS char2, ' +
//      '       iqms.country_code.get3charcountrycode(country) AS char3, ' +
//      '       iqms.country_code.get3digitcountrycode(country) AS digit3 ' +
//      '  FROM iqsys WHERE ROWNUM < 2');

  if Variants.VarArrayDimCount(AData) > 0 then
   begin
     ACountry := Variants.VarToStr(AData[0]);
     A2Char   := Variants.VarToStr(AData[1]);
     A3Char   := Variants.VarToStr(AData[2]);
     A3Digit  := Variants.VarAsType(AData[3], varInteger);
   end;
end;

function IQGetState: string;
begin
  Result := '';
//  if SecurityManager.EPlant_ID_AsInteger > 0 then
//    result := SelectValueFmtAsString(
//      'SELECT state FROM eplant WHERE id = %d',
//      [SecurityManager.EPlant_ID_AsInteger])
//  else
//    result := SelectValueAsString(
//      'SELECT state FROM iqsys WHERE ROWNUM < 2');
end;

function ExecuteProgram( const AFileName: String; const AShowOption: Integer;
                         const ACommandLineParameters: PAnsiChar ): Boolean;
var
  ShellExecuteInfo: TShellExecuteInfoA;
begin
  {AFileName}
  {
        Enter the path and name of the executable you wish to run.  For example:
        'C:\Program Files\My Program\RunMe.exe'
  }
  {Show Options:}
  {
        SW_HIDE             Hides the window and activates another window.
        SW_MAXIMIZE     Maximizes the specified window.
        SW_MINIMIZE     Minimizes the specified window and activates the
                            next top-level window in the Z order.
        SW_RESTORE     Activates and displays the window.
                            If the window is minimized or maximized,
                            Windows restores it to its original size and
                            position. An application should specify this flag
                            when restoring a minimized window.
        SW_SHOW             Activates the window and displays it in its
                            current size and position.
        SW_SHOWDEFAULT     Sets the show state based on the SW_ flag
                            specified in the STARTUPINFO structure passed to
                            the CreateProcess function by the program that
                            started the application. An application should
                            call ShowWindow with this flag to set the initial
                            show state of its main window.
        SW_SHOWMAXIMIZED    Activates the window and displays it as a
                            maximized window.
        SW_SHOWMINIMIZED    Activates the window and displays it as a
                            minimized window.
        SW_SHOWMINNOACTIVE  Displays the window as a minimized window.
                            The active window remains active.
        SW_SHOWNA     Displays the window in its current state.
                            The active window remains active.
        SW_SHOWNOACTIVATE   Displays a window in its most recent size and
                            position. The active window remains active.
        SW_SHOWNORMAL     Activates and displays a window. If the window is
                            minimized or maximized, Windows restores it to
                            its original size and position. An application
                            should specify this flag when displaying the
                            window for the first time.

  }
  {ACommandLineParameters}
  {
       Enter any command line parameters.  These are what you might insert
       after the command line on a shortcut.  They will only work if the
       application you are running is set up to accept them.
       This is optional.  For no parameters, just supply an empty string.
  }


  FillChar( ShellExecuteInfo, SizeOf(TShellExecuteInfo), 0);
  with ShellExecuteInfo do
  begin
    cbSize        := SizeOf(TShellExecuteInfoA);
    Wnd           := Application.MainForm.Handle;
    lpFile        := PAnsiChar( AnsiString( AFileName ));
    lpParameters  := ACommandLineParameters;
    nShow         := AShowOption;
  end;
  if not ShellExecuteExA( @ShellExecuteInfo ) then
     begin
          {Instead of raising an exception return FALSE as the result.  The
          calling function should check for the existence of the file first
          with FileExists() and handle the error more appropriately.}
          Result := FALSE;
          //raise Exception.CreateFmt( 'Failure attempting to open program. Error Code = %d', [ GetLastError ]);
     end
  else
     Result := TRUE;
end;

function ExecuteProgramW( const AFileName: String; const AShowOption: Integer;
                         const ACommandLineParameters: PWideChar ): Boolean;
var
  ShellExecuteInfo: TShellExecuteInfo;
begin
  {AFileName}
  {
        Enter the path and name of the executable you wish to run.  For example:
        'C:\Program Files\My Program\RunMe.exe'
  }
  {Show Options:}
  {
        SW_HIDE             Hides the window and activates another window.
        SW_MAXIMIZE     Maximizes the specified window.
        SW_MINIMIZE     Minimizes the specified window and activates the
                            next top-level window in the Z order.
        SW_RESTORE     Activates and displays the window.
                            If the window is minimized or maximized,
                            Windows restores it to its original size and
                            position. An application should specify this flag
                            when restoring a minimized window.
        SW_SHOW             Activates the window and displays it in its
                            current size and position.
        SW_SHOWDEFAULT     Sets the show state based on the SW_ flag
                            specified in the STARTUPINFO structure passed to
                            the CreateProcess function by the program that
                            started the application. An application should
                            call ShowWindow with this flag to set the initial
                            show state of its main window.
        SW_SHOWMAXIMIZED    Activates the window and displays it as a
                            maximized window.
        SW_SHOWMINIMIZED    Activates the window and displays it as a
                            minimized window.
        SW_SHOWMINNOACTIVE  Displays the window as a minimized window.
                            The active window remains active.
        SW_SHOWNA     Displays the window in its current state.
                            The active window remains active.
        SW_SHOWNOACTIVATE   Displays a window in its most recent size and
                            position. The active window remains active.
        SW_SHOWNORMAL     Activates and displays a window. If the window is
                            minimized or maximized, Windows restores it to
                            its original size and position. An application
                            should specify this flag when displaying the
                            window for the first time.

  }
  {ACommandLineParameters}
  {
       Enter any command line parameters.  These are what you might insert
       after the command line on a shortcut.  They will only work if the
       application you are running is set up to accept them.
       This is optional.  For no parameters, just supply an empty string.
  }

  
  FillChar( ShellExecuteInfo, SizeOf(TShellExecuteInfo), 0);
  with ShellExecuteInfo do
  begin
    cbSize        := SizeOf(TShellExecuteInfo);
    Wnd           := Application.MainForm.Handle;
    lpFile        := PWideChar( AFileName );
    lpParameters  := ACommandLineParameters;
    nShow         := AShowOption;
  end;
  if not ShellExecuteEx( @ShellExecuteInfo ) then
     begin
          {Instead of raising an exception return FALSE as the result.  The
          calling function should check for the existence of the file first
          with FileExists() and handle the error more appropriately.}
          Result := FALSE;
          //raise Exception.CreateFmt( 'Failure attempting to open program. Error Code = %d', [ GetLastError ]);
     end
  else
     Result := TRUE;
end;

function ExecuteProgramExA( ACommandLine: string ): Integer;
begin
  Result := ExecuteProgramExB( ACommandLine, true ); // wait for child process to return
end;

function ExecuteProgramExB( ACommandLine: string; AWait:Boolean ): Integer;
var
  StartUpInfo: TStartUpInfo;
  ProcessInfo: TProcessInformation;
  Success    : LongBool;
begin
  Result:= -9999;
  if ACommandLine = '' then
     Exit;

  FillChar( StartUpInfo, SizeOf(TStartUpInfo), 0 );
  with StartupInfo do
  begin
    cb := SizeOf(TStartupInfo);
    dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
    wShowWindow := sw_SHOWNORMAL;
  end;

  Success:= CreateProcess( nil, PChar(ACommandLine), nil, nil, False, NORMAL_PRIORITY_CLASS, nil, nil, StartupInfo, ProcessInfo );

  if Success then
     with ProcessInfo do
     begin
       if AWait then
         WaitForInputIdle(hProcess, INFINITE);  // Wait until the process is in idle

       CloseHandle(hThread);                  // Free the hThread  handle
       CloseHandle(hProcess);                 // Free the hProcess handle
       Result := 0;                           // Set Result to 0, meaning successful
     end
  else
     Result:= GetLastError;                   // Set result to the error code.
end;

procedure OpenWith_NotePad(AFileName: string);
var
  ACommandLine: AnsiString;
begin
  if FileExists(AFileName) then
  begin
    ACommandLine := Format('"%s"', [AFileName]);
    ExecuteProgram('notepad.exe', SW_SHOWDEFAULT, PAnsiChar(ACommandLine));
  end;
end;

procedure OpenWith_MSWord(AFileName: string);
var
  ACommandLine: AnsiString;
begin
  if FileExists(AFileName) then
  begin
    ACommandLine := Format('"%s"', [AFileName]);
    ExecuteProgram('winword.exe', SW_SHOWDEFAULT, PAnsiChar(ACommandLine));
  end;
end;

procedure IQAssert( ACondition: Boolean; AMesg: string );
begin
  if not ACondition then
    begin
//      if IQAppSet.IsTouchScreen then
//        try
//          iqmesg.IQError(AMesg);
//        finally
//          SysUtils.Abort;
//        end
//      else
        raise Exception.Create( AMesg );
    end;
end;


function LoadWNetComputersNames( AList: TStrings; ANetResource: PNetResource ): DWord;
{Example: LoadComputersNames( MyList, NIL ) }
const
  RESOURCE_BUF_ENTRIES = 2000;
var
  hNetEnum      : THandle;
  ResourceBuffer: array[1..RESOURCE_BUF_ENTRIES] of TNetResource;
  I             : DWORD;
  ResourceBuf   : DWORD;
begin
  if (NO_ERROR <> WNetOpenEnum( RESOURCE_GLOBALNET, RESOURCETYPE_DISK, RESOURCEUSAGE_CONTAINER, ANetResource, hNetEnum )) then
    raise Exception.CreateFmt('WNetOpenEnum Error. Error Code = %d', [ GetLastError ]);

  try
    ResourceBuf:= SizeOf(ResourceBuffer);
    Result     := RESOURCE_BUF_ENTRIES;

    if NO_ERROR <> WNetEnumResource(hNetEnum, Result, @ResourceBuffer,ResourceBuf) then
       if GetLastError() = ERROR_NO_MORE_ITEMS then
          Result:= 0
       else
         raise Exception.CreateFmt('WNetEnumResource Error. Error Code = %d', [ GetLastError ]);

    for I:= 1 to Result do
      if (ResourceBuffer[ I ].dwUsage and RESOURCEUSAGE_CONTAINER) <> 0 then
         if LoadWNetComputersNames( AList, @ResourceBuffer[ I ]) = 0 then
            AList.Add( StrTran( string( ResourceBuffer[ I ].lpRemoteName), '\\', '' ));  {This is a leaf - add to the list}

  finally
    if NO_ERROR <> WNetCloseEnum( hNetEnum ) then
       raise Exception.CreateFmt('WNetCloseEnum Error. Error Code = %d', [ GetLastError ]);
  end;
end;

procedure Record_Skipped_Seq(AModule, ATable, AField, AValue, ANewValue,
  AAction:String);
begin
  ExecuteCommandFmt(
    'insert into skipped_seq( module_name, table_name, field_name, ' +
    'original_value, new_value, userid, datetime_stamp, action) ' +
    'values( ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', sysdate, ''%s'')',
    [UpperCase(AModule),
     UpperCase(ATable),
     UpperCase(AField),
     AValue,
     ANewValue,
     '', //SecurityManager.UserName,
     AAction]);
end;


procedure IQDeleteUser( AUserName: string );
var
  A: Variant;
  I: Integer;
begin
//  if AUserName = '' then
//     raise Exception.Create( IQMS.Common.ResStrings.cTXT0000149 {'A valid user name must be selected.'} )
//  else if CompareText( AUserName, SecurityManager.UserName ) = 0 then
//     raise Exception.Create(IQMS.Common.ResStrings.cTXT0000150 { 'Cannot delete yourself while logged on.'})
//  else if not IQWarningYN(Format(IQMS.Common.ResStrings.cTXT0000151 { 'Are you sure you want to delete user, %s?' },
//                          [ AUserName ])) then
//     SysUtils.ABORT;

  ExecuteCommandFmt('delete from s_user_eplants where user_name = ''%s''', [ AUserName ]);
  ExecuteCommandFmt('delete s_user_general where user_name = ''%s'' ', [ AUserName ]);
  ExecuteCommandFmt('drop user "%s" cascade', [ AUserName ]);

  A:= VarArrayOf([ 'CONTACT', 'VENDOR_CONTACT', 'PR_EMP' ]);
  for I:= 0 to 2 do
    try
      ExecuteCommandFmt('update %s set web_userid = NULL where web_userid = ''%s''', [ A[ I ], AUserName ]);
    except
      {keep DD compatible - if web_userid doesn't exist - walk away quietly}
    end;
end;


procedure IQWebGrant( AUserName, ATableName: string; AToGrant: Boolean = TRUE );
var
  A: Variant;
  I: Integer;
begin
  A:= VarArrayOf([ 'CONTACT', 'VENDOR_CONTACT', 'PR_EMP' ]);

  {If revoking: set web_userid to null in all 3 tables. If granting: set to null for other 2 tables only}
  for I:= 0 to 2 do
    if not AToGrant or ((CompareText(ATableName, A[ I ]) <> 0) and (ATableName > '')) then
    try
      ExecuteCommandFmt('update %s set web_userid = NULL where web_userid = ''%s''', [ A[ I ], UpperCase( AUserName )]);
    except
      {make it compatible so if web_userid does not exist - we will keep going}
    end;

  try
    if AToGrant then
      ExecuteCommandFmt('grant IQWEBDIRECT_ROLE to "%s"', [ AUserName ])
    else
      ExecuteCommandFmt('revoke IQWEBDIRECT_ROLE from "%s"', [ AUserName ]);
  except
    {so that Oracle would not throw an exception if no rights were granted}
  end;
end;

// function GetWebUserType: TWebUserType;
// var
//   AUserName: string;
// begin
//   Result:= utUnknown;
//   if (SecurityManager <> nil) then
//   begin
//     AUserName:= UpperCase(SecurityManager.UserName);
//     if GetValFmt('select arcusto_id from contact where Upper(web_userid) = ''%s''', [ AUserName ]) > 0 then
//        Result:= utCustomer
//     else if GetValFmt('select vendor_id from vendor_contact where Upper(web_userid) = ''%s''', [ AUserName ]) > 0 then  
//        Result:= utSupplier
//     else if GetValFmt('select id from pr_emp where Upper(web_userid) = ''%s''', [ AUserName ]) > 0 then
//        Result:= utSupplier;
//   end;
// end;    

function GetWebRepDefApp_ID( AArcusto_ID: Real; AUserType: TWebUserType = utCustomer ): string;
begin
  case AUserType of
    utCustomer: Result:= Format( '_WEB_%.0f',     [ AArcusto_ID ]); 
    utSupplier: Result:= Format( '_WEB_VEN_%.0f', [ AArcusto_ID ]);
    utEmployee: Result:= Format( '_WEB_EMP_%.0f', [ AArcusto_ID ]);
  else  
    Result:= Format( '_WEB_%.0f', [ AArcusto_ID ]);
  end;  
end;

function GetRandomID: string;
begin
  Randomize;
  Result:= Format('%s - %s', [ FormatDateTime('MM-DD-YYYY - hh:nn:ss', Now), IntToStr( Random( 100000000 ))] );
end;

{Return Ex: 12_31_02 09_16_59 123 Use for tempfilenames: ~QC12_31_02 09_16_59 123.html}
function GetRandomName: string;
begin
  Randomize;
  Result:= Format('%s %s', [ FormatDateTime('mm_dd_yy hh_nn_ss', Now), IntToStr( Random( 1000 ))] );
end;  

function GetTempFileName(const AExt: string): string;
var
  APath, AName: string;
begin
  APath := IQMS.Common.Miscellaneous.GetSpecialPath(evTemp);
  AName := IQMS.Common.Miscellaneous.GetRandomName;
  Result := SysUtils.IncludeTrailingPathDelimiter(APath) + AName;
  if AExt > '' then
    Result := SysUtils.ChangeFileExt(Result, AExt);
end;

function IQGetAppServerURL( DataBaseName: string = cnstFDConnectionName ):string;
var
  DB: TFDCustomConnection;
begin
  DB:= FDManager.FindConnection( DataBaseName );
  IQAssert( Assigned(DB), Format(IQMS.Common.ResStrings.cTXT0000152 { 'Unable to determine Application Server.  The URL, %s, is an unknown database name.' },
                                 [ DataBaseName ]));

  Result := SelectValueAsString('select web_misc.get_apache_url from dual');  //EIQ-4977 System Parameters - Web - Use IIS Gateway
  IQAssert( Result > '', IQMS.Common.ResStrings.cTXT0000153 { 'The Application Server URL is unassigned' });
  
  if Result[ Length(Result) ] <> '/' then
     Result:= Result + '/';
end;

procedure ResetConnection(ADB: string);
var
  I         : Integer;
  AList     : TList;
  AUserName : string;
  AEPlant_ID: string;
  AConnection: TFDConnection;
begin
  // DBase:= Session.FindDataBase( DB );
  AConnection:= FDManager.FindConnection( ADB ) as TFDConnection;
  IQAssert( Assigned( AConnection ), Format(IQMS.Common.ResStrings.cTXT0000154, [ ADB ])); { 'Unable to find database alias %s' }
  
  AList:= TList.Create;
  try
    {Load datasets}
    for I:= 0 to AConnection.DatasetCount - 1 do
      if AConnection.DataSets[ I ].Active then
         AList.Add( AConnection.DataSets[ I ]);

    {user name, eplant_id on the backend}     
    AUserName := '';
    AEPlant_ID:= '';
//    if (SecurityManager <> nil) then
//    begin
//      AUserName:= SecurityManager.UserName;
//      AEPlant_ID:= SecurityManager.EPlant_ID;
//    end;

    {Reset connection}
    AConnection.Connected:= FALSE;

    {Ensure IQMS password is up to date}
    // EnsureCurrentIQMSPassword( AConnection, AConnection.ConnectionName );
    
    {Reconnect!}
    AConnection.Connected:= TRUE;
    // db_datamodule.ConfigureFDConnection;  01-20-2016 do we need this? EIQ-10213 FireDAC - move to FireDAC, no more BDE

    {Reestablish default eplant_id and user name on the backend}
//    if (SecurityManager <> nil) and (AUserName > '') then
//       SecurityManager.AssignUserName( AUserName, ADB );
//
//    {Reestablish eplant_id}
//    if CompareText(SecurityManager.EPlant_ID, AEPlant_ID ) <> 0 then
//       SecurityManager.EPlant_ID:= AEPlant_ID;
//
//    {Reopen active datasets}
//    for I:= 0 to AList.Count - 1 do
//      TDataSet(AList[ I ]).Open;
//
//    //'Database connection was closed and reopen to reset open cursors. Datasets count: %d'
//    TFrmCheckPointList.Add(Format(IQMS.Common.ResStrings.cTXT0000155, [ AList.Count ]));

  finally
    AList.Free;
  end;
end;

function CheckResetCursorOver( APercent: Real ): Boolean;
var
  AMaxCursers : Integer; 
  ACursorsUsed: Integer;
  AEXE_Name   : string;
begin
  Result:= FALSE;

  {Max allowed cursors}
  if MaxCursorsCount = 0 then
     MaxCursorsCount:= SelectValueAsInteger(
     'select To_Number(value) from v$parameter where Upper(name) = ''OPEN_CURSORS''');

  {Exe Name}   
//  AEXE_Name:= UpperCase( StrBeforeDot( ExtractFileName( ParamStr( 0 )))); {Ex: IQVOICE}

  {what's the threshold }                                                                        
  AMaxCursers := Trunc( MaxCursorsCount * APercent / 100 );                {Ex: 400 * 50 / 100 = 200}
  if AMaxCursers = 0 then
     EXIT;

  {How many are used}
  ACursorsUsed := SelectValueFmtAsInteger(
    'select s.value                           '#13 +
    '  from v$statname n,                     '#13 +
    '       v$sesstat s,                      '#13 +
    '       v$session p                       '#13 +
    ' where s.sid = p.sid                     '#13 +
    '   and n.statistic# = s.statistic#       '#13 +
    '   and s.statistic# = 3                  '#13 +
    '   and upper(p.program) like ''%%%s%%''  ',
    [ AEXE_Name ]);

  {Reset connection if currently open cursors count exceeds the threshold}                                
  if ACursorsUsed > AMaxCursers then
  begin
    ResetConnection;   {this unit}
    Result:= TRUE;
  end
end;


function EnsureConnectionExists(ADB: string): Boolean;
var
  ACount: Integer;
begin
  CS_Connection.Acquire;
  try
     ACount:= 1;
     Result:= FALSE;
     repeat          
        try
           with TFDQuery.Create(NIL) do
           try
             Connection:= FDManager.FindConnection( ADB ) as TFDConnection;
             SQL.Add('select sysdate from dual');
             Open;
           finally
             Free;
           end;
           
           Result:= TRUE;  {connection is alive - get out}
           EXIT;    
          
        except 
           on E: EOCINativeException do with E as EOCINativeException do                     // Possible reasons ORA-12571 TNS:packet writer failure 
              if (ACount = 1) then    {first attempt - try to reconnect}           // ORA-03114 Not Connected To Oracle
                 try 
                   Inc(ACount);
                   ResetConnection( ADB );   {IQMisc.pas}
                 except on E: Exception do
//                   TFrmCheckPointList.Add( Format(IQMS.Common.ResStrings.cTXT0000255, [ E.Message ]));
                 end
              else 
                 EXIT;                {return FALSE indicating failure}
           else
              raise;                  {other error - reraise exception}
        end;  
     until Result;
  finally
     CS_Connection.Release;
  end;
end;


function GetSpecialPath( AFolder: TSpecialFolder ): String;
var
   APath: String;
   ACharArray: array [0..255] of Char;
   PIDL : PItemIDList; // declared in Delphi shlobj.pas
begin
     APath  := ''; // initialization
     Result := ''; // initialization

     case AFolder of
        evWindows   : // i.e., C:\WINNT\
         begin
              Windows.GetWindowsDirectory( @ACharArray, 255 );
              APath := ACharArray;
         end;
        evSystem    : // i.e., C:\WINNT\System32\
         begin
              Windows.GetSystemDirectory( @ACharArray, 255 );
              APath := Trim( ACharArray );
         end;
        evTemp      : // Get temporary folder (i.e., C:\DOCUME~1\Byron\LOCALS~1\Temp\)
         begin
              Windows.GetTempPath( 255, @ACharArray );
              APath := Trim( ACharArray );
         end;
        evPrograms  : // Current user profile Program Files path (i.e. C:\Documents and Settings\Byron\Start Menu\Programs\)
         begin
              SHGetSpecialFolderLocation( 0, CSIDL_PROGRAMS, PIDL ); // in Delphi shlobj.pas
              SHGetPathFromIDList( PIDL, ACharArray );
              APath := Trim( ACharArray );
         end;
        evProgramsCommon: // Returns Program Files path for All users (i.e., C:\Documents and Settings\All Users\Start Menu\Programs\)
         begin
              SHGetSpecialFolderLocation( 0, CSIDL_COMMON_PROGRAMS, PIDL ); // in Delphi shlobj.pas
              SHGetPathFromIDList( PIDL, ACharArray );
              APath := Trim( ACharArray );
         end;
        evProgramFiles:
         begin
              SHGetSpecialFolderLocation( 0, 38 {CSIDL_PROGRAM_FILES}, PIDL ); // in Delphi shlobj.pas
              SHGetPathFromIDList( PIDL, ACharArray );
              APath := Trim( ACharArray );
         end;
        evStartMenu : // Current user profile Start Menu path (i.e., C:\Documents and Settings\Byron\Start Menu\)
         begin
              SHGetSpecialFolderLocation( 0, CSIDL_STARTMENU, PIDL ); // in Delphi shlobj.pas
              SHGetPathFromIDList( PIDL, ACharArray );
              APath := Trim( ACharArray );
         end;
        evStartMenuCommon : // Returns start menu for All Users (i.e., C:\Documents and Settings\All Users\Start Menu\)
         begin
              SHGetSpecialFolderLocation( 0, CSIDL_COMMON_STARTMENU, PIDL ); // in Delphi shlobj.pas
              SHGetPathFromIDList( PIDL, ACharArray );
              APath := Trim( ACharArray );
         end;
        evDesktop   : // Current user profile Desktop path (i.e., C:\Documents and Settings\Byron\Desktop\)
         begin
              SHGetSpecialFolderLocation( 0, CSIDL_DESKTOP {or CSIDL_DESKTOPDIRECTORY}, PIDL ); // in Delphi shlobj.pas
              SHGetPathFromIDList( PIDL, ACharArray );
              APath := Trim( ACharArray );
         end;
        evDesktopCommon: // Current user profile Desktop path (i.e., C:\Documents and Settings\All Users\Desktop\)
         begin
              SHGetSpecialFolderLocation( 0, CSIDL_COMMON_DESKTOPDIRECTORY {or CSIDL_DESKTOPDIRECTORY}, PIDL ); // in Delphi shlobj.pas
              SHGetPathFromIDList( PIDL, ACharArray );
              APath := Trim( ACharArray );
         end;
        evFavorites : // Current user profile Favorites path (i.e., C:\Documents and Settings\Byron\Favorites\)
         begin
              SHGetSpecialFolderLocation( 0, CSIDL_FAVORITES, PIDL ); // in Delphi shlobj.pas
              SHGetPathFromIDList( PIDL, ACharArray );
              APath := Trim( ACharArray );
         end;
        evPersonal  : // Returns Personal folder, i.e., C:\My Documents
         begin
              SHGetSpecialFolderLocation( 0, CSIDL_PERSONAL, PIDL ); // in Delphi shlobj.pas
              SHGetPathFromIDList( PIDL, ACharArray );
              APath := Trim( ACharArray );
         end;
        evNetHood  :
         begin
              SHGetSpecialFolderLocation( 0, CSIDL_NETHOOD, PIDL ); // in Delphi shlobj.pas
              SHGetPathFromIDList( PIDL, ACharArray );
              APath := Trim( ACharArray );
         end;
        evFonts  : // Fonts directory, i.e., C:\WINNT\Fonts\
         begin
              SHGetSpecialFolderLocation( 0, CSIDL_FONTS, PIDL ); // in Delphi shlobj.pas
              SHGetPathFromIDList( PIDL, ACharArray );
              APath := Trim( ACharArray );
         end;
        evTemplates  : // Current user templates (i.e., C:\Documents and Settings\Byron\Templates\)
         begin
              SHGetSpecialFolderLocation( 0, CSIDL_TEMPLATES, PIDL ); // in Delphi shlobj.pas
              SHGetPathFromIDList( PIDL, ACharArray );
              APath := Trim( ACharArray );
         end;
     end;

     // Ensure the trailing system path delimiter is assigned
     if APath > '' then
       APath := SysUtils.IncludeTrailingPathDelimiter(APath);

     // Return the result
     Result := APath;
end;

function GetPriorPath(const ADirectory: String): String;
var
   ALastPos: Integer;
   ATemp: String;
begin
   { This method returns a prior path.
     For example:
       IN:   C:\My Documents\IQMS Documents\
       OUT:  C:\My Documents\
   }
   
   // Get the original path without the trailing delimiter
   ATemp := SysUtils.ExcludeTrailingBackslash(ADirectory);
   // Get the position of the last trailing delimiter
   ALastPos := IQMS.Common.StringUtils.RPos(SysUtils.PathDelim, ATemp);
   // Get a string without the last chunk
   ATemp := Copy(ATemp, 1, ALastPos);
   // Return the new path with a trailing delimiter
   Result := SysUtils.IncludeTrailingBackslash(ATemp);
end;

function FileTypeIsRegistered( AExtension, AFiletype: string ): Boolean;
const
  cDEFAULT = '';
var
//  AReg      : TIQRegistry;
  AKeyString, AValueString: string;
begin
//  AReg:= TIQRegistry.Create;
//  with AReg do
//  try
//    try
//      Rootkey:= HKEY_CLASSES_ROOT;
//
//      {Ensure file Extension exists as a sub key of HKEY_CLASSES_ROOT}
//      Result := OpenKey( AExtension, FALSE );  // .EIQ
//      if Result then
//         AValueString := ReadString( cDEFAULT ); // EIQ_auto_file
//      Result := AValueString = AFiletype;
//      CloseKey;
//
//{      if not Result then Exit;
//
//      AValueString := ''; // reset
//      Result := OpenKey( AFiletype, TRUE ); // EIQ_auto_file
//      if Result then
//         AValueString := ReadString( cDEFAULT ); // EIQ Jump
//      Result := AValueString = ADescription;
//      CloseKey;
//
//      if not Result then Exit;  }
//
//    except on E: Exception do
//      raise Exception.CreateFmt( '%s. ErrorCode = %d', [ E.Message, GetLastError ]);
//    end;
//  finally
//    AReg.free;
//  end;
end;

procedure RegisterFileType( AExtension, AFiletype, ADescription, AVerb, AServerApp: string );
{ RegisterFiletype( '.EIQ',                                // AExtension
                    'EIQ_auto_file',                       // AFiletype
                    'EIQ Jump',                            // ADescription
                    'open',                                // AVerb
                    IQGetLocalHomePath + 'IQWin32.exe' );  // AServerApp }
const
  cDEFAULT = '';
var
//  AReg      : TIQRegistry;
  AKeyString: string;
begin
//  AReg:= TIQRegistry.Create;
//  with AReg do
//  try
//    try
//      Rootkey:= HKEY_CLASSES_ROOT;
//
//      {Ensure file Extension exists as a sub key of HKEY_CLASSES_ROOT}
//      OpenKey( AExtension, TRUE );              // .EIQ
//      WriteString( cDEFAULT, AFiletype );       // EIQ_auto_file
//      CloseKey;
//
//      {Now create shell command:
//      EIQJ_auto_file
//          shell
//             open
//                command    }
//      OpenKey( AFiletype, TRUE );               // EIQ_auto_file
//      WriteString( cDEFAULT, ADescription );    // EIQ Jump
//      Closekey;
//
//      {shell}
//      AKeyString:= Format('%s\shell', [ AFiletype ]);
//      OpenKey( AKeyString, TRUE );              // EIQ_auto_file/shell
//      WriteString( cDEFAULT, AVerb );           // open
//      Closekey;
//
//      {command}
//      AKeyString:= Format('%s\shell\%s\command', [ AFiletype, AVerb ]);
//      OpenKey( AKeyString, TRUE );
//      WriteString( cDEFAULT, Format('%s "%%1"', [ AServerApp ])); // D:\IQwin\Iqwin32.exe "%1"
//      CloseKey;
//    except on E: Exception do
//      raise Exception.CreateFmt( '%s. ErrorCode = %d', [ E.Message, GetLastError ]);
//    end;
//  finally
//    AReg.free;
//  end;
end;

procedure UnRegisterFileType( AExtension, AFiletype: string );
const
  cDEFAULT = '';
var
//  AReg      : TIQRegistry;
  AKeyString: string;
begin
//  AReg:= TIQRegistry.Create;
//
//  with AReg do
//  try
//    try
//      Rootkey:= HKEY_CLASSES_ROOT;
//
//      // Remove file Extension key in HKEY_CLASSES_ROOT
//      if OpenKey( AExtension, FALSE ) then   // .EIQ
//         begin
//           CloseKey;
//           DeleteKey(AExtension);
//         end;
//
//      // Remove shell command:
//      if OpenKey( AFiletype, FALSE ) then  // EIQ_auto_file
//         begin
//           CloseKey;
//           DeleteKey(AFiletype);
//         end;
//
//    except on E: Exception do
//      raise Exception.CreateFmt( '%s. ErrorCode = %d', [ E.Message, GetLastError ]);
//    end;
//  finally
//    AReg.free;
//  end;
end;

procedure EnsureExistsInTrustedZone( AURLType, AServerName: string );
{ EnsureExistsInTrustedZone( 'http', 'cody.iqms.com') for http://cody.iqms.com}
const
  cPATH = '\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains';
var
//  AReg : TIQRegistry;
  AList: TStringList;
  AMainNodeName: string;
  ASubNodeName : string;

  function ParseServerName( S: string ): Boolean;
  var
    I: Integer;
  begin
    S:= StrTran( S, '.', ';' );
    StrToStringList( S, AList );

    Result:= AList.Count > 0;
    if not Result then EXIT;

    AMainNodeName:= '';
    ASubNodeName := '';

    {main node: end of the string such as four.com}
    I:= AList.Count - 1;
    while (I > -1) and ( AList.Count - 1 - I < 2 ) do
    begin
      if AMainNodeName > '' then
         AMainNodeName:= AList[ I ] + '.' + AMainNodeName
      else
         AMainNodeName:= AList[ I ];
      I:= I - 1;
    end;

    {subnode: beginning of the string such as one.two.three}
    for I:= 0 to AList.Count - 3 do
      if ASubNodeName > '' then
         ASubNodeName:= ASubNodeName + '.' + AList[ I ]
      else
         ASubNodeName:= AList[ I ];
  end;

begin
  {1. http://one.two.three.four.com: we should create node "four.com" with subnode "one.two.three":
      four.com
        |--- one.two.three

   2. http://one.com: we should create node "one.com"

   3. http://one: we should create node "one" }


//  AReg := TIQRegistry.Create;
//  AList:= TStringList.Create;
//  with AReg do
//  try
//    if not ParseServerName( AServerName ) then EXIT;
//
//    try
//      Rootkey:= HKEY_CURRENT_USER;
//
//      {main node}
//      OpenKey( cPATH + '\' + AMainNodeName, TRUE );     // four.com
//
//      {create subnode if needed}
//      if ASubNodeName > '' then
//      begin
//         CloseKey;
//         OpenKey( cPATH + '\' + AMainNodeName + '\' + ASubNodeName, TRUE );  // one.two.three
//      end;
//
//      {value goes into main or subnode if exists}
//      WriteInteger( AURLType, 2 );                    // 'http' with value 2
//
//      CloseKey;
//    except on E: Exception do
//      raise Exception.CreateFmt( '%s. ErrorCode = %d', [ E.Message, GetLastError ]);
//    end;
//  finally
//    AReg.free;
//    AList.Free;
//  end;
end;


//procedure AssignBDEConfig( ASetting: string; DB: string = 'IQ' );
//var
//  AList     : TStringList;
//  AAliasName: string;
//  ADBase    : TFDCustomConnection;
//begin
//  AList:= TStringList.Create;
//  try
//    ADBase:= FDManager.FindConnection( DB );
//    if not Assigned( ADBase ) then
//       EXIT;
//
//    AAliasName:= ADBase.Params.Values[cnstFDDatabaseParam];
//    AList.Add( ASetting );                  {Ex: SCHEMA CACHE DIR=''}
//
//    // Session.ModifyAlias( AAliasName, AList );
//
////    if ADBase.Connected then
////       ResetConnection( DB );
//  finally
//    AList.Free;
//  end;
//end;

function IsEIQInvokedByJumpFile: Boolean;
var
  I: Integer;
begin
  for I:= 1 to ParamCount do
    if (CompareText( ExtractFileExt(ParamStr( I )), '.EIQ' ) = 0) then
    begin
      Result:= TRUE;
      EXIT;
    end;
  Result:= FALSE;
end;


function EnsureMasterHomeIsMapped: Integer;
{Ex: if EnsureMasterHomeIsMapped() <> NO_ERROR then
        IQWarning( 'Error connecting: ' + SysErrorMessage(GetLastError));
}
var
  AMasterHomePath   : string;
  AUNCMasterHomePath: string;              
  ADrive            : string;
  ANetRes           : TNetResource;
  AUser             : string;
  I                 : DWord;
begin
  Result:= NO_ERROR;

  {check if directory exists and available}
  AMasterHomePath:= IQGetMasterHomePath;
  if DirectoryExists( AMasterHomePath ) then
     EXIT;

  {master home is not available - check if UNC info is avail}
  AUNCMasterHomePath:= SysUtils.ExcludeTrailingPathDelimiter( IQGetUNCMasterHomePath );
  if AUNCMasterHomePath = '' then 
     EXIT;
  
  {figure out the mapped drive letter}
  ADrive:= ExtractFileDrive( AMasterHomePath );
  
  {no dive letter is used or master home is set via UNC path that is not available - nothing we can do}
  if (ADrive = '') or (Copy(ADrive,1,2) = '\\') then
     EXIT; 
  
  {get OS user name}
  // I:= 255;
  // SetLength( AUser,I); 
  // GetUserName( PChar(AUser), I); 
  // SetLength( AUser, I );
  // 
  // {delete mapping is there is any}
  // WNetCancelConnection2( PChar(ADrive), 0{connection type flags}, TRUE {Force});
  // 
  // {create new one}
  // FillChar(ANetRes, SizeOf(ANetRes), #0); 
  // with ANetRes do       
  // begin
  //   dwType      := RESOURCETYPE_DISK; 
  //   lpLocalName := PChar(ADrive);                // M:
  //   lpRemoteName:= PChar(AUNCMasterHomePath);    // '\\P933\IQwin'
  //   lpProvider  := ''; 
  // end;
  
  // Add connection, returns NO_ERROR when success
  // Result:= WNetAddConnection2( ANetRes, ''{password}, PChar(AUser){OS user name}, CONNECT_INTERACTIVE );  

  ExecuteProgramExA( Format('Net use %s /delete', [ ADrive ]));
  ExecuteProgramExA( Format('Net use %s %s', [ ADrive, AUNCMasterHomePath ]));
  Sleep(2000);  {allow net use to be executed}
end;


procedure ChangeWindowsDefaultPrinter(const APrinterName: string) ;
var
  W2KSDP: function(pszPrinter: PChar): Boolean; stdcall;
  H          : THandle;
  Size, Dummy: Cardinal;
  PI         : PPrinterInfo2;
begin
  if (Win32Platform = VER_PLATFORM_WIN32_NT) and (Win32MajorVersion >= 5) then
     begin
       @W2KSDP := GetProcAddress(GetModuleHandle(winspl), 'SetDefaultPrinterW') ;
       if @W2KSDP = nil then RaiseLastOSError;
       if not W2KSDP(PWideChar(APrinterName)) then RaiseLastOSError;
     end
  else
     begin
       if not OpenPrinter(PChar(APrinterName), H, nil) then 
          RaiseLastOSError;
       try
         WinSpool.GetPrinter(H, 2, nil, 0, @Size) ;
         if GetLastError <> ERROR_INSUFFICIENT_BUFFER then 
            RaiseLastOSError;
         GetMem(PI, Size) ;
         try
           if not WinSpool.GetPrinter(H, 2, PI, Size, @Dummy) then 
              RaiseLastOSError;
           PI^.Attributes := PI^.Attributes or PRINTER_ATTRIBUTE_DEFAULT;
           if not WinSpool.SetPrinter(H, 2, PI, PRINTER_CONTROL_SET_STATUS) then 
              RaiseLastOSError;
         finally
           FreeMem(PI) ;
         end;
       finally
         ClosePrinter(H) ;
       end;
     end;
end;     //ChangeDefaultPrinter


function GetPrinterJobsCount( APrinterName: string = ''): Integer;   {pass printer name or leave blank for windows default printer}
type 
  TJobs  = array [0..1000] of JOB_INFO_1; 
  PJobs = ^TJobs;
var 
  hPrinter: THandle; 
  ABytesNeeded, ANumJobs: Cardinal; 
  AJobs: PJobs; 

  function GetCurrentWindowsDefaultPrinterHandle: THandle; 
  var 
    Device, Driver, Port: array[0..255] of Char; 
    hDeviceMode: THandle; 
  begin 
    Printer.GetPrinter(Device, Driver, Port, hDeviceMode); 
    if not OpenPrinter(@Device, Result, nil) then 
       RaiseLastOSError; 
  end; 

  function GetPrinterHandle( APrinterName: string ): THandle;
  begin
    if Trim(APrinterName) = '' then
       Result:= GetCurrentWindowsDefaultPrinterHandle
       
    else if not OpenPrinter(PChar(APrinterName), Result, Nil) then
       RaiseLastOSError; 
  end;
  
begin   {GetWindowsDefaultPrinterJobsCount}
  hPrinter:= GetPrinterHandle( APrinterName );
  
  try 
    EnumJobs( hPrinter, 0, 1000, 1, nil, 0, ABytesNeeded, ANumJobs);     
    AJobs:= AllocMem(ABytesNeeded); 
    try
      if not EnumJobs(hPrinter, 0, 1000, 1, AJobs, ABytesNeeded, ABytesNeeded, ANumJobs) then 
         RaiseLastOSError; 
      Result:= ANumJobs;
    finally
      FreeMem( AJobs );
    end;
  finally 
    ClosePrinter(hPrinter); 
  end; 
end;


procedure EnsureZeroJobsInPrintQueue();
var
  AStart: TDateTime;
  Device, Driver, Port: array[0..255] of Char; 
  hDeviceMode: THandle; 
begin
  Printer.GetPrinter(Device, Driver, Port, hDeviceMode); 
  
  AStart:= Now;
  while IQMS.Common.Miscellaneous.GetPrinterJobsCount( {default printer} ) > 0 do
  begin
    {if it didn't finish printing after 20 mins the process hung}
    if (Now - AStart) * 86400 > 60 * 20 then
    begin
      IQWarning(Format('Printing Queue of %s is not being processed - program will abort waiting for the printout and attempt to continue normal execution.', 
                       [ Device ]));
      BREAK;
    end;   
    Sleep(300);
    Application.ProcessMessages;
  end;
end;


function ExpandEnvironment(const strValue: string): string;
var      
  chrResult: array[0..1023] of Char;
  wrdReturn: DWORD;
begin
  // Example: Edit1.Text:= ExpandEnvironment( '%SystemRoot%\Temp\');
  wrdReturn := ExpandEnvironmentStrings(PChar(strValue), chrResult, 1024);
  if wrdReturn = 0 then
     Result:= strValue
  else
     Result:= Trim(chrResult);
end;              


function ExtractInLineParam( AParamName: string; var AValue: string ): Boolean;
var
  I: Integer;
  AList: TStringList;
begin
  {commnad line should look like that: c:\program files\iqms\iqwin32.exe user=iqms password=iqms alias=iqora}
  AList:= TStringList.Create;
  try
    for I:= 1 to ParamCount do
      AList.Add(ParamStr(I));

   {look for a pair SomeName=SomeValue}   
   Result:= AList.IndexOfName(AParamName) > -1;
   if Result then
   begin
     AValue:= AList.Values[ AParamName ];
     EXIT;
   end;

   {look for a flag such as _MULTI_}
   AValue:= '';
   Result:= AList.IndexOf(AParamName) > -1;
    
  finally
    AList.Free;
  end;
end;


function SmartPageWantsLauncherHidden: Boolean;
var
  ATmp: string;
begin
  Result:= FALSE;
  // obsolte as of Feb-10-2008 after switching to dcom
  // Result:= ExtractInLineParam( 'SMART_PAGE', ATmp ) and not ExtractInLineParam( 'KEEP_LAUNCHER_VISIBLE', ATmp );  {IQMisc.pas}
end;

procedure CheckSmartPageMakeLauncherHidden(AImmediate: Boolean = FALSE);
begin
  if SmartPageWantsLauncherHidden() then
  begin
    Application.ShowMainForm:= FALSE;
  
    if AImmediate then
       SendMessage( Application.MainForm.Handle, iq_Notify, SMART_PAGE_HIDE_IQLAUNCHER, 0)     {IQUsrMsg.pas}
    else
       PostMessage( Application.MainForm.Handle, iq_Notify, SMART_PAGE_HIDE_IQLAUNCHER, 0);
  end;
end;


function IsWindowsVista: Boolean;   {use IsWinVista in IqSysInfo.pas}
var
  VerInfo: TOSVersioninfo;
begin
  VerInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
  GetVersionEx(VerInfo);
  Result:= VerInfo.dwMajorVersion >= 6;
end;

function IgnoreCOMRaisedEAbort(E: Exception): Boolean;
begin
  Result:= E.ClassNameIs( 'EAbort' ) or (E.ClassNameIs('EOleException') and (CompareText(E.Message, 'Operation aborted') = 0));
end;

function IQGetGlobalSetting(const ASetting: String;
 var AValue: String): Boolean;
begin
  Result := False;
//  with TIQRegistry.Create do
//  try
//    RootKey:= HKEY_LOCAL_MACHINE;
//    if not OpenKey('\Software\IQMS\IQWin32', FALSE) then Exit;
//    Result := ValueExists(ASetting);
//    if Result then
//       AValue := ReadString(ASetting);
//  finally
//     Free;
//  end;
end;

procedure IQSetGlobalSetting(const ASetting: String;
 const AValue: String);
begin
//  with TIQRegistry.Create do
//  try
//    RootKey:= HKEY_LOCAL_MACHINE;
//    if OpenKey('\Software\IQMS\IQWin32', FALSE) then
//       WriteString(ASetting, AValue);
//  finally
//     Free;
//  end;
end;

procedure Delay(dwMilliseconds: LongInt; AMessage: String);
var
  iStart, iStop: DWORD;
//  hMsg: TPanelMesg;
begin
  // Initial
//  hMsg := NIL;

  try
//     if (AMessage > '') then
//        hMsg := hPleaseWait(AMessage);

     iStart := GetTickCount;
     repeat
       iStop := GetTickCount;
       Application.ProcessMessages;
       Sleep(1); // prevents pegging the CPU
     until (iStop - iStart) >= dwMilliseconds;

  finally
//    if (hMsg <> NIL) and Assigned(hMsg) then FreeAndNil(hMsg);
  end;
end;


function GetIndexNameFromForeignKeyConstraint( AParentTableName, AChildTableName: string; var AIndexName: string ): Boolean;
begin

  AIndexName:= SelectValueFmtAsString(
    'select ''II_'' || substr(constraint_name,4)  '#13 +
    '  from user_constraints                      '#13 +
    ' where table_name = ''%s''                   '#13 +
    '   and constraint_type = ''R''               '#13 +
    '   and r_constraint_name = ''PK_%s''         ',
    [UpperCase(AChildTableName),
     UpperCase(AParentTableName)]);
  Result:= SelectValueFmtAsInteger(
    'select 1 from user_indexes where index_name = ''%s''',
    [UpperCase(AIndexName)]) = 1;
end;


function GetLongPathName(const ShortPath: String): String; 
var 
  GetLongPathNameFunc: TGetLongPathName; 
  hKernel32: THandle; 
begin 
  hKernel32:= LoadLibrary(kernel32); 
  try 
    GetLongPathNameFunc:= GetProcAddress(hKernel32, 'GetLongPathNameW'); 

    if not Assigned(GetLongPathNameFunc) then 
      RaiseLastWin32Error; 

    SetLength(Result, GetLongPathNameFunc(PChar(ShortPath), nil, 0)); 
    SetLength(Result, GetLongPathNameFunc(PChar(ShortPath), PChar(Result), Length(Result))); 
  finally 
    FreeLibrary(hKernel32); 
  end; 
end;

function IE_Installed: Boolean;
var
  AVersion: String;
begin
  // Initialization
  AVersion := '';

  // Obtain version from the Registry
//  with TIQRegistry.Create do
//  try
//    RootKey := HKEY_LOCAL_MACHINE;
//    OpenKey('Software\Microsoft\Internet Explorer', False);
//    if ValueExists('Version') then
//      AVersion := ReadString('Version')
//    else
//      AVersion := '';
//    CloseKey;
//  finally
//    Free;
//  end;

  // Pass result
  Result := Version <> '';
end;

procedure CheckRTBOXUserCreated(ADatabase: string);

  function tableSpaceExists(const ATablespace: string): Boolean;
  begin
    Result := SelectValueFmtAsInteger(
      'SELECT 1 FROM user_tablespaces ' +
      'WHERE tablespace_name = UPPER(TRIM(''%s'')) AND ROWNUM < 2',
      [ATablespace],
      ADatabase) = 1;
  end;

begin
  // If the user, RTBOX, does not exist, then create it.
  try
    if (SelectValueAsInteger(
      'SELECT 1 FROM dba_users WHERE username = ''RTBOX'' AND ROWNUM < 2',
      ADatabase) = 0) and
      tableSpaceExists('USERS') and tableSpaceExists('TEMP') then
      begin
        ExecuteCommand(
          'CREATE USER RTBOX IDENTIFIED BY IQMS ' +
          'DEFAULT TABLESPACE USERS TEMPORARY TABLESPACE TEMP', ADatabase);
        ExecuteCommand('GRANT CONNECT TO "RTBOX"', ADatabase);
        ExecuteCommand('GRANT CREATE SESSION TO "RTBOX"', ADatabase);
        ExecuteCommand('GRANT SELECT ON iqorder2 TO "RTBOX"', ADatabase);
        ExecuteCommand('DELETE FROM s_user_general ' +
          'WHERE UPPER(TRIM(user_name)) = UPPER(RTRIM(''RTBOX''))', ADatabase);
        ExecuteCommand('INSERT INTO s_user_general (user_name) ' +
          'VALUES (''RTBOX'')', ADatabase);
      end;
  except
    // never display errors here
  end;
end;

procedure EnsureCurrentIQMSPassword( ADBase: TFDConnection; A_Alias:String = 'IQORA');
var
  ARTBoxDataBase: TFDConnection;
//  ARTBoxSession : TSession;
  APassword: string;


  // TODO -oGabriel -cBDE: Need to review if this is accurate, what is the logic and how do we conver it?
  procedure CreateRTBoxDataBaseAccessComponents;
  begin
    try
//      //CS_Sessions.Acquire;
//      try
//        ARTBoxSession:= TSession.Create( NIL );
//        ARTBoxSession.SessionName:= 'Session_'+ IntToStr( Random( 100000000 ));
//      finally
//        //CS_Sessions.Release;
//      end;

      // ARTBoxSession.Active:= TRUE;
      ARTBoxDataBase:= TFDConnection.Create(nil);
//      ARTBoxDataBase.DatabaseName:= Format('RTBoxDatabase_%s', [ ARTBoxSession.SessionName ]);  {unique name}
//      ARTBoxDataBase.Params.Values[ szENABLESCHEMACACHE ]:= 'FALSE';
//      ARTBoxDataBase.KeepConnection:= TRUE;
      ARTBoxDataBase.LoginPrompt   := FALSE;
      ARTBoxDataBase.ConnectionName := A_Alias;
//      ARTBoxDataBase.AliasName     := 'IQORA'; // 07-18-2011 ADBase.AliasName;
      ARTBoxDataBase.Params.Values[cnstFDUserNameParam]:= 'RTBox';
//      ARTBoxDataBase.Params.Values[cnstFDPasswordParam]:= DB_DM.GetRTBoxPassword( A_Alias ); //EIQ-2434 AB 03-06-14

    except on E: Exception do
      begin
//        TFrmCheckPointList.Add( Format('EnsureCurrentIQMSPassword, CreateRTBoxDataBaseAccessComponents: %s', [ E.Message ]));
        raise;
      end;
    end;
  end;

  procedure FreeRTBoxDataBaseAccessComponents;
  begin
    try
      if Assigned( ARTBoxDataBase ) then
         ARTBoxDataBase.Free;

//      if Assigned(ARTBoxSession) then
//      begin
//        //CS_Sessions.Acquire;
//        try
//          ARTBoxSession.Close;
//          ARTBoxSession.Free;
//        finally
//          //CS_Sessions.Release;
//        end;
//      end;
    except on E: Exception do
      begin
//        TFrmCheckPointList.Add( Format('EnsureCurrentIQMSPassword, FreeRTBoxDataBaseAccessComponents: %s', [ E.Message ]));
        raise;
      end;
    end;    
  end;

  function GetCurrentIQMSPassword: string;
  begin
//    with TFDQuery.Create(nil) do
//    try
//      Connection := db_dm.FDConnection;
//      SQL.Add( 'select IQMS_LOG from iqms.iqorder2' );
//      Open;
//      if Fields[ 0 ].asString = '' then
//         Result:= 'IQMS'
//      else
//         Result:= CharXOR(Fields[ 0 ].asString);
//    finally
//      Free;
//    end;
  end;

  
begin
  if CompareText( ADBase.Params.Values[cnstFDUserNameParam], 'IQMS' ) <> 0 then
     EXIT;
  CheckRTBOXUserCreated(ADBase.ConnectionName);
  CreateRTBoxDataBaseAccessComponents;
  try
    try
    ARTBoxDataBase.Connected:= TRUE;
    APassword:= GetCurrentIQMSPassword();
    except on E: Exception do
      begin
//        TFrmCheckPointList.Add( Format('EnsureCurrentIQMSPassword error (connecting and getting data): %s', [ E.Message ]));
        raise;
      end;
    end;
    
    if CompareText(ADBase.Params.Values[cnstFDPasswordParam], APassword) <> 0 then
    try
      ADBase.Connected:= FALSE;
      ADBase.Params.Values[cnstFDPasswordParam]:= APassword;
    
//      if (SecurityManager <> nil) then
//         SecurityManager.Password:= APassword;
    except on E: Exception do
      begin
//        TFrmCheckPointList.Add( Format('EnsureCurrentIQMSPassword error (updating): %s', [ E.Message ]));
        raise;
      end;
    end;

  finally
    FreeRTBoxDataBaseAccessComponents;
  end;
end;

procedure CheckCancelChanges;
begin
  // IQMS.Common.ResStrings.cTXT0000421 = 'Cancel changes?';
//  if not iqmesg.IQConfirmYN(IQMS.Common.ResStrings.cTXT0000421) then
//   SysUtils.Abort;
end;

function UserHasWebDirectRole( AUserID : string ) : boolean;
begin
  Result := SelectValueFmtAsInteger(
    'select 1 from dba_role_privs where granted_role = ''IQWEBDIRECT_ROLE'' '+
    '          and grantee = ''%s''',
    [ AUserID ]) = 1;
end;

function GetLocalComputerName : string;
var
    Buffer: array [0..63] of AnsiChar;
    GInitData: TWSADATA;
begin
    Result := '';
    WSAStartup($101, GInitData);
    GetHostName(Buffer, SizeOf(Buffer));
    Result:=Buffer;
    WSACleanup;
end;

function IQGetIISServerBaseURLWebDirect:string;
begin
(*Note: this logic is strictly for WebDirect base URL construction, all others use IQGetIISServerBaseURL
 Example result: localhost:8080/WebDirect *)

  //EIQ-4264 Allow WebDirect to be configured on a different server than the default IIS
  //EIQ-4977 System Parameters - Web - Use IIS Gateway AB 12-11-14
  Result:= SelectValueAsString(
    'select web_direct_share.get_site_url from dual');// Example result: localhost:8080/WebDirect
end;


procedure ValidateColumnName( AColumnName: string );
var
  I: Integer;
begin
  IQAssert( Pos( ' ', AColumnName ) = 0,  IQMS.Common.ResStrings.cTXT0000324 ); // 'Column name may not contain space(s)'
  IQAssert( Length( AColumnName ) <= 30,  IQMS.Common.ResStrings.cTXT0000328 ); // 'Column name length cannot exceed 30';
                                                                                                            
  for I:= 1 to Length( AColumnName ) do
  begin
    if I = 1 then
       IQAssert( Ord(AColumnName[ 1 ]) in [ Ord('A')..Ord('Z') ], IQMS.Common.ResStrings.cTXT0000325 ) // 'Column name must start with a letter'
    else   
       IQAssert( Ord(AColumnName[ I ]) in [ Ord('A')..Ord('Z'), Ord('_'), Ord('0')..Ord('9') ], IQMS.Common.ResStrings.cTXT0000327 ); // 'Column name may only contain letters, digits and underscore'
  end;  
end;


procedure ValidateComponentName( AName: string );
var
  I: Integer;
begin
  IQAssert( Pos( ' ', AName ) = 0,  IQMS.Common.ResStrings.cTXT0000476 ); // 'Component name may not contain space(s)';

  AName:= UpperCase(AName);
  for I:= 1 to Length( AName ) do
  begin
    if I = 1 then
       IQAssert( TCharacter.IsLetter(AName[ 1 ]) or (AName[ 1 ] = '_'), IQMS.Common.ResStrings.cTXT0000477 ) // 'Component name must start with a letter or underscore';
    else   
       IQAssert( TCharacter.IsLetter(AName[ 1 ]) or TCharacter.IsDigit(AName[ 1 ]) or (AName[ 1 ] = '_'), IQMS.Common.ResStrings.cTXT0000478 ); // 'Component name may only contain letters, digits and underscore';
  end;  
end;

function IQUseIISGateway(DB: string): Boolean;
begin
  Result := SelectValueAsString(
    'select nvl(use_iis_gateway, ''N'') from iqsys2', DB) = 'Y';
end;


initialization
  try
    FPrinterIndexOnStartUp:= Printers.Printer.PrinterIndex
  except
    FPrinterIndexOnStartUp:= -1;
  end;
  CS_Connection:= TCriticalSection.Create;

finalization
  CS_Connection.Free;

end.

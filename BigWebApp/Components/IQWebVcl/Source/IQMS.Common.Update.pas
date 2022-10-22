unit IQMS.Common.Update;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  IQMS.Common.Registry,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication,
  uniGUIBaseClasses,
  uniLabel,
  uniProgressBar;

type
  {This form is just to display the copy progress}
  TfrmUpdate = class(TUniForm)
    Label1: TUniLabel;
    lblUpdatingFile: TUniLabel;
    ProgressBar: TUniProgressBar;
  private
    { Private declarations }
    function GetUpdatingFile:string;
    procedure SetUpdatingFile( const AFileName:string );
  public
    procedure ShowUpdatedFileInCopyDir( AObject : TObject );
    { Public declarations }
    property UpdatingFile:string read GetUpdatingFile write SetUpdatingFile;
  end;

type
  TIQUpdate = class
    private
      FList: TStringList;
      FIQMS_Local_Home  : string;
      FIQMS_Master_Home : string;
      procedure SetFilesList( AList:TStringList; const APath:string );
      procedure FreeStringListOfFileInfo( AList:TStringList );
    public
      constructor Create;
      destructor Destroy; override;
      // If AlwaysUpdate is True, then files will be copied from the Master
      // Home, whether or not a corresponding file exists in the Local Home.
      procedure SetOutOfDateFilesList(const FileSpec: string; AlwaysUpdate: Boolean);

      // Pass Exe name that you want matching/updated config file for
      procedure SetConfigFilesList( const ExeFileSpec: string );

      function CopyFromMaster( AList : TStringList):Integer;
      procedure CheckSourceDestinationDirs;

      class function ReadIQMS_Registry( RegRootKey:HKey; const Path, Key : string ):string;
      class procedure WriteIQMS_Registry( RegRootKey:HKey; const Path, Key : string; AValue: String );

      procedure CheckUpdateSmartPage;

      property IQMS_Local_Home : string read FIQMS_Local_Home  write FIQMS_Local_Home ;
      property IQMS_Master_Home: string read FIQMS_Master_Home write FIQMS_Master_Home;
      property List: TStringList read FList write FList;
  end;

  TFileInfo = class
      Time: Integer;
      Size: Integer;
      Attr: Integer;
      Name: TFileName;
  end;

function IQExeUpToDate( const FileSpec : string ):Boolean;
procedure IQSyncWithMaster;
procedure OracleCopyFromMaster;

implementation

{$R *.DFM}

uses
  IQMS.Common.Dialogs,
  IQMS.Common.StringUtils,
  IQMS.Common.FileUtils,
  IQMS.Common.ResStrings,
  IQMS.Common.Dates,
  IQMS.Common.Miscellaneous;

{ External Aux Procedures }
function IQExeUpToDate( const FileSpec : string ):Boolean;
var
   AAlwaysUpdate: Boolean;
begin
  Result:= TRUE;
  with TIQUpdate.Create do
  try
    try
      CheckSourceDestinationDirs;
      AAlwaysUpdate := not ( CompareText( FileSpec, '*.BPL'    ) <> 0 ) and ( CompareText( FileSpec, '*.DLL' ) <> 0 );
      SetOutOfDateFilesList( FileSpec, AAlwaysUpdate );
      SetConfigFilesList(FileSpec);

      if List.Count = 0 then              {if EXEs are out of date - don't bother checking DLLs}
        SetOutOfDateFilesList('*.DLL', True);
      Result:= List.Count = 0;
    except
      Result:= FALSE;
      raise;
    end
  finally
    Free;
  end;
end;

procedure IQSyncWithMaster;
var
  n:Integer;
  HasErrors:Boolean;
begin
  n:= 0;
  HasErrors:= FALSE;
  with TIQUpdate.Create do
  try
    try
       CheckSourceDestinationDirs;

       {Check if EXE or a DLL has changed on the Master SubDir}
       SetOutOfDateFilesList( '*.EXE', False );
       SetOutOfDateFilesList( '*.DLL', True );
       SetOutOfDateFilesList( '*.BPL', True );
       SetConfigFilesList( '*.EXE'); // .Net reporting requires Exe needs matching xml
                                     // file called *.exe.config where * is the exe's name.
       SetOutOfDateFilesList( 'english.aff', True );
       SetOutOfDateFilesList( 'american.xlg', True );
       SetOutOfDateFilesList( 'EnglishAlphabet.txt', True );

       n:= CopyFromMaster( List ); // pass the full list of found files

       CheckUpdateSmartPage;

    except
       HasErrors:= TRUE;
       Application.ShowException( Exception( ExceptObject ));
    end;
  finally
    Free;
    if HasErrors then
      IQError( IQMS.Common.ResStrings.cTXT0000059 {'Update finished with errors'} )
    else if n > 0 then
      // 'Update finished with %d executables and DLLs successfully updated.'
      IQWarning(Format(IQMS.Common.ResStrings.cTXT0000060, [ n ]))
    else
      // 'Update finished with no out-of-date executables or DLLs found.'
      IQInformation(IQMS.Common.ResStrings.cTXT0000061);
  end;
end;

procedure OracleCopyFromMaster;
var
  ASource, ATarget:string;
  FrmUpdate : TfrmUpdate;
begin
  frmUpdate:= TFrmUpdate.Create(Application);
  try
    frmUpdate.Show;               {Progress Forms}
    Application.ProcessMessages;

    ASource:= TIQUpdate.ReadIQMS_Registry( HKEY_LOCAL_MACHINE, '\Software\IQMS\IQWin32', 'IQMS_MASTER_ORACLE_HOME');
    ATarget:= TIQUpdate.ReadIQMS_Registry( HKEY_LOCAL_MACHINE, '\Software\ORACLE', 'ORACLE_HOME' );

    with TIQCopyDir.Create( ASource, ATarget ) do
    try
      OnFileCopy:= frmUpdate.ShowUpdatedFileInCopyDir;
      CopyFiles([ '*.*' ]);
    finally
      ShowFilesCopiedCount;
      Free;
    end;
  finally
    frmUpdate.Hide; frmUpdate.Free;
  end;
end;


{ TfrmUpdate }

function TfrmUpdate.GetUpdatingFile:string;
begin
  result:= lblUpdatingFile.Caption;
end;

procedure TfrmUpdate.SetUpdatingFile( const AFileName:string );
begin
  lblUpdatingFile.Caption:= AFileName;
  lblUpdatingFile.Update;
end;

procedure TfrmUpdate.ShowUpdatedFileInCopyDir( AObject : TObject );
begin
  with AObject as TIQCopyDir do
    UpdatingFile:= TargetFile;
end;

{TIQUpdate}
constructor TIQUpdate.Create;
begin
  FList:= TStringList.Create;
  IQMS_Local_Home := ReadIQMS_Registry( HKEY_LOCAL_MACHINE, '\Software\IQMS\IQWin32', 'IQMS_LOCAL_HOME' );
  IQMS_Master_Home:= ReadIQMS_Registry( HKEY_LOCAL_MACHINE, '\Software\IQMS\IQWin32', 'IQMS_MASTER_HOME');
end;

destructor TIQUpdate.Destroy;
begin
  FreeStringListOfFileInfo( FList  );
  inherited;
end;

procedure TIQUpdate.FreeStringListOfFileInfo( AList:TStringList );
begin
  while AList.Count > 0 do
  begin
    TFileInfo( AList.Objects[ AList.Count - 1 ] ).Free;
    AList.Delete( AList.Count - 1 );
  end;
  AList.Free;
end;

procedure TIQUpdate.CheckSourceDestinationDirs;
begin
  if Empty( IQMS_Master_Home ) or not DirectoryExists(IQMS_Master_Home) {IQDirExists( IQMS_Master_Home )} then
     // 'Unable to locate IQMS Master Home directory %s. Check your network and drive mappings.'
     raise Exception.CreateFmt(IQMS.Common.ResStrings.cTXT0000062, [ IQMS_Master_Home ]);
  if Empty( IQMS_Local_Home ) or not DirectoryExists(IQMS_Local_Home) {IQDirExists( IQMS_Local_Home )} then
     // 'Unable to locate IQMS Local Home directory %s. Check your network and drive mappings.'
     raise Exception.CreateFmt( IQMS.Common.ResStrings.cTXT0000063, [ IQMS_Local_Home ]);
  if not FileExists( IQMS_Master_Home + 'IQwin32.exe') then
     // 'Unable to locate main executable file, IQWIN32.EXE.'
     raise Exception.Create( IQMS.Common.ResStrings.cTXT0000064 );
end;

function TIQUpdate.CopyFromMaster( AList : TStringList):Integer;
var
  i:Integer;
  Source, Dest : string;
  ASourceAge : Integer;
  ro, hd: Boolean;
begin
  {Create Progress Form}
  result:= 0;
  with TfrmUpdate.Create(Application) do
  try
    Show;    {Progress Forms}
    Application.ProcessMessages;

    // Set progress bar
    ProgressBar.Visible := TRUE;
    ProgressBar.Position := 0;
    ProgressBar.Max := AList.Count;

    for i:= 0 to AList.Count - 1 do
    try

      ProgressBar.Position:=ProgressBar.Position+1;

      Source:= AList[ i ];

      // Do not process a file if it has the same name as the current executable (07/08/2005)
      // NOTE: We do not specifically name iqstatus.exe here because this method
      //       can be used generally.  It will fail at this stage if it attempts
      //       to update the current application.
      //if (UpperCase(ExtractFileName(AList[i])) = UpperCase(ExtractFileName(Application.ExeName))) then
      //   CONTINUE;

      // hard-coded
      if (UpperCase(ExtractFileName(AList[i])) = 'IQSTATUS.EXE') then
         CONTINUE;

      Dest  := IQMS_Local_Home + ExtractFileName( AList[ i ] );

      // Get the file age now to avoid any sharing violations
      ASourceAge:= FileAge( Source );

      UpdatingFile:= AList[ i ];

      try
         // 07/08/2010 Remove write protection (Byron).
         ro := IQMS.Common.FileUtils.IsFileReadOnly(Source);
         if IQMS.Common.FileUtils.IsFileReadOnly(Dest) then IQMS.Common.FileUtils.SetFileReadOnly(Dest, False);
         hd := IQMS.Common.FileUtils.IsFileHidden(Source);
         if IQMS.Common.FileUtils.IsFileHidden(Dest) then IQMS.Common.FileUtils.SetFileHidden(Dest, False);

         if not CopyFile( PChar(Source), PChar(Dest), False {Fail if exists}) then
            // 'Unable to copy %s to %s. Error Code: %d'
            raise Exception.Create(Format(IQMS.Common.ResStrings.cTXT0000065, [ Source, Dest, GetLastError ] ))
         else
           SetFileDate( Dest, ASourceAge ); // IQFile

      finally
         IQMS.Common.FileUtils.SetFileReadOnly(Dest, ro);
         IQMS.Common.FileUtils.SetFileHidden(Dest, hd);
      end;

      result:= result + 1;
    except on E:Exception do
      begin
        if IQWarningYN( E.Message + #10#13 + IQMS.Common.ResStrings.cTXT0000066 { 'Abort Update?' } ) then
           BREAK;
        ProgressBar.Visible := FALSE;
      end;
    end;
  finally
    Hide; Free;
  end;
end;

procedure TIQUpdate.SetConfigFilesList( const ExeFileSpec:string );
var
  LocalExeList, LocalConfigList, MasterConfigList: TStringList;
  iExe: Integer;


    procedure _CheckAddConfigFileToList(AExeName:String);
    var
      iMConfig, iLConfig : Integer;
    begin
        // Find matching Local config file for this exe
          iLConfig:= ( LocalConfigList.IndexOf( AExeName + '.CONFIG' ) );
        if iLConfig >= 0 then
          begin

             // Find matching master config
             iMConfig:= MasterConfigList.IndexOf( LocalConfigList[ iLConfig ] );
             if (iMConfig >= 0) then
                // If Local config file time or size differ from master config
                if (  ( TFileInfo( LocalConfigList.Objects[ iLConfig ] ).Time <> TFileInfo( MasterConfigList.Objects[ iMConfig ] ).Time )
                  or ( TFileInfo( LocalConfigList.Objects[ iLConfig ] ).Size <> TFileInfo( MasterConfigList.Objects[ iMConfig ] ).Size ) )
                then
                  List.Add( TFileInfo( MasterConfigList.Objects[ iMConfig ] ).Name );
          end
        else // Else look for master config
          begin
              iMConfig:= MasterConfigList.IndexOf( AExeName + '.CONFIG' );
            if (iMConfig >= 0) then
              // Add to list to be copied
              List.Add( TFileInfo( MasterConfigList.Objects[ iMConfig ] ).Name );
          end;
    end;
begin
  try
    LocalExeList    := TStringList.Create;
    LocalConfigList := TStringList.Create;
    MasterConfigList:= TStringList.Create;

    SetFilesList( LocalExeList,     IQMS_Local_Home  + ExeFileSpec             );
    SetFilesList( LocalConfigList,  IQMS_Local_Home  + ExeFileSpec + '.CONFIG' );
    SetFilesList( MasterConfigList, IQMS_Master_Home + ExeFileSpec + '.CONFIG' );

    // For each .EXE
    for iExe:= 0 to LocalExeList.Count - 1 do
    begin
      _CheckAddConfigFileToList( LocalExeList[ iExe ] );

      // check dos(8.3 format) config filenames that are different than long filenames
      if not Empty( ExtractShortPathName( LocalExeList[ iExe ] ) ) and
            ( CompareStr( ExtractShortPathName( LocalExeList[ iExe ] ), LocalExeList[ iExe ] ) <> 0 ) then
        _CheckAddConfigFileToList( ExtractShortPathName( LocalExeList[ iExe ] ) );
    end
  finally
    FreeStringListOfFileInfo( LocalExeList     );
    FreeStringListOfFileInfo( LocalConfigList  );
    FreeStringListOfFileInfo( MasterConfigList );
  end;
end;

procedure TIQUpdate.SetOutOfDateFilesList(const FileSpec: string; AlwaysUpdate: Boolean);
var
  LocalList, MasterList: TStringList;
  i, j : Integer;
begin
  try
    LocalList := TStringList.Create;
    MasterList:= TStringList.Create;

    SetFilesList( LocalList,  IQMS_Local_Home  + FileSpec );
    SetFilesList( MasterList, IQMS_Master_Home + FileSpec );

    //if ( CompareText( FileSpec, '*.BPL'    ) <> 0 ) and ( CompareText( FileSpec, '*.DLL' ) <> 0 ) then
    // Update these files only if a corresponding file exists in the local home.
    if not AlwaysUpdate then
       {Add files differ in size/time found on local drive and master}
       for I:= 0 to LocalList.Count - 1 do
       begin
         j:= MasterList.IndexOf( LocalList[ i ] );
         if (j >= 0)
           and (   ( TFileInfo( LocalList.Objects[ i ] ).Time <> TFileInfo( MasterList.Objects[ j ] ).Time )
                or ( TFileInfo( LocalList.Objects[ i ] ).Size <> TFileInfo( MasterList.Objects[ j ] ).Size ))
         then
            List.Add( TFileInfo( MasterList.Objects[ j ] ).Name );
       end

    else
       // Always update these files if they exist in the Master Home --
       // whether or not they exist in the Local Home.
       for I:= 0 to MasterList.Count - 1 do
       begin
         // 05/07/2014 Skip midas.dll which is a system file
         if (CompareText(MasterList[ I ], 'midas.dll') = 0) then
           Continue;

         J:= LocalList.IndexOf( MasterList[ I ] );
         if (J = -1)
            or
            ( (J >= 0) and
              (( TFileInfo( LocalList.Objects[ J ] ).Time <> TFileInfo( MasterList.Objects[ I ] ).Time )
                or ( TFileInfo( LocalList.Objects[ J ] ).Size <> TFileInfo( MasterList.Objects[ I ] ).Size )))
         then
            List.Add( TFileInfo( MasterList.Objects[ I ] ).Name );
       end;

  finally
    FreeStringListOfFileInfo( LocalList  );
    FreeStringListOfFileInfo( MasterList );
  end;
end;

procedure TIQUpdate.SetFilesList( AList:TStringList; const APath:string );
var
  SearchResult: Integer;
  SearchRec   : TSearchRec;
  FileInfo    : TFileInfo;
begin
  try
    SearchResult:= FindFirst( APath, faAnyFile, SearchRec );
    while SearchResult = 0 do
    begin
      FileInfo:= TFileInfo.Create;
      FileInfo.Time:= SearchRec.Time;
      FileInfo.Size:= SearchRec.Size;
      FileInfo.Attr:= SearchRec.Attr;
      FileInfo.Name:= ExtractFilePath(APath) + SearchRec.Name;

      // Do not add a file if it has the same name as IQSTATUS.EXE (07/08/2005)
      // NOTE:  We name IQSTATUS.EXE specifically here because this method
      //        is called by DB_DM to determine if the current application
      //        is out-of-date.  We cannot pass Application.ExeName.
      if UpperCase(ExtractFileName(SearchRec.Name)) <> 'IQSTATUS.EXE' then
         AList.AddObject( ExtractFileName(SearchRec.Name), FileInfo );

      SearchResult:= FindNext(SearchRec);
    end;
  finally
    FindClose(SearchRec);
  end;
end;

class function TIQUpdate.ReadIQMS_Registry( RegRootKey:HKey; const Path, Key : string ) : string;
var
  AReadOnly,
  AReadWrite : TIQWebRegistry;

  procedure _AttemptWrite;
  begin
    AReadWrite:= TIQWebRegistry.Create;
    with AReadWrite do
    try
      // 'The Registry Key, %s, has not been created. Would you like to create it now?'
      RootKey:= RegRootKey;
      OpenKey( Key, TRUE );
      if IQConfirmYN( Format( IQMS.Common.ResStrings.cTXT0000067, [ Key ] )) and
         InputQuery(IQMS.Common.ResStrings.cTXT0000068 {'IQMS Directories'},
                    Format( IQMS.Common.ResStrings.cTXT0000069 {'Enter value for Key, %s'}, [Key]),
                    Result ) then
      begin
        Result:= StrTran( Trim(Result)+'\', '\\', '\') ;
        WriteString( Key, Result );
      end
      else //User cancelled the inputquery or chose no on IQConfirmYN
        raise Exception.Create(''); //caught in main method body

    finally
      Free;
    end;
  end;

begin
  {default if registry is empty}
  Result:= ExtractFilePath( Application.ExeName );

  AReadOnly:= TIQWebRegistry.CreateRO;
  with AReadOnly do
  try
    try
      RootKey:= RegRootKey;
      if not OpenKeyReadOnly( Path ) then
        raise Exception.Create( Format('Unable to open %s IQMS.Common.Registry.', [ Path ])+#10#13 )
      else if ValueExists( Key ) then
        Result:= ReadString( Key );

      if not ValueExists( Key ) then
        _AttemptWrite;

      Result:= StrTran( Trim(Result)+'\', '\\', '\') ;
    except on E : Exception do
      // 'The Registry Key, %s, has not been set up. Use the current directory, %s, instead?';
      if not IQWarningYN( E.Message+Format(IQMS.Common.ResStrings.cTXT0000070, [ Key, ExtractFilePath( Application.ExeName) ])) then
        raise EAbort.Create('');
    end;
  finally
    Free;
  end;

end;

class procedure TIQUpdate.WriteIQMS_Registry(RegRootKey: HKey; const Path,
  Key: string; AValue: String);
begin
  with TIQWebRegistry.Create do
  try
    RootKey:= RegRootKey;
    if OpenKey(Path, FALSE) then
       WriteString(Key, AValue);
  finally
     Free;
  end;
end;

procedure TIQUpdate.CheckUpdateSmartPage;
const
   SMART_PAGE_DIR = 'SmartPage';
var
   AIsInstalled: Boolean;
   ADateStr,
   ALocalDir,
   AMasterDir,
   ASetupFile: String;
   ALastDate, AFileDate: TDateTime;
begin
 { Update local version of SmartPage:
   1.  Check if smart page is installed locally.
   2.  If so, run the following file from master_home\smartpage:
       setup.msi
       setup.exe
 }

 // Initialization
 AIsInstalled := False;

 // Get the master home location of the SmartPage installation files
 //ALocalDir := IQGetSmartPageHomePath; // iqmisc
 //if not DirectoryExists(ALocalDir) then Exit;

 // Check if SmartPage is installed locally
 //AIsInstalled := FileExists(ALocalDir + 'IQSmartPage.exe');

 // If SmartPage is not installed, then exit early
 //if not AIsInstalled then Exit;

 // The installation file is on the master home
 AMasterDir := System.SysUtils.IncludeTrailingBackslash(GetPriorPath(IQMS_Master_Home) + 'SmartPage');

 // Check to ensure directory and file exists
 ASetupFile := AMasterDir + 'setup.exe';
 if not DirectoryExists(AMasterDir) or not FileExists(ASetupFile) then
    Exit;

 // File date of the setup file
 AFileDate := IQMS.Common.FileUtils.GetFileDate(ASetupFile);
 //ADateStr := ReadIQMS_Registry(HKEY_LOCAL_MACHINE, '\Software\IQMS\IQWin32', 'SMART_PAGE_DATE');
 IQMS.Common.Miscellaneous.IQGetGlobalSetting('SMART_PAGE_DATE', ADateStr);

 // Compare dates
 if (ADateStr > '') and
    IQMS.Common.Dates.IsStringValidDate(ADateStr, ALastDate) and (ALastDate > 100) and
    (ALastDate = AFileDate) then
    Exit;

 // update the Registry value
 ADateStr := FormatDateTime('ddddd tt', AFileDate);
 //WriteIQMS_Registry(HKEY_LOCAL_MACHINE, '\Software\IQMS\IQWin32', 'SMART_PAGE_DATE', ADateStr);
 IQMS.Common.Miscellaneous.IQSetGlobalSetting('SMART_PAGE_DATE', ADateStr);

 // Run the installation file.
 IQMS.Common.Miscellaneous.ExecuteProgram(AMasterDir + 'setup.exe');

end;

end.


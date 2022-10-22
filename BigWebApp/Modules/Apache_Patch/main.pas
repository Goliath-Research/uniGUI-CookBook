{
  Version 0.4
  May 2, 2003
  Matt Kilbride

  - added checking to see if the patch files are in place before allowing the
    application to run
  - added checking to see if the server is already patched
  - added checking to see if the patched files were sucessfully installed

  Version 0.3
  - directory copy operation handled by function from freeware code (SHFileOp)
}


unit main;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  Registry,
  FileCtrl,
  ShellAPI,
  SHFileOp,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton;uses
  HOWWINDOW;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  Registry,
  FileCtrl,
  ShellAPI,
  SHFileOp,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton;

type
  TFrmMain = class(TUniForm)
    Panel1: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    sbtnInstall: TUniButton;
    lblStatus: TUniLabel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    lblCurStat: TUniLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnInstallClick(Sender: TObject);
    
  private
    { Private declarations }
   procedure Bomb( const s:string; Append:Integer );
   procedure CheckCurrent();
   procedure CheckPatched();
   procedure CopyDir(const InDir,OutDir: String);
   procedure DeleteDir(const DirName: String);
   function  GetFileDateTime( AFileName: String ): TDateTime;
   function  IQInformation( const s:string ):Word;
   function  LoadStrFromLocalMachineRegistry( const APath, AKey: string ):string;
   procedure NewLoc( const old, new :string );
   procedure NewName( const s:string );
   procedure Patch();
   procedure PostPatch();
   procedure PrePatch();
   procedure VeriFile( const s:string );
   procedure Verify();
   function  WinExecAndWait32(FileName:String; Visibility:integer):integer;

  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;
  OraHome: String;
  ServiceName: String;
  breaker: Boolean;


implementation

{$R *.DFM}

procedure TFrmMain.FormCreate(Sender: TObject);
begin
   // form creation
   ServiceName := 'Oracle' + LoadStrFromLocalMachineRegistry('\Software\Oracle\Home0','Oracle_Home_Name') + 'HTTPServer';
   OraHome:= LoadStrFromLocalMachineRegistry('\Software\Oracle\Home0','Oracle_Home');
   Verify();
   CheckCurrent();
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
   //
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree; // free the form
end;

// installs the security patches
procedure TFrmMain.sbtnInstallClick(Sender: TObject);
begin
   Screen.Cursor:= crHourGlass;
   lblStatus.visible := True;
   lblCurStat.visible := True;
   lblCurStat.caption := 'Stopping Apache';
   lblStatus.update;
   lblCurStat.update;
   WinExecAndWait32('net stop ' + ServiceName,0);
   lblCurStat.caption := 'Preparing';
   lblCurStat.update;
   PrePatch();
   lblCurStat.caption := 'Patching';
   lblCurStat.update;
   Patch();
   lblCurStat.caption := 'Finishing';
   lblCurStat.update;
   PostPatch();
   lblCurStat.caption := 'Starting Apache';
   lblCurStat.update;
   WinExecAndWait32('net start ' + ServiceName,0);
   Screen.Cursor:= crDefault;
   lblCurStat.caption := 'Complete';
   lblCurStat.update;
   CheckPatched();
   IQInformation('Patch installation completed!');
   close();
end;
// ******************************
// Private Functions & Procedures
// ******************************


// displays an error and closes
procedure TFrmMain.Bomb( const s:string; Append:Integer );
var
   AppendText: String;
   i: String;
begin
   AppendText := '.  Write down or capture this error, and contact IQMS technical support for assistance.';
   i := s;
   if Append = 1 then
      i := i + AppendText;
   IQInformation(i);
   halt;
end;


procedure TFrmMain.CheckCurrent();
var
   Source: String;
   SFile: String;
   SFileDate: TDateTime;
   DFile: String;
   DFileDate: TDateTime;
   RelPath: String;
   Current: Boolean;
   PFiles: Array[1..4] of String;
   i: Integer;
begin
   GetDir(0,Source);
   Source := Source + '\files';
   Current := True;
   PFiles[1] := '\Apache\Apache\ApacheCore.dll';
   PFiles[2] := '\Apache\Apache\modules\ApacheModuleSSL.dll';
   PFiles[3] := '\Apache\open_ssl\bin\openssl.exe';
   PFiles[4] := '\bin\modplsql.dll';

   for i := 1 to length(PFiles) do
   begin
      RelPath := PFiles[i];
      SFile := Source + RelPath;
      DFile := OraHome + RelPath;
      SFileDate := GetFileDateTime(SFile);
      DFileDate := GetFileDateTime(DFile);

      if not (SFileDate = DFileDate) then
      begin
         Current := False;
         break
      end;
   end;

   if Current then
      Bomb('All files are patched.  Applying these patches is not necessary.',0);
end;

procedure TFrmMain.CheckPatched();
var
   Source: String;
   SFile: String;
   SFileDate: TDateTime;
   DFile: String;
   DFileDate: TDateTime;
   RelPath: String;
   PFiles: Array[1..4] of String;
   i: Integer;
begin
   GetDir(0,Source);
   Source := Source + '\files';
   PFiles[1] := '\Apache\Apache\ApacheCore.dll';
   PFiles[2] := '\Apache\Apache\modules\ApacheModuleSSL.dll';
   PFiles[3] := '\Apache\open_ssl\bin\openssl.exe';
   PFiles[4] := '\bin\modplsql.dll';

   for i := 1 to length(PFiles) do
   begin
      RelPath := PFiles[i];
      SFile := Source + RelPath;
      DFile := OraHome + RelPath;
      SFileDate := GetFileDateTime(SFile);
      DFileDate := GetFileDateTime(DFile);

      if not (SFileDate = DFileDate) then
      begin
         Bomb('The patches were not successfully applied',1);
      end;
   end;
end;

procedure TFrmMain.CopyDir(const InDir,OutDir: String);
var
   fileop: TShellFileOp;
begin

   fileop := TShellFileOp.Create(nil);
   fileop.NoConfirmation := True;
   fileop.addtarget( InDir + '\*.*');
   fileop.CopyFiles(OutDir);
   fileop.Free;
end;

procedure TFrmMain.DeleteDir(const DirName: String);
var
   fileop: TShellFileOp;
begin
   fileop := TShellFileOp.Create(nil);
   fileop.NoConfirmation := True;
   fileop.addtarget(DirName);
   fileop.DeleteFiles;
   fileop.Free;

   if DirectoryExists(DirName) then
      Bomb('Could not delete ' + DirName,1);
end;

Function TFrmMain.GetFileDateTime( AFileName: String ): TDateTime;
var
  SearchRec : TSearchRec;
  FindResult: Integer;
begin
  FindResult:= FindFirst( AFileName, faAnyFile, SearchRec );
  try
    if FindResult = 0 then
      begin
         Result  := FileDateToDateTime( SearchRec.Time );
      end;
  finally
    FindClose( SearchRec );
  end;
end;

// pop-up text box
function TFrmMain.IQInformation( const s:string ):Word;
begin
   try
      if not IsConsole then
         result:= MessageDlg(s, mtInformation, [mbOK], 0 )
      else
         raise Exception.Create( s );
   finally
      Screen.Cursor:= crDefault;
   end;
end;

// Reads registry values from HKLM
function TFrmMain.LoadStrFromLocalMachineRegistry(const APath,
  AKey: string): string;
begin
  Result:= '';
  with TRegistry.Create do
  try
    RootKey:= HKEY_LOCAL_MACHINE;
    if OpenKey( APath, FALSE ) and ValueExists( AKey ) then
       Result:= ReadString( AKey );
  finally
    Free;
  end;
end;

// Move files to be updated
procedure TFrmMain.NewLoc( const old, new:string );
begin
   if not MoveFile(pchar(old), pchar(new)) then
      Bomb('Could not move ' + old,1);
end;

// Renames files to be updated
procedure TFrmMain.NewName( const s:string );
var
   unpatched: string;
begin
   unpatched := s + '.unpatched';
   if FileExists(unpatched) then
      begin
         if not DeleteFile(unpatched) then
            begin
               Bomb('Could not delete ' + unpatched,1);
            end;
      end;
    if not RenameFile(s, s + '.unpatched') then
      Bomb('Could not rename ' + s,1);
end;

procedure TFrmMain.Patch();
var
   DirIn: String;
   BaseDir: String;
   DirOut: String;
begin
   // Set all file & directory variables
   GetDir(0,BaseDir);
   DirIn := BaseDir + '\files';
   DirOut := OraHome;

   // Copy all patch files
   CopyDir(DirIn,DirOut);
end;

procedure TFrmMain.PostPatch();
var
   DirIn: String;
   DirOut: String;
   REFile: String;
   BKFile: String;
begin
   GetDir(0,DirIn);
   DirIn := DirIn + '\apache';
   DirOut := OraHome + '\apache';

   // plsql.conf restore (modplsql patch)
   REFile := DirOut + '\modplsql\cfg\plsql.conf';
   BKFile := DirOut + '\plsql.conf';
   NewLoc(BKFile,REFile);

   // wdbsvr.app restore (modplsql patch)
   REFile := DirOut + '\modplsql\cfg\wdbsvr.app';
   BKFile := DirOut + '\wdbsvr.app';
   NewLoc(BKFile,REFile);

   // cache.cfg restore (modplsql patch)
   REFile := DirOut + '\modplsql\cfg\cache.cfg';
   BKFile := DirOut + '\cache.cfg';
   NewLoc(BKFile,REFile);
end;

procedure TFrmMain.PrePatch();
var
   DirIn: String;
   DirOut: String;
   REFile: String;
   BKFile: String;
begin
   GetDir(0,DirIn);
   DirIn := DirIn + '\apache';
   DirOut := OraHome + '\apache';

   // ApacheCore.dll renamed (multi & chunked encoding patch)
   REFile := DirOut + '\Apache\ApacheCore.dll';
   NewName(REFile);

   // ApacheModuleSSL.dll renamed (openssl patch)
   REFile := DirOut + '\Apache\modules\ApacheModuleSSL.dll';
   NewName(REFile);

   // OpenSSL.exe renamed (openssl patch)
   REFile := DirOut + '\open_ssl\bin\openssl.exe';
   NewName(REFile);

   // modplsql.dll renamed (modplsql patch)
   REFile := OraHome + '\bin\modplsql.dll';
   NewName(REFile);

   // plsql.conf backup (modplsql patch)
   REFile := DirOut + '\modplsql\cfg\plsql.conf';
   BKFile := DirOut + '\plsql.conf';
   NewLoc(REFile,BKFile);

   // wdbsvr.app backup (modplsql patch)
   REFile := DirOut + '\modplsql\cfg\wdbsvr.app';
   BKFile := DirOut + '\wdbsvr.app';
   NewLoc(REFile,BKFile);

   // cache.cfg backup (modplsql patch)
   REFile := DirOut + '\modplsql\cfg\cache.cfg';
   BKFile := DirOut + '\cache.cfg';
   NewLoc(REFile,BKFile);

   //delete the modplsql directory (modplsql patch)
   REFile := DirOut + '\modplsql';
   DeleteDir(REFile);
end;


// Verifies the existence of a patch file
procedure TFrmMain.VeriFile( const s:string );
begin
   if not FileExists(s) then
      begin
         Bomb('The patch file ' + s + ' does not exist.  This is most likely because the zip file was not extracted properly.  Use the winzip extract button to extract the files, and then try again.',0);
      end;
end;

procedure TFrmMain.Verify();
var
   Source: String;
   SFile: String;
begin
   GetDir(0,Source);
   Source := Source + '\files';

   // ApacheCore.dll
   SFile := Source + '\Apache\Apache\ApacheCore.dll';
   VeriFile(SFile);

   // ApacheModuleSSL.dll
   SFile := Source + '\Apache\Apache\modules\ApacheModuleSSL.dll';
   VeriFile(SFile);

   // OpenSSL.exe
   SFile := Source + '\Apache\open_ssl\bin\openssl.exe';
   VeriFile(SFile);

   // modplsql.dll
   SFile := Source + '\bin\modplsql.dll';
   VeriFile(SFile);
end;

function TFrmMain.WinExecAndWait32(FileName:String; Visibility:integer):integer;
var
  zAppName:array[0..512] of char;
  zCurDir:array[0..255] of char;
  WorkDir:String;
  StartupInfo:TStartupInfo;
  ProcessInfo:TProcessInformation;
  Resultado: DWord;
begin
  StrPCopy(zAppName,FileName);
  GetDir(0,WorkDir);
  StrPCopy(zCurDir,WorkDir);
  FillChar(StartupInfo,Sizeof(StartupInfo),#0);
  StartupInfo.cb := Sizeof(StartupInfo);

  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := Visibility;
  if not CreateProcess(nil,
    zAppName,                      { pointer to command line string }
    nil,                           { pointer to process security attributes}
    nil,                           { pointer to thread security attributes}
    false,                         { handle inheritance flag }
    CREATE_NEW_CONSOLE or          { creation flags }
    NORMAL_PRIORITY_CLASS,
    nil,                           { pointer to new environment block}
    nil,                           { pointer to current directory name}
    StartupInfo,                   { pointer to STARTUPINFO }
    ProcessInfo) then Result := -1 { pointer to PROCESS_INF }

  else begin
    WaitforSingleObject(ProcessInfo.hProcess,INFINITE);
    GetExitCodeProcess(ProcessInfo.hProcess,Resultado);
    Result := Resultado;
  end;
end;

end.

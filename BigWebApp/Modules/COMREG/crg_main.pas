unit crg_main;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Registry,
  Vcl.Buttons,
  Vcl.Menus,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniSplitter,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniMainMenu,
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniEdit, Vcl.ExtCtrls;

type
  TListCargo = class
    RootKey: HKEY;
    Path: string;
    GUID: string;
    StartupRegistryPath: string;
    StartupFile: string;
    constructor Create(ARootKey: HKEY; APath, AGUID, AStartupFile,
      AStartupRegistryPath: string);
  end;

type
  TFrmCrgMain = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Splitter1: TUniSplitter;
    Label1: TUniLabel;
    edtRegPath: TUniEdit;
    Label2: TUniLabel;
    edtGUID: TUniEdit;
    Label3: TUniLabel;
    edtStartupPath: TUniEdit;
    sbtnChangeStartup: TUniSpeedButton;
    Label4: TUniLabel;
    edtFileExists: TUniEdit;
    Panel6: TUniPanel;
    lvMenu: TUniListBox;
    Bevel1: TUniPanel;
    PServerList: TUniPopupMenu;
    Refresh2: TUniMenuItem;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Server1: TUniMenuItem;
    Unregister1: TUniMenuItem;
    View1: TUniMenuItem;
    Refresh1: TUniMenuItem;
    Unregister2: TUniMenuItem;
    N1: TUniMenuItem;
    UnregisterAll1: TUniMenuItem;
    PUnreg: TUniPopupMenu;
    Unregister3: TUniMenuItem;
    UnregisterAll3: TUniMenuItem;
    Label7: TUniLabel;
    edtStartupRegPath: TUniEdit;
    btnUnregisterSelected: TUniButton;
    sbtnUnregisterAll: TUniSpeedButton;
    PnlCaption: TUniPanel;
    lblCaption: TUniLabel;
    Panel4: TUniPanel;
    Label5: TUniLabel;
    sbtnRefresh: TUniSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lvMenuClick(Sender: TObject);
    procedure sbtnChangeStartupClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Unregister1Click(Sender: TObject);
    procedure Refresh1Click(Sender: TObject);
    procedure lvMenuKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure UnregisterAll1Click(Sender: TObject);
    function ReadStringFromClassRoot(const APath, AKey: string): string;
    procedure WriteStringToClassRoot(const APath, AKey, AValue: string);
    procedure lvMenuMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    procedure BuildMenu;
    procedure DoChangeCOMDir(AEdit: TUniEdit; AStartupRegistryPath: string);
    function ProcessExec(const Cmd: string; cShow: Word): Integer;
    procedure UnregisterSelected;
    function Unregister(APath, AStartupRegistryPath: string): Boolean;
    procedure SetControls;
    procedure ClearInfoFields;
    function GetNameFromPath(const APath: string): string;
  public
    { Public declarations }
  end;

var FrmCrgMain: TFrmCrgMain;

implementation

{$R *.DFM}


uses
 MainModule,
  FileCtrl,
  IQMS.Common.Registry,
  IQMS.Common.RegServer;

{ TListCargo }

constructor TListCargo.Create(ARootKey: HKEY; APath, AGUID, AStartupFile,
  AStartupRegistryPath: string);
begin
  RootKey := ARootKey;
  Path := APath;
  GUID := AGUID;
  StartupFile := AStartupFile;
  StartupRegistryPath := AStartupRegistryPath;
end;

{ TFrmCrgMain }

procedure TFrmCrgMain.FormCreate(Sender: TObject);
begin
  BuildMenu;
end;

procedure TFrmCrgMain.FormShow(Sender: TObject);
begin
  SetControls;
end;

procedure TFrmCrgMain.BuildMenu;
  procedure _addTreeItem(ACaption, APath, AGUID, AStartupFile,
    AStartupRegistryPath: string);
  begin
    lvMenu.Items.AddObject(ACaption, TListCargo.Create(HKEY_CLASSES_ROOT, APath,
      AGUID, AStartupFile, AStartupRegistryPath));
  end;

var
  AList: TStringList;
  i: Integer;
  APath, AGUID, AStartupFile, AStartupRegistryPath: string;
begin
  lvMenu.Items.BeginUpdate;
  try
    lvMenu.Items.Clear;
    AList := TStringList.Create;
    try
      with TRegistry.Create do
        try
          RootKey := HKEY_CLASSES_ROOT;
          if OpenKey('', FALSE) then
            GetKeyNames(AList);
          for i := 0 to AList.Count - 1 do
            begin
              APath := AList.Strings[i];
              AStartupFile := '';
              AStartupRegistryPath := '';
              AGUID := '';
              if Pos('.IQSHELL', UpperCase(APath)) > 0 then
                begin
                  if OpenKey(Format('%s\Clsid', [APath]), FALSE) then
                    begin
                      AGUID := ReadString('');
                      CloseKey;
                      if (AGUID > '') then
                        begin
                          AStartupRegistryPath :=
                            Format('\CLSID\%s\LocalServer32\', [AGUID]);
                          if (OpenKey(AStartupRegistryPath, FALSE)) then
                            AStartupFile := ReadString('')
                          else
                            begin
                              AStartupRegistryPath :=
                                Format('Wow6432Node\CLSID\%s\LocalServer32',
                                [AGUID]);
                              // HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{038BB868-0F60-40DC-A06F-66DE95617D3F}
                              AStartupFile :=
                                ReadStringFromClassRoot
                                (AStartupRegistryPath, '');
                            end
                        end;
                      CloseKey;
                    end;
                  if AStartupFile = '' then
                    AStartupRegistryPath := '';
                  _addTreeItem(GetNameFromPath(APath), APath, AGUID,
                    AStartupFile,
                    AStartupRegistryPath);
                end;
            end;
        finally
          Free;
        end;

      if lvMenu.Items.Count > 0 then
        begin
          lvMenu.ItemIndex := 0;
          lvMenuClick(nil);
        end;

    finally
      if Assigned(AList) then
        FreeAndNil(AList);
    end;
  finally
    lvMenu.Items.EndUpdate;
  end;

end;

function TFrmCrgMain.GetNameFromPath(const APath: string): string;
var
  i: Integer;
begin
  Result := APath;
  i := Pos('.IQShell', APath);
  if i > 0 then
    Result := Copy(APath, 1, i - 1);
end;

procedure TFrmCrgMain.DoChangeCOMDir(AEdit: TUniEdit;
  AStartupRegistryPath: string);
var
  ADir: string;
  AFileName: string;
begin
  AFileName := AEdit.Text;
  ADir := ExtractFilePath(AFileName);
  // TODO
  if FileCtrl.SelectDirectory(ADir, [sdAllowCreate], 0) then
    begin
      AFileName := Format('%s%s',
        [System.SysUtils.IncludeTrailingPathDelimiter(ADir),
        ExtractFileName(AFileName)]);
      AEdit.Text := AFileName;
      WriteStringToClassRoot(AStartupRegistryPath, '', AFileName);
    end;
end;

procedure TFrmCrgMain.lvMenuClick(Sender: TObject);
begin
  ClearInfoFields;
  if lvMenu.ItemIndex < 0 then
    Exit;
  edtRegPath.Text := Format('HKEY_CLASSES_ROOT\%s',
    [TListCargo(lvMenu.Items.Objects[lvMenu.ItemIndex]).Path]);
  edtGUID.Text := TListCargo(lvMenu.Items.Objects[lvMenu.ItemIndex]).GUID;
  edtStartupPath.Text := TListCargo(lvMenu.Items.Objects[lvMenu.ItemIndex])
    .StartupFile;
  if FileExists(edtStartupPath.Text) then
    edtFileExists.Text := 'Yes'
  else
    edtFileExists.Text := 'No';
  edtStartupRegPath.Text := TListCargo(lvMenu.Items.Objects[lvMenu.ItemIndex])
    .StartupRegistryPath;
  SetControls;
end;

procedure TFrmCrgMain.sbtnChangeStartupClick(Sender: TObject);
begin
  if lvMenu.ItemIndex < 0 then
    Exit;

  DoChangeCOMDir(edtStartupPath,
    TListCargo(lvMenu.Items.Objects[lvMenu.ItemIndex]).StartupRegistryPath);
end;

function TFrmCrgMain.ProcessExec(const Cmd: string; cShow: Word): Integer;
var
  Res: Boolean;
  StartUpInfo: TStartUpInfo;
  ProcessInfo: TProcessInformation;
begin
  FillChar(StartUpInfo, SizeOf(TStartUpInfo), 0);
  with StartUpInfo do
    begin
      cb := SizeOf(TStartUpInfo);
    end;

  Res := CreateProcess(nil, PChar(Cmd), nil, nil, FALSE,
    CREATE_SEPARATE_WOW_VDM, nil, nil, StartUpInfo, ProcessInfo);
  if Res then
    with ProcessInfo do
      begin
        WaitForInputIdle(hProcess, INFINITE);
        CloseHandle(hThread);
        CloseHandle(hProcess);
        Result := 0;
      end
  else
    Result := GetLastError;
end;

procedure TFrmCrgMain.UnregisterSelected;
var
  AIndex: Integer;
  ASuccess: Boolean;
begin
  AIndex := lvMenu.ItemIndex;
  if (AIndex < 0) then
    Exit;
  if FileExists(TListCargo(lvMenu.Items.Objects[AIndex]).StartupFile) then
    ASuccess := IQMS.Common.RegServer.UnRegisterFile(TListCargo(lvMenu.Items.Objects[AIndex]).StartupFile)
  else
    ASuccess := Unregister(TListCargo(lvMenu.Items.Objects[AIndex]).Path,
      TListCargo(lvMenu.Items.Objects[AIndex]).StartupRegistryPath);
  if ASuccess then
    begin
      lvMenu.Items.Delete(AIndex);
      lvMenuClick(nil);
      SetControls;
    end;
end;

procedure TFrmCrgMain.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCrgMain.Unregister1Click(Sender: TObject);
begin
  UnregisterSelected;
end;

function TFrmCrgMain.ReadStringFromClassRoot(const APath, AKey: string): string;
begin
  Result := '';
  with TRegistry.Create do
    try
      RootKey := HKEY_CLASSES_ROOT;
      if OpenKey(APath, FALSE) and ValueExists(AKey) then
        Result := ReadString(AKey);
    finally
      Free;
    end;
end;

procedure TFrmCrgMain.WriteStringToClassRoot(const APath, AKey, AValue: string);
begin
  with TRegistry.Create do
    try
      RootKey := HKEY_CLASSES_ROOT;
      if OpenKey(APath, FALSE) then
        WriteString(AKey, AValue);
    finally
      Free;
    end;
end;

procedure TFrmCrgMain.Refresh1Click(Sender: TObject);
begin
  BuildMenu;
end;

function TFrmCrgMain.Unregister(APath, AStartupRegistryPath: string): Boolean;
begin
  Result := FALSE;
  with TRegistry.Create do
    try
      RootKey := HKEY_CLASSES_ROOT;
      if (APath > '') and OpenKey(APath, FALSE) then
        begin
          CloseKey;
          Result := DeleteKey(APath);
        end;
    finally
      Free;
    end;
  if AStartupRegistryPath > '' then
    WriteStringToClassRoot(AStartupRegistryPath, '', '');
end;

procedure TFrmCrgMain.lvMenuKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DELETE) then
    UnregisterSelected;
end;

procedure TFrmCrgMain.lvMenuMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then
    PServerList.Popup(x,y,Sender);
end;

procedure TFrmCrgMain.SetControls;
begin
  btnUnregisterSelected.Enabled := (lvMenu.ItemIndex >= 0);
  sbtnUnregisterAll.Enabled := lvMenu.Count > 0;
end;

procedure TFrmCrgMain.UnregisterAll1Click(Sender: TObject);
var
  i: Integer;
  ASuccess: Boolean;
begin
  lvMenu.Items.BeginUpdate;
  try
    for i := lvMenu.Items.Count - 1 downto 0 do
      begin
        if FileExists(TListCargo(lvMenu.Items.Objects[i]).StartupFile) then
          ASuccess := IQMS.Common.RegServer.UnRegisterFile(TListCargo(lvMenu.Items.Objects[i]
            ).StartupFile)
        else
          ASuccess := Unregister(TListCargo(lvMenu.Items.Objects[i]).Path,
            TListCargo(lvMenu.Items.Objects[i]).StartupRegistryPath);
        if ASuccess then
          lvMenu.Items.Delete(i);
      end;
    ClearInfoFields;
    lvMenuClick(nil);
    SetControls;
  finally
    lvMenu.Items.EndUpdate;
  end;

end;

procedure TFrmCrgMain.ClearInfoFields;
begin
  edtRegPath.Clear;
  edtGUID.Clear;
  edtStartupPath.Clear;
  edtStartupRegPath.Clear;
  edtFileExists.Clear;
end;

end.

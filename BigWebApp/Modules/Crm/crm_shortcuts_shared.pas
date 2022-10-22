unit crm_shortcuts_shared;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Menus,
  IQMS.Common.Registry,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  uniMainMenu,
  uniGUITypes,
  IQMS.Common.DataConst,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication;

// Methods
function NextShortCutSeq(AFolderID: Real): Integer;
// returns next Sequence number for this folder
function NextFolderSeq(AParentID: Real): Integer;
// returns next Sequence number for this folder

type
  { TShortcutsCargo }
  TShortcutsCargo = class
    IsFolder: Boolean; // True if this is a folder
    IsRoot: Boolean;
    RecordID: Real; // The record ID, regardless of the table
    ParentID: Real; // If a shortcut, this will be CRM_SHORTCUT_FOLDERS.ID;
    // if a folder, then this will be CRM_SHORTCUT_FOLDERS.PARENT_ID
    ParentNode: TUniTreeNode;
    HyperlinkAddress: String;
    HyperlinkSubAddress: String;
    ReadOnly: Boolean;
    constructor Create(AIsFolder: Boolean; ARecordID, AParentID: Real;
      AParentNode: TUniTreeNode; AHyperlinkAddress: String;
      AHyperlinkSubAddress: String;
      AIsRoot: Boolean = False; AReadOnly: Boolean = False);

  end;

type
  { TCRMShortcutsMenu }
  TCRMShortcutsMenu = class
    procedure ShortcutMenuItemClick(Sender: TObject);
  private
    FOwnerForm: TUniForm;
    FHostMenu: TUniMenuItem;
    FShortCutsList: TStrings;
    function LoadMenu: Boolean;
    function Sub_LoadFolders(AMenu: TUniMenuItem; AFolderID: Real): Boolean;
    function Sub_LoadDBShortcuts(AMenu: TUniMenuItem; AFolderID: Real): Boolean;
    function Sub_LoadUserShortcuts(AMenu: TUniMenuItem): Boolean;
  public
    constructor Create(AOwnerForm: TUniForm; AHostMenu: TUniMenuItem);
    destructor Destroy; override;
    procedure RefreshMenu;
    procedure OpenCRMShortcut(AMenu: TUniMenuItem);
  published
  end;

const
  // Registry Path
  cCurrentUserShortcutsPath = '\Software\IQMS\IQWin32\CRMShortcuts';

var
  FShortCutsList: TStrings;
  FOwnerForm: TUniForm;
  FModified: Boolean;

implementation

uses
  crm_rscstr,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs;
//  msapps;

function NextShortCutSeq(AFolderID: Real): Integer;
// returns next Sequence number for this folder
begin
  if AFolderID > 0 then
    Result := Trunc
      (SelectValueFmtAsFloat
      ('SELECT MAX( seq ) FROM crm_shortcuts WHERE folder_id = %.0f',
      [AFolderID])) + 1
  else
    Result := Trunc
      (SelectValueAsFloat
      ('SELECT MAX( seq ) FROM crm_shortcuts WHERE folder_id IS NULL')
      ) + 1;
end;

function NextFolderSeq(AParentID: Real): Integer;
// returns next Sequence number for this folder
begin
  if AParentID > 0 then
    Result := Trunc
      (SelectValueFmtAsFloat
      ('SELECT MAX( seq ) FROM crm_shortcut_folders WHERE parent_id = %.0f',
      [AParentID])) + 1
  else
    Result := Trunc
      (SelectValueAsFloat
      ('SELECT MAX( seq ) FROM crm_shortcut_folders WHERE parent_id IS NULL')
      ) + 1;
end;

{ TShortcutsCargo }

constructor TShortcutsCargo.Create(AIsFolder: Boolean; ARecordID,
  AParentID: Real; AParentNode: TUniTreeNode; AHyperlinkAddress: String;
  AHyperlinkSubAddress: String; AIsRoot: Boolean = False;
  AReadOnly: Boolean = False);
begin
  IsFolder := AIsFolder;
  RecordID := ARecordID;
  ParentID := AParentID;
  ParentNode := AParentNode;
  HyperlinkAddress := AHyperlinkAddress;
  HyperlinkSubAddress := AHyperlinkSubAddress;
  IsRoot := AIsRoot;
  ReadOnly := AReadOnly;
end;

{ TCRMShortcutsMenu }

constructor TCRMShortcutsMenu.Create(AOwnerForm: TUniForm;
  AHostMenu: TUniMenuItem);
begin
  inherited Create;
  // Byron:  Do not internationalize this message
  if AOwnerForm = NIL then
    raise Exception.Create(crm_rscstr.cTXT0000232 { 'Internal Error:' } +
      #32#32 { spaces } + 'Owner form required for CRM Shortcuts.');
  FOwnerForm := AOwnerForm;
  FHostMenu := AHostMenu;
  FShortCutsList := TStringList.Create;
  LoadMenu;
end;

destructor TCRMShortcutsMenu.Destroy;
begin
  if Assigned(FShortCutsList) then
    FreeAndNil(FShortCutsList);
  inherited Destroy;
end;

function TCRMShortcutsMenu.LoadMenu: Boolean;
begin
  Result := False; // initial

  if (FHostMenu <> NIL) then
    try
      if not Assigned(FShortCutsList) then
        FShortCutsList := TStringList.Create
      else
        FShortCutsList.Clear;

      try
        Sub_LoadDBShortcuts(FHostMenu, 0); // load shortcuts with no folder
        Sub_LoadFolders(FHostMenu, 0);
        // this method also calls Sub_LoadDBShortcuts()
        Sub_LoadUserShortcuts(FHostMenu);
        Result := (FHostMenu.Count > 0);
      except
        on E: Exception do
          IQError(Format
            (crm_rscstr.cTXT0001123 { 'Error loading CRM shortcuts: %s' } ,
            [E.Message]));
      end;
    finally
      crm_shortcuts_shared.FModified := False;
    end;
end;

procedure TCRMShortcutsMenu.OpenCRMShortcut(AMenu: TUniMenuItem);
var
  i: Integer;
begin
  if AMenu <> NIL then
    begin
      i := FShortCutsList.IndexOfObject(AMenu);
//      if i > - 1 then
//        ExecuteApplication(FShortCutsList.Strings[i], ''); // msapps
    end;
end;

procedure TCRMShortcutsMenu.RefreshMenu;
begin
  FHostMenu.Clear;
  LoadMenu;
end;

function TCRMShortcutsMenu.Sub_LoadFolders(AMenu: TUniMenuItem;
  AFolderID: Real): Boolean;
var
  ACurrentMenu: TUniMenuItem;
begin
  Result := False;
  with TFDQuery.Create(NIL) do
    try
      ConnectionName := cnstFDConnectionName;
      SQL.Add('  SELECT id,');
      SQL.Add('         parent_id,');
      SQL.Add('         seq,');
      SQL.Add('         name,');
      SQL.Add('         description,');
      SQL.Add('         created,');
      SQL.Add('         created_by,');
      SQL.Add('         last_changed,');
      SQL.Add('         changed_by');
      SQL.Add('    FROM crm_shortcut_folders');
      if AFolderID = 0 then // no parent, based on the root
        SQL.Add('   WHERE NVL( parent_id, 0 ) <= 0')
      else
        SQL.Add(Format('   WHERE parent_id = %.0f', [AFolderID]));
      SQL.Add('ORDER BY seq');
      Open;
      First;
      Result := not (BOF and EOF);
      while not EOF do
        begin
          ACurrentMenu := TUniMenuItem.Create(FOwnerForm);
          ACurrentMenu.Caption := FieldByName('NAME').AsString;
          ACurrentMenu.Tag := 0;
          AMenu.Add(ACurrentMenu);
          Sub_LoadFolders(ACurrentMenu, FieldByName('ID').AsFloat); // recursion
          Sub_LoadDBShortcuts(ACurrentMenu, FieldByName('ID').AsFloat);
          Next; // next record
        end;
    finally
      Free;
    end;
end;

function TCRMShortcutsMenu.Sub_LoadDBShortcuts(AMenu: TUniMenuItem;
  AFolderID: Real): Boolean;
var
  ACurrentMenu: TUniMenuItem;
  AHyperlinkAddress: String;
begin
  Result := False;
  with TFDQuery.Create(NIL) do
    try
      ConnectionName := cnstFDConnectionName;
      SQL.Add('  SELECT id,');
      SQL.Add('         folder_id,');
      SQL.Add('         seq,');
      SQL.Add('         hyperlink,');
      SQL.Add('         hyperlinkaddress,');
      SQL.Add('         hyperlinksubaddress,');
      SQL.Add('         created,');
      SQL.Add('         created_by,');
      SQL.Add('         last_changed,');
      SQL.Add('         changed_by');
      SQL.Add('    FROM crm_shortcuts');
      if AFolderID = 0 then // no parent, based on the root
        SQL.Add('   WHERE NVL(folder_id, 0) <= 0')
      else
        SQL.Add(Format('   WHERE folder_id = %.0f', [AFolderID]));
      SQL.Add('ORDER BY seq');
      Open;
      First;
      Result := not (BOF and EOF);
      if Result then
        begin
          ACurrentMenu := TUniMenuItem.Create(FOwnerForm);
          ACurrentMenu.Caption := '-';
          AMenu.Add(ACurrentMenu);
        end;

      while not EOF do
        begin
          ACurrentMenu := TUniMenuItem.Create(FOwnerForm);
          ACurrentMenu.Caption := FieldByName('HYPERLINK').AsString;
          ACurrentMenu.Tag := Trunc(FieldByName('ID').AsFloat);
          ACurrentMenu.OnClick := ShortcutMenuItemClick;
          AHyperlinkAddress := FieldByName('HYPERLINKADDRESS').AsString;
          AMenu.Add(ACurrentMenu);
          FShortCutsList.AddObject(AHyperlinkAddress, ACurrentMenu);
          Next; // next record
        end;
    finally
      Free;
    end;
end;

function TCRMShortcutsMenu.Sub_LoadUserShortcuts(AMenu: TUniMenuItem): Boolean;
var
  AKeys: TStrings;
  i: Integer;
  AHyperlink, AHyperlinkAddress: String;
  ACurrentMenu: TUniMenuItem;
begin
  if AMenu <> NIL then
    begin
      ACurrentMenu := TUniMenuItem.Create(FOwnerForm);
      ACurrentMenu.Caption := '-';
      AMenu.Add(ACurrentMenu);
      with TIQWebRegistry.Create do
        try
          RootKey := HKEY_CURRENT_USER;
          if OpenKey(cCurrentUserShortcutsPath, True) then
            begin
              AKeys := TStringList.Create;
              try
                GetValueNames(AKeys);
                for i := 0 to AKeys.Count - 1 do
                  begin
                    AHyperlink := AKeys.Strings[i];
                    AHyperlinkAddress := ReadString(AKeys.Strings[i]);
                    ACurrentMenu := TUniMenuItem.Create(FOwnerForm);
                    ACurrentMenu.Caption := AHyperlink;
                    ACurrentMenu.OnClick := ShortcutMenuItemClick;
                    AMenu.Add(ACurrentMenu);
                    FShortCutsList.AddObject(AHyperlinkAddress, ACurrentMenu);
                  end;
              finally
                if Assigned(AKeys) then
                  FreeAndNil(AKeys);
              end;
            end;
        finally
          Free;
        end;
    end;
end;

procedure TCRMShortcutsMenu.ShortcutMenuItemClick(Sender: TObject);
begin
  if (TComponent(Sender).ClassType = TUniMenuItem) then
    OpenCRMShortcut(TUniMenuItem(Sender));
end;

end.

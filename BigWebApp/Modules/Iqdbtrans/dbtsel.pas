{ ******************************************************* }
{ }
{ Database Transfer, select database }
{ }
{ ******************************************************* }

unit dbtsel;

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
  Menus,
  StdCtrls,
  Buttons,
  ComCtrls,
  ExtCtrls,
  DB,
  IQMS.DBTrans.dbttypes,
  IQMS.Common.Registry,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniMultiItem,
  uniListBox,
  uniEdit,
  uniComboBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel,
  uniPageControl, uniBasicGrid, uniListView, uniRadioGroup, uniFileUpload;

type
  TMRUCargo = class
    DBIndex: Integer;
    FileName: TFileName;
    constructor Create(ADBIndex: Integer; AFileName: TFileName);
  end;

type
  TDriverTypeCargo = class
    name: string;
    Driver: TDriverType;
    constructor Create(AName: string; ADriver: TDriverType);
  end;

type
  TDialogAction = (daOpen, daSave);

  TFrmIQDBTransSelectDB = class(TUniForm)
    PnlBottom: TUniPanel;
    PRecent: TUniPopupMenu;
    Clear1: TUniMenuItem;
    Panel2: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    rgDataSource: TUniRadioGroup;
    PnlClient: TUniPanel;
    pcMain: TUniPageControl;
    TabDSN: TUniTabSheet;
    PnlDrivers: TUniPanel;
    PnlDriverType: TUniPanel;
    lblDriverType: TUniLabel;
    cmbDriverType: TUniComboBox;
    PnlDriverList: TUniPanel;
    lstDrivers: TUniListView;
    TabFile: TUniTabSheet;
    PnlFile: TUniPanel;
    lblDatabaseFile: TUniLabel;
    edtDatabaseFile: TUniEdit;
    Panel1: TUniPanel;
    sbtnBrowseToDatabaseFile: TUniSpeedButton;
    lstRecent: TUniListView;
    TabOracle: TUniTabSheet;
    PnlOracle: TUniPanel;
    lstOracle: TUniListBox;
    UniFileUpload1: TUniFileUpload;
    procedure FormCreate(Sender: TObject);
    procedure sbtnBrowseToDatabaseFileClick(Sender: TObject);
    procedure SaveAndClose(Sender: TObject);
    procedure ImportDlgTypeChange(Sender: TObject);
    procedure rgDataSourceClick(Sender: TObject);
    procedure ExportDlgTypeChange(Sender: TObject);
    procedure lstRecentClick(Sender: TObject);
    procedure lstRecentDblClick(Sender: TObject);
    procedure Clear1Click(Sender: TObject);
    procedure lstRecentKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDatabaseFileKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure lstDriversChange(Sender: TObject; Item: TListItem);
    private
      { Private declarations }
      FFilterIndex: Integer;
      FDialogAction: TDialogAction;
      FSelectedDatabase: TSelectedDatabase;
      FOperation: TOperationType;
      FFileDataSource: TFileName;
      procedure StartUp;
      procedure ChangeView(AIndex: Integer);
      procedure GetSystemDSNList(const AExcludeDB: array of string);
      function GetCustomTableType(const AExt: string): TCustomTableType;
      procedure GetRecentFilesList;
      procedure SetRecentFilesList;
      procedure ClearRecentFilesList;
      procedure AddRecentFile(const AFileName: string;
        const AFilterIndex: Integer);
      procedure CopySelectedDatabase(var ASelectedDatabase: TSelectedDatabase);
      procedure SetDatabaseFileEditHint(AFileName: TFileName);
      procedure SetFileDataSource(const Value: TFileName);
      procedure LoadDriverTypeList;
      procedure SetCmbDriverType(const dt: TDriverType);
      function GetCmbDriverType: TDriverType;
      function FindCaption(lv:TUniListView; StartIndex:integer; S:String):TListItem;
    public
      { Public declarations }
      procedure SetFileNameFor(const ADataName: string);
    published
      { Published declarations }
      property FileDataSource: TFileName
        read FFileDataSource
        write SetFileDataSource;
      property Operation: TOperationType
        read FOperation;
  end;

  // Import
  // old: DBTransSelectDatabase
function DoSelectDatabaseForImport(var ASelectedDatabase: TSelectedDatabase): Boolean;
// Export
// old: DBTransSaveToDatabase
function DoSelectDatabaseForExport(var ASelectedDatabase: TSelectedDatabase): Boolean;

const
  MAX_MRU = 500;

  // var
  // FrmIQDBTransSelectDB: TFrmIQDBTransSelectDB;

implementation

{$R *.DFM}

uses
  IQMS.DBTrans.dbtdsn,
  IQMS.DBTrans.dbtrscstr,
  IQMS.DBTrans.dbtshare,
  IQMS.Common.Controls,
  IQMS.Common.FileUtils,
  IQMS.Common.Dialogs,
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils;

function DoSelectDatabaseForImport(var ASelectedDatabase
  : TSelectedDatabase): Boolean;
begin
  with TFrmIQDBTransSelectDB.Create(UniApplication) do
    begin
      IQMS.DBTrans.dbttypes.CopySelectedDatabase(ASelectedDatabase, FSelectedDatabase);
      SetFileNameFor(ASelectedDatabase.SuggestedTableName);
      FOperation := otImport;
      FDialogAction := daOpen;
      Result := ShowModal = mrOk;
      if Result then
        CopySelectedDatabase(ASelectedDatabase);
    end;
end;

function DoSelectDatabaseForExport(var ASelectedDatabase: TSelectedDatabase): Boolean;
begin
  with TFrmIQDBTransSelectDB.Create(UniApplication) do
    begin
      IQMS.DBTrans.dbttypes.CopySelectedDatabase(ASelectedDatabase, FSelectedDatabase);
      SetFileNameFor(ASelectedDatabase.SuggestedTableName);
      FOperation := otExport;
      FDialogAction := daSave;
      Result := ShowModal = mrOk;
      if Result then
        CopySelectedDatabase(ASelectedDatabase);
    end;
end;

{ TMRUCargo }

constructor TMRUCargo.Create(ADBIndex: Integer; AFileName: TFileName);
begin
  DBIndex := ADBIndex;
  FileName := AFileName;
end;

{ TDriverTypeCargo }

constructor TDriverTypeCargo.Create(AName: string; ADriver: TDriverType);
begin
  name := AName;
  Driver := ADriver;
end;

{ TFrmIQDBTransSelectDB }

function TFrmIQDBTransSelectDB.FindCaption(lv: TUniListView;
  StartIndex: integer; S: String): TListItem;
var
 i : integer;
begin
 result:=nil;
  for i := StartIndex to lv.Items.Count-1 do
   begin
     if lv.Items[i].Caption=S then
      begin
        Result:=lv.Items[i];
        Break;
      end;
   end;
end;

procedure TFrmIQDBTransSelectDB.FormCreate(Sender: TObject);
begin
  FFilterIndex := 0; // the filter is 1 based
  IQMS.Common.Controls.AdjustPageControlToParent(pcMain);
  with PnlClient do
    begin
      Align := alNone;
      Anchors := [akLeft, akTop, akRight, akBottom];
      Left := 8;
      Top := 80;
      Height := Parent.ClientHeight - PnlBottom.Height - PnlClient.Top;
      Width := Parent.ClientWidth - 16;
    end;
end;

procedure TFrmIQDBTransSelectDB.FormShow(Sender: TObject);
begin
  StartUp;
end;

procedure TFrmIQDBTransSelectDB.StartUp;
begin
  // AdjustPageControlToParent( pcDataSource ); // IQMS.Common.Controls.pas
  if (Operation = otExport) then
    LoadDriverTypeList;

  ChangeView(0);
  GetRecentFilesList;
  if FDialogAction = daOpen then
    Caption := IQMS.DBTrans.dbtrscstr.cTXT0000055 // 'Import From Database'
  else
    Caption := IQMS.DBTrans.dbtrscstr.cTXT0000056; // 'Export To Database'
end;

procedure TFrmIQDBTransSelectDB.ChangeView(AIndex: Integer);
begin
  if (AIndex in [0, 2]) and ((lstDrivers.Items.Count = 0) or
    (lstOracle.Count = 0)) then
    begin
      lstDrivers.Items.Clear;
      lstOracle.Items.Clear;
      GetSystemDSNList([]); //
    end;
  cmbDriverType.Left := lblDriverType.Left + lblDriverType.Width + 32;
  cmbDriverType.Width := PnlDriverType.ClientWidth - (cmbDriverType.Left + 8);
  PnlDriverType.Visible := Operation = otExport;
  pcMain.ActivePageIndex := AIndex;
end;

procedure TFrmIQDBTransSelectDB.LoadDriverTypeList;
var
  i: Integer;
begin
  try
    cmbDriverType.Items.BeginUpdate;
    cmbDriverType.Items.Clear;

    for i := Ord( low(TDriverType)) to Ord( high(TDriverType)) do
      if (TDriverType(i) in SupportedDriverTypes) then
        cmbDriverType.Items.AddObject(ConnectionName[TDriverType(i)],
          TDriverTypeCargo.Create(ConnectionName[TDriverType(i)],
          TDriverType(i)));
  finally
    cmbDriverType.Items.EndUpdate;
  end;
end;

procedure TFrmIQDBTransSelectDB.sbtnBrowseToDatabaseFileClick(Sender: TObject);
begin
  if FDialogAction = daOpen then
    begin
      with UniFileUpload1 do
        begin
//          FFilterIndex := 1; // first item in the list
//          FilterIndex := FFilterIndex; // ensures an accurate return value
          if Execute and IQMS.DBTrans.dbtshare.ValidDataFileName(FileName) then
            FileDataSource := FileName
          else
            FFilterIndex := 0; // clear it
        end;
    end
  else begin
//      with ExportDlg do
//        begin
//          FFilterIndex := 1; // first item in the list
//          FilterIndex := FFilterIndex; // ensures an accurate return value
//          if Execute then
//            FileDataSource := FileName
//          else
//            FFilterIndex := 0; // clear it
//        end;
    end
end;

procedure TFrmIQDBTransSelectDB.SaveAndClose(Sender: TObject);
var
  ADataSourceName, ATableName: string;
begin
  // This is the only place we update the result record object
  // TDialogAction = ( daOpen, daSave ); FDialogAction

  // Validation...
  ADataSourceName := '';
  if rgDataSource.ItemIndex = 0 then
    begin
      if lstDrivers.Selected = nil then
        raise Exception.Create
          ('Please select a Data Source Name from the list, or click Cancel.')
      else
        ADataSourceName := lstDrivers.Selected.Caption;

      if (Operation = otExport) then
        begin
          FSelectedDatabase.DriverType := GetCmbDriverType;
          if (FSelectedDatabase.DriverType = dvUnknown) then
            raise Exception.Create
              ('Please select a Driver Type from the list, or click Cancel.');
        end;

    end
  else if rgDataSource.ItemIndex = 1 then
    begin
      if (FDialogAction = daOpen) and not FileExists(FileDataSource) then
        raise Exception.Create('Please browse to a data file, or click Cancel.')
      else if Trim(FileDataSource) = '' then
        raise Exception.Create('Please specify a file name, or click Cancel.');
    end
  else if rgDataSource.ItemIndex = 2 then
    begin
      if lstOracle.ItemIndex = - 1 then
        raise Exception.Create
          ('Please select an Oracle SID from the list, or click Cancel.')
      else
        ADataSourceName := lstOracle.Items.Strings[lstOracle.ItemIndex];
    end
  else
    raise Exception.Create('Please select a data source type.');

  // Fill record...
  FSelectedDatabase.DataSourceType := dstUnknown;
  FSelectedDatabase.DatabaseName := sIIf(rgDataSource.ItemIndex in [0, 2],
    ADataSourceName, FileDataSource);
  FSelectedDatabase.FileExt := sIIf(rgDataSource.ItemIndex in [0, 2], '',
    UpperCase(ExtractFileExt(FileDataSource)));
  FSelectedDatabase.CustomTableType :=
    GetCustomTableType(FSelectedDatabase.FileExt);
  // based on combo box filter index of ImportDlg

  case rgDataSource.ItemIndex of
    0:
      FSelectedDatabase.DataSourceType := dstDSN;
    1:
      FSelectedDatabase.DataSourceType := dstFile;
    2:
      FSelectedDatabase.DataSourceType := dstOracleAlias;
  end;

  if Operation = otExport then
    begin
      // In some special cases, we need also to select a table
      if (FSelectedDatabase.DataSourceType = dstFile) and
        (FDialogAction = daSave) then
        begin
          ATableName := FSelectedDatabase.SuggestedTableName;
          // IQMS.DBTrans.dbtrscstr.cTXT0000041 = 'Export into this table:'
          if (FSelectedDatabase.CustomTableType = dttMSAccess) and
            (FSelectedDatabase.TableName = '') and
            not IQMS.DBTrans.dbtshare.PromptTableName( { var } ATableName,
            IQMS.DBTrans.dbtrscstr.cTXT0000041) then
            Exit;

          FSelectedDatabase.TableName := ATableName;
        end
      else if (FSelectedDatabase.DataSourceType in [dstDSN,
        dstOracleAlias]) then
        begin
          // IQMS.DBTrans.dbtrscstr.cTXT0000041 = 'Export into this table:'
          if (FSelectedDatabase.TableName = '') and
            not IQMS.DBTrans.dbtshare.PromptTableName(NIL, FSelectedDatabase.TableName,
            IQMS.DBTrans.dbtrscstr.cTXT0000041, True) then
            Exit;
        end;
    end;

  if (FSelectedDatabase.DataSourceType = dstFile) and
    (FindCaption(lstRecent,0, ExtractFileName(FileDataSource) ) = nil) then
    begin
      AddRecentFile(FileDataSource, FFilterIndex);
      SetRecentFilesList;
    end;

  // The only place we return modal result
  ModalResult := mrOk;
end;

procedure TFrmIQDBTransSelectDB.GetSystemDSNList(const AExcludeDB
  : array of string);
var
  AList: TStringList;
  i: Integer;
  AName, AAliasType: string;
begin
  AList := nil;

  AList := TStringList.Create;
  try
    IQMS.DBTrans.dbtdsn.GetDSNList(AList);
    lstDrivers.Items.BeginUpdate;
    lstDrivers.Items.Clear;
    for i := 0 to AList.Count - 1 do
      begin
        with lstDrivers.Items.Add do
          begin
            Caption := TDSNDescriptor(AList.Objects[i]).DSN;
            SubItems.Add(TDSNDescriptor(AList.Objects[i]).Description);
            SubItems.Add(TDSNDescriptor(AList.Objects[i]).DriverName);
            SubItems.Add(TDSNDescriptor(AList.Objects[i]).Driver);
            SubItems.Add(TDSNDescriptor(AList.Objects[i]).FileName);
            if TDSNDescriptor(AList.Objects[i]).DSNType = dtUser then
              SubItems.Add('User')
            else
              SubItems.Add('System');
          end;
      end;
  finally
    IQMS.Common.Controls.ClearStringListOfObjects(AList);
    if Assigned(AList) then
      FreeAndNil(AList);
    lstDrivers.Items.EndUpdate;
  end;

  try
    AList := TStringList.Create;
    lstOracle.Items.BeginUpdate;
    IQMS.DBTrans.dbtshare.GetTNSListenerNames(AList);
    for i := 0 to AList.Count - 1 do
      begin
        AName := AList.Strings[i];
        if not StrInList(AName, AExcludeDB) then // IQString
         begin
           lstOracle.Items.Add(AName);
         end;
      end;
  finally
    if Assigned(AList) then
      FreeAndNil(AList);
    lstOracle.Items.EndUpdate;
  end;
end;

function TFrmIQDBTransSelectDB.GetCustomTableType(const AExt: string)
  : TCustomTableType;
var
  S: string;
begin
  // To prevent confusion, first go off of the file extension.  It is the
  // most obvious indicator of file type.
  Result := IQMS.DBTrans.dbttypes.GetCustomTableTypeExt(AExt);

  // When the user changes the filter on the "Files of type:" combo box,
  // in the ImportDlg, the FFilterIndex (a private variable) gets set
  // to the item index of the comb box.  The item index is 1 based,
  // not 0 based.
  if (rgDataSource.ItemIndex = 0) then
    FFilterIndex := 0; // alias, not file
  if Result = dttDefault then
    case FFilterIndex of
      1:
        Result := dttMSAccess; // 'Microsoft Access (*.mdb, *.mde)|*.mdb;*.mde|'
      2:
        Result := dttDBase; // 'dBASE (*.dbf)|*.dbf|'
      3:
        Result := dttFoxPro; // 'FoxPro (*.dbf)|*.dbf|'
      4:
        Result := dttParadox; // 'Paradox (*.db)|*.db|'
      5:
        Result := dttASCII; // 'Text File (*.txt)|*.txt|'
      6:
        Result := dttASCII; // 'Comma Delimited Text File (*.csv)|*.csv '
      7:
        Result := dttMSExcel; // 'Microsoft Excel (*.xls)
      8:
        Result := dttXML; // 'XML (*.xml)
    else
      Result := dttDefault;
    end;

  if (Trim(UpperCase(AExt)) = '.DBF') and
    not (Result in [dttDBase, dttFoxPro]) then
    Result := dttDBase;

end;

procedure TFrmIQDBTransSelectDB.ImportDlgTypeChange(Sender: TObject);
begin
//  FFilterIndex := ImportDlg.FilterIndex;
end;

procedure TFrmIQDBTransSelectDB.ExportDlgTypeChange(Sender: TObject);
begin
//  FFilterIndex := ExportDlg.FilterIndex;
end;

procedure TFrmIQDBTransSelectDB.rgDataSourceClick(Sender: TObject);
begin
  ChangeView(rgDataSource.ItemIndex);
end;

procedure TFrmIQDBTransSelectDB.lstRecentClick(Sender: TObject);
var
  i, AIndex: Integer;
  AFileName: TFileName;
begin
  i := lstRecent.row;
  if (i >= 0) then
    try
      lstRecent.Items.BeginUpdate;

      if not Assigned(lstRecent.Items[i].Data) then
        Exit;

      AFileName := TMRUCargo(lstRecent.Items[i].Data).FileName;

      if (AFileName > '') and not FileExists(AFileName) then
        begin
          IQInformation
            (Format(IQMS.DBTrans.dbtrscstr.cTXT0000026 { 'Cannot find file, %s' } ,
            [AFileName]));
          lstRecent.Items.Delete(i);
        end
      else begin
          AIndex := TMRUCargo(lstRecent.Items[i].Data).DBIndex;
          if (AIndex > 0) then
            begin
              FileDataSource := AFileName;
              FFilterIndex := AIndex;
            end;
        end;
    finally
      lstRecent.Items.EndUpdate;
    end;

end;

procedure TFrmIQDBTransSelectDB.ClearRecentFilesList;
begin
  try
    with TIQWebRegistry.Create do
      try
        RootKey := HKEY_CURRENT_USER;
        // Clear the old items from the Registry
        if OpenKey('Software\IQMS\IQWin32\iqdbtrans.exe\Recent', TRUE) then
          begin
            CloseKey;
            DeleteKey('Software\IQMS\IQWin32\iqdbtrans.exe\Recent');
          end;
      finally
        Free;
      end;
  except // silent
  end;
end;

procedure TFrmIQDBTransSelectDB.SetRecentFilesList;
var
  AKey, AFileName, AIndexList: string;
  i, AIndex: Integer;
begin
  ClearRecentFilesList;
  try
    lstRecent.Items.BeginUpdate;
    AIndexList := '';
    with TIQWebRegistry.Create do
      try
        RootKey := HKEY_CURRENT_USER;
        if OpenKey('Software\IQMS\IQWin32\iqdbtrans.exe\Recent', TRUE) then
          begin
            for i := 0 to lstRecent.Items.Count - 1 do
              begin
                if i = MAX_MRU then
                  BREAK;
                AKey := 'MRU_' + IntToStr(i + 1);

                if not Assigned(lstRecent.Items[i].Data) then
                  CONTINUE;

                AFileName := TMRUCargo(lstRecent.Items[i].Data).FileName;
                AIndex := TMRUCargo(lstRecent.Items[i].Data).DBIndex;

                if AFileName > ' ' then
                  begin
                    WriteString(AKey, AFileName);
                    if (AIndexList > '') then
                      AIndexList := AIndexList + ';' + IntToStr(AIndex)
                    else
                      AIndexList := IntToStr(AIndex);
                  end;
              end;
            if (AIndexList > '') then
              WriteString('MRU_Index', AIndexList);
          end;
      finally
        Free;
      end;
    lstRecent.Items.EndUpdate;
  except // do nothing
  end;
end;

procedure TFrmIQDBTransSelectDB.GetRecentFilesList;
var
  i, AFileIndex, AIndex: Integer;
  AKey, AFileName, AIndexString, ATemp: string;
  AIndexList: TStringList;

  // --------------------------------------------------------------------------
  procedure _ReverseIndexList;
  var
    o: TStringList;
    j: Integer;
  begin
    if Assigned(AIndexList) then
    begin
      o := TStringList.Create;
      try
        for j := AIndexList.Count - 1 downto 0 do
          o.Add(AIndexList.Strings[i]);
        AIndexList.Clear;
        AIndexList.AddStrings(o);
      finally
        FreeAndNil(o);
      end;
    end;
  end;
// --------------------------------------------------------------------------

begin
  try
    lstRecent.Items.BeginUpdate;
    lstRecent.Items.Clear;
    with TIQWebRegistry.Create do
      try
        RootKey := HKEY_CURRENT_USER;
        if OpenKey('Software\IQMS\IQWin32\iqdbtrans.exe\Recent', FALSE) then
          begin
            AIndexString := ReadString('MRU_Index');
            if (AIndexString = '') then
              Exit;

            AIndexList := TStringList.Create;
            try
              // get the list of indexes which are used to determine the type of file
              StrToStringList(AIndexString, AIndexList); // iqstring
              // now reverse the list because we go backwards
              _ReverseIndexList;

              if (AIndexList.Count < 0) then
                Exit;

              AFileIndex := - 1;
              for i := MAX_MRU downto 1 do
                begin
                  AKey := 'MRU_' + IntToStr(i);
                  if (ValueExists(AKey)) and (ReadString(AKey) > ' ') then
                    begin
                      Inc(AFileIndex);
                      AFileName := ReadString(AKey);
                      AIndex := - 1;
                      ATemp := AIndexList.Strings[AFileIndex];
                      if IsStringValidInteger(ATemp, AIndex) then
                        AddRecentFile(AFileName, AIndex);
                    end;
                end;
            finally
              if Assigned(AIndexList) then
                FreeAndNil(AIndexList);
            end;
          end;
      finally
        Free;
      end;
    lstRecent.Items.EndUpdate;
  except // do nothing
  end;
end;

procedure TFrmIQDBTransSelectDB.lstRecentDblClick(Sender: TObject);
begin
  lstRecentClick(Sender);
  SaveAndClose(Sender);
end;

procedure TFrmIQDBTransSelectDB.Clear1Click(Sender: TObject);
var
  i: Integer;
begin
  if (lstRecent.Items.Count = 0) then
    Exit;
  if IQConfirmYN
    (IQMS.DBTrans.dbtrscstr.cTXT0000054 { 'Clear list of recently used files?' } ) then
    try
      lstRecent.Items.BeginUpdate;
      for i := lstRecent.Items.Count - 1 downto 0 do
        if Assigned(lstRecent.Items[i].Data) then
          TMRUCargo(lstRecent.Items[i].Data).Free;
      lstRecent.Items.Clear;
    finally
      lstRecent.Items.EndUpdate;
    end;
end;

procedure TFrmIQDBTransSelectDB.AddRecentFile(const AFileName: string;
  const AFilterIndex: Integer);

// ---------------------------------------------------------------------------
  procedure _AddItem(ATop: Boolean = FALSE);
  var
    o: TListItem;
  begin
    if ATop then
      o := lstRecent.Items.Insert(0)
    else
      o := lstRecent.Items.Add;
    with o do
      begin
        Caption := ExtractFileName(AFileName);
        SubItems.Add(ExtractFilePath(AFileName));
        SubItems.Add(DateTimeToStr(FileDateToDateTime(FileAge(AFileName))));
        SubItems.Add(IQMS.Common.FileUtils.IQGetFileSizeStr(AFileName));
        Data := TMRUCargo.Create(AFilterIndex, AFileName);
      end;
  end;
// ---------------------------------------------------------------------------

var
  AItem: TListItem;
begin
  if not FileExists(AFileName) or (AFilterIndex = 0) then
    Exit;

  try
    lstRecent.Items.BeginUpdate;

    AItem := FindCaption(lstRecent,0, ExtractFileName(AFileName));

    // Does the item already exist?  If so, then just update the filter index
    if (AItem <> nil) then
      begin
        // Is the TMRUCargo pointer assigned?  If not, recreate the item
        if not Assigned(TMRUCargo(AItem.Data)) then
          begin
            AItem.Destroy;
            _AddItem;
          end
          // otherwise, update the filter index
        else
          TMRUCargo(AItem.Data).DBIndex := AFilterIndex;
      end
      // Add the item
    else
      _AddItem(TRUE);

  finally
    lstRecent.Items.EndUpdate;
  end;
end;

procedure TFrmIQDBTransSelectDB.lstRecentKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    begin
      Key := 0;
      lstRecentClick(Sender);
      if edtDatabaseFile.CanFocus then
        edtDatabaseFile.SetFocus;
    end;
end;

procedure TFrmIQDBTransSelectDB.edtDatabaseFileKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    begin
      Key := 0;
      SaveAndClose(Sender);
    end;
end;

procedure TFrmIQDBTransSelectDB.CopySelectedDatabase(var ASelectedDatabase
  : TSelectedDatabase);
begin
  IQMS.DBTrans.dbttypes.CopySelectedDatabase(FSelectedDatabase, ASelectedDatabase);
  { ASelectedDatabase.CustomTableType  := FSelectedDatabase.CustomTableType;
    ASelectedDatabase.DatabaseName     := FSelectedDatabase.DatabaseName   ;
    ASelectedDatabase.DataSourceType   := FSelectedDatabase.DataSourceType ;
    ASelectedDatabase.FileExt          := FSelectedDatabase.FileExt        ;
    ASelectedDatabase.TableName        := FSelectedDatabase.TableName      ;
    ASelectedDatabase.SuggestedTableName := FSelectedDatabase.SuggestedTableName; }
  // ASelectedDatabase.AliasType        := FSelectedDatabase.AliasType;
end;

procedure TFrmIQDBTransSelectDB.SetDatabaseFileEditHint(AFileName: TFileName);
begin
  if FileExists(AFileName) then
    edtDatabaseFile.Hint := Format('File Name: %s'#13 + 'Directory: %s'#13 +
      'Date Modified: %s'#13 + 'Size: %s', [ExtractFileName(AFileName),
      ExtractFilePath(AFileName),
      DateTimeToStr(FileDateToDateTime(FileAge(AFileName))),
      IQGetFileSizeStr(AFileName)])
  else
    edtDatabaseFile.Hint := AFileName;
end;

procedure TFrmIQDBTransSelectDB.SetFileDataSource(const Value: TFileName);
var
  ADisplay: string;
begin
  FFileDataSource := Value;

  ADisplay := IQMS.Common.FileUtils.ShortDirectoryAndFileName(Value);
  if ADisplay = '' then
    ADisplay := Value;

  edtDatabaseFile.Text := ADisplay;
  SetDatabaseFileEditHint(Value);
end;

procedure TFrmIQDBTransSelectDB.SetFileNameFor(const ADataName: string);
begin
  if ADataName > '' then
    begin
      UniFileUpload1.FileName := ADataName;
    end;
end;

procedure TFrmIQDBTransSelectDB.lstDriversChange(Sender: TObject;
  Item: TListItem);
var
  ADriver: string;
begin
  if not cmbDriverType.Visible or (lstDrivers.Selected = nil) then
    Exit;

  ADriver := lstDrivers.Selected.SubItems.Strings[1];

  if (ADriver = 'Microsoft Access Driver (*.mdb)') or
    (Pos('Microsoft Access', ADriver) > 0) then
    SetCmbDriverType(dvMicrosoftAccess)

  else if (Pos('SQL Server', ADriver) > 0) or
    (Pos('Sybase SQL Anywhere', ADriver) > 0) then
    SetCmbDriverType(dvMicrosoftSQL)

  else if (Pos('Cafe Adaptive Server Anywhere', ADriver) > 0) then
    SetCmbDriverType(dvAdaptiveServerAnywhere)

  else if (PosOfWord('Oracle', ADriver) > 0) then
    SetCmbDriverType(dvOracle)
  else
    SetCmbDriverType(dvUnknown);
end;

procedure TFrmIQDBTransSelectDB.SetCmbDriverType(const dt: TDriverType);
var
  i, x: Integer;
begin
  // This method selects a driver type in the combo box list.
  x := - 1;
  for i := 0 to cmbDriverType.Items.Count - 1 do
    if (TDriverTypeCargo(cmbDriverType.Items.Objects[i]).Driver = dt) then
      begin
        x := i;
        BREAK;
      end;
  cmbDriverType.ItemIndex := x;
end;

function TFrmIQDBTransSelectDB.GetCmbDriverType: TDriverType;
begin
  // This method returns the selected driver type.
  Result := TDriverType(0);
  if cmbDriverType.ItemIndex > - 1 then
    Result := TDriverTypeCargo(cmbDriverType.Items.Objects
      [cmbDriverType.ItemIndex]).Driver;
end;

end.

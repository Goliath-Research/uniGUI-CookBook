{ ******************************************************* }
{ }
{ This unit handles importing text files (.TXT, }
{ and .CSV) }
{ }
{ ******************************************************* }

unit dbtimptx;

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
  Variants,
  Buttons,
  StdCtrls,
  ComCtrls,
  ExtCtrls,
  ImgList,
  Menus,
  Mask,
  FileCtrl,
  Db,
  Grids,
  DBGrids,
  DBCtrls,
  ADODB,
  FMTBcd,
  SqlExpr,
  Wwdbigrd,
  Wwdbgrid,
  IQMS.WebVcl.CaptionPanel,
  IQMS.Common.JumpConstants,
  dbtclass,
  dbthiddn,
  dbtschma,
  dbttxtfile,
  DBXOracle,
  IQMS.Common.WizardBase,
  Datasnap.DBClient,
  IQMS.WebVcl.DBExpress,
  MainModule,
  System.ImageList,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniImageList,
  uniBasicGrid,
  uniStringGrid,
  uniEdit,
  uniDBGrid,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniMainMenu,
  uniLabel,
  uniPageControl, uniRadioGroup;

type
  TDTPresetCargo = class
    DataType: string;
    Size: Integer; // length
    Precision: Integer;
    Scale: Integer;
    FieldType: TFieldType;
    constructor Create(ADataType: string; ASize: Integer; APrecision: Integer;
      AScale: Integer; AFieldType: TFieldType);
  end;

  TFrmIQDBTransImportTextFile = class(TFrmDBTransHidden)
    OpenSourceDlg: TOpenDialog;
    Panel8: TUniPanel;
    List_Images: TUniImageList;
    PnlPageControl1: TUniPanel;
    pcMain: TUniPageControl;
    TabFormat: TUniTabSheet;
    TabDelimOptions: TUniTabSheet;
    Panel2: TUniPanel;
    Label2: TUniLabel;
    Label1: TUniLabel;
    cmbDelimiter: TUniComboBox;
    cmbSeparator: TUniComboBox;
    chkHasFieldNames: TUniCheckBox;
    TabFieldOptions: TUniTabSheet;
    Bevel1: TUniPanel;
    PnlDisplayPageControl: TUniPanel;
    pcView: TUniPageControl;
    TabDataView: TUniTabSheet;
    PnlGridData: TUniPanel;
    TabTextView: TUniTabSheet;
    PnlDataFileName: TUniPanel;
    lblSampleData: TUniLabel;
    PData: TUniPopupMenu;
    Refresh1: TUniMenuItem;
    PnlFixedText: TUniPanel;
    TabFixedOptions: TUniTabSheet;
    PnlWizardBtnsRight: TUniPanel;
    btnCancel: TUniBitBtn;
    btnBack: TUniBitBtn;
    btnNext: TUniBitBtn;
    btnFinish: TUniBitBtn;
    cpnlFormat: TIQWebCaptionPanel;
    cpnlDelimOptions: TIQWebCaptionPanel;
    cpnlFixedOptions: TIQWebCaptionPanel;
    cpnlFieldOptions: TIQWebCaptionPanel;
    Panel1: TUniPanel;
    gbFixedOptions: TUniGroupBox;
    Label6: TUniLabel;
    Label8: TUniLabel;
    Label9: TUniLabel;
    Label11: TUniLabel;
    Panel3: TUniPanel;
    gbFieldOptions: TUniGroupBox;
    lblFieldName: TUniLabel;
    sbtnApplyFieldName: TUniSpeedButton;
    edtFieldName: TUniEdit;
    Panel4: TUniPanel;
    rgTextFormat: TUniRadioGroup;
    Grid: TUniStringGrid;
    Label3: TUniLabel;
    edtFieldDataType: TUniEdit;
    sbtnEditDataType: TUniSpeedButton;
    cmbDataType: TUniComboBox;
    SrcSource: TDataSource;
    QrySource: TIQWebDbxQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBackClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnFinishClick(Sender: TObject);
    procedure DoFormatCtrlChange(Sender: TObject);
    procedure chkHasFieldNamesClick(Sender: TObject);
    procedure edtFieldNameKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelClick(Sender: TObject);
    procedure rgTextFormatClick(Sender: TObject);
    procedure Refresh1Click(Sender: TObject);
    procedure DoApplyFieldName(Sender: TObject);
    procedure TblSourceUpdateRecord(DataSet: TDataSet; UpdateKind: TUpdateKind;
      var AUpdateAction: TUpdateAction);
    procedure sbtnEditDataTypeClick(Sender: TObject);
    procedure GridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure cmbDataTypeChange(Sender: TObject);
    procedure GridDrawCell(Sender: TObject; ACol, ARow: Integer;
      var Value: string; Attribs: TUniCellAttribs);
  private
    { Private declarations }
    FFieldNamesModified: Boolean;
    // used by methods that create the schema, and only when TListView items are modified
    FHasFieldNames: Boolean;
    FFixedText: TFixedText;
    FTextFileImport: TTextFileImport;
    // FSchemaFileName: String;
    FGridActive: Boolean;
    FSchema: string;
    FDatabaseName: string;
    procedure IQNotify(var Msg: TMessage); message iq_Notify;
    procedure InitializeTextFileImport;
    procedure LoadPresetDataTypes;
    procedure BuildComboBoxLists; // we do it his way for Internationalization
    // procedure BuildSchemaFile;
    procedure ChangeActiveFieldName;
    procedure EnableEditControls(AEnabled: Boolean);
    function OpenSourceTable: Boolean;
    procedure SetButtons;
    procedure SuggestTextFileParams(ATextFileName: string);
    // default settings based on what we can gather from the file

    function GetDelimiter: AnsiChar;
    function GetSeparator: AnsiChar;

    // function subBuildSchemaFields_Fixed(var ADBSchema: TDBSchema): Boolean;
    // function subBuildSchemaFields_Delim(var ADBSchema: TDBSchema): Boolean;
    function ShowTextPreview(var AErrorMsg: string): Boolean;
    // populates the text file view of the ascii data file
    function ValidateRenamedField(const ACol: Integer;
      var ANewFieldName: string): Boolean; // when user changes field name
    function ValidateAllFieldNames: Boolean; // False = error condition
    procedure FixUpFieldNamesAfterOpen;

    function UpdateFileInformation: Boolean;
    // function PotentialTableSizeAcceptable: Boolean;
    function GetFirstRowFieldNames: Boolean;
    procedure SetFirstRowFieldNames(const Value: Boolean);
    function GetGridFieldName(const ACol: Integer): string;
    procedure SetGridFieldName(const ACol: Integer; const Value: string);
    procedure DoSelectCell(const ACol: Integer);
    function IndexOfPresetDataType(ADataType: string;
      ALength, APrecision, AScale: SmallInt): Integer;
    procedure SetPresetDataTypeIndex(const AItemIndex: Integer);
    function IsDateType(const ADataType: string): Boolean;
    function IsNumberType(const ADataType: string): Boolean;
    function IsStringType(const ADataType: string): Boolean;
    function IndexOfFieldType(AFieldType: TFieldType): Integer;
  public
    { Public declarations }
    FFormActive: Boolean;
    constructor Create(AOwner: TComponent; ADatabaseName: string;
      AFirstRowHasNames: Boolean); reintroduce;
    procedure DoButtonClick(AWizardButton: TWizardBtn); override;
    // method for wizard buttons
    procedure DoRefreshTextFileData;
    function DoProcessExec: Boolean; override; // main method called

    property SQLConnection;
    property Logging;
    property LogFile;
    property ErrorLogFile;
    property DatabaseName: string read FDatabaseName write FDatabaseName;
    property FirstRowHasNames: Boolean read GetFirstRowFieldNames
      write SetFirstRowFieldNames;
    property TargetTableName;
    property ImportIntoTargetTable;
    property ShowProgress;
    property ProgressMessage;
    property OnProgressEvent;
    property OnCheckProgressAbortedEvent;

    property Schema: string read FSchema write FSchema;
  end;

  // var
  // FrmIQDBTransImportTextFile: TFrmIQDBTransImportTextFile;

implementation

{$R *.DFM}


uses
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Controls,
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils,
  dbtfld,
  IQMS.DBTrans.dbtshare,
  dbtemptables,
  IQMS.DBTrans.dbtrscstr,
  IQMS.Common.PanelMsg;

{ TDTPresetCargo }

constructor TDTPresetCargo.Create(ADataType: string; ASize, APrecision,
  AScale: Integer; AFieldType: TFieldType);
begin
  DataType := ADataType;
  Size := ASize;
  Precision := APrecision;
  Scale := AScale;
  FieldType := AFieldType;
end;

{ TFrmIQDBTransImportTextFile }

constructor TFrmIQDBTransImportTextFile.Create(AOwner: TComponent;
  ADatabaseName: string; AFirstRowHasNames: Boolean);
begin
  FFormActive := False;
  FGridActive := False;
  inherited Create(AOwner);

  AdjustPageControlToParent(pcMain); // IQMS.Common.Controls.pas
  AdjustPageControlToParent(pcView); // IQMS.Common.Controls.pas
  BuildComboBoxLists;
  LoadPresetDataTypes;

  // Assign property values
  DatabaseName := ADatabaseName;
  FirstRowHasNames := AFirstRowHasNames;

  { 'Sample data from file:  %s' }
  lblSampleData.Caption := Format(IQMS.DBTrans.dbtrscstr.cTXT0000025, [DatabaseName]);
  lblSampleData.Hint := DatabaseName;

  if not FileExists(DatabaseName) then
    try
      PnlMain.Visible := False;
      { 'Cannot find file, %s' }
      IQError(Format(IQMS.DBTrans.dbtrscstr.cTXT0000026, [DatabaseName]));
    finally
      PostMessage(Handle, wm_Command, Exit1.Command, 0); // Call "Exit"
    end;

  InitializeTextFileImport;
  UpdateFileInformation;

  rgTextFormat.Width := rgTextFormat.Parent.ClientWidth -
    (rgTextFormat.Left * 2);
  gbFixedOptions.Width := gbFixedOptions.Parent.ClientWidth -
    (gbFixedOptions.Left * 2);
  gbFieldOptions.Width := gbFieldOptions.Parent.ClientWidth -
    (gbFieldOptions.Left * 2);
end;

procedure TFrmIQDBTransImportTextFile.FormShow(Sender: TObject);
begin
  FFormActive := True;
  // Initialize again, in case form properties where changed
  InitializeTextFileImport;
end;

procedure TFrmIQDBTransImportTextFile.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FFormActive := False;

  inherited;

end;

procedure TFrmIQDBTransImportTextFile.InitializeTextFileImport;
begin
  // 12/14/2009 This object imports the file to either the string grid
  // or to the table (once Finish is clicked).
  if not Assigned(FTextFileImport) then
    FTextFileImport := TTextFileImport.Create(Self);
  if FSchema > '' then
    FTextFileImport.SchemaText := FSchema;
  FTextFileImport.ProgressMessage := Self.ProgressMessage;
end;

procedure TFrmIQDBTransImportTextFile.IQNotify(var Msg: TMessage);
begin
  Grid.Repaint;
end;

procedure TFrmIQDBTransImportTextFile.LoadPresetDataTypes;

  procedure _Add(ACaption, ADataType: string; ASize: Integer;
    APrecision: Integer; AScale: Integer; AFieldType: TFieldType);
  begin
    cmbDataType.Items.AddObject(
      ACaption,
      TDTPresetCargo.Create(ADataType,  ASize, APrecision, AScale, AFieldType));
  end;

begin
  try
    cmbDataType.Items.BeginUpdate;
    cmbDataType.Items.Clear;

    // IQMS.DBTrans.dbtrscstr.cTXT0000229 = 'Byte';
    _Add(IQMS.DBTrans.dbtrscstr.cTXT0000229, 'NUMBER', 0, 3, 0, ftByte);
    // IQMS.DBTrans.dbtrscstr.cTXT0000230 = 'Integer';
    _Add(IQMS.DBTrans.dbtrscstr.cTXT0000230, 'NUMBER', 0, 15, 0, ftInteger);
    // IQMS.DBTrans.dbtrscstr.cTXT0000231 = 'Currency';
    _Add(IQMS.DBTrans.dbtrscstr.cTXT0000231, 'NUMBER', 0, 16, 6, ftCurrency);
    // IQMS.DBTrans.dbtrscstr.cTXT0000232 = 'Single';
    _Add(IQMS.DBTrans.dbtrscstr.cTXT0000232, 'NUMBER', 0, 16, 10, ftSingle);
    // IQMS.DBTrans.dbtrscstr.cTXT0000233 = 'Double';
    _Add(IQMS.DBTrans.dbtrscstr.cTXT0000233, 'NUMBER', 0, 23, 10, ftFloat);
    // IQMS.DBTrans.dbtrscstr.cTXT0000234 = 'Date/Time';
    _Add(IQMS.DBTrans.dbtrscstr.cTXT0000234, 'DATE', 7, 0, 0, ftDateTime);
    // IQMS.DBTrans.dbtrscstr.cTXT0000235 = 'Text';
    _Add(IQMS.DBTrans.dbtrscstr.cTXT0000235, 'VARCHAR2', 255, 0, 0, ftString);
    // IQMS.DBTrans.dbtrscstr.cTXT0000236 = 'Memo';
    _Add(IQMS.DBTrans.dbtrscstr.cTXT0000236, 'VARCHAR2', 2000, 0, 0, ftMemo);

  finally
    cmbDataType.Items.EndUpdate;
  end;
end;

function TFrmIQDBTransImportTextFile.IsStringType(const ADataType
  : string): Boolean;
begin
  Result :=
    (ADataType = 'CHAR') or
    (ADataType = 'NCHAR') or
    (ADataType = 'CHARACTER') or
    (ADataType = 'VARCHAR2') or
    (ADataType = 'NVARCHAR2') or
    (ADataType = 'CHARACTER VARYING') or
    (ADataType = 'CHAR VARYING');
end;

function TFrmIQDBTransImportTextFile.IsNumberType(const ADataType
  : string): Boolean;
begin
  Result :=
    (ADataType = 'NUMBER') or
    (ADataType = 'FLOAT') or
    (ADataType = 'REAL') or
    (ADataType = 'INT') or
    (ADataType = 'INTEGER') or
    (ADataType = 'SMALLINT') or
    (ADataType = 'DEC') or
    (ADataType = 'DECIMAL') or
    (ADataType = 'DOUBLE PRECISION');
end;

function TFrmIQDBTransImportTextFile.IsDateType(const ADataType
  : string): Boolean;
begin
  Result := (ADataType = 'DATE');
end;

function TFrmIQDBTransImportTextFile.IndexOfFieldType(AFieldType: TFieldType):
  Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to cmbDataType.Items.Count - 1 do
    if (TDTPresetCargo(cmbDataType.Items.Objects[i]).FieldType =
      AFieldType) then
      begin
        Result := i;
        Break;
      end;
end;

function TFrmIQDBTransImportTextFile.IndexOfPresetDataType(ADataType: string;
  ALength: SmallInt; APrecision: SmallInt; AScale: SmallInt): Integer;
begin
  Result := - 1;

  if IsStringType(ADataType) then
    begin
      if (ALength >= 0) and (ALength <= 255) then
        Result := IndexOfFieldType(ftString) // cmbDataType.Items.IndexOf('Text')
      else // if (ALength > 255) then
        Result := IndexOfFieldType(ftMemo) // cmbDataType.Items.IndexOf('Memo');
    end
  else if IsNumberType(ADataType) then
    begin
      if (AScale = 0) and ((APrecision >= 0) and (APrecision <= 3)) then
        Result := IndexOfFieldType(ftByte) // cmbDataType.Items.IndexOf('Byte')

      else if (AScale = 0) and ((APrecision >= 4) and (APrecision <= 15)) then
        Result := IndexOfFieldType(ftInteger) // cmbDataType.Items.IndexOf('Integer')

      else if ((AScale > 0) and (AScale <= 6)) and (APrecision = 16) then
        Result := IndexOfFieldType(ftCurrency) // cmbDataType.Items.IndexOf('Currency')

      else if ((AScale > 6) and (AScale <= 10)) and (APrecision = 16) then
        Result := IndexOfFieldType(ftSingle) // cmbDataType.Items.IndexOf('Single')

      else
        Result := IndexOfFieldType(ftFloat) // cmbDataType.Items.IndexOf('Double');

    end
  else if IsDateType(ADataType) then
    Result := IndexOfFieldType(ftDateTime); // cmbDataType.Items.IndexOf('Date/Time');
end;

procedure TFrmIQDBTransImportTextFile.SetPresetDataTypeIndex(const AItemIndex
  : Integer);
var
  ev: TNotifyEvent;
begin
  ev := nil;
  if (AItemIndex >= - 1) and (AItemIndex < cmbDataType.Items.Count) then
    try
      ev := cmbDataType.OnChange;
      cmbDataType.OnChange := nil;
      cmbDataType.ItemIndex := AItemIndex;
    finally
      cmbDataType.OnChange := ev;
    end;
end;

procedure TFrmIQDBTransImportTextFile.SuggestTextFileParams
  (ATextFileName: string);
var
  ADelimiter, ASeparator: string;
begin
  with TDBSchema.Create(Self) do
    try
      name := 'dbtschma';
      HasFieldNames := chkHasFieldNames.Checked;
      TextFileName := ATextFileName;
      SuggestParams;
      rgTextFormat.ItemIndex := Ord(SchemaType);
      ADelimiter := Delimiter;
      ASeparator := Separator;
    finally
      Free;
    end;

  // Display user-friendly delimiter (what wraps the character field text?)
  if (ADelimiter = '') then
    cmbDelimiter.Text := IQMS.DBTrans.dbtrscstr.cTXT0000005 // <None>
  else
    cmbDelimiter.Text := ADelimiter;

  // Display user-friendly separator (what separates the fields?)
  if (ASeparator = #9) then
    cmbSeparator.Text := IQMS.DBTrans.dbtrscstr.cTXT0000006 // Tab Character
  else if (ASeparator = ',') then
    cmbSeparator.Text := IQMS.DBTrans.dbtrscstr.cTXT0000008 // Comma
  else if (ASeparator = ';') then
    cmbSeparator.Text := IQMS.DBTrans.dbtrscstr.cTXT0000007 // Semicolon
  else if (ASeparator = '|') then
    cmbSeparator.Text := '|'
  else
    cmbSeparator.Text := ASeparator;
end;

function TFrmIQDBTransImportTextFile.OpenSourceTable: Boolean;
var
  i, n: Integer;
begin
  Result := False;
  if (Self = nil) then
    Exit(False);
  if not Assigned(FTextFileImport) then
    Exit(False);

  if not FileExists(DatabaseName) then
    // IQMS.DBTrans.dbtrscstr.cTXT0000111 = 'Please specify a valid data file.'
    raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000111);

  InitializeTextFileImport;

  FTextFileImport.FileName := DatabaseName;
  if Schema > '' then
    FTextFileImport.SchemaText := Schema
  else
    begin
      if (rgTextFormat.ItemIndex in [0, 1]) then
        FTextFileImport.Format := dbttxtfile.TTextFileFormat
          (rgTextFormat.ItemIndex);
      FTextFileImport.FirstRowHasNames := chkHasFieldNames.Checked;
      FTextFileImport.DelimitedFileOptions.Separator := GetSeparator;
      FTextFileImport.DelimitedFileOptions.Delimiter := GetDelimiter;
      // If this is a fixed-width text file, then we need to provide the
      // field list before we display the data in a string grid.
      if FTextFileImport.Format = fmtFixed then
        begin
          FTextFileImport.Fields.Clear;
          n := 0;
          for i := 0 to FFixedText.RulerMarkerList.Count - 1 do
            if FFixedText.RulerMarkerList.Items[i].Visible then
              begin
                FTextFileImport.Fields.Add('', FFixedText.RulerMarkerList.Items
                  [i].Position - n);
                n := FFixedText.RulerMarkerList.Items[i].Position;
              end;
          with FTextFileImport.Fields.Add('', FFixedText.RightBorder - n) do
            begin
              DataType := 'VARCHAR2';
              Size := 255;
            end;
        end;
    end;
  FTextFileImport.Options := [foValidateFieldSizes];
  FTextFileImport.WriteToStringGrid(Grid, 50);
  DoSelectCell(0);
  FGridActive := True;
  Result := True;
  // This is called to ensure the field names are reasonably correct.
  // For example, in some CSV files, the field names might be encased in
  // quotation marks ("), which will look normal at first but will generate
  // errors when we try to reference field data.
  FixUpFieldNamesAfterOpen;
end;

procedure TFrmIQDBTransImportTextFile.DoButtonClick(AWizardButton: TWizardBtn);
var
  i: Integer;
begin
  Invalidate;
  case AWizardButton of
    wbPrior:
      begin
        i := pcMain.ActivePageIndex - 1;
        if (pcMain.ActivePage = TabFieldOptions) then
          begin
            if (rgTextFormat.ItemIndex = 1) then // fixed
              pcMain.ActivePage := TabFixedOptions
            else
              pcMain.ActivePage := TabDelimOptions;
          end
        else if (pcMain.ActivePage = TabFixedOptions) and
          (rgTextFormat.ItemIndex = 1) then
          pcMain.ActivePage := TabFormat
        else if (i >= 0) then
          pcMain.ActivePageIndex := i;
      end;
    wbNext:
      begin
        i := pcMain.ActivePageIndex + 1; // next index

        if (pcMain.ActivePage = TabFormat) then
          begin
            if (rgTextFormat.ItemIndex = 1) then // fixed
              pcMain.ActivePage := TabFixedOptions
            else
              pcMain.ActivePage := TabDelimOptions;
          end
        else if (pcMain.ActivePage = TabDelimOptions) then
          pcMain.ActivePage := TabFieldOptions
        else if (i <= pcMain.PageCount) then
          pcMain.ActivePageIndex := i;

        // Do we refresh the data, or build the schema file?
        if (pcMain.ActivePage = TabFieldOptions) then
          DoRefreshTextFileData;
        // else BuildSchemaFile;

        Grid.Repaint;
      end;
    wbFinish:
      begin
        // Do this or get an error saying the file is corrupt.
        // If the user has said the first row contains field names, then
        // for visual reasons only, we deleted the first row.  But since we
        // have cached updates, the row isn't really deleted.
        if FGridActive then
          begin
            if not ValidateAllFieldNames then
              Exit;
            // remake schema file one last time to ensure we get changed field names
            FFieldNamesModified := True;
            // set this to True now; important for CSV files (").
            // BuildSchemaFile;
            FHasFieldNames := chkHasFieldNames.Checked;
            DoProcessExec;
          end
        else
          raise Exception.Create(
            'Application Error: Not connected to source dataset.');
      end;
  end;

  SetButtons;
  if Assigned(FFixedText) then
    with FFixedText do
      begin
        ShowRuler := (pcMain.ActivePage = TabFixedOptions) and
          (rgTextFormat.ItemIndex = 1);
        AllowAddMarker := ShowRuler;
        AllowDeleteMarker := ShowRuler;
        AllowMoveMarker := ShowRuler;
      end;

  // view
  if pcMain.ActivePage = TabFieldOptions then
    pcView.ActivePageIndex := 1 // grid
  else
    pcView.ActivePageIndex := 0; // text

end;

procedure TFrmIQDBTransImportTextFile.SetButtons;
begin
  btnBack.Enabled := (pcMain.ActivePageIndex > 0);
  // and (pcSchemaOptions.ActivePageIndex > 0);
  btnNext.Enabled := (pcMain.ActivePageIndex < pcMain.PageCount - 1);

  // Important:  Enable Finish only for the last page.  The user must complete
  // all steps of the process, or CSV files may have problems with
  // field names in quotation marks.
  btnFinish.Enabled := (pcMain.ActivePageIndex = pcMain.PageCount - 1) and
    (FGridActive and (Grid.RowCount > 1));
  IQMS.Common.Controls.IQEnableControl([lblFieldName, edtFieldName, sbtnApplyFieldName],
    (FGridActive and (Grid.RowCount > 1)));
  Grid.Visible := Assigned(FTextFileImport);
end;

procedure TFrmIQDBTransImportTextFile.btnBackClick(Sender: TObject);
begin
  DoButtonClick(wbPrior);
end;

procedure TFrmIQDBTransImportTextFile.btnNextClick(Sender: TObject);
begin
  DoButtonClick(wbNext);
end;

procedure TFrmIQDBTransImportTextFile.btnFinishClick(Sender: TObject);
begin
  DoButtonClick(wbFinish);
end;

function TFrmIQDBTransImportTextFile.DoProcessExec: Boolean;
var
  i: Integer;
begin
  // NOTE:  This method will use the existing schema file if the data file
  // is a text file.  It can be called without executing the wizard
  // if if the data file and, for text files, the schema file exist.
  // Point is, we can use this method without displaying an interface,
  // except for maybe a picklist.
  Result := False;

  if not FileExists(DatabaseName) then
    // IQMS.DBTrans.dbtrscstr.cTXT0000113 = 'Please specify a source data file to import.'
    raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000113);

  try
    EnableEditControls(False);
    // Assign unique destination table name
    if ImportIntoTargetTable and (TargetTableName = '') then
      TargetTableName := GetTempTableName(SQLConnection); // dbtemptables;

    if not Assigned(FTextFileImport) then
      raise Exception.Create(
      'Application Error: Invalid object, Text file import.');

    if FTextFileImport.Fields.Count = Grid.ColCount then
      for i := 0 to Grid.ColCount - 1 do
        begin
          FTextFileImport.Fields[i].FieldName := GetGridFieldName(i);
        end;

    FSchema := FTextFileImport.SchemaText;
    FTextFileImport.FileName := DatabaseName;
    if not ShowProgress then
      FTextFileImport.Options := [foCreateTable]
    else
      FTextFileImport.Options := [foCreateTable, foShowProgressDlg];
    FTextFileImport.OnProgressEvent := Self.OnProgressEvent;
    FTextFileImport.OnCheckProgressAbortedEvent :=
      Self.OnCheckProgressAbortedEvent;
    FTextFileImport.ProgressMessage := Self.ProgressMessage;

    if Assigned(SQLConnection) then
      FTextFileImport.WriteToOracleTable(SQLConnection, TargetTableName);
//    else
//      FTextFileImport.WriteToOracleTable(MainModule.SQLConnection, TargetTableName);

    Result := True; // if we get here, then success

//    QrySource.SQLConnection := MainModule.SQLConnection;
    QrySource.SQL.Text := Format('SELECT * FROM %s', [TargetTableName]);
    FSourceDataSet := QrySource;

    // We close the application to prevent the user from click the back button
    // or from running another import for this session.
    Close; // close form, since process is done
    ModalResult := mrOk;
    // close this COM executable to release cursor to the BDE
    // NOTE: if we don't release connection to BDE, then an error
    // may occur if user tries to import another file during
    // this session:  ORA-00904: invalid column name.
  except
    on E: Exception do
      try
        IQError(E.Message);
      finally
        ModalResult := mrCancel;
      end;
  end;
end;

procedure TFrmIQDBTransImportTextFile.DoRefreshTextFileData;
begin
  OpenSourceTable;
  SetButtons;
end;

procedure TFrmIQDBTransImportTextFile.DoFormatCtrlChange(Sender: TObject);
begin
  if FFormActive = False then
    Exit;
  // DoRefreshTextFileData;
end;

procedure TFrmIQDBTransImportTextFile.chkHasFieldNamesClick(Sender: TObject);
begin
  Application.ProcessMessages; // wait for click to finish
  FirstRowHasNames := chkHasFieldNames.Checked;
  // DoRefreshTextFileData;
end;

function TFrmIQDBTransImportTextFile.ValidateRenamedField(const ACol: Integer;
  var ANewFieldName: string): Boolean;
var
  i: Integer;
  S, AError: string;
begin
  Result := False;
  S := Trim(UpperCase(ANewFieldName));
  S := IQMS.Common.StringUtils.RemoveWhiteSpace(S, '_');

  if not ValidFieldName(S, AError) then // IQMS.DBTrans.dbtshare.pas
    begin
      if (AError > '') then
        IQError(AError);
      Exit;
    end;

  for i := 0 to Grid.ColCount - 1 do
    if (i <> ACol) and (ANewFieldName = Grid.Cells[i, 0]) then
      begin
        // IQMS.DBTrans.dbtrscstr.cTXT0000226 =
        // 'Field, %s, already exists.  Please enter a unique field name.';
        IQError(Format(IQMS.DBTrans.dbtrscstr.cTXT0000226, [FixStr(ANewFieldName)]));
        Exit;
      end;

  ANewFieldName := S;
  Result := True;
end;

procedure TFrmIQDBTransImportTextFile.edtFieldNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    begin
      edtFieldName.SelectAll;
      Key := #0;
      DoApplyFieldName(Sender);
    end
  else if Key = #27 then
    begin
      Key := #0;
      edtFieldName.Text := GetGridFieldName(Grid.Col);
    end;
end;

procedure TFrmIQDBTransImportTextFile.BuildComboBoxLists;
var
  ev: TNotifyEvent;
begin
  // Delimiter
  with cmbDelimiter do
    try
      ev := OnChange;
      OnChange := nil;
      Items.Clear;
      Items.Add(IQMS.DBTrans.dbtrscstr.cTXT0000005); // <None>
      Items.Add('"');
      Items.Add('''');
    finally
      OnChange := ev;
    end;

  ev := nil;

  // Separator
  with cmbSeparator do
    try
      ev := OnChange;
      OnChange := nil;
      Items.Clear;
      Items.Add(IQMS.DBTrans.dbtrscstr.cTXT0000005); // <None>
      Items.Add(IQMS.DBTrans.dbtrscstr.cTXT0000008); // Comma
      Items.Add('|');
      Items.Add(IQMS.DBTrans.dbtrscstr.cTXT0000007); // Semicolon
      Items.Add(IQMS.DBTrans.dbtrscstr.cTXT0000006); // Tab Character
    finally
      OnChange := ev;
    end;
end;

function TFrmIQDBTransImportTextFile.ShowTextPreview(var AErrorMsg
  : string): Boolean;
begin
  // This method creates the TFixedText object which shows the file's text
  // We use this component, and not the TMemo or TRichEdit component because
  // if the lines are too long, the standard components will wrap the text.
  // Also, the TFixedText component includes a ruler and allows the user to
  // specify fixed field spacing.

  // The method returns True, if the file was opened and the text displayed.
  // The method returns False, if an error was encountered.

  // An error will occur if the text file cannot be open by the
  // TTable or the file cannot be opened.

  try
    AErrorMsg := '';
    if not Assigned(FFixedText) then
      begin
        FFixedText := TFixedText.Create(Self);
        with FFixedText do
          begin
            Parent := PnlFixedText;
            name := 'FixedText';
            Caption := '';
            Align := alClient;
            Lines.LoadFromFile(DatabaseName);
            ApplyList;
            ShowRuler := pcMain.ActivePage = TabFieldOptions;
            AllowAddMarker := False; // initial value
            AllowDeleteMarker := False; // initial value
            AllowMoveMarker := False; // initial value
            Modified := False;
            ParentBackground := False;
            Tag := 1999;
          end;
      end;

    Result := True; // success

  except
    on E: Exception do
      begin
        AErrorMsg := E.Message;
        Result := False;
      end;
  end;
end;

procedure TFrmIQDBTransImportTextFile.btnCancelClick(Sender: TObject);
begin
  Close;
end;

function TFrmIQDBTransImportTextFile.UpdateFileInformation: Boolean;
var
  AErrorMsg: string;
begin
  Result := True; // default to a valid (True) condition
  try
    // Validation
    if not FileExists(DatabaseName) then
      begin
        btnNext.Enabled := False;
        Exit;
      end;

    SuggestTextFileParams(DatabaseName);
    pcView.ActivePage := TabTextView;

    SetButtons;

    if not ShowTextPreview(AErrorMsg) then
      begin
        Result := False;
        IQError(AErrorMsg);
      end;

  except
    Result := False;
  end;
end;

procedure TFrmIQDBTransImportTextFile.EnableEditControls(AEnabled: Boolean);
begin
  IQEnableControl(edtFieldName, AEnabled); // iqctrl
  IQEnableControl(lblFieldName, AEnabled);
end;

procedure TFrmIQDBTransImportTextFile.rgTextFormatClick(Sender: TObject);
begin
  // Set captions
  case rgTextFormat.ItemIndex of
    0: // delimited
      begin
        cpnlFixedOptions.Caption := IQMS.DBTrans.dbtrscstr.cTXT0000030;
        // 'What are the field sizes?'
        cpnlFixedOptions.Text := IQMS.DBTrans.dbtrscstr.cTXT0000031;
        // 'Please adjust field sizes if necessary.'
      end;
    1: // fixed
      begin
        cpnlFixedOptions.Caption := IQMS.DBTrans.dbtrscstr.cTXT0000028;
        // 'How are the fields spaced in the data file?'
        cpnlFixedOptions.Text := IQMS.DBTrans.dbtrscstr.cTXT0000029;
        // 'The wizard has guessed how the fields are separated.  Please make any needed adjustments.';
      end;
  end;
end;

procedure TFrmIQDBTransImportTextFile.Refresh1Click(Sender: TObject);
begin
  // OpenSourceTable;
end;

function TFrmIQDBTransImportTextFile.GetDelimiter: AnsiChar;
var
  tmp: string;
begin
  // Get the delimiter, based on user selection
  // A "delimiter" is a character that surrounds text (by contrast to numbers)
  // in the text data
  tmp := sIIf((cmbDelimiter.Text = IQMS.DBTrans.dbtrscstr.cTXT0000005 { <None> } ), '',
    cmbDelimiter.Text);
  if tmp > '' then
    Result := AnsiChar(tmp[1])
  else
    Result := #0;
end;

function TFrmIQDBTransImportTextFile.GetSeparator: AnsiChar;
var
  tmp: string;
begin
  // Get the separator, based on user selection
  // A "separator" is a character that separates fields from each other
  if cmbSeparator.Text = IQMS.DBTrans.dbtrscstr.cTXT0000006 then
    tmp := #9 // Tab Character
  else if cmbSeparator.Text = IQMS.DBTrans.dbtrscstr.cTXT0000007 then
    tmp := ';' // Semicolon
  else if cmbSeparator.Text = IQMS.DBTrans.dbtrscstr.cTXT0000008 then
    tmp := ',' // Comma
  else if cmbSeparator.Text = IQMS.DBTrans.dbtrscstr.cTXT0000005 then
    tmp := '' // <None>
  else
    tmp := cmbSeparator.Text;
  if tmp > '' then
    Result := AnsiChar(tmp[1])
  else
    Result := #0;
end;

procedure TFrmIQDBTransImportTextFile.DoApplyFieldName(Sender: TObject);
begin
  if (edtFieldName.Text = '') and (Grid.Col >= 0) then
    edtFieldName.Text := GetGridFieldName(Grid.Col)
  else
    ChangeActiveFieldName;
end;

procedure TFrmIQDBTransImportTextFile.sbtnEditDataTypeClick(Sender: TObject);
var
  ACol: Integer;
  AFieldName, ADataType: string;
  ALength: SmallInt;
  APrecision: SmallInt;
  AScale: SmallInt;
  ADefinition: string;
begin
  DoApplyFieldName(Sender);
  ACol := Grid.Col;
  if (ACol >= 0) then
    begin
      AFieldName := GetGridFieldName(ACol);
      ADataType := FTextFileImport.Fields.Items[ACol].DataType;
      ALength := FTextFileImport.Fields.Items[ACol].Size;
      APrecision := FTextFileImport.Fields.Items[ACol].Precision;
      AScale := FTextFileImport.Fields.Items[ACol].Scale;

      if IsStringType(ADataType) then
        begin
          APrecision := 0;
          AScale := 0;
        end
      else if IsNumberType(ADataType) then
        ALength := 0
      else if IsDateType(ADataType) then
        begin
          ALength := 0;
          APrecision := 0;
          AScale := 0;
        end;

      if dbtfld.DoDefineField(AFieldName, ADataType, ALength, APrecision,
        AScale, ADefinition) then
        begin
          FTextFileImport.Fields.Items[ACol].DataType := ADataType;
          FTextFileImport.Fields.Items[ACol].Size := ALength;
          FTextFileImport.Fields.Items[ACol].Precision := APrecision;
          FTextFileImport.Fields.Items[ACol].Scale := AScale;
          edtFieldDataType.Text := ADefinition;
        end;
    end;
end;

procedure TFrmIQDBTransImportTextFile.ChangeActiveFieldName;
var
  ANewFieldName: string;
begin
  if FFormActive = False then
    Exit;
  ANewFieldName := Trim(edtFieldName.Text);
  if (Grid.Col < 0) or (ANewFieldName = '') then
    Exit;
  if ValidateRenamedField(Grid.Col, ANewFieldName) then
    begin
      FFieldNamesModified := True;
      SetGridFieldName(Grid.Col, ANewFieldName);
      SetButtons;
    end;
end;

function TFrmIQDBTransImportTextFile.ValidateAllFieldNames: Boolean;
var
  i: Integer;
  AFieldName, AError: string;
  AList: TStringList;
begin
  // Ensures that all the field names are valid.  This method is necessary
  // because some fields may be reserved words and so forth.  We call this
  // method before even creating the scheme file.
  Result := True; // default
  if FGridActive then
    try
      AList := TStringList.Create;
      try
        AList.Sorted := True;
        AList.Duplicates := dupError;
        for i := 0 to Grid.ColCount - 1 do
          begin
            // Get the field name
            AFieldName := GetGridFieldName(i);
            Result := ValidFieldName(AFieldName, AError);
            if not Result then
              begin
                // IQMS.DBTrans.dbtrscstr.cTXT0000227 = 'Field name:  %s';
                AError := AError + #13 + Format(IQMS.DBTrans.dbtrscstr.cTXT0000227, [FixStr(AFieldName)]);
                // IQMS.DBTrans.dbtrscstr.cTXT0000228 = 'Field index:  %d';
                AError := AError + #13 + Format(IQMS.DBTrans.dbtrscstr.cTXT0000228, [i + 1]);
              raise Exception.Create(AError);
              end;
            AList.Add(AFieldName);
          end;
      finally
        FreeAndNil(AList);
      end;
    except
      on E: Exception do
        begin
          Result := False;
          if E is EStringListError then
            { 'The field, %s, is duplicated in the import dataset.
              Please change the field name.' }
            raise Exception.CreateFmt(IQMS.DBTrans.dbtrscstr.cTXT0000120, [AFieldName])
          else
            raise;
        end;
    end;
end;

procedure TFrmIQDBTransImportTextFile.FixUpFieldNamesAfterOpen;
var
  i: Integer;
  S: string;
begin
  // This should be called once, just before we begin the import.

  if not FGridActive then
    Exit;

  for i := 0 to Grid.ColCount - 1 do
    begin
      // Get the field name
      S := GetGridFieldName(i);
      // Remove any quotation marks.  This can occur with CSV files
      S := StringReplace(S, '"', '', [rfReplaceAll, rfIgnoreCase]);
      // Apply an upper case field name to the display label
      SetGridFieldName(i, S);
    end;
end;

function TFrmIQDBTransImportTextFile.GetFirstRowFieldNames: Boolean;
begin
  Result := chkHasFieldNames.Checked;
end;

procedure TFrmIQDBTransImportTextFile.SetFirstRowFieldNames
  (const Value: Boolean);
var
  AOnClick: TNotifyEvent;
begin
  FHasFieldNames := Value;
  try
    AOnClick := chkHasFieldNames.OnClick;
    chkHasFieldNames.OnClick := nil;
    chkHasFieldNames.Checked := Value;
  finally
    chkHasFieldNames.OnClick := AOnClick;
  end;
end;

procedure TFrmIQDBTransImportTextFile.TblSourceUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var AUpdateAction: TUpdateAction);
begin
  AUpdateAction := uaApplied;
end;

procedure TFrmIQDBTransImportTextFile.GridDrawCell(Sender: TObject; ACol,
  ARow: Integer; var Value: string; Attribs: TUniCellAttribs);
var
  AText: string;
begin
  inherited;
  if (ACol = Grid.Col) then
    with Grid do
      begin
        AText := Cells[ACol, ARow];
        Attribs.Color := clBlack; // 15066597;
        Attribs.Font.Color := clWhite; // clBlack;
      end;
end;

procedure TFrmIQDBTransImportTextFile.GridSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
  DoSelectCell(ACol);
end;

procedure TFrmIQDBTransImportTextFile.DoSelectCell(const ACol: Integer);
begin
  edtFieldName.Text := GetGridFieldName(ACol);
  edtFieldDataType.Text := '';
  if (FTextFileImport.Fields.Count = Grid.ColCount) then
    begin
      edtFieldDataType.Text := FTextFileImport.Fields.Items[ACol]
        .DataTypeDisplay;
      SetPresetDataTypeIndex(IndexOfPresetDataType(FTextFileImport.Fields.Items
        [ACol].DataType, FTextFileImport.Fields.Items[ACol].Size,
        FTextFileImport.Fields.Items[ACol].Precision,
        FTextFileImport.Fields.Items[ACol].Scale));
    end;
  EnableEditControls(True);

  PostMessage(Handle, iq_Notify, 0, 0);
end;

function TFrmIQDBTransImportTextFile.GetGridFieldName
  (const ACol: Integer): string;
begin
  Result := '';
  if (ACol >= 0) and (ACol < Grid.ColCount) then
    Result := StringReplace(Trim(Grid.Cells[ACol, 0]), '"', '',
      [rfReplaceAll, rfIgnoreCase]);
end;

procedure TFrmIQDBTransImportTextFile.SetGridFieldName(const ACol: Integer;
  const Value: string);
begin
  if (ACol >= 0) and (ACol < Grid.ColCount) then
    begin
      Grid.Cells[ACol, 0] := Trim(UpperCase(Value));
      if (FTextFileImport.Fields.Count > ACol) then
        FTextFileImport.Fields[ACol].FieldName := Value;
    end;
end;

procedure TFrmIQDBTransImportTextFile.cmbDataTypeChange(Sender: TObject);
var
  ACol, AIndex: Integer;
  ADataType: string;
  ALength: SmallInt;
  APrecision: SmallInt;
  AScale: SmallInt;
begin
  if not Showing then
    Exit;
  ACol := Grid.Col;
  AIndex := cmbDataType.ItemIndex;
  if not Assigned(cmbDataType.Items.Objects[AIndex]) then
    Exit;

  ADataType := TDTPresetCargo(cmbDataType.Items.Objects[AIndex]).DataType;
  ALength := TDTPresetCargo(cmbDataType.Items.Objects[AIndex]).Size;
  APrecision := TDTPresetCargo(cmbDataType.Items.Objects[AIndex]).Precision;
  AScale := TDTPresetCargo(cmbDataType.Items.Objects[AIndex]).Scale;

  FTextFileImport.Fields.Items[ACol].DataType := ADataType;
  FTextFileImport.Fields.Items[ACol].Size := ALength;
  FTextFileImport.Fields.Items[ACol].Precision := APrecision;
  FTextFileImport.Fields.Items[ACol].Scale := AScale;
end;

end.

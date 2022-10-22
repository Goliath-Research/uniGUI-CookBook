{ ******************************************************* }
{ }
{ This unit handles importing Microsoft Excel }
{ spreadsheets (.XLS) }
{ Requires making an OLE connection to Excel. }
{ }
{ ******************************************************* }

unit dbtimpx;

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
  dbthiddn,
  Menus,
  ExtCtrls,
  StdCtrls,
  Buttons,
  ComCtrls,
  Grids,
  ComObj,
  DBGrids,
  ADODB,
  Db,
  DBCommon,
  IQMS.Common.Registry,
  Wwdbigrd,
  Wwdbgrid,
  IQMS.Common.WriteLogFile,
  Math,
  IQMS.WebVcl.CaptionPanel,
  FMTBcd,
  SqlExpr,
  IQMS.DBTrans.dbtdb,
  DBXOracle,
  IQMS.Common.WizardBase,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniMultiItem,
  uniListBox,
  uniEdit,
  uniPanel,
  uniGroupBox,
  uniLabel,
  uniPageControl, IQUniGrid, uniGUIFrame, uniMainMenu;

type
  TFrmIQDBTransImportExcel = class(TFrmDBTransHidden)
    Panel8: TUniPanel;
    PnlTop: TUniPanel;
    pcMain: TUniPageControl;
    TabFormat: TUniTabSheet;
    TabFieldOptions: TUniTabSheet;
    ADOConnection: TADOConnection;
    SrcExcel: TDataSource;
    ADOTable: TADOTable;
    TabRange: TUniTabSheet;
    PnlWizardBtnsRight: TUniPanel;
    btnCancel: TUniBitBtn;
    btnBack: TUniBitBtn;
    btnNext: TUniBitBtn;
    btnFinish: TUniBitBtn;
    PnlRange: TUniPanel;
    cpnlRange: TIQWebCaptionPanel;
    lstTableList: TUniListBox;
    PnlFormat: TUniPanel;
    cpnlFormat: TIQWebCaptionPanel;
    Panel2: TUniPanel;
    chkHasFieldNames: TUniCheckBox;
    chkAutoFieldType: TUniCheckBox;
    PnlGridFormat: TUniPanel;
    PnlFieldOptions: TUniPanel;
    cpnlFieldOptions: TIQWebCaptionPanel;
    PnlGridFieldOptions: TUniPanel;
    Grid: TIQUniGridControl;
    PnlFieldOptionsFieldName: TUniPanel;
    lblFieldType: TUniLabel;
    gbFieldOptions: TUniGroupBox;
    Label3: TUniLabel;
    sbtnApplyFieldName: TUniSpeedButton;
    edtFieldName: TUniEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBackClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnFinishClick(Sender: TObject);
    procedure DoAfterClickCheckbox(Sender: TObject);
    procedure DoAbortClick(Sender: TObject);
    procedure GridColEnter(Sender: TObject);
    procedure lstTableListClick(Sender: TObject);
    procedure DoApplyFieldName(Sender: TObject);
    procedure ADOTableAfterOpen(DataSet: TDataSet);
    procedure edtFieldNameKeyPress(Sender: TObject; var Key: Char);
    procedure chkAutoFieldTypeClick(Sender: TObject);
    procedure GridTitleButtonClick(Sender: TObject; AFieldName: string);
    procedure GridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
  private
    { Private declarations }
    FMaxRows, FMaxCols: Integer;
    FAbort: Boolean;
    FSheetModified, FBooleanFieldsImported: Boolean;
    // FMovedCount: Integer;
    FLogFileObject: TIQLogFile;
    FErrorLogFileObject: TIQLogFile;
    FSuppressPrompts: Boolean;
    FDatabaseName: string;
    FSourceTableName: string;
    FProgressMessage: string;
    // FFieldMap: TFieldMap;
    function ConnectToXLS: Boolean;
    procedure SetButtons;
    // function GetExcelRange: String;
    function ConfigADOConnection: Boolean; // configure the ADO connection
    // procedure CheckRemoveHeadingRow;
    function ImportMSExcelData: Boolean;
    function CheckProcessAborted: Boolean;
    procedure SetPreviewGridParent;
    function OpenTable: Boolean;
    function ValidateAllFieldNames: Boolean;
    procedure FixUpFieldNamesAfterOpen;
    // function PotentialTableSizeAcceptable: Boolean;
    function GetEstimateFieldTypes: Boolean;
    function GetFirstRowFieldNames: Boolean;
    procedure SetEstimateFieldTypes(const Value: Boolean);
    procedure SetFirstRowFieldNames(const Value: Boolean);
    procedure CheckExcelDriverConfig;
    procedure UpdateFieldMap;
    procedure SetSourceTableName(const Value: string);
  public
    { Public declarations }
    FFormActive: Boolean;
    FActiveField: TField;
    constructor Create(AOwner: TComponent; ADatabaseName, ATableName: string;
      AImportIntoTargetTable: Boolean; ATargetTableName: string;
      AFirstRowHasNames, AEstimateFieldTypes: Boolean);
    destructor Destroy; override;
    procedure DoButtonClick(AWizardButton: TWizardBtn); override;
    // method for wizard buttons
    // function MSExcelVersion: Integer; // 8=97, 9 = 2000, 10=2002 (XP)
    function DoProcessExec: Boolean; override;

    property SQLConnection;
    property Logging;
    property LogFile;
    property ErrorLogFile;
    property FieldMap;

    property DatabaseName: string
      read FDatabaseName
      write FDatabaseName;
    property SourceTableName: string
      read FSourceTableName
      write SetSourceTableName;
    property TargetTableName;
    property ImportIntoTargetTable;
    property ShowProgress;
    property ProgressMessage: string
      read FProgressMessage
      write FProgressMessage;
    property SuppressPrompts: Boolean
      read FSuppressPrompts
      write FSuppressPrompts;
    property OnProgressEvent;
    property OnCheckProgressAbortedEvent;

    property FirstRowHasNames: Boolean
      read GetFirstRowFieldNames
      write SetFirstRowFieldNames;
    property EstimateFieldTypes: Boolean
      read GetEstimateFieldTypes
      write SetEstimateFieldTypes;
  end;

implementation

{$R *.DFM}


uses
  IQMS.Common.ErrorDialog,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.Controls,
  IQMS.Common.StringUtils,
  IQMS.DBTrans.dbtado,
  IQMS.DBTrans.dbtdbexp,
  IQMS.DBTrans.dbtfields,
  IQMS.DBTrans.dbtshare,
  IQMS.DBTrans.dbtrscstr,
  IQMS.Common.ProgressDialog,
  IQMS.Common.PanelMsg;

{ TFrmIQDBTransImportExcelFile }

constructor TFrmIQDBTransImportExcel.Create(AOwner: TComponent;
  ADatabaseName, ATableName: string; AImportIntoTargetTable: Boolean;
  ATargetTableName: string; AFirstRowHasNames, AEstimateFieldTypes: Boolean);
begin
  FLogFileObject := nil;
  FErrorLogFileObject := nil;
  FFormActive := FALSE;
  FActiveField := nil; // initial
  inherited Create(AOwner);
  AdjustPageControlToParent(pcMain, 2, 2); // IQMS.Common.Controls.pas

  // Set property values
  DatabaseName := ADatabaseName;
  SourceTableName := ATableName;
  ImportIntoTargetTable := AImportIntoTargetTable;
  TargetTableName := ATargetTableName;
  chkHasFieldNames.Checked := AFirstRowHasNames;
  chkAutoFieldType.Checked := AEstimateFieldTypes;
  gbFieldOptions.Width := gbFieldOptions.Parent.ClientWidth -
    (gbFieldOptions.Left * 2);

  { 'Select this option if you want the wizard to determine the field data type
    based on the first few rows.  If this is unchecked, then fields will be imported as text. }
  chkAutoFieldType.Hint := WrapText(IQMS.DBTrans.dbtrscstr.cTXT0000137, #13,
    ['.', ' ', #9, '-'], 65);

  if not FileExists(DatabaseName) then
    try
      PnlMain.Visible := FALSE;
      IQError(Format(IQMS.DBTrans.dbtrscstr.cTXT0000026 { 'Cannot find file, %s' } ,
        [DatabaseName]));
    finally
      PostMessage(Handle, wm_Command, Exit1.Command, 0); // Call "Exit"
    end;
end;

destructor TFrmIQDBTransImportExcel.Destroy;
begin
  inherited Destroy;
end;

procedure TFrmIQDBTransImportExcel.FormShow(Sender: TObject);
begin
  inherited;
  FFormActive := TRUE;

  try
    if not ConnectToXLS then
      PostMessage(Handle, wm_Command, Exit1.Command, 0) // Call "Exit"
    else
      // There is only one table.  Select it, and move on.
      if lstTableList.Items.Count = 1 then
        begin
          pcMain.ActivePage := TabFormat;
          SetPreviewGridParent;
          if not ConfigADOConnection then
            begin
              IQError(IQMS.DBTrans.dbtrscstr.
                cTXT0000110 { 'Could not connect to datasource.' } );
              Close; // Call "Exit"
            end;
        end;
  except
    PostMessage(Handle, wm_Command, Exit1.Command, 0); // Call "Exit"
  end;
end;

procedure TFrmIQDBTransImportExcel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Assigned(FLogFileObject) then
    FreeAndNil(FLogFileObject);
  if Assigned(FErrorLogFileObject) then
    FreeAndNil(FErrorLogFileObject);
  FFormActive := FALSE;
  FSourceDataSet := ADOTable;
  inherited;
end;

procedure TFrmIQDBTransImportExcel.btnBackClick(Sender: TObject);
begin
  Application.ProcessMessages;
  DoButtonClick(wbPrior);
end;

procedure TFrmIQDBTransImportExcel.btnNextClick(Sender: TObject);
begin
  Application.ProcessMessages;
  DoButtonClick(wbNext);
end;

procedure TFrmIQDBTransImportExcel.btnFinishClick(Sender: TObject);
begin
  Application.ProcessMessages;
  DoButtonClick(wbFinish);
end;

function TFrmIQDBTransImportExcel.ConnectToXLS: Boolean;
var
  AList: TStrings;
  i: Integer;
  ATempStr, AHDR, AIMEX: string;
  ARefreshTableList: Boolean;
begin
  Result := FALSE;

  if not FileExists(DatabaseName) then
    // raise Exception.Create( 'Application Error:  Database not supplied.' );
    RaiseError
      (IQMS.DBTrans.dbtrscstr.cTXT0000017 { 'Application Error:  Database not supplied.' } );

  // Set these in case the user changed them
  // FirstRowHasNames := chkHasFieldNames.Checked;
  // EstimateFieldTypes := chkAutoFieldType.Checked;

  // Check if msexcl*.dll exists -- usually msexcl35.dll or msexcl40.dll.
  IQMS.DBTrans.dbtado.CheckExcelISAMExists;

  Result := ADOConnection.Connected;
  if Result then
    Exit;

  // Do we refresh the table list?
  ARefreshTableList := lstTableList.Items.Count = 0;

  try
    try
      AList := TStringList.Create;
      with ADOConnection do
        begin
          // 10/22/2007 Remmed the version check.  We don't need Excel
          // loaded for this to work.  We are using ADO.
          // if not ( MSExcelVersion in [8..12] ) then
          // RaiseErrorMemo(IQMS.DBTrans.dbtrscstr.cTXT0000082 {'Connection Error'},
          // IQMS.DBTrans.dbtrscstr.cTXT0000059 {'Current version of Microsoft Excel is not supported.'},
          // Format('Microsoft Excel Version: %d', [MSExcelVersion] ));

          { 02/28/2006 Added IMEX=1
            In the Extended Properties, the switch "IMEX=1" will prevent Excel
            from trying to determine the datatype of the column.  While this
            can be very good sometimes, it can be bad if we want to mix
            numbers and characters in each column.
          }

          // Check if ISAM dll exists
          CheckExcelDriverConfig;

          // if not FirstRowHasNames then AHDR := ';HDR=No' else AIMEX := ';HDR=Yes';
          // if not EstimateFieldTypes then AIMEX := ';IMEX=1' else AIMEX := ';IMEX=0';

          ConnectionString := IQMS.DBTrans.dbtado.ADO_ConnectionStringForMSExcel
            (DatabaseName, FirstRowHasNames, EstimateFieldTypes);

          Connected := TRUE;

          if ARefreshTableList then
            GetTableNames(AList, FALSE);

          Result := Connected;
        end;

    except
      on E: Exception do
        begin
          { If the Excel workbook is protected by a password, you cannot open it
            for data access, even by supplying the correct password with your
            connection string. If you try, you receive the following error
            message: "Could not decrypt file." }

          RaiseErrorMemo(IQMS.DBTrans.dbtrscstr.cTXT0000082 { 'Connection Error' } ,
            Format(IQMS.DBTrans.dbtrscstr.
            cTXT0000019 { 'Could not connect to database, %s:' } ,
            [DatabaseName]), E.Message);
          Result := FALSE;
        end;
    end;

    // are we refreshing the table list?  If so, do some extra work;
    // otherwise, we only need to know if we are connected.
    if ARefreshTableList then
      begin
        lstTableList.Items.Clear;
        Result := (AList.Count > 0);

        if not Result then
          RaiseError(IQMS.DBTrans.dbtrscstr.cTXT0000061) // 'There is no data to import.'
        else
          begin
            lstTableList.Items.AddStrings(AList);
            lstTableList.ItemIndex := 0; // must select first item
            if Length(FSourceTableName) > 0 then
              lstTableList.ItemIndex := lstTableList.Items.IndexOf
                (FSourceTableName);
          end;
      end;

  finally
    if Assigned(AList) then
      FreeAndNil(AList);
  end;
end;

procedure TFrmIQDBTransImportExcel.CheckExcelDriverConfig;
const
  cPath = '\SOFTWARE\Microsoft\Jet\4.0\Engines\Excel';
  cRows = 100;
var
  i: Integer;
begin
  // This method ensures that the basic configuration settings for
  // the Excel driver are correct.
  with TIQWebRegistry.Create do
    try
      RootKey := HKEY_LOCAL_MACHINE;
      // if the Excel configuration doesn't exist, then exit
      if not OpenKey(cPath, FALSE) then
        Exit;

      WriteString('ImportMixedTypes', 'Text');
      i := ReadInteger('TypeGuessRows');
      if (i <> 0) or (i < cRows) then
        WriteInteger('TypeGuessRows', cRows);

    finally
      Free;
    end;
end;

procedure TFrmIQDBTransImportExcel.lstTableListClick(Sender: TObject);
begin
  FSheetModified := TRUE;
  SourceTableName := lstTableList.Items.Strings[lstTableList.ItemIndex];
end;

function TFrmIQDBTransImportExcel.ConfigADOConnection: Boolean;
begin
  // Connects and opens dataset

  // Is ADO Table already active?
  Result := ADOTable.Active;
  if Result then
    Exit; // A TRUE result is good (good to go)

  FSheetModified := FALSE;

  // Can we connect or are we already connect?
  Result := ConnectToXLS;
  if not Result then
    Exit; // a FALSE result is a problem

  if not FileExists(DatabaseName) then
    RaiseError
      (IQMS.DBTrans.dbtrscstr.cTXT0000017 { 'Application Error:  Database not supplied.' } );

  // Table name
  SourceTableName := lstTableList.Items.Strings[lstTableList.ItemIndex];
  // + '$';

  if Trim(SourceTableName) = '' then
    begin
      Result := FALSE;
      RaiseError(IQMS.DBTrans.dbtrscstr.cTXT0000061 { 'There is no data to import.' } );
    end;

  // Set the table name
  ADOConnection.Connected := TRUE;
  if not ADOConnection.Connected then
    begin
      Result := FALSE;
      Exit;
    end;

  // 06/01/2009 Removed reference to PotentialTableSizeAcceptable.
  // We now use DBExpress components which allow use to
  // access tables with many fields.
  Result := OpenTable;
  // and PotentialTableSizeAcceptable; // if we get here, then we are OK

end;

function TFrmIQDBTransImportExcel.OpenTable: Boolean;
var
  hMsg: TPanelMesg; // added 05/26/2009
begin
  // Initialize
  hMsg := nil;

  try
    try
      // 05/26/2009 Added please wait because this may take a while,
      // and we don't want the user thinking that it is "locked up."
      if ShowProgress and not Assigned(OnProgressEvent) then
        hMsg := hPleaseWait('');
      if Assigned(OnProgressEvent) then
        begin
          // 'Accessing database.  Please wait.'
          OnProgressEvent(0, 0, IQMS.DBTrans.dbtrscstr.cTXT0000207);
          Application.ProcessMessages;
        end;
      if ADOTable.Active then
        ADOTable.Close;
      ADOTable.TableName := SourceTableName;
      ADOTable.Open;
      Result := TRUE;
    finally
      if Assigned(hMsg) then
        FreeAndNil(hMsg);
    end;
  except
    Result := FALSE;
    // 'Could not open source dataset:'#13'%s'
    RaiseError(Format(IQMS.DBTrans.dbtrscstr.cTXT0000047, [DatabaseName]));
  end;
end;

procedure TFrmIQDBTransImportExcel.UpdateFieldMap;
var
  i: Integer;
begin
  // This is called only when the user clicks the Finish button on the GUI.
  FieldMap.Clear;
  for i := 0 to ADOTable.FieldCount - 1 do
    FieldMap.Add(ADOTable.Fields[i].DisplayLabel { Target } ,
      ADOTable.Fields[i].FieldName { Source } );
end;

function TFrmIQDBTransImportExcel.DoProcessExec: Boolean;
begin
  Result := ConfigADOConnection;

  if not Result then
    begin
      IQWarning(IQMS.DBTrans.dbtrscstr.
        cTXT0000108 { 'Could not access Excel spreadsheet data.' } );
      Exit;
    end;

  try
    // Import the data
    if ImportIntoTargetTable then
      Result := ImportMSExcelData
    else
      begin
        ConfigADOConnection;
        OpenTable;
        UpdateFieldMap;
        Result := TRUE;
      end;

    if not Result then
      begin
        FAbort := TRUE;
        Exit;
      end;

    // 10/09/2007
    if FBooleanFieldsImported and not SuppressPrompts then
      { One or more fields were interpreted as Yes/No (Boolean) fields.
        Yes/No data has been imported as "Y" (Yes) and "N" (No) for
        compatibility with IQMS Yes/No fields. }
      IQMS.Common.Dialogs.IQInformation(IQMS.DBTrans.dbtrscstr.cTXT0000152);
    // IQMS.Common.Dialogs.IQDialogTimed(IQMS.DBTrans.dbtrscstr.cTXT0000153 {'Information'},IQMS.DBTrans.dbtrscstr.cTXT0000152,30);

  finally
    // Close connections
    if ImportIntoTargetTable then
      begin
        if ADOTable.Active then
          ADOTable.Close;
        if ADOConnection.Connected then
          ADOConnection.Connected := FALSE;
      end;
    // Here is where we remove the heading row
    // CheckRemoveHeadingRow;

    // We close the application to prevent the user from running another
    // import for this session.  Note:  The action param in FormClose()
    // depends on whether data is imported into a table, or is just
    // displayed in the dataset.
    Close; // close form, since process is done

    // 05/27/2009 Added the check for FAbort to return mrCancel also.
    // CRM Import needs to have Cancel sent if the user aborted.
    if not FAbort then
      ModalResult := mrOk
      // close this COM executable to release cursor to the BDE
      // NOTE: if we don't release connection to BDE, then an error
      // may occur if user tries to import another file during
      // this session:  ORA-00904: invalid column name.
    else
      ModalResult := mrCancel;
  end;
end;

procedure TFrmIQDBTransImportExcel.DoButtonClick(AWizardButton: TWizardBtn);
var
  i: Integer;
begin
  case AWizardButton of
    wbPrior:
      begin
        i := pcMain.ActivePageIndex - 1;
        if (i >= 0) then
          begin
            if (pcMain.Pages[i] = TabRange) and
              (lstTableList.Items.Count = 1) then
              Exit;

            pcMain.ActivePageIndex := i;
          end;
        SetPreviewGridParent;
        GridColEnter(nil);
      end;
    wbNext:
      begin
        i := pcMain.ActivePageIndex + 1; // next index
        if i <= pcMain.PageCount then
          begin
            // Going to "Format"
            if (pcMain.Pages[i] = TabFormat) then
              begin
                if not ConfigADOConnection then
                  begin
                    IQError(IQMS.DBTrans.dbtrscstr.
                      cTXT0000110 { 'Could not connect to datasource.' } );
                    Exit;
                  end;
                if FSheetModified then
                  OpenTable;
              end;

            // Change page
            pcMain.ActivePageIndex := i;
          end;
        SetPreviewGridParent;
        GridColEnter(nil);
      end;
    wbFinish:
      begin

        if not ValidateAllFieldNames then
          Exit;

        UpdateFieldMap;

        if ImportIntoTargetTable then
          DoProcessExec
        else
          ModalResult := mrOk;
      end;
  end;

  SetButtons;

end;

procedure TFrmIQDBTransImportExcel.SetButtons;
begin
  if (Self = nil) or (pcMain = nil) then
    Exit;
  btnBack.Enabled := (pcMain.ActivePageIndex > 0);
  // and ( pcSchemaOptions.ActivePageIndex > 0 );
  btnNext.Enabled := (pcMain.ActivePageIndex < pcMain.PageCount - 1);
  btnFinish.Enabled := (pcMain.ActivePageIndex in [1 .. 3]);
end;

procedure TFrmIQDBTransImportExcel.DoAfterClickCheckbox(Sender: TObject);
begin
  if not FFormActive or (Self = nil) or not Showing then
    Exit;
  Application.ProcessMessages;
  ADOConnection.Connected := FALSE;
  if not ConfigADOConnection then
    IQError(IQMS.DBTrans.dbtrscstr.cTXT0000110 { 'Could not connect to datasource.' } );
end;

(*
  function TFrmIQDBTransImportExcel.GetExcelRange: String;
  var
  iMult, iAlph: Integer;
  ALtr: String;
  begin
  // Returns the Excel letter/number combination for the last
  // column and row.
  iMult := Trunc(FMaxCols/26);
  iAlph := FMaxCols - Trunc(iMult*26);
  if FMaxCols <= 26 then ALtr := Chr(FMaxCols+64)
  else ALtr := Repl(Chr(iAlph+64), iMult+1); // iqstring
  Result := Format( 'A1:%s%d',[ALtr,FMaxRows]);
  end;
*)

{function TFrmIQDBTransImportExcel.MSExcelVersion: Integer;
var
  S: string;
  i: Integer;
begin
  Result := 0;
  with TIQRegistry.Create do
    try
      RootKey := HKEY_CLASSES_ROOT;
      if OpenKey('Excel.Application\CurVer', FALSE) then
        begin
          S := ReadString(''); // i.e., 'Excel.Application.10'
          S := GetToken(S, '.', 3);
          if S > '' then
            try
              i := StrToInt(S);
              Result := i; // 8 = 97, 9 = 2000, 10=2002
            except // suppress
            end;
        end;
    finally
      Free;
    end;
end;}

function TFrmIQDBTransImportExcel.ImportMSExcelData: Boolean;
var
  ALocalFieldMap: TFieldMap;
  AData, ASQL, ACommandText, AProgressMessage: string;
  AMax, ACount: Integer;
  APrg: TIQWebProgressDialog;
  AStart, AEnd: TDateTime;
  ret: Boolean;

  // ---------------------------------------------------------------------------
  function _ValidateFieldMap: Boolean;
  var
    i: Integer;
    fld: TField;
    s_name, s_display: string;
  begin
    Result := TRUE;
    if (FieldMap.Count > 0) then
      for i := 0 to FieldMap.Count - 1 do
        begin
          fld := nil;
          s_name := FieldMap.Source(i);
          s_display := FieldMap.Target(i);

          if (FieldMap.Source(i) > '') then
            fld := ADOTable.FindField(s_name);

          if Assigned(fld) then
            begin
              if (s_display > '') then
                fld.DisplayLabel := s_display;
            end
          else
            begin
              Result := FALSE;
              BREAK;
            end;
        end;
  end;
// ---------------------------------------------------------------------------
  procedure _InitSQLBase;
  var
    i: Integer;
    AFields, AValues: string;
    sl: TStringList;
  begin
    // Get the field list
    // Populate string list with the field names
    if ALocalFieldMap.Count = 0 then
      for i := 0 to ADOTable.FieldCount - 1 do
        ALocalFieldMap.Add(ADOTable.Fields[i].DisplayLabel { Target } ,
          ADOTable.Fields[i].FieldName { Source } );
    // Ensure we have fields
    if (ALocalFieldMap.Count = 0) then
      // IQMS.DBTrans.dbtrscstr.cTXT0000220 = 'Could not access table fields.';
      RaiseError(IQMS.DBTrans.dbtrscstr.cTXT0000220);

    // Build the SQL statement
    sl := TStringList.Create;
    try
      // Get the target fields (INSERT INTO)
      for i := 0 to ALocalFieldMap.Count - 1 do
        sl.Add(ALocalFieldMap.Target(i));

      // Add the keys (PK, FK, Lookup)
      if FieldKeys.Count > 0 then
        begin
          for i := 0 to FieldKeys.Count - 1 do
            sl.Add(FieldKeys.Target(i));
        end;

      // Get the field list as a string
      AFields := sl.CommaText;
      AFields := StrTran(AFields, '"', '');
      AFields := StrTran(AFields, ',', ', ');

      // Get the base SQL.  The values will be added by another routine.
      ASQL := Format('INSERT /*+ Append */ INTO %s (%s) ',
        [TargetTableName, AFields]);

      // Append the key values to the VALUES section
      if FieldKeys.Count > 0 then
        begin
          sl.Clear;
          for i := 0 to FieldKeys.Count - 1 do
            sl.Add(FieldKeys.Source(i));
          AValues := sl.CommaText;
          AValues := StrTran(AValues, '"', '');
          AValues := StrTran(AValues, ',', ', ');
          ASQL := ASQL + 'VALUES (%s, ' + AValues + ')';
        end
      else
        ASQL := ASQL + 'VALUES (%s)';
    finally
      sl.Free;
    end;
  end;
// ---------------------------------------------------------------------------
  procedure _GetFieldData;
  var
    i: Integer;
    sl: TStringList;
    AField: TField;
  begin
    // Initialize
    sl := nil;
    AData := '';
    // Cycle the table an build a list containing data
    try
      sl := TStringList.Create;
      // Get the field names
      for i := 0 to ALocalFieldMap.Count - 1 do
        begin
          AField := ADOTable.FindField(ALocalFieldMap.Source(i));
          if (AField = nil) then
            begin
              if (FieldKeys.IndexOfTarget(ALocalFieldMap.Target(i)) > -1) then
                sl.Add(ALocalFieldMap.Source(i))
              else
                RaiseError('Application Error:  Expected field no longer in field list.');
            end
          else
            sl.Add(IQMS.DBTrans.dbtfields.GetFormattedDataAsString(AField, AField.Size, TRUE));
        end;
      // Get a single string from the string list. Do not call CommaText
      // because string chunks are wrapped in double quotation marks (")
      // which would have to be removed.  We don't want to tamper with
      // the data any more than we need to.
      AData := IQMS.DBTrans.dbtshare.GetStrictCommaText(sl);
    finally
      // Free temporary string list
      if Assigned(sl) then
        FreeAndNil(sl);
    end;
  end;
// ---------------------------------------------------------------------------
  function _RunCommand: Boolean;
  begin
    // 05/28/2009 Run SQL
    _GetFieldData;
    ACommandText := Format(ASQL, [AData]);
    if Assigned(SQLConnection) then
      Result := IQMS.DBTrans.dbtdbexp.DBX_RunSQL(SQLConnection, ACommandText)
    else
      Result := IQMS.DBTrans.dbtdbexp.DBX_RunSQL(ACommandText);
    // 05/29/2009 Tried this, but I get an "Invalid data type" error
    { ACommandText := Format('insert /*+ Append */ into %s (%s) values (%s)',
      [TargetTableName, AFields, AParams]);
      Result := IQMS.DBTrans.dbtdbexp.DBX_RunSQLParamDataSet(LocalSQLConnection,
      ACommandText, ADOTable); }
  end;

// ---------------------------------------------------------------------------
begin
  // Initialize
  Result := FALSE;
  FBooleanFieldsImported := FALSE;
  APrg := nil;
  AMax := 0;
  ACount := 0;

  try
    ALocalFieldMap := TFieldMap.Create(nil);
    try
      ALocalFieldMap.AddMap(FieldMap);

      if not _ValidateFieldMap then
        begin
          { 'The table fields have changed since this ' +
            'import was last configured.  Please reconfigure the import for this ' +
            'file.' }
          IQError(IQMS.DBTrans.dbtrscstr.cTXT0000199);
          Exit;
        end;

      // Check the field names to ensure they are useable
      if not ValidateAllFieldNames then
        begin
          { 'Could not validate all field names.  Operation aborted.' }
          if Assigned(FErrorLogFileObject) then
            FErrorLogFileObject.Write(IQMS.DBTrans.dbtrscstr.cTXT0000109);
          IQError(IQMS.DBTrans.dbtrscstr.cTXT0000109);
          Exit;
        end;

      AMax := ADOTable.RecordCount;
      // 'Retrieving table definition...'
      AProgressMessage := IQMS.DBTrans.dbtrscstr.cTXT0000022;

      if ShowProgress then
        begin
          APrg := TIQWebProgressDialog.Create(Self); // IQMS.Common.ProgressDialog.pas
          APrg.OnCancelButtonClick := DoAbortClick;
          APrg.MinProgress := 0;
          APrg.MaxProgress := ADOTable.RecordCount;
          APrg.Caption := IQMS.DBTrans.dbtrscstr.cTXT0000057; // 'Import'
          Self.Visible := FALSE;
          APrg.Execute;
          APrg.Status1 := AProgressMessage;
          APrg.Status2 := Format('%s, %s', [DatabaseName, SourceTableName]);
          Application.ProcessMessages;
        end;
      try
        if Assigned(OnProgressEvent) then
          OnProgressEvent(AMax, 0, AProgressMessage);

        // NOTE:  The TTable CreateTable method does not work very well,
        // which is why we have our own...
        // Also, we only do this if we are importing into a temp table
        if (TargetTableName > '') and
          not CreateOracleTable(ADOTable, TargetTableName, FALSE { Temporary } )
        then // in IQMS.DBTrans.dbtshare.pas
          begin
            if Assigned(APrg) then
              FreeAndNil(APrg);
            if Assigned(OnProgressEvent) then
              // 'Data Error'
              OnProgressEvent(AMax, 0, IQMS.DBTrans.dbtrscstr.cTXT0000083);
            //IQMS.DBTrans.dbtrscstr.cTXT0000083 = 'Data Error'
            // IQMS.DBTrans.dbtrscstr.cTXT0000015 =
            // 'Could not create data definition.  Process aborted.'
            RaiseErrorMemo(IQMS.DBTrans.dbtrscstr.cTXT0000083, IQMS.DBTrans.dbtrscstr.cTXT0000015,
              Format('%s, %s', [DatabaseName, SourceTableName]));
          end;

        if not ADOTable.Active then
          ADOTable.Open;
        ADOTable.First;
        FAbort := FALSE;

        if not ImportIntoTargetTable and (TargetTableName = '') then
          Exit(TRUE);

        _InitSQLBase;

        // IQMS.DBTrans.dbtrscstr.cTXT0000024 = 'Importing data...'
        AProgressMessage := sIIf(ProgressMessage > '', ProgressMessage,
          IQMS.DBTrans.dbtrscstr.cTXT0000024);
        if Assigned(APrg) then
          APrg.Status1 := AProgressMessage;
        if Assigned(OnProgressEvent) then
          OnProgressEvent(AMax, 0, AProgressMessage);

        // Hide the form
        Self.Hide;
        ADOTable.DisableControls;

        while not ADOTable.EOF do
          begin
            // Check if user has cancelled operation
            Application.ProcessMessages;
            if CheckProcessAborted then
              BREAK;

            // Logging
            if Assigned(FLogFileObject) then
              FLogFileObject.Write(ACommandText);

            // User has cancelled process
            Application.ProcessMessages;
            if CheckProcessAborted then
              BREAK;
            if Assigned(OnCheckProgressAbortedEvent) then
              begin
                FAbort := OnCheckProgressAbortedEvent;
                if FAbort then
                  BREAK;
              end;

            // Append the data
            AStart := Now;
            ret := _RunCommand;
            if ret then
              Result := TRUE;
            AEnd := Now;

            if Assigned(FLogFileObject) then
              FLogFileObject.Write(IQMS.DBTrans.dbtshare.StartEndText(AStart, AEnd));

            ADOTable.Next; // go to the next record in the Oracle view
            Inc(ACount);
            if Assigned(APrg) then
              APrg.StepProgress;
            if Assigned(OnProgressEvent) then
              OnProgressEvent(AMax, ACount, AProgressMessage);
          end;
      finally
        if Assigned(APrg) then
          FreeAndNil(APrg);
      end;
    finally
      if Assigned(ALocalFieldMap) then
        FreeAndNil(ALocalFieldMap);
    end;
  except
    on E: Exception do
      begin
        if Assigned(FErrorLogFileObject) then
          FErrorLogFileObject.Write(E.Message + #13#13 + ACommandText);
        Result := FALSE;
        if E.ClassType <> EAbort then
          RaiseErrorMemo(IQMS.DBTrans.dbtrscstr.cTXT0000053 { 'Import Execution Error' } ,
            E.Message, ACommandText);
      end;
  end;
end;

procedure TFrmIQDBTransImportExcel.DoAbortClick(Sender: TObject);
begin
  FAbort := TRUE;
end;

function TFrmIQDBTransImportExcel.CheckProcessAborted: Boolean;
begin
  Result := FAbort;
  if FAbort then
    begin
      Result := IQConfirmYN
        (IQMS.DBTrans.dbtrscstr.cTXT0000023 { 'Abort import operation?' } );
      if not Result then
        FAbort := FALSE; // reset; user changed mind
    end;
end;

procedure TFrmIQDBTransImportExcel.SetPreviewGridParent;
begin
  if pcMain.ActivePage = TabFormat then
    Grid.Parent := PnlGridFormat
  else if pcMain.ActivePage = TabFieldOptions then
    Grid.Parent := PnlGridFieldOptions;
end;

procedure TFrmIQDBTransImportExcel.SetSourceTableName(const Value: string);
begin
  FSourceTableName := Value;
  lstTableList.ItemIndex := lstTableList.Items.IndexOf(Value);
end;

procedure TFrmIQDBTransImportExcel.GridColEnter(Sender: TObject);
begin
//  FActiveField := Grid.DBGrid.GetActiveField;
  if FActiveField <> nil then
    begin
      if (FActiveField.DisplayLabel > '') then
        edtFieldName.Text := FActiveField.DisplayLabel
      else
        edtFieldName.Text := FActiveField.FieldName;

      // display the field type
      if IQMS.DBTrans.dbtfields.IsStringFieldType(FActiveField) then
        lblFieldType.Caption :=
          Format(IQMS.DBTrans.dbtrscstr.cTXT0000154 { 'Field Type: %s (%d)' } ,
          [Db.FieldTypeNames[FActiveField.DataType], FActiveField.Size])
      else
        lblFieldType.Caption :=
          Format(IQMS.DBTrans.dbtrscstr.cTXT0000155 { 'Field Type: %s' } ,
          [Db.FieldTypeNames[FActiveField.DataType]]);
    end;

  Grid.Invalidate;

end;

procedure TFrmIQDBTransImportExcel.DoApplyFieldName(Sender: TObject);
var
  AField: TField;
  AError: string;
begin
//  FActiveField := Grid.DBGrid.GetActiveField;
  if AField <> nil then
    begin
      if not ValidFieldName(edtFieldName.Text, AError) then
        IQError(AError)
      else
        AField.DisplayLabel := edtFieldName.Text;
    end;
end;

function TFrmIQDBTransImportExcel.ValidateAllFieldNames: Boolean;
var
  i: Integer;
  ALastFieldAdded, AError: string;
  AList: TStringList;
begin
  Result := TRUE;
  try
    try
      AList := TStringList.Create;
      AList.Sorted := TRUE;
      AList.Duplicates := dupError;
      for i := 0 to ADOTable.FieldCount - 1 do
        begin
          ALastFieldAdded := ADOTable.Fields[i].DisplayName;
          if not IQMS.DBTrans.dbtshare.ValidFieldName(UpperCase(ALastFieldAdded),
            AError) then
            begin
              Result := FALSE;
              // IQMS.Common.ErrorDialog.ShowIQErrorMessage(IQMS.DBTrans.dbtrscstr.cTXT0000117 {'Invalid field name.'}, AError);
              // Format( IQMS.DBTrans.dbtrscstr.cTXT0000115 {'The field name, %s, has invalid characters.'}, [ALastFieldAdded]),
              // IQMS.DBTrans.dbtrscstr.cTXT0000118 {'Field names can contain only letters, numbers and underscore marks'});
              raise Exception.Create(AError);
              BREAK;
            end;
        end;

      if not Result then
        Exit;

      ALastFieldAdded := '';
      for i := 0 to ADOTable.FieldCount - 1 do
        begin
          ALastFieldAdded := ADOTable.Fields[i].DisplayName;
          AList.Add(UpperCase(ADOTable.Fields[i].DisplayName));
        end;

      Result := TRUE;

    finally
      if Assigned(AList) then
        FreeAndNil(AList);
    end;

  except
    on E: Exception do
      begin
        Result := FALSE;
        if E is EStringListError then
          // IQMS.Common.ErrorDialog.ShowIQErrorMessageA(IQMS.DBTrans.dbtrscstr.cTXT0000119 {'Duplicate field name.'},
          // Format( IQMS.DBTrans.dbtrscstr.cTXT0000120 {'The field, %s, is duplicated in the import dataset.  Please change the field name.'},
          // [ALastFieldAdded]))
          raise Exception.CreateFmt
            (IQMS.DBTrans.dbtrscstr.
            cTXT0000120 { 'The field, %s, is duplicated in the import dataset.  Please change the field name.' } ,
            [ALastFieldAdded])

        else
          raise;
      end;
  end;

end;

procedure TFrmIQDBTransImportExcel.ADOTableAfterOpen(DataSet: TDataSet);
begin
  FixUpFieldNamesAfterOpen;
end;

procedure TFrmIQDBTransImportExcel.FixUpFieldNamesAfterOpen;
var
  i: Integer;
  S, AError: string;
begin
  // This should be called once, just before we begin the import.
  // if not ValidFieldName(S, AError) then
  if not ADOTable.Active then
    Exit;

  for i := 0 to ADOTable.FieldCount - 1 do
    begin
      // Get the field name
      S := Trim(ADOTable.Fields[i].DisplayLabel);
      if S = '' then
        S := Trim(ADOTable.Fields[i].FieldName);

      // Remove any quotation marks.  This can occur with CSV files
      S := StringReplace(S, '"', '', [rfReplaceAll, rfIgnoreCase]);

      // Apply an upper case field name to the display label
      ADOTable.Fields[i].DisplayLabel := UpperCase(S);

      ADOTable.Fields[i].DisplayWidth :=
        Min(50, ADOTable.Fields[i].DisplayWidth);

    end;

end;

procedure TFrmIQDBTransImportExcel.edtFieldNameKeyPress(Sender: TObject;
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
//      if (Grid.DBGrid.SelectedField <> nil) then
//        edtFieldName.Text := Grid.SelectedField.DisplayLabel;
    end;
end;

procedure TFrmIQDBTransImportExcel.chkAutoFieldTypeClick(Sender: TObject);
begin
  { The wizard will determine the data type of each field based on the first few values.
    If the data type changes in subsequent rows, the values that do not match the
    determined data type will not be imported; they will be null.  Please review the
    data below to ensure all values will imported. }
  Application.ProcessMessages;
  if chkAutoFieldType.Checked then
    IQWarningChk(IQMS.DBTrans.dbtrscstr.cTXT0000138, 'ESTIMATE_FIELD_DATA_TYPES');
  // IQMS.Common.Dialogs.pas
  DoAfterClickCheckbox(Sender);
end;

procedure TFrmIQDBTransImportExcel.GridTitleButtonClick(Sender: TObject;
  AFieldName: string);
begin
  // inherited; nothing
  if pcMain.ActivePage <> TabFieldOptions then
    Exit;
//  Grid.DBGrid.SetActiveField(AFieldName);
  edtFieldName.Text := AFieldName;
end;

(*
  function TFrmIQDBTransImportExcel.PotentialTableSizeAcceptable: Boolean;
  const
  // 05/27/2009 Note:  The value, 16165, is more accurate.  But this value
  // must be kept low -- well below the limit.
  MAX_SIZE = 12750; // 50 * 255 = 12750
  var
  i, ASize: Integer;
  begin
  Result := True;

  // 06/27/2006 Added check.  ADO limits field count that can be imported.

  // 05/26/2009 Confirmed that this is still necessary.  If there are too
  //            many fields in the Excel file, then we will not be able
  //            to import the data into the temp table, and the BDE will also
  //            generate Access Violations.

  {Although we export to Excel with correct field sizes, Excel text
  fields are always interpreted as Text(255) when importing.  This
  accounts for the difference in table structure between export
  and import.   I'm using ADO to connect to the Excel spreadsheet.
  But even Microsoft Access interprets Excel string fields as
  Text(255).

  The BDE generates a GPF when touching a table with a combined
  field size greater than 16,165 bytes.  I arrived at this figure
  with a test application, but this value is a bit rough because
  it can vary depending on data type.  I'm still searching the
  Internet for related information.

  The trouble is, in order to add or update data in Oracle, I must
  use SQL.  And using SQL against such a structurally large table
  doesn't work.  If I run a "select" statement against it, then
  GPF's result.  Even if I connected with DCOM, I would still need
  to update or select on it, and I would still get GPF's. }

  if not ADOTable.Active then Exit;
  ASize := 0;
  for i := 0 to ADOTable.Fields.Count - 1 do
  ASize := ASize + ADOTable.Fields[i].Size;

  // Cannot exceed limit
  Result := (ASize <= MAX_SIZE);

  if not Result then
  begin
  Result := FALSE;

  {Alternative message:
  'The Excel file you wish to import has a combined field size that is
  too large to import.  The recommended limit is 50 fields or less per
  data file.  Please remove unnecessary fields and try again.' }

  { 'Cannot import file.  There are too many fields (%d), or the combined field sizes is too large (%d).
  The recommended limit is 50 fields or less per data file.  Please
  remove unnecessary fields and try again.' }
  IQError(Format(IQMS.DBTrans.dbtrscstr.cTXT0000140, [ADOTable.Fields.Count, ASize]));
  end;

  end;
*)

function TFrmIQDBTransImportExcel.GetEstimateFieldTypes: Boolean;
begin
  Result := chkAutoFieldType.Checked;
end;

function TFrmIQDBTransImportExcel.GetFirstRowFieldNames: Boolean;
begin
  Result := chkHasFieldNames.Checked;
end;

procedure TFrmIQDBTransImportExcel.SetEstimateFieldTypes(const Value: Boolean);
var
  AOnClick: TNotifyEvent;
begin
  try
    AOnClick := chkAutoFieldType.OnClick;
    chkAutoFieldType.OnClick := nil;
    chkAutoFieldType.Checked := Value;
    ADOConnection.Connected := FALSE;
    ConfigADOConnection;
  finally
    chkAutoFieldType.OnClick := AOnClick;
  end;
end;

procedure TFrmIQDBTransImportExcel.SetFirstRowFieldNames(const Value: Boolean);
var
  AOnClick: TNotifyEvent;
begin
  try
    AOnClick := chkHasFieldNames.OnClick;
    chkHasFieldNames.OnClick := nil;

    chkHasFieldNames.Checked := Value;

    ADOConnection.Connected := FALSE;
    ConfigADOConnection;

  finally
    chkHasFieldNames.OnClick := AOnClick;
  end;
end;

procedure TFrmIQDBTransImportExcel.GridCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited; // nothing

  if Highlight then
    Exit;

  // only color for the field changer
  if (pcMain.ActivePageIndex = 2) and (FActiveField <> nil) and
    (Field = FActiveField) then
    ABrush.Color := 15658734; // light gray

end;

end.

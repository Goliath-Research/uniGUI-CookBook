unit dbtimxml;

{ ***************************************************************************** }
{ }
{ Import XML }
{ This unit handles importing from XML files. }
{ }
{ ***************************************************************************** }

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  dbthiddn,
  Menus,
  ExtCtrls,
  ComCtrls,
  uniGUIApplication,
  StdCtrls,
  Buttons,
  DB,
  IQMS.Common.JumpConstants,
  IQMS.Common.WriteLogFile,
  IQMS.Common.ProgressDialog,
  dbtxml,
  IQMS.DBTrans.dbttypes,
  MainModule,
  Datasnap.DBClient,
  IQMS.WebVcl.DBExpress,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniTreeView,
  uniPanel, uniMainMenu;

type
  TFrmDBTransImportXML = class(TFrmDBTransHidden)
    tvSchema: TUniTreeView;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnFinish: TUniBitBtn;
    btnCancel: TUniBitBtn;
    SrcSource: TDataSource;
    QrySource: TIQWebDbxQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DoAbortClick(Sender: TObject);
    procedure DoFinishClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FSchemaFileName: String;
    FAbort: Boolean;
    FLogFileObject: TIQLogFile;
    FErrorLogFileObject: TIQLogFile;
    FBooleanFieldsImported: Boolean;
    FPrg: TIQWebProgressDialog;
    XMLTable: TXMLTable;
    FDatabaseName: String;
    FSourceTableName: String;
    FTableType: TCustomTableType;
    FTargetTableIsTemporary: Boolean;

    // XMLSchema: TXMLSchema; // declared in dbtxml.pas
    // XMLDataFile: TXMLDataFile; // declared in dbtxml.pas

    procedure CheckXMLTableCreated;

    procedure GetSchemaPreview;
    procedure SetButtons;
    function ValidateSchemaFields: Boolean;
    function ValidateFieldNames: Boolean;
    function ImportData: Boolean;
    procedure PrepareProgressDlg;
  public
    { Public declarations }
    FRunBeforeImport: TNotifyEvent;
    constructor Create(
      ADatabaseName,
      ATableName,
      ATargetTableName: String;
      AImportIntoTargetTable,
      ATargetTableIsTemporary: Boolean);
    destructor Destroy; override;
    function DoProcessExec: Boolean; override; // pass table name inside MDB
  published
    { Published declarations }
    property SQLConnection;
    property Logging;
    property LogFile;
    property ErrorLogFile;

    property DatabaseName: String read FDatabaseName write FDatabaseName;
    property SourceTableName: String read FSourceTableName
      write FSourceTableName;
    property TargetTableName;
    property ImportIntoTargetTable;
    property TargetTableIsTemporary: Boolean read FTargetTableIsTemporary
      write FTargetTableIsTemporary;
    property ProgressMessage;
    property SuppressPrompts;

    property SchemaFileName: String read FSchemaFileName write FSchemaFileName;
  end;

implementation

{$R *.dfm}


uses
  dbtcommon,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Controls,
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils,
  IQMS.DBTrans.dbtshare,
  IQMS.DBTrans.dbtrscstr,
  IQMS.Common.XML;

constructor TFrmDBTransImportXML.Create(
  ADatabaseName, ATableName, ATargetTableName: String;
  AImportIntoTargetTable, ATargetTableIsTemporary: Boolean);
var
  AExt: String;
begin
  FPrg := NIL;
  XMLTable := NIL;
  FLogFileObject := NIL;
  FErrorLogFileObject := NIL;

  // 12/21/2011 Evaluate the variable provided to the constructor.
  // Fixed issue where property was evaluated before it was populated.
  AExt := Trim(UpperCase(ExtractFileExt(ADatabaseName)));
  if CompareText(AExt, IQMS.Common.XML.XML_FILE_EXT) <> 0 then
    // IQMS.DBTrans.dbtrscstr.cTXT0000016 = 'File type not supported:  %s'
    raise Exception.CreateFmt(IQMS.DBTrans.dbtrscstr.cTXT0000016, [AExt]);

  inherited Create(uniGUIApplication.UniApplication);

  DatabaseName := ADatabaseName;
  SourceTableName := ATableName;
  TargetTableName := ATargetTableName;
  ImportIntoTargetTable := AImportIntoTargetTable;
  TargetTableIsTemporary := ATargetTableIsTemporary;

end;

destructor TFrmDBTransImportXML.Destroy;
begin
  if Assigned(FPrg) then
    FreeAndNil(FPrg);
  inherited Destroy;
end;

procedure TFrmDBTransImportXML.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Assigned(FLogFileObject) then
    FreeAndNil(FLogFileObject);
  if Assigned(FErrorLogFileObject) then
    FreeAndNil(FErrorLogFileObject);

  inherited;

end;

procedure TFrmDBTransImportXML.CheckXMLTableCreated;
begin
  if Assigned(XMLTable) then
    Exit;
  XMLTable := TXMLTable.Create(Self, DatabaseName);
end;

procedure TFrmDBTransImportXML.SetButtons;
begin
  btnFinish.Enabled := Assigned(XMLTable) and (tvSchema.Items.Count > 0);
end;

procedure TFrmDBTransImportXML.UniFormShow(Sender: TObject);
begin
  inherited;
  try
    CheckXMLTableCreated;
    GetSchemaPreview;
    SetButtons;
  except
    on E: Exception do
      begin
        IQError(E.Message);
        Close;
      end;
  end;
end;

procedure TFrmDBTransImportXML.GetSchemaPreview;
begin
  if Assigned(XMLTable) then
    XMLTable.ParseSchemaToTree(tvSchema);
end;

function TFrmDBTransImportXML.DoProcessExec: Boolean;
var
  i: Integer;
begin
  Result := False;
  try
    try
      // required checks
      if not FileExists(DatabaseName) then
        // IQMS.DBTrans.dbtrscstr.cTXT0000017 = 'Application Error:  Database not supplied.'
        raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000017);
      // Ensures the XMLTable (TXMLTable) object is created
      CheckXMLTableCreated;

      try
        // Display the progress dlg
        if ShowProgress then
          PrepareProgressDlg;
        // Check for valid schema fields.  This may also open the table,
        // if required.
        Result := ValidateSchemaFields; // local, see below
        if not Result then
          Exit;
        // Make sure the data is open; if it is already open, then
        // nothing will happen.
        XMLTable.Open;
        // Make sure the field names are correct.
        if ValidateFieldNames then
          // And import the data
          Result := ImportData;
      finally
        // Hide, do not free, the progress dlg.  It is a private variable.
        if Assigned(FPrg) then
          FPrg.Hide;
      end;

      if Result then
        begin
//          QrySource.SQLConnection := MainModule.SQLConnection;
          QrySource.SQL.Text := Format('SELECT * FROM %s', [TargetTableName]);
          FSourceDataSet := QrySource;
        end;

      if FBooleanFieldsImported and not SuppressPrompts then
        { One or more fields were interpreted as Yes/No (Boolean) fields.
          Yes/No data has been imported as "Y" (Yes) and "N" (No) for
          compatibility with IQMS Yes/No fields. }
        IQMS.Common.Dialogs.IQInformation(IQMS.DBTrans.dbtrscstr.cTXT0000152);

    except
      on E: Exception do
        begin
          if Assigned(FErrorLogFileObject) then
            FErrorLogFileObject.Write(E.Message);
          raise;
        end;
    end;
  finally
    if (FPrg <> NIL) and Assigned(FPrg) then
      FreeAndNil(FPrg);
    // We close the application to prevent the user from running another import for this session.
    Close; // close form, since process is done
    if Result then
      ModalResult := mrOk
      // close this COM executable to release cursor to the BDE
      // NOTE: if we don't release connection to BDE, then an error
      // may occur if user tries to import another file during
      // this session:  ORA-00904: invalid column name.
    else
      ModalResult := mrCancel;
  end;

end;

function TFrmDBTransImportXML.ValidateSchemaFields: Boolean;
var
  i: Integer;
  ASuccess: Boolean;
begin
  Result := False;
  if Assigned(XMLTable) then
    Result := High(XMLTable.Schema.Fields) > 0;

  if not Result then
    begin
      XMLTable.Open;
      Result := High(XMLTable.Schema.Fields) > 0;
    end;
end;

function TFrmDBTransImportXML.ValidateFieldNames: Boolean;
var
  i: Integer;
  S, AError: String;
  AList: TStringList;
begin
  // Ensures that all the field names are valid.  This method is necessary
  // because some fields may be reserved words and so forth.  We call this
  // method before even creating the scheme file.

  Result := True; // default

  if Assigned(XMLTable) then
    try
      try
        // we create a string list to check for duplicates
        AList := TStringList.Create;
        AList.Sorted := True;
        AList.Duplicates := dupError;

        XMLTable.Open;

        // initial
        Result := True;

        for i := 0 to High(XMLTable.Schema.Fields) do
          begin
            S := XMLTable.Schema.Fields[i].FieldName;
            Result := ValidFieldName(S, AError);

            if not Result then
              // 'Encountered problems attempting to import XML data: %s'
              raise Exception.CreateFmt(IQMS.DBTrans.dbtrscstr.cTXT0000170, [AError]);

            AList.Add(S);

          end;

      finally
        if Assigned(AList) then
          FreeAndNil(AList);
      end;

    except
      on E: Exception do
        begin
          Result := False;
          if E is EStringListError then
            { 'The field, %s, is duplicated in the import dataset.
              Please change the field name.' }
            raise Exception.CreateFmt(IQMS.DBTrans.dbtrscstr.cTXT0000120, [S])
          else
            raise;
        end;
    end;
end;

function TFrmDBTransImportXML.ImportData: Boolean;
var
  AFields, AData, ACommandText, AProgressMessage: String;
  AMax, ARow, ACount: Integer;
  AStart, AEnd: TDateTime;

  // ---------------------------------------------------------------------------
  procedure _PopulateFields;
  begin
    // Build a list of target field names.  These are the "insert into"
    // field names.  We do this once, here, since this will always be
    // a constant value.
    AFields := XMLTable.DataTable.FieldList.CommaText; // sl.CommaText;
    AFields := StrTran(AFields, '"', '');
  end;
// ---------------------------------------------------------------------------
  procedure _GetXMLFieldData(var AFieldData: String);
  var
    i: Integer;
    ADataList: TStringList;
    AValue: String;
  begin
    if Assigned(XMLTable) and XMLTable.Active then
      AFieldData := XMLTable.DataTable.RecordText(ARow, ',', True { for SQL } );
    AFieldData := IQMS.Common.XML.XMLDecode(AFieldData);
  end;
// ---------------------------------------------------------------------------
  procedure _CheckBooleanFieldsImported;
  var
    i: Integer;
  begin
    if not Assigned(XMLTable) then
      Exit;
    for i := Low(XMLTable.Schema.Fields) to High(XMLTable.Schema.Fields) do
      if (XMLTable.Schema.Fields[i].DataType = ftBoolean) then
        begin
          FBooleanFieldsImported := True;
          Break;
        end;
  end;

// ---------------------------------------------------------------------------
begin
  if not Assigned(XMLTable) then
    Exit;

  try
    Result := False;
    // APrg := NIL;
    FBooleanFieldsImported := False; // used for the information box

    if Assigned(FRunBeforeImport) then
      FRunBeforeImport(Self);

    if not XMLTable.Active then
      XMLTable.Open;

    // 12/22/2011 Ensure connection exists
    dbtcommon.PrepareSQLConnection;

    // NOTE:  The TTable CreateTable method does not work very well,
    // which is why we have our own...
    // if ImportIntoTargetTable and
    if not IQMS.DBTrans.dbtshare.CreateOracleTableByDef(
      dbtcommon.SQLConnection,
      XMLTable.Schema.Fields,
      TargetTableName,
      TargetTableIsTemporary { Temporary } ) then
      begin
        // IQMS.DBTrans.dbtrscstr.cTXT0000015 =
        // 'Could not create data definition.  Process aborted.'
        RaiseError(IQMS.DBTrans.dbtrscstr.cTXT0000015);
        Exit;
      end;

    XMLTable.Open;

    // Get the progress max
    AMax := XMLTable.RecordCount;
    // IQMS.DBTrans.dbtrscstr.cTXT0000024 = 'Importing data...'
    AProgressMessage := IQMS.Common.Numbers.sIIf(ProgressMessage > '', ProgressMessage,
      IQMS.DBTrans.dbtrscstr.cTXT0000024);

    if Assigned(OnProgressEvent) then
      OnProgressEvent(AMax, 0, AProgressMessage);
    if Assigned(FPrg) then
      FPrg.MaxProgress := AMax;
    FAbort := False;

    if XMLTable.RecordCount = 0 then
      Exit;

    // get the field names used for SQL
    _PopulateFields;

    if Assigned(OnProgressEvent) then
      OnProgressEvent(AMax, 0, AProgressMessage);
    if Assigned(FPrg) then
      FPrg.Status1 := AProgressMessage;

    // initialize to first row
    ARow := 1;

    repeat

      // Check if user has cancelled operation
      Application.ProcessMessages;
      if Assigned(OnCheckProgressAbortedEvent) then
        OnCheckProgressAbortedEvent;
      if Assigned(FPrg) and FPrg.CheckProgressAborted then // IQMS.Common.ProgressDialog.pas
        Break;

      // Get the lists of field names and their data
      _GetXMLFieldData(AData);

      // Ensure data exists to import
      if (Trim(AData) > '') then
        begin
          // Modify the SQL
          ACommandText :=
            Format('INSERT /*+ Append */ INTO %s ( %s ) VALUES ( %s )',
            [TargetTableName, AFields, AData]);

          // Logging
          if Assigned(FLogFileObject) then
            FLogFileObject.Write(ACommandText);

          // User has cancelled process
          Application.ProcessMessages;
          if Assigned(OnCheckProgressAbortedEvent) then
            OnCheckProgressAbortedEvent;
          if Assigned(FPrg) and FPrg.CheckProgressAborted then
            Break;

          // Append the data
          AStart := Now;
          ExecuteCommand(ACommandText); // iqlib
          AEnd := Now;
          if Assigned(FLogFileObject) then
            FLogFileObject.Write(IQMS.DBTrans.dbtshare.StartEndText(AStart, AEnd));
        end;

      Inc(ARow);

      if Assigned(OnProgressEvent) then
        OnProgressEvent(AMax, ARow, AProgressMessage);
      if Assigned(FPrg) then
        FPrg.StepProgress;

    until ARow > AMax;

    ACommandText := '';

    Result := True;

    if Assigned(OnProgressEvent) then
      OnProgressEvent(AMax, AMax, AProgressMessage);

  except
    on E: Exception do
      begin
        if Assigned(FErrorLogFileObject) then
          FErrorLogFileObject.Write(E.Message);
        Result := False;
        if E.ClassType <> EAbort then
          // IQMS.DBTrans.dbtrscstr.cTXT0000053 = 'Import Execution Error'
          RaiseErrorMemo(IQMS.DBTrans.dbtrscstr.cTXT0000053, E.Message, ACommandText);
      end;
  end;

  if not SuppressPrompts then
    _CheckBooleanFieldsImported;
end;

procedure TFrmDBTransImportXML.PrepareProgressDlg;
begin
  if not Assigned(FPrg) then
    FPrg := TIQWebProgressDialog.Create(Self); // IQMS.Common.ProgressDialog.pas
  FPrg.OnCancelButtonClick := DoAbortClick;
  FPrg.MinProgress := 0;
  FPrg.MaxProgress := 100;
  FPrg.Caption := IQMS.DBTrans.dbtrscstr.cTXT0000057; // 'Import'
  FPrg.Status1 := IQMS.DBTrans.dbtrscstr.cTXT0000022; // 'Retrieving table definition...'
  if SourceTableName > '' then
    FPrg.Status2 := Format('%s, %s', [DatabaseName, SourceTableName])
  else
    FPrg.Status2 := DatabaseName;
  Self.Visible := False;
  FPrg.Execute;
end;

procedure TFrmDBTransImportXML.DoAbortClick(Sender: TObject);
begin
  FAbort := True;
end;

procedure TFrmDBTransImportXML.DoFinishClick(Sender: TObject);
begin
  DoProcessExec;
  ModalResult := mrOk;
end;

end.

{ ******************************************************* }
{ }
{ This unit handles importing from a }
{ Microsoft Access database }
{ }
{ ******************************************************* }

unit dbtimpm;

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
  Buttons,
  ExtCtrls,
  ComCtrls,
  Db,
  ADODB,
  dbthiddn,
  Menus,
  Math,
  IQMS.Common.JumpConstants,
  IQMS.Common.WriteLogFile,
  FMTBcd,
  SqlExpr,
  IQMS.DBTrans.dbttypes,
  IQMS.DBTrans.dbtdb,
  DBXOracle,
  IQMS.Common.WizardBase,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMultiItem,
  uniListBox,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniLabel, uniMainMenu;

type
  TFrmDBTransImportMDB = class(TFrmDBTransHidden)
    PnlButtons: TUniPanel;
    ADOConnection: TADOConnection;
    ADOTable: TADOTable;
    Label6: TUniLabel;
    PnlList: TUniPanel;
    lstTableList: TUniListBox;
    PnlButtonsInner: TUniPanel;
    btnFinish: TUniBitBtn;
    btnCancel: TUniBitBtn;
    LocalSQLConnection: TSQLConnection;
    procedure btnCancelClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnFinishClick(Sender: TObject);
    procedure lstTableListClick(Sender: TObject);
    procedure DoAbortClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FAbort: Boolean;
    FLogFileObject: TIQLogFile;
    FErrorLogFileObject: TIQLogFile;
    FBooleanFieldsImported: Boolean;
    FUserName: string;
    FDatabaseName: string;
    FPassword: string;
    FSourceTableName: string;
    procedure IQAfterShowMessage(var Msg: TMessage);
      message iq_AfterShowMessage;
    procedure SetButtons;
    function ConnectToMDB: Boolean;
    function ImportMSAccessData: Boolean;
    function CheckProcessAborted: Boolean;
    function ValidateFieldNames: Boolean;
    procedure UpdateFieldMap;
    function LoadTableNames: Boolean;
  public
    { Public declarations }
    FRunBeforeImport: TNotifyEvent;
    constructor Create(AOwner: TComponent; ADatabaseName, ATableName,
      AUserName, APassword, ATargetTableName: string;
      AImportIntoTargetTable: Boolean);

    procedure InitializeConnection;
    function ConfigTable(ASetActive: Boolean = TRUE): Boolean;
    procedure DoButtonClick(AWizardButton: TWizardBtn); override;
    // method for wizard buttons
    function MSAccessVersion: Integer; // 9 = 2000, 10=2002 (XP)
    function DoProcessExec: Boolean; override; // pass table name inside MDB

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
      write FSourceTableName;
    property TargetTableName;
    property ImportIntoTargetTable;
    property UserName: string
      read FUserName
      write FUserName;
    property Password: string
      read FPassword
      write FPassword;
    property ShowProgress;
    property ProgressMessage;
    property SuppressPrompts;
    property OnProgressEvent;
    property OnCheckProgressAbortedEvent;
  end;

var
  FrmDBTransImportMDB: TFrmDBTransImportMDB;

implementation

{$R *.DFM}


uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Controls,
  IQMS.Common.Numbers,
  IQMS.Common.RecordCount,
  IQMS.Common.Registry,
  IQMS.Common.StringUtils,
  IQMS.DBTrans.dbtado,
  IQMS.DBTrans.dbtfields,
  IQMS.DBTrans.dbtdbexp,
  IQMS.DBTrans.dbtshare,
  dbtlogin,
  IQMS.DBTrans.dbtrscstr,
  IQMS.Common.ProgressDialog,
  IQMS.Common.PanelMsg;

constructor TFrmDBTransImportMDB.Create(AOwner: TComponent;
  ADatabaseName, ATableName, AUserName, APassword, ATargetTableName: string;
  AImportIntoTargetTable: Boolean);
begin
  FLogFileObject := nil;
  FErrorLogFileObject := nil;

  if IQMS.DBTrans.dbttypes.GetCustomTableType(ADatabaseName) <> dttMSAccess then
    // IQMS.DBTrans.dbtrscstr.cTXT0000016 = 'File type not supported:  %s'
    raise Exception.CreateFmt(IQMS.DBTrans.dbtrscstr.cTXT0000016,
      [Trim(UpperCase(ExtractFileExt(ADatabaseName)))]);

  inherited Create(AOwner);

  DatabaseName := ADatabaseName;
  SourceTableName := ATableName;
  UserName := AUserName;
  Password := APassword;
  TargetTableName := ATargetTableName;
  ImportIntoTargetTable := AImportIntoTargetTable;
  PostMessage(Handle, iq_AfterShowMessage, 0, 0);
end;

procedure TFrmDBTransImportMDB.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Assigned(FLogFileObject) then
    FreeAndNil(FLogFileObject);
  if Assigned(FErrorLogFileObject) then
    FreeAndNil(FErrorLogFileObject);

  FSourceDataSet := ADOTable;
  inherited;

end;

procedure TFrmDBTransImportMDB.IQAfterShowMessage(var Msg: TMessage);
begin
  InitializeConnection;
end;

procedure TFrmDBTransImportMDB.InitializeConnection;
begin
  // Check if ISAM dll exists
  IQMS.DBTrans.dbtado.CheckAccessISAMExists;

  lstTableList.Items.Clear;
  Update;
  Application.ProcessMessages;

  ConnectToMDB;
  SetButtons;

  if SourceTableName > '' then
    lstTableList.ItemIndex := lstTableList.Items.IndexOf(SourceTableName);
end;

procedure TFrmDBTransImportMDB.DoButtonClick(AWizardButton: TWizardBtn);
begin
end;

procedure TFrmDBTransImportMDB.SetButtons;
begin
  btnFinish.Enabled := (lstTableList.ItemIndex > - 1);
end;

procedure TFrmDBTransImportMDB.UpdateFieldMap;
var
  i: Integer;
begin
  // This is called only when the user clicks the Finish button on the GUI.
  FieldMap.Clear;
  for i := 0 to ADOTable.FieldCount - 1 do
    FieldMap.Add(ADOTable.Fields[i].DisplayLabel { Target } ,
      ADOTable.Fields[i].FieldName { Source } );
end;

function TFrmDBTransImportMDB.ConnectToMDB: Boolean;
var
  ASystemMDW, AUserName, APassword: string;

  function _TryConnect(AUID, APWD: string): Boolean;
  begin
    Result := False;
    with ADOConnection do
      try
        ConnectionString := IQMS.DBTrans.dbtado.ADO_ConnectionStringForMSAccess(DatabaseName,
          AUserName, APWD);
        Connected := TRUE;
        Result := Connected;
      except
      end;
  end;

begin
  Result := False;

  if not FileExists(DatabaseName) then
    // IQMS.DBTrans.dbtrscstr.cTXT0000017 = 'Application Error:  Database not supplied.'
    RaiseError(IQMS.DBTrans.dbtrscstr.cTXT0000017);

  try
    Result := ADOConnection.Connected;
    if Result then
      begin
        if lstTableList.Items.Count = 0 then
          LoadTableNames;
        Exit(TRUE);
      end;

    lstTableList.Items.Clear;

    // The system database is the work group file that is associated with an
    // MDE or MDB.  This is only used when a database is password protected.
    ASystemMDW := ChangeFileExt(DatabaseName, '.MDW');
    if (Password > '') and not FileExists(ASystemMDW) then
      raise Exception.CreateFmt('Could not find workgroup file: %s',
        [ASystemMDW]);

    if (UserName = '') then
      begin
        // Initialize
        AUserName := 'Admin';
        APassword := '';

        // First, attempt to connect with the standard user and no password
        if _TryConnect('Admin', '') then
          begin
            UserName := 'Admin';
            Password := '';
          end
          // otherwise, prompt the user to connect
        else
          // 'Please log in to the source database.'
          if GetLoginIn(AUserName, APassword, IQMS.DBTrans.dbtrscstr.cTXT0000071) then
            begin
              UserName := AUserName;
              Password := APassword;
            end
          else
            SysUtils.Abort;
      end;

    // Now, if we are not already connected, attempt to connect
    if not ADOConnection.Connected then
      if not _TryConnect(UserName, Password) then
        // IQMS.DBTrans.dbtrscstr.cTXT0000148 = 'Invalid user name or password.'
        raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000148);

    Result := ADOConnection.Connected and Self.LoadTableNames;

    if (lstTableList.Items.Count = 0) then
      // IQMS.DBTrans.dbtrscstr.cTXT0000021 = 'Database contains no tables.'
      RaiseError(IQMS.DBTrans.dbtrscstr.cTXT0000021);

  except
    on E: Exception do
      // IQMS.DBTrans.dbtrscstr.cTXT0000082 = 'Connection Error'
      // IQMS.DBTrans.dbtrscstr.cTXT0000019 = 'Could not connect to database, %s:'
      RaiseErrorMemo(IQMS.DBTrans.dbtrscstr.cTXT0000082, Format(IQMS.DBTrans.dbtrscstr.cTXT0000019,
        [DatabaseName]), E.Message);
  end;
end;

function TFrmDBTransImportMDB.LoadTableNames: Boolean;
var
  AList: TStringList;
begin
  Result := False;
  if ADOConnection.Connected then
    begin
      AList := TStringList.Create;
      try
        ADOConnection.GetTableNames(AList, False);
        lstTableList.Items.Clear;
        lstTableList.Items.AddStrings(AList);
        Result := lstTableList.Items.Count > 0;
        lstTableList.Visible := Result;
      finally
        if Assigned(AList) then
          FreeAndNil(AList);
      end;
    end;
end;

function TFrmDBTransImportMDB.DoProcessExec: Boolean;
begin
  Result := False;

  if not ADOConnection.Connected then
    if not ConnectToMDB then
      begin
        if Assigned(FErrorLogFileObject) then
          FErrorLogFileObject.Write('Not connected to Microsoft Access');
        Exit(False);
      end;

  try
    try
      if not FileExists(DatabaseName) then
        // IQMS.DBTrans.dbtrscstr.cTXT0000017 =
        // 'Application Error:  Database not supplied.'
        raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000017);

      if (lstTableList.Items.Count = 0) then
        Self.LoadTableNames;

      // We may be loading a prior import configuration.  If so, then
      // make sure the table name is already selected in the list.
      if (SourceTableName > '') and
        (lstTableList.ItemIndex < 0) then
        lstTableList.ItemIndex := lstTableList.Items.IndexOf(SourceTableName);

      // If the table was not found, and we get to this point, then this
      // method is being executed without the GUI, so we display this
      // message.  See btnFinishClick() for the "please select" message.
      if lstTableList.ItemIndex < 0 then
        { 'The table, %s, was not found in the database.  ' +
          'It may have been renamed or deleted.' }
        raise Exception.CreateFmt(IQMS.DBTrans.dbtrscstr.cTXT0000198, [SourceTableName]);

      // Set the table name
      Result := ConfigTable; // local, see below
      if not Result then
        Exit;

      // Import the data
      if ImportIntoTargetTable then
        Result := ImportMSAccessData
      else
        begin
          // InitializeConnection;
          // ConfigTable(TRUE);
          if not ADOTable.Active then
            ADOTable.Open;
          UpdateFieldMap;
          Result := ADOConnection.Connected and ADOTable.Active;
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
    except
      on E: Exception do
        begin
          if Assigned(FErrorLogFileObject) then
            FErrorLogFileObject.Write(E.Message);
          raise;
        end;
    end;
  finally
    // Close connection
    // if ADOTable.Active then
    // ADOTable.Close;
    // if ADOConnection.Connected then
    // ADOConnection.Connected := False;
    // if LocalSQLConnection.Connected then
    // LocalSQLConnection.Connected := False;

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

procedure TFrmDBTransImportMDB.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmDBTransImportMDB.btnBackClick(Sender: TObject);
begin
  DoButtonClick(wbPrior);
end;

procedure TFrmDBTransImportMDB.btnNextClick(Sender: TObject);
begin
  DoButtonClick(wbNext);
end;

procedure TFrmDBTransImportMDB.btnFinishClick(Sender: TObject);
begin
  if lstTableList.ItemIndex < 0 then
    // IQMS.DBTrans.dbtrscstr.cTXT0000020 = 'Please select a table.'
    raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000020);

  if ImportIntoTargetTable then
    DoProcessExec
  else
    begin
      // NOTE:  We may need to configure the table, etc. and keep this
      // form open but hidden (see OnClose event).
      ConfigTable; // local, see below
      ModalResult := mrOk;
    end;
end;

function TFrmDBTransImportMDB.ImportMSAccessData: Boolean;
var
  ALocalFieldMap: TFieldMap;
  AData, ASQL, ACommandText, AProgressMessage: string;
  AMax, ACount: Integer;
  APrg: TIQWebProgressDialog;
  AStart, AEnd: TDateTime;
  ret: Boolean;
  AQueryExec: TSQLQuery;

  // ---------------------------------------------------------------------------
  procedure _CreateQueryExec;
  begin
    if not Assigned(AQueryExec) then
      begin
        AQueryExec := TSQLQuery.Create(nil);
        if Assigned(Self.SQLConnection) then
          AQueryExec.SQLConnection := Self.SQLConnection
        else if Assigned(Self.LocalSQLConnection) then
          AQueryExec.SQLConnection := LocalSQLConnection
        else
          raise Exception.Create('Application Error:  Cannot create ' +
            'export query.  SQLConnection object unassigned.');
      end;
  end;
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
              Result := False;
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
    AData := '';
    // Cycle the table an build a list containing data
    sl := TStringList.Create;
    try
      // Get the field names
      for i := 0 to ALocalFieldMap.Count - 1 do
        begin
          AField := ADOTable.FindField(ALocalFieldMap.Source(i));
          if (AField = nil) then
            RaiseError
              ('Application Error:  Expected field no longer in field list.')
          else
            sl.Add(IQMS.DBTrans.dbtfields.GetFormattedDataAsString(AField,
              AField.Size, TRUE));
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
    Result := False;
    // 05/28/2009 Run SQL
    _GetFieldData;

    ACommandText := Format(ASQL, [AData]);

    // 10/14/2010 Remmed this in favor of creating a TSQLQuery (AQueryExec)
    // just once inside the main procedure.
    { if Assigned(SQLConnection) then
      Result := IQMS.DBTrans.dbtdbexp.DBX_RunSQL(SQLConnection, ACommandText)
      else
      Result := IQMS.DBTrans.dbtdbexp.DBX_RunSQL(LocalSQLConnection, ACommandText); }

    if Assigned(AQueryExec) then
      begin
        AQueryExec.SQL.Text := ACommandText;
        AQueryExec.Prepared := TRUE;
        Result := AQueryExec.ExecSQL() > 0;
      end
    else
      SysUtils.Abort;

    // 05/29/2009 Tried this, but I get an "Invalid data type" error
    { ACommandText := Format('insert /*+ Append */ into %s (%s) values (%s)',
      [TargetTableName, AFields, AParams]);
      Result := IQMS.DBTrans.dbtdbexp.DBX_RunSQLParamDataSet(LocalSQLConnection,
      ACommandText, ADOTable); }
  end;

// ---------------------------------------------------------------------------
begin
  // Initialize
  Result := False;
  FBooleanFieldsImported := False;
  APrg := nil;
  ACount := 0;
  AMax := 0;
  AQueryExec := nil;

  // 05/28/2009 Connect the DBExpress Connection to the IQMS database
  if Assigned(SQLConnection) then
    begin
      if not IQMS.DBTrans.dbtdbexp.DBX_OpenSQLConnection(SQLConnection) then
        RaiseError(Format('Cannot connect to database, %s',
          [IQMS.Common.Miscellaneous.IQGetServerName]));
    end
  else
    begin
      if not IQMS.DBTrans.dbtdbexp.DBX_OpenSQLConnection(LocalSQLConnection) then
        RaiseError(Format('Cannot connect to database, %s',
          [IQMS.Common.Miscellaneous.IQGetServerName]));
    end;

  if ImportIntoTargetTable and (TargetTableName = '') then
    raise Exception.Create('Application Error:  Table name not provided.');

  // First 'try' is for except clause
  try
    ALocalFieldMap := TFieldMap.Create(nil);
    try
      ALocalFieldMap.AddMap(FieldMap);

      // 10/14/2010 Create the TSQLQuery that will handle importing the records.
      // We do this to enhance speed, even if this saves only a few seconds.
      _CreateQueryExec;
      try
        if not _ValidateFieldMap then
          begin
            // IQMS.DBTrans.dbtrscstr.cTXT0000199 =
            // 'The table fields have changed since this ' +
            // 'import was last configured.  Please reconfigure the import for this ' +
            // 'file.'
            IQError(IQMS.DBTrans.dbtrscstr.cTXT0000199);
            Exit;
          end;

        // Check the field names to ensure they are useable
        if not ValidateFieldNames then
          begin
            { 'Could not validate all field names.  Operation aborted.' }
            if Assigned(FErrorLogFileObject) then
              FErrorLogFileObject.Write(IQMS.DBTrans.dbtrscstr.cTXT0000109);
            IQError(IQMS.DBTrans.dbtrscstr.cTXT0000109);
            Exit;
          end;

        if Assigned(FRunBeforeImport) then
          FRunBeforeImport(Self);

        try
          AMax := IQMS.Common.RecordCount.GetRecordCount(ADOTable);
          if ShowProgress then
            begin
              APrg := TIQWebProgressDialog.Create(Self); // IQMS.Common.ProgressDialog.pas
              APrg.OnCancelButtonClick := DoAbortClick;
              APrg.MinProgress := 0;
              APrg.MaxProgress := AMax;
              APrg.Caption := IQMS.DBTrans.dbtrscstr.cTXT0000057; // 'Import'
              Self.Visible := False;
              APrg.Execute;
              APrg.Status1 := IQMS.DBTrans.dbtrscstr.cTXT0000022;
              // 'Retrieving table definition...'
              APrg.Status2 := Format('%s, %s', [ExtractFileName(DatabaseName),
                SourceTableName]);
              Application.ProcessMessages;
            end;

          if Assigned(OnProgressEvent) then
            // 'Retrieving table definition...'
            OnProgressEvent(AMax, 0, IQMS.DBTrans.dbtrscstr.cTXT0000022);

          // NOTE:  The TTable CreateTable method does not work very well,
          // which is why we have our own...
          // Also, we only do this if we are importing into a temp table
          if ImportIntoTargetTable and (TargetTableName > '') and
            not CreateOracleTable(ADOTable, TargetTableName, False { Temporary } )
          then // in IQMS.DBTrans.dbtshare.pas
            begin
              FreeAndNil(APrg);
              // IQMS.DBTrans.dbtrscstr.cTXT0000083 = 'Data Error'
              // IQMS.DBTrans.dbtrscstr.cTXT0000015 =
              // 'Could not create data definition.  Process aborted.' }
              RaiseErrorMemo(IQMS.DBTrans.dbtrscstr.cTXT0000083, IQMS.DBTrans.dbtrscstr.cTXT0000015,
                Format('%s, %s', [DatabaseName, SourceTableName]));
            end;

          if not ADOTable.Active then
            ADOTable.Open;
          ADOTable.First;
          FAbort := False;

          _InitSQLBase;

          AProgressMessage := sIIf(ProgressMessage > '', ProgressMessage,
            IQMS.DBTrans.dbtrscstr.cTXT0000024 { 'Importing data...' } );
          if Assigned(APrg) then
            APrg.Status1 := AProgressMessage;
          if Assigned(OnProgressEvent) then
            OnProgressEvent(AMax, 0, AProgressMessage);

          while not ADOTable.EOF do
            begin
              // Check if user has cancelled operation
              Application.ProcessMessages;
              if CheckProcessAborted then
                BREAK;

              if Assigned(OnCheckProgressAbortedEvent) then
                begin
                  FAbort := OnCheckProgressAbortedEvent;
                  if FAbort then
                    BREAK;
                end;

              // Logging
              if Assigned(FLogFileObject) then
                FLogFileObject.Write(ACommandText);

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
        if Assigned(AQueryExec) then
          FreeAndNil(AQueryExec);
      end;
    finally
      if Assigned(APrg) then
        FreeAndNil(APrg);
      if Assigned(ALocalFieldMap) then
        FreeAndNil(ALocalFieldMap);
    end;
  except
    on E: Exception do
      begin
        if Assigned(FErrorLogFileObject) then
          FErrorLogFileObject.Write(E.Message + #13#13 + ACommandText);
        Result := False;
        if E.ClassType <> EAbort then
          // IQMS.DBTrans.dbtrscstr.cTXT0000053 = 'Import Execution Error'
          RaiseErrorMemo(IQMS.DBTrans.dbtrscstr.cTXT0000053, E.Message, ACommandText);
      end;
  end;
end;

procedure TFrmDBTransImportMDB.lstTableListClick(Sender: TObject);
begin
  SetButtons;
end;

procedure TFrmDBTransImportMDB.DoAbortClick(Sender: TObject);
begin
  FAbort := TRUE;
end;

function TFrmDBTransImportMDB.CheckProcessAborted: Boolean;
begin
  Result := FAbort;
  if FAbort then
    begin
      // IQMS.DBTrans.dbtrscstr.cTXT0000023 = 'Abort import operation?'
      Result := IQConfirmYN(IQMS.DBTrans.dbtrscstr.cTXT0000023);
      if not Result then
        FAbort := False; // reset; user changed mind
    end;
end;

function TFrmDBTransImportMDB.MSAccessVersion: Integer;
var
  S: string;
  i, j, x: Integer;
  AList: TStringList;
begin
  Result := 0;
  i := 0;
  with TIQWebRegistry.Create do
    try
      RootKey := HKEY_CLASSES_ROOT;
      if OpenKey('Access.Application\CurVer', False) then
        begin
          S := ReadString('');
          S := GetToken(S, '.', 3);
          if S > '' then
            try
              i := StrToInt(S);
              Result := i; // 9 = Word 2000, 10=2002
            except // suppress
            end;
        end
      else if OpenKey('', False) then
        try
          AList := TStringList.Create;
          GetKeyNames(AList);
          for j := 0 to AList.Count - 1 do
            if Pos('Access.Application.', AList.Strings[j]) > 0 then
              begin
                x := 0;
                S := GetToken(AList.Strings[j], '.', 3);
                if IQMS.Common.Numbers.IsStringValidInteger(S, x) then
                  i := Max(i, x);
              end;

          Result := i;

        finally
          if Assigned(AList) then
            FreeAndNil(AList);
        end;

    finally
      Free;
    end;
end;

function TFrmDBTransImportMDB.ValidateFieldNames: Boolean;
var
  i: Integer;
  S, AError: string;
  AList: TStringList;
begin
  // Ensures that all the field names are valid.  This method is necessary
  // because some fields may be reserved words and so forth.  We call this
  // method before even creating the scheme file.

  Result := TRUE; // default
  if not ADOConnection.Connected and not ADOTable.Active then
    Exit;

  try
    try
      AList := TStringList.Create;
      AList.Sorted := TRUE;
      AList.Duplicates := dupError;

      for i := 0 to ADOTable.FieldCount - 1 do
        begin
          // Get the field name
          S := Trim(ADOTable.Fields[i].DisplayLabel);
          if S = '' then
            S := Trim(ADOTable.Fields[i].FieldName);

          Result := ValidFieldName(S, AError);

          if not Result then
            // 'Encountered problems attempting to import Microsoft Access data: %s'
            raise Exception.CreateFmt(IQMS.DBTrans.dbtrscstr.cTXT0000122, [AError]);

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
          // IQMS.DBTrans.dbtrscstr.cTXT0000120 =
          // 'The field, %s, is duplicated in the import dataset.  Please change the field name.'
          raise Exception.CreateFmt(IQMS.DBTrans.dbtrscstr.cTXT0000120, [S])
        else
          raise;
      end;
  end;
end;

function TFrmDBTransImportMDB.ConfigTable(ASetActive: Boolean): Boolean;
var
  hMsg: TPanelMesg;
begin
  hMsg := nil;
  Result := False;

  // We must have an ADO connection to the database first
  if not ADOConnection.Connected then
    Exit;

  // Close the dataset before changing table name
  if ADOTable.Active then
    ADOTable.Close;

  // First, fill the record variable
  SourceTableName := lstTableList.Items.Strings[lstTableList.ItemIndex];

  if SourceTableName = '' then
    // IQMS.DBTrans.dbtrscstr.cTXT0000123 = 'Cannot open table.  Table name is empty.'
    raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000123);

  // Now, apply the table name property
  ADOTable.TableName := SourceTableName;

  // Open the dataset
  try
    if ShowProgress and not Assigned(OnProgressEvent) then
      hMsg := hPleaseWait('');
    if Assigned(OnProgressEvent) then
      begin
        // 'Accessing database.  Please wait.'
        OnProgressEvent(0, 0, IQMS.DBTrans.dbtrscstr.cTXT0000207);
        Application.ProcessMessages;
      end;
    if ASetActive then
      ADOTable.Open;
  finally
    if Assigned(hMsg) then
      FreeAndNil(hMsg);
  end;

  Result := CheckValidFields(ADOTable);
end;

end.

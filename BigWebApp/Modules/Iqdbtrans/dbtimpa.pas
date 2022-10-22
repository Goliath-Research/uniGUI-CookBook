{ ******************************************************* }
{ }
{ Import data from a System Connection (Alias) }
{ }
{ ******************************************************* }

unit dbtimpa;

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
  StdCtrls,
  Buttons,
  Menus,
  ExtCtrls,
  Db,
  ADODB,
  IQMS.WebVcl.DBExpress,
  DBClient,
  SqlExpr,
  IQMS.DBTrans.dbttypes,
  IQMS.Common.JumpConstants,
  DBXOracle,
  Datasnap.Provider,
  Data.FMTBcd,
  uniGUIBaseClasses,
  uniGUIApplication,
  uniGUIClasses,
  uniMultiItem,
  uniListBox,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniLabel, uniMainMenu;

type
  TFrmDBTransImportAlias = class(TFrmDBTransHidden)
    Panel8: TUniPanel;
    PnlList: TUniPanel;
    lstTableList: TUniListBox;
    Label6: TUniLabel;
    SrcData: TDataSource;
    QryADOData: TADOQuery;
    TblADOSource: TADOTable;
    TblDestination: TIQWebDbxTable;
    Panel1: TUniPanel;
    btnFinish: TUniBitBtn;
    btnCancel: TUniBitBtn;
    ADOConnection: TADOConnection;
    LocalSQLConnection: TSQLConnection;
    SourceSQLConnection: TSQLConnection;
    SourceDataSetProvider: TDataSetProvider;
    SourceClientDataSet: TClientDataSet;
    SourceSQLQuery: TSQLQuery;
    procedure QryADODataBeforeOpen(DataSet: TDataSet);
    procedure btnFinishClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure lstTableListClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    // FAliasType: TAliasType;
    FAbortOnCreate: Boolean;
    FUserName: String;
    FProgressMessage: String;
    FSourceTableName: String;
    FDatabaseName: String;
    FPassword: String;
    FDataSourceType: TDataSourceType;
    procedure IQAfterShowMessage(var Msg: TMessage);
      message iq_AfterShowMessage;
    procedure SetControls;
    function ConfigTable: Boolean;
    function TryConnect(AUserName, APassword: String): Boolean;
    procedure TestOpenTable;
    procedure LoadTableList;
    procedure SetSourceTableName(const Value: String);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create( ADatabaseName: String;
      ADataSourceType: TDataSourceType;
      AUserName, APassword, ATableName: String);
    destructor Destroy; override;
    // function SelectedTableName: String;
    function DoProcessExec: Boolean; override; // pass table name inside MDB

    property DataSourceType: TDataSourceType read FDataSourceType
      write FDataSourceType;
    property SourceTableName: String read FSourceTableName
      write SetSourceTableName;

    property DatabaseName: String read FDatabaseName write FDatabaseName;
    property TargetTableName;
    property ImportIntoTargetTable;
    property UserName: String read FUserName write FUserName;
    property Password: String read FPassword write FPassword;
    property ProgressMessage: String read FProgressMessage
      write FProgressMessage;

    property SQLConnection;
    property Logging;
    property LogFile;
    property ErrorLogFile;

  end;


implementation

{$R *.DFM}


uses
  IQMS.DBTrans.dbtado,
  dbtbatmv,
  IQMS.DBTrans.dbtdbexp,
  dbtlogin,
  IQMS.DBTrans.dbtrscstr,
  IQMS.DBTrans.dbtshare,
  IQMS.Common.Controls,
  dbtemptables,
  IQMS.Common.ErrorDialog,
  IQMS.Common.Dialogs,
  IQMS.Common.PanelMsg;

constructor TFrmDBTransImportAlias.Create(
  ADatabaseName: String;
  ADataSourceType: TDataSourceType; AUserName, APassword, ATableName: String);
var
  ATmpUserName,
    ATmpPassword: String;
begin
  FAbortOnCreate := False;

  inherited Create(uniGUIApplication.UniApplication);

  // Assign property values
  DatabaseName := ADatabaseName;
  UserName := AUserName;
  Password := APassword;
  SourceTableName := ATableName;
  // TableType := ATableType;
  DataSourceType := ADataSourceType;

  try
    // Configure a local DBExpress SQLConnection.  This is used for the
    // target (since we are importing).
    IQMS.DBTrans.dbtdbexp.DBX_ConfigureSQLConnection(LocalSQLConnection);

    if ADOConnection.Connected then
      ADOConnection.Connected := False;
    if SourceSQLConnection.Connected then
      SourceSQLConnection.Connected := False;

    if DataSourceType = dstOracleAlias then
      IQMS.DBTrans.dbtdbexp.DBX_ConfigureSQLConnection(
        SourceSQLConnection,
        DatabaseName,
        UserName,
        Password,
        'Oracle')
    else if DataSourceType = dstDSN then
      IQMS.DBTrans.dbtado.ADO_ConfigureConnectionForODBC
        (ADOConnection,
        DatabaseName,
        UserName,
        Password)
    else
      raise Exception.Create('Application Error:  Invalid datasource type.');

    // Fill this for the login dlg box
    ATmpUserName := UserName;

    // We want to avoid prompting for a user name and password, if we can.
    // If we are importing a Microsoft Access database as a file, and
    // no user name or password was passed to this routine, then we try
    // to use the default user name, Admin, with no password; otherwise,
    // we will need to prompt.  But we always save the login information
    // if the login was successfull; so, it shouldn't happen repeatedly.
    // If we are connecting to an Alias, and no login information is
    // provided, then of course we need to login in.  But if we are
    // connecting to a Microsoft Access database through an alias (not a
    // file), then we can still try our default login information.

    // We only check if both the username and password values are empty;
    // it is possible for the username to provided, but not the password.
    // If something does go wrong with this approach, we will eventually
    // prompt the user for the username and password.
    if (UserName = '') and (Password = '') then
      begin
        // Prompt the user for a password
        // 'Please log in to the source database.'
        if GetLoginIn(ATmpUserName, ATmpPassword, IQMS.DBTrans.dbtrscstr.cTXT0000071) then
          begin
            UserName := ATmpUserName;
            Password := ATmpPassword;
          end
        else
          SysUtils.Abort;
      end;

    // Now, attempt to login to the database; if we fail, then we prompt the
    // user for login information (again).
    if not TryConnect(UserName, Password) then
      begin
        // 'Please log in to the source database.'
        GetLoginIn(ATmpUserName, ATmpPassword, IQMS.DBTrans.dbtrscstr.cTXT0000071);
        UserName := ATmpUserName;
        Password := ATmpPassword;
      end;

    // Second attempt at connecting.  If the database is not connected, then
    // this is our second go-around.  Try again to connect.  But if we fail
    // this time, then alert the user and stop attempting to process this
    // record.
    {if not ADOConnection.Connected and
      not TryConnect(UserName, Password) then
      // 'Invalid user name or password.'
      raise Exception.Create
        (IQMS.DBTrans.dbtrscstr.cTXT0000148  );
     }
  except
    on E: Exception do
      begin
        FAbortOnCreate := True;

        if not E.ClassNameIs('EAbort') and not E.ClassNameIs('EOleException')
        then
          ShowIQErrorMessageA
            (IQMS.DBTrans.dbtrscstr.cTXT0000107 { 'Error connecting to data source.' } ,
            E.Message,
            // 'The login or password may be incorrect, or the system data source
            // (alias, DSN, etc.) may not be configured.'
            IQMS.DBTrans.dbtrscstr.cTXT0000106);
        PostMessage(Handle, wm_Command, Exit1.Command, 0); // Call "Exit"
      end;
  end;
end;

procedure TFrmDBTransImportAlias.FormShow(Sender: TObject);
begin
  // inherited; // nothing

  // This will load the table list; it should only load if we are
  // showing the form.  It should not load if we are executing a
  // pre-defined configuration.
  if not FAbortOnCreate then
    PostMessage(Handle, iq_AfterShowMessage, 0, 0);

end;

procedure TFrmDBTransImportAlias.IQAfterShowMessage(var Msg: TMessage);
begin
  Application.ProcessMessages;
  LoadTableList;
end;

procedure TFrmDBTransImportAlias.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ModalResult = mrOk then
    CanClose := ConfigTable
  else
    CanClose := True;

  inherited;
end;

procedure TFrmDBTransImportAlias.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DataSourceType = dstOracleAlias then
    FSourceDataSet := SourceSQLQuery
  else
    FSourceDataSet := TblADOSource;
  inherited;
end;

destructor TFrmDBTransImportAlias.Destroy;
begin
  inherited Destroy;
end;

function TFrmDBTransImportAlias.TryConnect(AUserName,
  APassword: String): Boolean;
begin
  Result := False;
  try
    if ADOConnection.Connected then
      ADOConnection.Connected := False;
    if SourceSQLConnection.Connected then
      SourceSQLConnection.Connected := False;
    if DataSourceType = dstOracleAlias then
      begin
        IQMS.DBTrans.dbtdbexp.DBX_ConfigureSQLConnection(
          SourceSQLConnection,
          DatabaseName,
          AUserName,
          APassword,
          'Oracle');
        SourceSQLConnection.Connected := True;
        Result := SourceSQLConnection.Connected;
      end
    else if DataSourceType = dstDSN then
      begin
        IQMS.DBTrans.dbtado.ADO_ConfigureConnectionForODBC
          (ADOConnection,
          DatabaseName,
          AUserName,
          APassword);
        ADOConnection.Connected := True;
        Result := ADOConnection.Connected;
      end
    else
      raise Exception.Create('Application Error:  Invalid datasource type.');

  except
  end;
end;

procedure TFrmDBTransImportAlias.LoadTableList;
var
  hMsg: TPanelMesg;
begin
  hMsg := NIL;
  try
    if ShowProgress and not Assigned(OnProgressEvent) then
      { 'Connected successfully to database.'#13 +
        'Accessing table list.  Please wait.' }
      hMsg := hPleaseWait(IQMS.DBTrans.dbtrscstr.cTXT0000208);
    lstTableList.Items.BeginUpdate;
    lstTableList.Items.Clear;
    if DataSourceType = dstOracleAlias then
      begin
        with TSQLQuery.Create(nil) do
          try
            SQLConnection := SourceSQLConnection;
            SQL.Add('SELECT table_name FROM user_tables ORDER BY 1');
            Open;
            while not Eof do
              begin
                lstTableList.Items.Add(Fields[0].AsString);
                Next;
              end;
          finally
            Free;
          end;
      end
    else
      ADOConnection.GetTableNames(lstTableList.Items);
  finally
    lstTableList.Items.EndUpdate;
    if Assigned(hMsg) then
      FreeAndNil(hMsg);
  end;

  // Ensure we select the table in the list; this should be done here
  // in case the list was not loaded when the table name value was set.
  if FSourceTableName > '' then
    SourceTableName := FSourceTableName;

  SetControls;
end;

procedure TFrmDBTransImportAlias.SetSourceTableName(const Value: String);
begin
  FSourceTableName := Value;
  if lstTableList.Count > 0 then
    lstTableList.ItemIndex := lstTableList.Items.IndexOf(Value);
end;

procedure TFrmDBTransImportAlias.lstTableListClick(Sender: TObject);
begin
  SourceTableName := lstTableList.Items.Strings[lstTableList.ItemIndex];
  btnFinish.Enabled := SourceTableName > '';
end;

procedure TFrmDBTransImportAlias.TestOpenTable;
begin
  try
    if DataSourceType = dstOracleAlias then
      begin
        if not SourceSQLConnection.Connected then
          SourceSQLConnection.Connected := True;
        if SourceSQLQuery.Active then
          SourceSQLQuery.Close;
        if SourceTableName > '' then
           begin
             SourceSQLQuery.SQL.Clear;
             SourceSQLQuery.SQL.Add(Format('SELECT * FROM %s', [SourceTableName]));
           end;
        SourceSQLQuery.Open;
        SourceSQLQuery.Close;
      end
    else
      begin
        if QryADOData.Active then
          QryADOData.Close;
        QryADOData.Open;
        QryADOData.Close;
      end;
  except
    begin
      btnFinish.Enabled := False;
      IQError(IQMS.DBTrans.dbtrscstr.
        cTXT0000052 { 'Cannot access data in selected table.' } );
    end;
  end;
end;

procedure TFrmDBTransImportAlias.QryADODataBeforeOpen(DataSet: TDataSet);
begin
  if SourceTableName > '' then
    with TADOQuery(DataSet) do
      begin
        if Active then
          Close;
        SQL.Clear;
        SQL.Add(Format('SELECT * FROM %s', [SourceTableName]));
      end;
end;

function TFrmDBTransImportAlias.DoProcessExec: Boolean;
var
  ATableName: String;
  AIQBatchMode: TIQBatchMode;
begin
  // this method only executes if we are importing directly into a table
  Result := False; // initial

  try
    if ConfigTable then
      begin
        // Assign unique destination table name
        if ImportIntoTargetTable then
          begin
            if (TargetTableName = '') then
              TargetTableName := GetTempTableName(SQLConnection);
            // dbtemptables;
            TblDestination.TableName := TargetTableName; // dbtshare
            AIQBatchMode := iqbmCopy;
          end
        else
          AIQBatchMode := iqbmAppend;

        Hide; // hide this form

        // Assign SQLConnection, if provided.
        if Assigned(SQLConnection) then
          TblDestination.SQLConnection := SQLConnection;

        if DataSourceType = dstOracleAlias then
          Result := dbtbatmv.BatchImportOracleTable(
            SourceSQLQuery, // ASource
            TblDestination, // ATarget
            TblDestination.TableName, // ATableName
            AIQBatchMode, // AIQBatchMode
            Self.ShowProgress, // AShowProgress
            NIL, // AFieldMap: TStringList;
            ProgressMessage, // AImportMsg1
            '', // AImportMsg2
            Self.LogFile, // ALogFile
            Self.ErrorLogFile, // AErrorLogFile
            Self.OnProgressEvent, // AOnProgressEvent: TOnProgressEvent;
            Self.OnCheckProgressAbortedEvent)
          // AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent
        else
          Result := dbtbatmv.BatchImport(
            TblADOSource, // ASource: TCustomADODataSet;
            TblDestination, // ATarget: TDbxCustomDataSet;
            TblDestination.TableName, // ATableName: String;
            AIQBatchMode, // AIQBatchMode: TIQBatchMode;
            Self.ShowProgress, // AShowProgress: Boolean;
            NIL, // AFieldMap: TStringList;
            ProgressMessage, // AImportMsg1: String;
            '', // AImportMsg2: String;
            Self.LogFile, // ALogFile: TFileName;
            Self.ErrorLogFile, // AErrorLogFile: TFileName;
            Self.OnProgressEvent, // AOnProgressEvent: TOnProgressEvent;
            Self.OnCheckProgressAbortedEvent);
        // AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent

        // We close the application to prevent the user from click the back button
        // or from running another import for this session.
        Close; // close form, since process is done
        ModalResult := mrOk;
        // close this COM executable to release cursor to the BDE
        // NOTE: if we don't release connection to BDE, then an error
        // may occur if user tries to import another file during
        // this session:  ORA-00904: invalid column name.
      end;
  except
    on E: Exception do
      try
        raise Exception.CreateFmt('%s'#13#13'%s'#13#13'%s',
          [IQMS.DBTrans.dbtrscstr.cTXT0000002, E.Message, IQMS.DBTrans.dbtrscstr.cTXT0000003]);
      finally
        ModalResult := mrCancel;
      end;
  end;
end;

procedure TFrmDBTransImportAlias.btnFinishClick(Sender: TObject);
begin
  Application.ProcessMessages;

  TestOpenTable;

  if SourceTableName = '' then
    begin
      ModalResult := mrNone;
      raise Exception.Create('Please select a table.');
    end;

  if ImportIntoTargetTable then
    DoProcessExec
  else
    ModalResult := mrOk;
end;

procedure TFrmDBTransImportAlias.SetControls;
begin
  lstTableList.Visible := (lstTableList.Items.Count > 0);
  if not lstTableList.Visible then
    PnlList.Caption := IQMS.DBTrans.dbtrscstr.cTXT0000049; // {'No tables found.'
end;

function TFrmDBTransImportAlias.ConfigTable: Boolean;
begin
  if (SourceTableName = '') then
    raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000020 { 'Please select a table.' } );

  if DataSourceType = dstOracleAlias then
    begin
      if not SourceSQLConnection.Connected then
        SourceSQLConnection.Connected := True;
      if SourceSQLQuery.Active then
        SourceSQLQuery.Close; // close it first
      if SourceTableName > '' then
         begin
           SourceSQLQuery.SQL.Clear;
           SourceSQLQuery.SQL.Add(Format('SELECT * FROM %s', [SourceTableName]));
         end;
      SourceSQLQuery.Open; // open it so we can look at the fields
      Result := CheckValidFields(SourceSQLQuery); // IQMS.DBTrans.dbtshare.pas
    end
  else
    begin
      // Source (alias table)
      if TblADOSource.Active then
        TblADOSource.Close; // close it first
      TblADOSource.TableName := SourceTableName; // set the table name
      TblADOSource.Open; // open it so we can look at the fields
      Result := CheckValidFields(TblADOSource); // IQMS.DBTrans.dbtshare.pas
    end;
end;

end.

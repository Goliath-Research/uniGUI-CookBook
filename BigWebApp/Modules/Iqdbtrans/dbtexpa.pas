
{*******************************************************}
{                                                       }
{ Export data to a System Connection (Alias)            }
{                                                       }
{*******************************************************}


unit dbtexpa;

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
  uniGUIApplication,
  ExtCtrls,
  Db,
  IQMS.DBTrans.dbttypes,
  ADODB,
  SqlExpr,
  DBClient,
  IQMS.WebVcl.DBExpress,
  ComCtrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniLabel,
  uniProgressBar, uniMainMenu, uniPanel;

type
  TFrmDBTransExportAlias = class(TFrmDBTransHidden)
    lblPrompt: TUniLabel;
    TargetSQLConnection: TSQLConnection;
    ProgressBar1: TUniProgressBar;
    TargetADOConnection: TADOConnection;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FUserName: String;
    FTableName: String;
    FDatabaseName: String;
    FPassword: String;
    FDataSourceType: TDataSourceType;
    FDriverType: TDriverType;
    function InitializeSQLConnection: Boolean;
    function InitializeADOConnection: Boolean;
    function DoProcessOracle: Boolean;
    function DoProcessUsingDBExpress: Boolean;
    function DoProcessUsingADO: Boolean;

    procedure SetCaption;
  public
    { Public declarations }
    FAborted: Boolean;
    FMovedCount: Integer;
    FKeyViolations: Integer;
    constructor Create(
                       ADatabaseName,
                       ATableName,
                       AUserName,
                       APassword,
                       ATargetTableName: String;
                       ADataSourceType: TDataSourceType;
                       ADriverType: TDriverType;
                       ASourceDataSet: TDataSet);
    function DoProcessExec: Boolean; override; // pass table name inside MDB

    property SQLConnection;
    property SourceDataset;
    property Logging;
    property LogFile;
    property ErrorLogFile;

    property TableName: String read FTableName write FTableName;
    property DatabaseName: String read FDatabaseName write FDatabaseName;
    property TargetTableName;
    property DataSourceType: TDataSourceType read FDataSourceType write FDataSourceType;
    property DriverType: TDriverType read FDriverType write FDriverType; // for DSN
    property UserName: String read FUserName write FUserName;
    property Password: String read FPassword write FPassword;
    property ShowProgress;
    property ProgressMessage;
    property OnProgressEvent;
    property OnCheckProgressAbortedEvent;
  end;

var
  FrmDBTransExportAlias: TFrmDBTransExportAlias;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.ErrorDialog,
  IQMS.Common.Dialogs,
  IQMS.Common.ProgressDialog,
  IQMS.DBTrans.dbtado,
  dbtbatmv,
  IQMS.DBTrans.dbtdbexp,
  IQMS.DBTrans.dbtfields,
  dbtlogin,
  IQMS.DBTrans.dbtshare,
  IQMS.DBTrans.dbtrscstr;

{ TFrmDBTransExportAlias }

constructor TFrmDBTransExportAlias.Create(
  ADatabaseName, ATableName, AUserName, APassword,
  ATargetTableName: String; ADataSourceType: TDataSourceType;
  ADriverType: TDriverType; ASourceDataSet: TDataSet);
begin
  inherited Create(uniapplication);
  DatabaseName      := ADatabaseName   ;
  TableName         := ATableName      ;
  UserName          := AUserName       ;
  Password          := APassword       ;
  TargetTableName   := ATargetTableName;
  DataSourceType    := ADataSourceType ;
  DriverType        := ADriverType     ;
  SourceDataSet     := ASourceDataSet  ;
end;

procedure TFrmDBTransExportAlias.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

function TFrmDBTransExportAlias.InitializeSQLConnection: Boolean;
var
   ATmpUserName, ATmpPassword: String;

   function _TryConnect(AUserName, APassword: String): Boolean;
   var
      AErrorMsg: String;
   begin
     Result := InitConnection(TargetSQLConnection,
                              DatabaseName,
                              DataSourceType,
                              DriverType,
                              AUserName,
                              APassword,
                              AErrorMsg); // in IQMS.DBTrans.dbtdbexp.pas
     if not Result then
        IQError(IQMS.DBTrans.dbtrscstr.cTXT0000105 + // 'Connection failed.'
                #13#13 + AErrorMsg);
   end;

begin
  // Initialization
  FAborted := TRUE;
  Result := False;

  if DatabaseName = '' then
     // 'Application Error:  Database not supplied.'
     raise Exception.Create( IQMS.DBTrans.dbtrscstr.cTXT0000017);


  try
     if not (DataSourceType in [dstOracleAlias, dstDSN]) then
        raise Exception.Create('Application Error:  Invalid datasource type.');

     if (UserName = '') or not _TryConnect(UserName, Password) then
        repeat
          if GetLoginIn(ATmpUserName, ATmpPassword, IQMS.DBTrans.dbtrscstr.cTXT0000072) then // dbtlogin
             begin
               UserName := ATmpUserName;
               Password := ATmpPassword;
             end
          else
              SysUtils.Abort;

        until _TryConnect(UserName, Password);

     FAborted := False;
     Result := TargetSQLConnection.Connected;
     if Result then SetCaption;

  except on E:Exception do
    begin
     if E is EDatabaseError then
        IQError(IQMS.DBTrans.dbtrscstr.cTXT0000070) // 'Cannot connect to database'
     else IQError( E.Message );
     PostMessage( Handle, wm_Command, Exit1.Command, 0 );   // Call "Exit"
    end;
  end;
end;

function TFrmDBTransExportAlias.InitializeADOConnection: Boolean;
var
   ATmpUserName, ATmpPassword: String;

   function _TryConnect(AUserName, APassword: String): Boolean;
   var
      AErrorMsg: String;
   begin
     Result := IQMS.DBTrans.dbtado.InitConnection(
       TargetADOConnection,
       DatabaseName,
       dttDefault,
       AUserName,
       APassword,
       True, // ODBC
       AErrorMsg);
     if not Result then
        IQError(IQMS.DBTrans.dbtrscstr.cTXT0000105 + // 'Connection failed.'
                #13#13 + AErrorMsg);
{
     Result := False;
     try
        if TargetADOConnection.Connected then
           TargetADOConnection.Connected := False;

        IQMS.DBTrans.dbtado.ADO_ConfigureConnectionForODBC
          (TargetADOConnection,
           DatabaseName,
           AUserName,
           APassword);

        TargetADOConnection.Connected := True;
        Result := TargetADOConnection.Connected;
     except
        // 'Invalid user name or password.'
        IQMS.Common.Dialogs.IQError(IQMS.DBTrans.dbtrscstr.cTXT0000148);
     end; }
   end;

begin
  // Initialization
  FAborted := TRUE;
  Result := False;

  if DatabaseName = '' then
     // 'Application Error:  Database not supplied.'
     raise Exception.Create( IQMS.DBTrans.dbtrscstr.cTXT0000017);


  try
     if not (DataSourceType in [dstOracleAlias, dstDSN]) then
        raise Exception.Create('Application Error:  Invalid datasource type.');

     if (UserName = '') or not _TryConnect(UserName, Password) then
        repeat
          if GetLoginIn(ATmpUserName, ATmpPassword, IQMS.DBTrans.dbtrscstr.cTXT0000072) then // dbtlogin
             begin
               UserName := ATmpUserName;
               Password := ATmpPassword;
             end
          else
              SysUtils.Abort;

        until _TryConnect(UserName, Password);

     FAborted := False;
     Result := TargetADOConnection.Connected;
     if Result then SetCaption;

  except on E:Exception do
    begin
     if E is EDatabaseError then
        IQError(IQMS.DBTrans.dbtrscstr.cTXT0000070) // 'Cannot connect to database'
     else IQError( E.Message );
     PostMessage( Handle, wm_Command, Exit1.Command, 0 );   // Call "Exit"
    end;
  end;
end;

procedure TFrmDBTransExportAlias.SetCaption;
begin
  Caption := Format( IQMS.DBTrans.dbtrscstr.cTXT0000042 {'Export to %s'}, [DatabaseName] );
end;

function TFrmDBTransExportAlias.DoProcessExec: Boolean;
var
   AMode: TIQBatchMode;
begin
  Result := FALSE;
  AMode := iqbmCopy;
  if not (SourceDataset is TIQWebDbxCustomDataSet) then
     raise Exception.Create('Application Error:  Invalid data source type.  ' +
     'Source dataset must be TDbxCustomDataSet');

  // 'Exporting data to %s.  Please wait.'
  lblPrompt.Caption := Format( IQMS.DBTrans.dbtrscstr.cTXT0000043,
   [TableName] );
  Invalidate;

  try
     if (SourceDataset = NIL) then
        raise Exception.Create( IQMS.DBTrans.dbtrscstr.cTXT0000045 {'Application Error:  Source dataset not supplied.'} );
     if ( TableName = '' ) then
        raise Exception.Create( IQMS.DBTrans.dbtrscstr.cTXT0000044 {'Application Error:  Target table name not supplied.'} );

     if SourceDataset.Active then
        begin
          SourceDataset.Cancel;
          SourceDataset.Close;
        end;

     // Create the table if we are exporting to Oracle
     if DataSourceType = dstOracleAlias then
        Result := DoProcessOracle
     else
     case DriverType of
       dvOracle: Result := DoProcessOracle;
       dvAdaptiveServerAnywhere: Result := DoProcessUsingADO;
       dvDB2,
       dvIB,
       dvInformix,
       dvMicrosoftSQL,
       dvMySQL: Result := DoProcessUsingDBExpress;
     else
       raise Exception.Create('The selected database type is unsupported.');
     end;

     Result := TRUE;
     ModalResult := mrOk;

     // write to log file
     if Logging then
        begin
          if (TargetTableName > '') then
             WriteToLog(Format('Exported table, %s, to %s (table, %s).',
               [TableName, DatabaseName, TargetTableName]))
          else
             WriteToLog(Format('Exported table, %s, to %s.',
               [TableName, DatabaseName]));
        end;



  except on E:Exception do
    begin
         ShowIQErrorMessage( IQMS.DBTrans.dbtrscstr.cTXT0000081 {'Export Execution Error'}, E.Message, '' ); // IQMS.Common.ErrorDialog.pas
         ModalResult := mrCancel;
    end;
  end;
end;

function TFrmDBTransExportAlias.DoProcessOracle: Boolean;
var
   ASQL, AFieldList, AParamList: TStringList;
   ADestination: TSQLQuery;
   ATmpUserName, ATmpPassword: String;
   i, AMax: Integer;
   ADBLinkCreated, AAborted: Boolean;
   S: String;
   AStart, AEnd: TDateTime;

   procedure _DropDBLink;
   begin
     try
        // Drop the DBLink from local (source) IQMS database.
        IQMS.DBTrans.dbtdbexp.DBX_RunSQL(SQLConnection, 'DROP DATABASE LINK tmp_dbtrans_link');
     except
     end;
   end;

   function _CreateDBLink: Boolean;
   begin
     Result := False;
     try
        // Create the DBLink in local (source) IQMS database.
        IQMS.DBTrans.dbtdbexp.DBX_RunSQLFmt(SQLConnection,
          'CREATE DATABASE LINK tmp_dbtrans_link'#13 +
          '  CONNECT TO %s IDENTIFIED BY %s'#13 +
          '  USING ''%s'' ',
          [UserName, Password, DatabaseName]);
        Result := True;
      except
         {raise Exception.Create('Cannot create link to target database. '#13#13 +
          'Ensure your Oracle user profile has been assigned the CREATE DATABASE LINK ' +
          'privilege in local database, and the CREATE SESSION privilege in ' +
          'the remote database.');}
      end;
   end;

begin
  // Initialization
  Result := False;
  ASQL := NIL;
  AFieldList := NIL;
  AParamList := NIL;
  ADestination := NIL;
  ATmpUserName := '';
  ATmpPassword := '';
  ADBLinkCreated := False;
  AAborted := False;

  try
     ASQL := TStringList.Create;
     AFieldList := TStringList.Create;
     AParamList := TStringList.Create;

     if not InitializeSQLConnection then
        Exit;

     // Drop the old DBLink
     _DropDBLink;

     // Create the DBLink
     { NOTE:  Requires CREATE DATABASE LINK privilege in local database,
              and the CREATE SESSION privelege in the remote database. }
     ADBLinkCreated := _CreateDBLink;

     AMax := Self.GetRecordCount;

     // Get the target table definition.
     if not GetOracleCreateTableSQL(SourceDataset,
                                    TargetTableName,
                                    False,
                                    ASQL) then
        Exit;

     GetFieldListFromDataSet(SourceDataset, AFieldList);

     if (AFieldList.Count = 0) then
        raise Exception.Create('Application Error:  No fields found in source dataset.');

     // Get param list
     IQMS.DBTrans.dbtfields.FieldListAsParamList(AFieldList, AParamList);

     // Prompt user if we need to drop the table
     if IQMS.DBTrans.dbtshare.IQTableExists(TargetSQLConnection, TargetTableName) and
        not SuppressPrompts and
        // 'The table, %s, already exists.  Do you wish to replace it?'
        not IQConfirmYN(Format(IQMS.DBTrans.dbtrscstr.cTXT0000200, [TargetTableName])) then
        Exit;

     ProgressBar1.Max := AMax;
     lblPrompt.Caption := ProgressMessage;

     if Assigned(OnProgressEvent) then
        OnProgressEvent(AMax, 0, ProgressMessage);

     // Create the new table in the target Oracle instance.
     IQMS.DBTrans.dbtshare.DropTable(TargetSQLConnection, TargetTableName);
     IQMS.DBTrans.dbtdbexp.DBX_RunSQL(TargetSQLConnection, ASQL.Text);

     // If we created a dblink, then we do not need this connection anymore.
     // We want to eliminate needless connections as much as possible. 
     if ADBLinkCreated then
        TargetSQLConnection.Connected := False;

     // Create query and assign SQL
     ADestination := TSQLQuery.Create(NIL);
     if ADBLinkCreated then
        begin
          ADestination.SQLConnection := SQLConnection;;
          ADestination.SQL.Add(Format('INSERT INTO %s@tmp_dbtrans_link',
            [LowerCase(TargetTableName)]));
        end
     else
        begin
          ADestination.SQLConnection := TargetSQLConnection;
          ADestination.SQL.Add(Format('INSERT INTO %s',
            [LowerCase(TargetTableName)]));
        end;
     ADestination.SQL.Add('(');
     ADestination.SQL.Add(LowerCase(AFieldList.CommaText));
     ADestination.SQL.Add(')');
     ADestination.SQL.Add('VALUES');
     ADestination.SQL.Add('(');
     ADestination.SQL.Add(LowerCase(AParamList.CommaText));
     ADestination.SQL.Add(')');

     for i := 0 to ADestination.Params.Count - 1 do
        ADestination.Params.Items[i].ParamType := ptInput;

     // Append records from the current instance to the target instance.
     if not SourceDataset.Active then SourceDataset.Open;
     SourceDataset.First;
     while not SourceDataset.EOF do
      begin
        // Check to see if user pressed Cancel button
        if Assigned(OnCheckProgressAbortedEvent) and
           OnCheckProgressAbortedEvent then
           begin
             AAborted := True;
             Break;
           end;

        // Assign params
        DBX_FillParams(SourceDataset, ADestination.Params); // IQMS.DBTrans.dbtdbexp.pas
        if Logging then
           IQMS.DBTrans.dbtshare.GetParsedSQL(SourceDataset, ADestination.Params, ADestination.SQL, S);
        // Execute
        try
           try
              AStart := Now;
              AEnd := AStart;
              ADestination.ExecSQL;
              AEnd := Now;
           finally
             if Logging then
                WriteToLog(S + #13#10 + IQMS.DBTrans.dbtshare.StartEndText(AStart,AEnd));
           end;
        except on E: Exception do
          begin
            if Logging then
               WriteToErrorLog(E.Message);
            raise;
          end;
        end;
        // Next record
        SourceDataset.Next;

        // Step progress bar
        ProgressBar1.Position:=ProgressBar1.Position+1;

        if Assigned(OnProgressEvent) then
           OnProgressEvent(AMax, ProgressBar1.Position, ProgressMessage);
      end;

     Result := not AAborted;

  finally
     _DropDBLink;
     if Assigned(ASQL) then FreeAndNil(ASQL);
     if Assigned(AFieldList) then FreeAndNil(AFieldList);
     if Assigned(AParamList) then FreeAndNil(AParamList);
     if Assigned(ADestination) then FreeAndNil(ADestination);
  end;
end;

function TFrmDBTransExportAlias.DoProcessUsingDBExpress: Boolean;
var
   ASQL, AFieldList, AParamList: TStringList;
   ADestination: TSQLQuery;
   ATmpUserName, ATmpPassword: String;
   i, AMax: Integer;
   ADBLinkCreated: Boolean;
   S: String;
   AStart, AEnd: TDateTime;

   procedure _DropTable;
   begin
     try
        IQMS.DBTrans.dbtdbexp.DBX_RunSQLFmt(TargetSQLConnection, 'DROP TABLE %s', [TargetTableName]);
     except
     end;
   end;

   function _TableExists: Boolean;
   begin
     try
        IQMS.DBTrans.dbtdbexp.DBX_GetValIntFmt(TargetSQLConnection, 'SELECT 1 FROM %s', [TargetTableName])
     except
        Result := False;
     end;
   end;

begin
  // Initialization
  Result := False;
  ASQL := NIL;
  AFieldList := NIL;
  AParamList := NIL;
  ADestination := NIL;
  ATmpUserName := '';
  ATmpPassword := '';

  try
     ASQL := TStringList.Create;
     AFieldList := TStringList.Create;
     AParamList := TStringList.Create;

     if not InitializeSQLConnection then
        Exit;

     AMax := Self.GetRecordCount;

     // Get the target table definition.
     case DriverType of
       dvDB2:
         if not IQMS.DBTrans.dbtshare.GetDB2CreateTableSQL(
            SourceDataset,
            TargetTableName,
            ASQL) then
            Exit;
       dvIB:
         if not IQMS.DBTrans.dbtshare.GetInterbaseCreateTableSQL(
            SourceDataset,
            TargetTableName,
            ASQL) then
            Exit;
       dvInformix:
         if not IQMS.DBTrans.dbtshare.GetInformixCreateTableSQL(
            SourceDataset,
            TargetTableName,
            ASQL) then
            Exit;
       dvMicrosoftSQL:
         if not IQMS.DBTrans.dbtshare.GetSQLServerCreateTableSQL(
            SourceDataset,
            TargetTableName,
            ASQL) then
            Exit;
       dvMySQL:
         if not IQMS.DBTrans.dbtshare.GetMySQLCreateTableSQL(
            SourceDataset,
            TargetTableName,
            ASQL) then
            Exit;
     else
       raise Exception.Create('The selected database type is unsupported.');
     end;

     GetFieldListFromDataSet(SourceDataset, AFieldList);

     if (AFieldList.Count = 0) then
        raise Exception.Create('Application Error:  No fields found in source dataset.');

     // Get param list
     IQMS.DBTrans.dbtfields.FieldListAsParamList(AFieldList, AParamList);

     // Prompt user if we need to drop the table
     if _TableExists and
        not SuppressPrompts and
        // 'The table, %s, already exists.  Do you wish to replace it?'
        not IQConfirmYN(Format(IQMS.DBTrans.dbtrscstr.cTXT0000200, [TargetTableName])) then
        Exit;

     ProgressBar1.Max := AMax;
     lblPrompt.Caption := ProgressMessage;
     
     // Create the new table in the target Oracle instance.
     _DropTable;
     IQMS.DBTrans.dbtdbexp.DBX_RunSQL(TargetSQLConnection, ASQL.Text);

     // Create query and assign SQL
     ADestination := TSQLQuery.Create(NIL);
     ADestination.SQLConnection := TargetSQLConnection;
     ADestination.SQL.Add(Format('INSERT INTO %s',
       [LowerCase(TargetTableName)]));
     ADestination.SQL.Add('(');
     ADestination.SQL.Add(LowerCase(AFieldList.CommaText));
     ADestination.SQL.Add(')');
     ADestination.SQL.Add('VALUES');
     ADestination.SQL.Add('(');
     ADestination.SQL.Add(LowerCase(AParamList.CommaText));
     ADestination.SQL.Add(')');

     for i := 0 to ADestination.Params.Count - 1 do
        ADestination.Params.Items[i].ParamType := ptInput;

     // Append records from the current instance to the target instance.
     if not SourceDataset.Active then SourceDataset.Open;
     SourceDataset.First;
     while not SourceDataset.EOF do
      begin
        // Check to see if user pressed Cancel button
        //if Assigned(hPrg) and hPrg.CheckProgressAborted then
        //   Break;
        // Assign params
        DBX_FillParams(SourceDataset, ADestination.Params); // IQMS.DBTrans.dbtdbexp.pas
        if Logging then
           IQMS.DBTrans.dbtshare.GetParsedSQL(SourceDataset, ADestination.Params, ADestination.SQL, S);
        // Execute
        try
           try
              AStart := Now;
              AEnd := AStart;
              ADestination.ExecSQL;
              AEnd := Now;
           finally
             if Logging then
                WriteToLog(S + #13#10 + IQMS.DBTrans.dbtshare.StartEndText(AStart,AEnd));
           end;
        except on E: Exception do
          begin
            if Logging then
               WriteToErrorLog(E.Message);
            raise;
          end;
        end;
        // Next record
        SourceDataset.Next;
        // Step progress bar
        ProgressBar1.Position:=ProgressBar1.Position+1;
      end;

     Result := True;

  finally
     if Assigned(ASQL) then FreeAndNil(ASQL);
     if Assigned(AFieldList) then FreeAndNil(AFieldList);
     if Assigned(AParamList) then FreeAndNil(AParamList);
     if Assigned(ADestination) then FreeAndNil(ADestination);
  end;
end;

function TFrmDBTransExportAlias.DoProcessUsingADO: Boolean;
var
   ASQL, AFieldList, AParamList: TStringList;
   ADestination: TADOQuery;
   ATmpUserName, ATmpPassword: String;
   hPrg: TIQWebProgressDialog; // IQMS.Common.ProgressDialog.pas
   i, AMax: Integer;
   S: String;
   AStart, AEnd: TDateTime;

   procedure _DropTable;
   begin
     try
        IQMS.DBTrans.dbtado.ADO_RunSQLFmt(TargetADOConnection, 'DROP TABLE %s', [TargetTableName]);
     except
     end;
   end;

   function _TableExists: Boolean;
   begin
     try
        IQMS.DBTrans.dbtado.ADO_GetValIntFmt(TargetADOConnection, 'SELECT 1 FROM %s', [TargetTableName])
     except
        Result := False;
     end;
   end;

begin
  { This is the generic ODBC connection.  This method is confirmed to
    work with the following database types:

     Cafe Adaptive Server Anywhere  (dvAdaptiveServerAnywhere)


  }

  // Initialization
  Result := False;
  ASQL := NIL;
  AFieldList := NIL;
  AParamList := NIL;
  ADestination := NIL;
  ATmpUserName := '';
  ATmpPassword := '';
  hPrg := NIL;

  // Hide the form
  Self.Hide;

  try
     ASQL := TStringList.Create;
     AFieldList := TStringList.Create;
     AParamList := TStringList.Create;

     if not InitializeADOConnection then
        Exit;

     AMax := Self.GetRecordCount;

     // Get the target table definition.
     case DriverType of
      dvDB2: Exit;
      dvIB: Exit;
      dvInformix: Exit;
      dvAdaptiveServerAnywhere:
        if not IQMS.DBTrans.dbtshare.GetSQLServerCreateTableSQL(
           SourceDataset,
           TargetTableName,
           ASQL) then
        Exit;
      dvMySQL: Exit;
     else
        raise Exception.Create('Target database is an unsupported format.');
     end; // end case

     GetFieldListFromDataSet(SourceDataset, AFieldList);

     if (AFieldList.Count = 0) then
        raise Exception.Create('Application Error:  No fields found in source dataset.');

     // Get param list
     IQMS.DBTrans.dbtfields.FieldListAsParamList(AFieldList, AParamList);

     // Prompt user if we need to drop the table
     //if IQMS.DBTrans.dbtshare.IQTableExists(TargetSQLConnection, TargetTableName) and
     if _TableExists and
        not SuppressPrompts and
        // 'The table, %s, already exists.  Do you wish to replace it?'
        not IQConfirmYN(Format(IQMS.DBTrans.dbtrscstr.cTXT0000200, [TargetTableName])) then
        Exit;

     // Display the progress bar
     hPrg := hProgressDlg( AMax {Max Value},
             'Exporting...' {Status Text});

     // Create the new table in the target Oracle instance.
     _DropTable;
     IQMS.DBTrans.dbtado.ADO_RunSQL(TargetADOConnection, ASQL.Text);

     // Create query and assign SQL
     ADestination := TADOQuery.Create(NIL);
     ADestination.Connection := TargetADOConnection;
     ADestination.SQL.Add(Format('INSERT INTO %s',
       [LowerCase(TargetTableName)]));
     ADestination.SQL.Add('(');
     ADestination.SQL.Add(LowerCase(AFieldList.CommaText));
     ADestination.SQL.Add(')');
     ADestination.SQL.Add('VALUES');
     ADestination.SQL.Add('(');
     ADestination.SQL.Add(LowerCase(AParamList.CommaText));
     ADestination.SQL.Add(')');

     for i := 0 to ADestination.Parameters.Count - 1 do
        ADestination.Parameters.Items[i].Direction := pdInput;

     // Append records from the current instance to the target instance.
     if not SourceDataset.Active then SourceDataset.Open;
     SourceDataset.First;
     while not SourceDataset.EOF do
      begin
        // Check to see if user pressed Cancel button
        if Assigned(hPrg) and hPrg.CheckProgressAborted then
           Break;
        // Assign params
        ADO_FillParams(SourceDataset, ADestination.Parameters); // IQMS.DBTrans.dbtado.pas
        if Logging then
           IQMS.DBTrans.dbtshare.GetParsedSQL(SourceDataset, ADestination.Parameters, ADestination.SQL, S);
        // Execute
        try
           try
              AStart := Now;
              AEnd := AStart;
              ADestination.ExecSQL;
              AEnd := Now;
           finally
             if Logging then
                WriteToLog(S + #13#10 + IQMS.DBTrans.dbtshare.StartEndText(AStart,AEnd));
           end;
        except on E: Exception do
          begin
            if Logging then
               WriteToErrorLog(E.Message);
            raise;
          end;
        end;
        // Next record
        SourceDataset.Next;
        // Step progress bar
        if Assigned(hPrg) then
           hPrg.StepProgress;
      end;

     Result := True;

  finally
     if Assigned(ASQL) then FreeAndNil(ASQL);
     if Assigned(AFieldList) then FreeAndNil(AFieldList);
     if Assigned(AParamList) then FreeAndNil(AParamList);
     if Assigned(ADestination) then FreeAndNil(ADestination);
     if Assigned(hPrg) then FreeAndNil(hPrg);
  end;
end;

end.

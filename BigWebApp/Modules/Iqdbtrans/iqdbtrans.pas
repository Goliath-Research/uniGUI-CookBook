(* ******************************************************************************

  IQ Database Transfer -- Main Unit for importing/exporting

  Reference this unit and its methods for importing and exporting.
  Do not call helper or subroutines directly.

  This unit provides a user-friendly interface to import and export data.
  It was inspired by the import and export screens in Microsoft applications,
  which users have come to expect and associate with data transfer.

  Exporting Data:
  When exporting, you provide the dataset.  Users export data to a format
  of choice.  Invisible fields are ignored.

  Importing Data:
  When importing, you must provide the name of a target, Oracle table
  that will be created at runtime. Users select an external source table,
  which will be imported into the target table.  You can then use PL-SQL to
  query the data in the target table, and provide additional import
  options.

  ***************************************************************************** *)

unit iqdbtrans;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  uniGUIApplication,
  Forms,
  Dialogs,
  ExtCtrls,
  StdCtrls,
  Buttons,
  dbthiddn,
  IQMS.Common.JumpConstants,
  Menus,
  IQMS.WebVcl.About,
  DB,
  SqlExpr,
  DBClient,
  IQMS.DBTrans.dbtdb,
  IQMS.DBTrans.dbttypes,
  dbtclass,
//  dbtsel,
  dbtemptables,
  dbtdbg;

(*
  *   ** Debug Data at Runtime **
  *
  *   Displays data for a one or more datasets during runtime.  Used for
  *   debugging data-related issues.
  *
*)
function ShowData(const ADataSets: array of TDataSet;
  AModal: Boolean = False): TFrmDBTransDebug;
procedure ShowDataFor(ADataSet: TDataSet); // simplified form

(* *** Function DoIQDBTransImport ***
  *  Purpose:  Import data from supported data sources into a temporary table.
  *
  *  ATargetTableName:
  Pass the name of the temporary table that should hold the
  *     imported data. You may use the function GetTempTableName in
  *     this unit to return a unique temporary table name.
  *     IMPORTANT:  You must provide a table name into which the data will
  *     be imported.  You can then apply PL-SQL against the temporary table
  *     and import the data in a controlled fashion.
  *
  *  Function Result:  Returns TRUE if succesful.
*)
function DoIQDBTransImport(const AOwner: TComponent;
  const ATargetTableName: string; const AImportMessage: string = '';
  const AIsTemporaryTable: Boolean = True): Boolean;
// Returns user selections (show)
function DoIQDBTransImportA(const AOwner: TComponent;
  const ATargetTableName: string; const AImportMessage: string;
  const AIsTemporaryTable: Boolean;
  var ATransferOptions: TTransferOptions): Boolean;
// Takes settings, but returns user name and password, if changed. (execute)
function DoIQDBTransImportB(const AOwner: TComponent;
  var ATransferOptions: TTransferOptions;
  const AExecute: Boolean = True): Boolean;

(* *** Import Using a Configuration ***

  This is by far the easiest way to get and set import settings.

  DoIQDBTransImportShow takes initial parameters, and then
  returns a configuration in XML format.
  DoIQDBTransImportExecute takes a configuration, applies it
  internally, and executes the import.  It also returns back
  the configuration in case the user was prompted for a
  user name and password.

  The only thing you, the programmer, need do is save the configuration
  to the database somewhere.
*)
function DoIQDBTransImportShow(const AOwner: TComponent;
  const ASQLConnection: TSQLConnection; const ASourceTableName: string;
  const ATargetTableName: string; const AProgressMessage: string;
  const AIsTemporaryTable: Boolean; var AConfiguration: TStringList;
  var ATransferOptions: TTransferOptions): Boolean;

// This will execute an import configuration.
function DoIQDBTransImportExecute(const AOwner: TComponent;
  const ASQLConnection: TSQLConnection; const ALogging: Boolean;
  const ALogFile: string; const AErrorLogFile: string;
  const ASuppressPrompts: Boolean; const AShowProgress: Boolean;
  var AConfiguration: TStringList; var ANewUserName: string;
  var ANewPassword: string; const AOnProgressEvent: TOnProgressEvent = nil;
  const AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent = nil)
  : Boolean;

{ Shared methods used for before and after the import. }
function GetTempTableName: string;
procedure DropTempTablesForSession;
// drops the temp tables created during this session

(*
  * Import from a Microsoft Access database table:
  *
  *  ADatabase:  The path and file name to the MDB or MDE.
  *
  *  ATableName: The name of the table in the database.
  *
  *  AUserName, APassword: User name and password are optional, but they are
  *     required if the database is password protected.  If you pass these
  *     values then, a .MDW file is also required and must have the same name
  *     and path as the .MDB or .MDE.
  *
  *  ATargetTableName:  The temporary table that will receive the records.
  *
  *  ARunBeforeImport:  An event to execute just before importing records.
  *
*)
function ImportMSAccessTable(const AOwner: TComponent;
  const ADatabase, ATableName, AUserName, APassword, ATargetTableName: string;
  ARunBeforeImport: TNotifyEvent): Boolean;

(* ** Prompt user for values and export **
  *
  *  Supplied Parameters:
  *
  *    ASource:  Pass the name of the TDataSet object which holds
  *              the IQMS data to be exported.
  *
  *    AExportMessage:  The message you want displayed as data is exported.
  *
  *  Returned Parameters:
  *
  *    ATargetDatabase:  The name of either the ODBC DSN or the flat file.
  *
  *    ATargetTableName:  The name of the new table, if the database is
  *       MS Access or an alias.  An empty string for flat files.
  *
  *  Function Result: Returns TRUE if successful.
  *
*)
function DoIQDBTransExportA(const AOwner: TComponent; const ASource: TDataSet;
  var ATargetDatabase: string; var ATargetTableName: string;
  AExportMessage: string = ''): Boolean;

(*
  *
  * Essential Parameters:
  *
  *   ASource:  Pass the name of the TDataSet object which holds the IQMS
  *             data to be exported.
  *
  *   ATransferOptions:  The record object, ATransferOptions, which is
  *     declared in dbttypes.pas.  You must supply all relevant values.
  *
  *   AExecuteImmediate: Applies to text files, which normally require additional
  *     configuration.  If AExecuteImmediate is True and a schema file exists,
  *     then the export will attempt to run with the latest schema file.
  *
  * Function Result: Returns TRUE if successful.
  *
*)
function DoIQDBTransExportB(const AOwner: TComponent; const ASource: TDataSet;
  const ATransferOptions: TTransferOptions;
  AExecuteImmediate: Boolean = False): Boolean;

function DoIQDBTransExportShow(const AOwner: TComponent;
  const ASQLConnection: TSQLConnection; const ASource: TDataSet;
  const ASourceTableName: string; const ATargetTableName: string;
  const ALogging: Boolean; const ALogFile: string; const AErrorLogFile: string;
  const AProgressMessage: string; var AConfiguration: TStringList): Boolean;
function DoIQDBTransExportExecuteA(const AOwner: TComponent;
  const ASQLConnection: TSQLConnection; const ASource: TDataSet;
  const ASourceTableName: string; const ADatabaseName: string;
  const ATargetTableName: string; const ATableType: TCustomTableType;
  const ADataSourceType: TDataSourceType; const ADriverType: TDriverType;
  const AUserName: string; const APassword: string; const ALogging: Boolean;
  const ALogFile: string; const AErrorLogFile: string;
  const ASuppressPrompts: Boolean; const AProgressMessage: string;
  const AShowProgress: Boolean; var AConfiguration: TStringList;
  const AOnProgressEvent: TOnProgressEvent = nil;
  const AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent = nil)
  : Boolean;

// This will execute an export configuration.
function DoIQDBTransExportExecuteB(const AOwner: TComponent;
  const ASQLConnection: TSQLConnection; const ASource: TDataSet;
  const ALogging: Boolean; const ALogFile: string; const AErrorLogFile: string;
  const ASuppressPrompts: Boolean; const AShowProgress: Boolean;
  var AConfiguration: TStringList;
  const AOnProgressEvent: TOnProgressEvent = nil;
  const AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent = nil)
  : Boolean;

// Converts a TTransferOptions to an XML configuration (TStringList).
// This method was added for Data Exchange Administrator.  The old
// files needed to be converted to the new format.
procedure ConvertRecToConfig(const ATransferOptions: TTransferOptions;
  var AConfiguration: TStringList);
function ConvertConfigToRec(const AConfiguration: TStringList;
  var ATransferOptions: TTransferOptions): Boolean;

procedure GetConfigurationFieldMap(const AConfiguration: TStringList; AFieldMap: TFieldMap);
procedure GetConfigurationFieldMapAs(const AConfiguration: TStringList;
  AFieldMapList: TStringList); overload;
procedure GetConfigurationFieldMapAs(const AConfiguration: TStringList;
  var AFieldMapText: string); overload;


implementation

uses
  dbtcommon,
  IQMS.DBTrans.dbtrscstr,
  dbtimptx,
  dbtimpm,
  dbtimpa,
  dbtimpdb,
  dbtimpx,
  dbtimxml,
  IQMS.DBTrans.dbtshare,
  dbtexp,
  dbtschma,
  IQMS.Common.ApplicationSet,
  IQMS.Common.Dates,
  IQMS.Common.FileUtils,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils;

function DoIQDBTransImport(const AOwner: TComponent;
  const ATargetTableName: string; const AImportMessage: string;
  const AIsTemporaryTable: Boolean): Boolean;
var
  ATransferOptions: TTransferOptions;
begin
  // Calls extended import method, although the var params are never returned
  Result := DoIQDBTransImportA(AOwner, ATargetTableName, AImportMessage,
    AIsTemporaryTable, ATransferOptions); // in this unit, see below
end;

{ Import:  Returns users selections }
function DoIQDBTransImportA(const AOwner: TComponent;
  const ATargetTableName: string; const AImportMessage: string;
  const AIsTemporaryTable: Boolean;
  var ATransferOptions: TTransferOptions): Boolean;
var
  ARec: TSelectedDatabase;
begin
  Result := False;

  if not IQMS.Common.Miscellaneous.EnsureConnectionExists then
    // 'You are not logged in.  You must be logged ' +
    // 'into an IQMS database to proceed.'
    raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000205);

  // Application initialization
  IQCalculateTimeZoneDiff; // iqdate

  // Clear record objects
  ClearSelectedDatabaseRec(ARec); // dbtsel.pas
  IQMS.DBTrans.dbttypes.PrepareTransferOptions(ATransferOptions);
  // dbttypes; initializes the record object

  ATransferOptions.Operation := otImport; // assign operation first
  ATransferOptions.ProgressMessage := AImportMessage;
  ATransferOptions.TargetTableName := ATargetTableName;
  ATransferOptions.ImportIntoTargetTable := True;
  ATransferOptions.TargetTableIsTemporary := AIsTemporaryTable;
  // temporary table

  // Select the source database (alias or flat file)
//  if DoSelectDatabaseForImport(ARec) then // dbtsel.pas
//    begin
//      // We never import directly into one of our standard tables.
//      // We import the data to a temporary table, which is then processed
//      // by the calling form.
//      ATransferOptions.DatabaseName := ARec.DatabaseName;
//      ATransferOptions.TargetTableName := ATargetTableName;
//      ATransferOptions.CustomTableType := ARec.CustomTableType;
//    end
//  else
//    Exit;

  ATransferOptions.DataSourceType := ARec.DataSourceType;

  // If we don't have a temporary table name assigned, then something
  // went wrong before this point.
  if Trim(ATransferOptions.TargetTableName) = '' then
    Exit;

  Result := DoIQDBTransImportB(AOwner, ATransferOptions, False);

end;

{ Import: Takes users previous selections }
function DoIQDBTransImportB(const AOwner: TComponent;
  var ATransferOptions: TTransferOptions; const AExecute: Boolean): Boolean;
begin
  Result := False; // initial

  if not IQMS.Common.Miscellaneous.EnsureConnectionExists then
    // 'You are not logged in.  You must be logged ' +
    // 'into an IQMS database to proceed.'
    raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000205);

  try
    dbtcommon.PrepareSQLConnection;
    // Application initialization
    IQCalculateTimeZoneDiff; // iqdate

    // NOTE:  Why use TCustomTableType?  We cannot accurately determine the type
    // of data file the user has selected based only on the file extension.
    // FoxPro for instance has the same file extension as a DBase file,
    // but they are very different.  We have to know quickly and accurately
    // what kind of file the user has selected.
    case ATransferOptions.DataSourceType of
      dstDSN, dstOracleAlias: // == Import from DSN or Alias ==
        begin
          with TSystemImport.Create(AOwner) do
            try
              SQLConnection := dbtcommon.SQLConnection;
              DataSourceType := ATransferOptions.DataSourceType;
              DatabaseName := ATransferOptions.DatabaseName;
              SourceTableName := ATransferOptions.SourceTableName;
              UserName := ATransferOptions.UserName;
              Password := ATransferOptions.Password;
              ProgressMessage := ATransferOptions.ProgressMessage;
              Logging := ATransferOptions.Logging;
              LogFile := ATransferOptions.LogFile;
              ErrorLogFile := ATransferOptions.ErrorLogFile;
              SuppressPrompts := False;
              ImportIntoTargetTable := ATransferOptions.ImportIntoTargetTable;
              TargetTableName := ATransferOptions.TargetTableName;
              ShowProgress := True;
              if AExecute then
                Result := Execute
              else
                Result := Show;
              // If OK, then fill return values
              if Result then
                begin
                  ATransferOptions.SourceTableName := SourceTableName;
                  ATransferOptions.TargetTableName := TargetTableName;
                  ATransferOptions.UserName := UserName;
                  ATransferOptions.Password := Password;
                end;
            finally
              Free;
            end;
        end; // end begin
      dstFile: // == Import from file ==
        begin
          // Ensure we have a file by this point
          if not FileExists(ATransferOptions.DatabaseName) then
            Exit;

          case ATransferOptions.CustomTableType of
            // == Import a text file == //
            dttASCII, dttMSExcel:
              begin
                with TTextFileImport.Create(AOwner) do
                  try
                    SQLConnection := dbtcommon.SQLConnection;
                    DatabaseName := ATransferOptions.DatabaseName;
                    TableType := ATransferOptions.CustomTableType;
                    Logging := ATransferOptions.Logging;
                    LogFile := ATransferOptions.LogFile;
                    ErrorLogFile := ATransferOptions.ErrorLogFile;
                    ImportIntoTargetTable :=
                      ATransferOptions.ImportIntoTargetTable;
                    TargetTableName := ATransferOptions.TargetTableName;
                    TargetTableIsTemporary :=
                      ATransferOptions.TargetTableIsTemporary;
                    FirstRowHasNames :=
                      (ATransferOptions.TextFileOptions and
                      tfoFirstRowHasNames = tfoFirstRowHasNames);
                    AutoFieldType := (ATransferOptions.TextFileOptions and
                      tfoAutoFieldType = tfoAutoFieldType); // Excel only
                    ProgressMessage := ATransferOptions.ProgressMessage;
                    SuppressPrompts := ATransferOptions.SuppressPrompts;
                    SchemaText := ATransferOptions.TextFileSchema;
                    ShowProgress := True;
                    if AExecute then
                      Result := Execute
                    else
                      Result := Show;
                    if Result then
                      begin
                        ATransferOptions.TextFileOptions := tfoNone;
                        if FirstRowHasNames then
                          ATransferOptions.TextFileOptions :=
                            ATransferOptions.TextFileOptions +
                            tfoFirstRowHasNames;
                        ATransferOptions.ImportIntoTargetTable :=
                          ImportIntoTargetTable;
                        ATransferOptions.TargetTableName := TargetTableName;
                        ATransferOptions.TextFileSchema := SchemaText;
                      end;
                  finally
                    Free;
                  end;
              end;
            // == Import a DBF or DB file == //
            dttParadox, dttDBase, dttFoxPro, dttMSAccess, dttXML:
              begin
                with TFileImport.Create(AOwner) do
                  try
                    SQLConnection := dbtcommon.SQLConnection;
                    DatabaseName := ATransferOptions.DatabaseName;
                    SourceTableName := ATransferOptions.SourceTableName;
                    Logging := ATransferOptions.Logging;
                    LogFile := ATransferOptions.LogFile;
                    ErrorLogFile := ATransferOptions.ErrorLogFile;
                    ImportIntoTargetTable :=
                      ATransferOptions.ImportIntoTargetTable;
                    TargetTableName := ATransferOptions.TargetTableName;
                    TableType := ATransferOptions.CustomTableType;
                    ProgressMessage := ATransferOptions.ProgressMessage;
                    UserName := ATransferOptions.UserName;
                    Password := ATransferOptions.Password;
                    ShowProgress := True;
                    if AExecute then
                      Result := Execute
                    else
                      Result := Show;
                    if Result then
                      begin
                        ATransferOptions.SourceTableName := SourceTableName;
                        ATransferOptions.UserName := UserName;
                        ATransferOptions.Password := Password;
                        ATransferOptions.ImportIntoTargetTable :=
                          ImportIntoTargetTable;
                        ATransferOptions.TargetTableName := TargetTableName;
                      end;
                  finally
                    Free;
                  end;
              end;
          end; // end case
        end; // end begin
    end; // end case
  finally
    dbtcommon.FreeSQLConnection;
  end;
end;

function DoIQDBTransImportShow(const AOwner: TComponent;
  const ASQLConnection: TSQLConnection; const ASourceTableName: string;
  const ATargetTableName: string; const AProgressMessage: string;
  const AIsTemporaryTable: Boolean; var AConfiguration: TStringList;
  var ATransferOptions: TTransferOptions): Boolean;
var
  ADatabaseName: string;
  ATableType: TCustomTableType;
  ADataSourceType: TDataSourceType;
  ARec: TSelectedDatabase; // in IQMS.DBTrans.dbttypes.pas
begin
  Result := False;

  if not Assigned(ASQLConnection) then
    raise Exception.Create('Application Error: SQL Connection not provided.');

  if not IQMS.Common.Miscellaneous.EnsureConnectionExists then
    // 'You are not logged in.  You must be logged ' +
    // 'into an IQMS database to proceed.'
    raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000205);

  if not Assigned(AConfiguration) then
    Exit;
  IQMS.DBTrans.dbttypes.PrepareTransferOptions(ATransferOptions);

  // If we don't have a temporary table name assigned, then something
  // went wrong before this point.
  if Trim(ATargetTableName) = '' then
    Exit;

  // Application initialization
  IQCalculateTimeZoneDiff; // iqdate

  // Clear record objects
  ClearSelectedDatabaseRec(ARec); // dbtsel.pas
  // Select the source database (alias or flat file)
//  if DoSelectDatabaseForImport(ARec) then // dbtsel.pas
//    begin
//      // We never import directly into one of our standard tables.
//      // We import the data to a temporary table, which is then processed
//      // by the calling form.
//      case ARec.DataSourceType of
//        dstDSN, dstOracleAlias:
//          ADatabaseName := ARec.DatabaseName; // ODBC DSN
//        dstFile:
//          ADatabaseName := ARec.DatabaseName; // File
//      end;
//      ATableType := ARec.CustomTableType;
//      ADataSourceType := ARec.DataSourceType;
//    end
//  else
//    Exit;

  case ADataSourceType of
    dstDSN, dstOracleAlias: // == Import from DSN or Alias ==
      begin
        with TSystemImport.Create(AOwner) do
          try
            SQLConnection := ASQLConnection;
            SourceTableName := ASourceTableName;
            DataSourceType := ADataSourceType;
            DatabaseName := ADatabaseName;
            ImportIntoTargetTable := True;
            TargetTableName := ATargetTableName;
            TargetTableIsTemporary := AIsTemporaryTable;
            ProgressMessage := AProgressMessage;
            ShowProgress := True;
            Result := Show;
            if Result then
              begin
                GetConfiguration(AConfiguration);
                // Populate the record
                ATransferOptions.Operation := otImport;
                ATransferOptions.DataSourceType := DataSourceType;
                ATransferOptions.DatabaseName := DatabaseName;
                ATransferOptions.SourceTableName := SourceTableName;
                ATransferOptions.ProgressMessage := ProgressMessage;
                ATransferOptions.UserName := UserName;
                ATransferOptions.Password := Password;
                ATransferOptions.TextFileOptions := tfoNone;
                ATransferOptions.Logging := Logging;
                ATransferOptions.LogFile := LogFile;
                ATransferOptions.ErrorLogFile := ErrorLogFile;
                ATransferOptions.SuppressPrompts := SuppressPrompts;
                ATransferOptions.TargetTableName := TargetTableName;
                ATransferOptions.ImportIntoTargetTable := ImportIntoTargetTable;
                ATransferOptions.TargetTableIsTemporary :=
                  TargetTableIsTemporary;
              end;
          finally
            Free;
          end;
      end; // end begin
    dstFile: // == Import from file ==
      begin
        // Ensure we have a file by this point
        if not FileExists(ADatabaseName) then
          Exit;

        case ATableType of
          // == Import a text file == //
          dttASCII, dttMSExcel:
            begin
              with TTextFileImport.Create(AOwner) do
                try
                  SQLConnection := ASQLConnection;
                  SourceTableName := ASourceTableName;
                  DataSourceType := ADataSourceType;
                  DatabaseName := ADatabaseName;
                  ImportIntoTargetTable := True;
                  TargetTableName := ATargetTableName;
                  TableType := ATableType;
                  TargetTableIsTemporary := AIsTemporaryTable;
                  ProgressMessage := AProgressMessage;
                  ShowProgress := True;
                  Result := Show;
                  if Result then
                    begin
                      GetConfiguration(AConfiguration);
                      // Populate the record
                      ATransferOptions.Operation := otImport;
                      ATransferOptions.DataSourceType := DataSourceType;
                      ATransferOptions.DatabaseName := DatabaseName;
                      ATransferOptions.SourceTableName := SourceTableName;
                      ATransferOptions.ProgressMessage := ProgressMessage;
                      ATransferOptions.UserName := UserName;
                      ATransferOptions.Password := Password;
                      ATransferOptions.TextFileOptions := tfoNone;
                      ATransferOptions.Logging := Logging;
                      ATransferOptions.LogFile := LogFile;
                      ATransferOptions.ErrorLogFile := ErrorLogFile;
                      ATransferOptions.SuppressPrompts := SuppressPrompts;
                      ATransferOptions.TargetTableName := TargetTableName;
                      ATransferOptions.ImportIntoTargetTable :=
                        ImportIntoTargetTable;
                      ATransferOptions.TargetTableIsTemporary :=
                        TargetTableIsTemporary;
                      ATransferOptions.CustomTableType := TableType;
                      if FirstRowHasNames then
                        ATransferOptions.TextFileOptions :=
                          ATransferOptions.TextFileOptions +
                          tfoFirstRowHasNames;
                      if AutoFieldType then
                        ATransferOptions.TextFileOptions :=
                          ATransferOptions.TextFileOptions + tfoAutoFieldType;
                    end;
                finally
                  Free;
                end;
            end;
          // == Import a DBF or DB file == //
          dttParadox, dttDBase, dttFoxPro, dttMSAccess, dttXML:
            begin
              with TFileImport.Create(AOwner) do
                try
                  SQLConnection := ASQLConnection;
                  SourceTableName := ASourceTableName;
                  DataSourceType := ADataSourceType;
                  DatabaseName := ADatabaseName;
                  ImportIntoTargetTable := True;
                  TargetTableName := ATargetTableName;
                  TableType := ATableType;
                  TargetTableIsTemporary := AIsTemporaryTable;
                  ProgressMessage := AProgressMessage;
                  ShowProgress := True;
                  Result := Show;
                  if Result then
                    begin
                      GetConfiguration(AConfiguration);
                      // Populate the record
                      ATransferOptions.Operation := otImport;
                      ATransferOptions.DataSourceType := DataSourceType;
                      ATransferOptions.DatabaseName := DatabaseName;
                      ATransferOptions.SourceTableName := SourceTableName;
                      ATransferOptions.ProgressMessage := ProgressMessage;
                      ATransferOptions.UserName := UserName;
                      ATransferOptions.Password := Password;
                      ATransferOptions.TextFileOptions := tfoNone;
                      ATransferOptions.Logging := Logging;
                      ATransferOptions.LogFile := LogFile;
                      ATransferOptions.ErrorLogFile := ErrorLogFile;
                      ATransferOptions.SuppressPrompts := SuppressPrompts;
                      ATransferOptions.TargetTableName := TargetTableName;
                      ATransferOptions.ImportIntoTargetTable :=
                        ImportIntoTargetTable;
                      ATransferOptions.TargetTableIsTemporary :=
                        TargetTableIsTemporary;
                      ATransferOptions.CustomTableType := TableType;
                    end;
                finally
                  Free;
                end;
            end;
        end; // end case
      end; // end begin
  end; // end case
end;

function DoIQDBTransImportExecute(const AOwner: TComponent;
  const ASQLConnection: TSQLConnection; const ALogging: Boolean;
  const ALogFile: string; const AErrorLogFile: string;
  const ASuppressPrompts: Boolean; const AShowProgress: Boolean;
  var AConfiguration: TStringList; var ANewUserName: string;
  var ANewPassword: string; const AOnProgressEvent: TOnProgressEvent;
  const AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent): Boolean;
var
  AClass: TDataExchange; // dbtclass.pas
begin
  // Initialization
  Result := False;
  ANewUserName := '';
  ANewPassword := '';

  // Validation
  if not IQMS.Common.Miscellaneous.EnsureConnectionExists then
    // 'You are not logged in.  You must be logged ' +
    // 'into an IQMS database to proceed.'
    raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000205);

  if not Assigned(ASQLConnection) then
    raise Exception.Create('Application Error: SQL Connection not provided.');

  // Ensure global date variables are set.
  IQMS.Common.Dates.IQCalculateTimeZoneDiff;
  // Get the configuration class.
  if not GetDataExchangeObject(AOwner, AConfiguration, AClass) then
    raise Exception.Create('Invalid Configuration.  Cannot run import.');
  if Assigned(AClass) then
    try
      // Run the configuration.
      AClass.SQLConnection := ASQLConnection;
      AClass.SetConfiguration(AConfiguration);
      AClass.Logging := ALogging;
      AClass.LogFile := ALogFile;
      AClass.ErrorLogFile := AErrorLogFile;
      AClass.SuppressPrompts := ASuppressPrompts;
      AClass.ShowProgress := AShowProgress;
      AClass.OnProgressEvent := AOnProgressEvent;
      AClass.OnCheckProgressAbortedEvent := AOnCheckProgressAbortedEvent;
      Result := AClass.Execute;
      // Return the configuration in case it was changed.
      AClass.GetConfiguration(AConfiguration);
      ANewUserName := AClass.UserName;
      ANewPassword := AClass.Password;
    finally
      FreeAndNil(AClass);
    end;
end;

function DoIQDBTransExportA(const AOwner: TComponent; const ASource: TDataSet;
  var ATargetDatabase: string; var ATargetTableName: string;
  AExportMessage: string): Boolean;
var
  ASelectedDB: TSelectedDatabase; // record object in dbtsel
  ATransferOptions: TTransferOptions;
begin
  Result := False;

  if not IQMS.Common.Miscellaneous.EnsureConnectionExists then
    // 'You are not logged in.  You must be logged ' +
    // 'into an IQMS database to proceed.'
    raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000205);

  if (ASource = nil) then
    raise Exception.Create
      (IQMS.DBTrans.dbtrscstr.
      cTXT0000045 { 'Application Error:  Source dataset not supplied.' } );

  // Prepare the record object
  IQMS.DBTrans.dbttypes.PrepareTransferOptions(ATransferOptions);

//  if not DoSelectDatabaseForExport(ASelectedDB) then
//    Exit; // dbtsel.pas

  // fill var parameters
  ATargetDatabase := ASelectedDB.DatabaseName;
  ATargetTableName := ASelectedDB.TableName;
  // file transfer options record
  ATransferOptions.DatabaseName := ASelectedDB.DatabaseName;
  ATransferOptions.CustomTableType := ASelectedDB.CustomTableType;
  ATransferOptions.DatabaseName := ASelectedDB.DatabaseName;
  ATransferOptions.ProgressMessage := AExportMessage;
  ATransferOptions.Operation := otExport;
  ATransferOptions.SourceTableName := ASelectedDB.TableName;
  ATransferOptions.TargetTableName := ASelectedDB.TableName;
  ATransferOptions.DataSourceType := ASelectedDB.DataSourceType;
  Result := DoIQDBTransExportB(AOwner, ASource, ATransferOptions);
end;

function DoIQDBTransExportB(const AOwner: TComponent; const ASource: TDataSet;
  const ATransferOptions: TTransferOptions; AExecuteImmediate: Boolean)
  : Boolean;
var
  AConfiguration: TStringList;
  ADatabaseName: string;

  function _ValidateTransferOptionsForExport(const ATransferOptions
    : TTransferOptions): Boolean;
  begin
    // Is the current TTransferOptions record valid for exporting data?
    Result := ATransferOptions.Operation = otExport;
    if not Result then
      raise Exception.Create('Invalid operation type.');

    if ATransferOptions.TargetTableName = '' then
      raise Exception.Create('Target table name required.');

    case ATransferOptions.DataSourceType of
      dstDSN, dstOracleAlias:
        begin
          Result := Trim(ATransferOptions.DatabaseName) > '';
          if not Result then
            raise Exception.Create('Alias required.');
          ADatabaseName := Trim(ATransferOptions.DatabaseName);
          Result := Trim(ATransferOptions.SourceTableName) > '';
          if not Result then
            raise Exception.Create('Source table name required.');
        end;
      dstFile:
        begin
          Result := Trim(ATransferOptions.DatabaseName) > '';
          ADatabaseName := Trim(ATransferOptions.DatabaseName);
          if not Result then
            raise Exception.Create('File name required.');
        end;
    end;
  end;

begin
  Result := False;

  if not IQMS.Common.Miscellaneous.EnsureConnectionExists then
    // 'You are not logged in.  You must be logged ' +
    // 'into an IQMS database to proceed.'
    raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000205);

  if (ASource = nil) then
    raise Exception.Create
      (IQMS.DBTrans.dbtrscstr.
      cTXT0000045 { 'Application Error:  Source dataset not supplied.' } );

  try
    dbtcommon.PrepareSQLConnection;
    AConfiguration := TStringList.Create;
    // check the record for errors
    if not _ValidateTransferOptionsForExport(ATransferOptions) then
      Exit;

    Result := DoIQDBTransExportExecuteA(AOwner, dbtcommon.SQLConnection,
      ASource, ATransferOptions.SourceTableName, ADatabaseName,
      ATransferOptions.TargetTableName, ATransferOptions.CustomTableType,
      ATransferOptions.DataSourceType, ATransferOptions.DriverType,
      ATransferOptions.UserName, ATransferOptions.Password,
      ATransferOptions.Logging, ATransferOptions.LogFile,
      ATransferOptions.ErrorLogFile, True, // SuppressPrompts
      ATransferOptions.ProgressMessage, True, // Show Progress
      { var } AConfiguration);
  finally
    dbtcommon.FreeSQLConnection;
    if Assigned(AConfiguration) then
      FreeAndNil(AConfiguration);
  end;
end;

function GetTempTableName: string;
begin
  // Returns a unique temporary table name.
  // This method also keeps a list of temporary tables created for this
  // instance.  Call DropTempTablesForSession (below) to remove the
  // temporary tables when the application closes.

  // NOTE:  we keep this method in dbtemptables to prevent this unit recursevely
  // calling itself.

  dbtcommon.PrepareSQLConnection;
  Result := dbtemptables.GetTempTableName(dbtcommon.SQLConnection);
end;

procedure DropTempTablesForSession;
begin
  // Drops temporary tables created during this application instance.
  // Sometimes users might create multiple temporary tables.  This can
  // happen when users click the back button to load a different dataset
  // on an import/export wizard.

  // NOTE:  we keep this method in dbtemptables to prevent this unit recursevely
  // calling itself.
  dbtcommon.PrepareSQLConnection;
  dbtemptables.DropTempTablesForSession(dbtcommon.SQLConnection);
end;

function ImportMSAccessTable(const AOwner: TComponent;
  const ADatabase, ATableName, AUserName, APassword, ATargetTableName: string;
  ARunBeforeImport: TNotifyEvent): Boolean;
begin
  // This method is not used by IQDBTRANS.  It can be used to import from
  // any * known * Microsoft Access database table.

  Result := False;

  if not IQMS.Common.Miscellaneous.EnsureConnectionExists then
    // 'You are not logged in.  You must be logged ' +
    // 'into an IQMS database to proceed.'
    raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000205);

  // Required values
  if not FileExists(ADatabase) or (ATargetTableName = '') then
    begin
      raise Exception.Create
        ('Application Error:  Database or temporary table name not supplied.');
      Exit;
    end;

  with TFrmDBTransImportMDB.Create(AOwner, ADatabase, ATableName, AUserName,
    APassword, ATargetTableName, True) do // dbtimpm.pas
    try
      // Event to execute before importing records
      FRunBeforeImport := ARunBeforeImport;
      InitializeConnection;
      Result := lstTableList.Items.IndexOf(ATableName) > -1;
      if Result then
        btnFinishClick(nil)
      else
        Result := ShowModal = mrOk;
    finally
      Free;
    end;
end;

{ ShowData }
function ShowData(const ADataSets: array of TDataSet;
  AModal: Boolean): TFrmDBTransDebug;
begin
  // Initialize
  Result := nil;

  // Check the list
  if ( high(ADataSets) < 0) then
    Exit;

  // Create the form
  Result := TFrmDBTransDebug.Create(ADataSets);

  // Check it before showing it, in case something bad happened.
  if not Assigned(Result) then
    Exit;

  // Show the form, depending the option:
  // A.) Modal
  if AModal then
    with Result do
      try
        ShowModal;
      finally
        Free;
      end
    // B.) Non-Modal
  else
    Result.Show;

end;

procedure ShowDataFor(ADataSet: TDataSet);
begin
  // Check the list
  if (ADataSet = nil) then
    Exit;

  with TFrmDBTransDebug.Create([ADataSet]) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

function DoIQDBTransExportShow(const AOwner: TComponent;
  const ASQLConnection: TSQLConnection; const ASource: TDataSet;
  const ASourceTableName: string; const ATargetTableName: string;
  const ALogging: Boolean; const ALogFile: string; const AErrorLogFile: string;
  const AProgressMessage: string; var AConfiguration: TStringList): Boolean;
var
  ARec: TSelectedDatabase; // record object in dbtsel
begin
  Result := False;

  if not IQMS.Common.Miscellaneous.EnsureConnectionExists then
    // 'You are not logged in.  You must be logged ' +
    // 'into an IQMS database to proceed.'
    raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000205);

  if (ASource = nil) then
    raise Exception.Create
      (IQMS.DBTrans.dbtrscstr.
      cTXT0000045 { 'Application Error:  Source dataset not supplied.' } );

  ARec.TableName := ATargetTableName;
  // ARec.SuggestedTableName := ATargetTableName;

//  if not DoSelectDatabaseForExport(ARec) then // dbtsel.pas
//    Exit;

  Result := DoIQDBTransExportExecuteA(AOwner, ASQLConnection, ASource,
    ASourceTableName, ARec.DatabaseName, ATargetTableName, ARec.CustomTableType,
    ARec.DataSourceType, ARec.DriverType, '', // UserName
    '', // Password
    ALogging, ALogFile, AErrorLogFile, False, // SuppressPrompts
    AProgressMessage, True, // Show Progress
    { var } AConfiguration);

end;

function DoIQDBTransExportExecuteA(const AOwner: TComponent;
  const ASQLConnection: TSQLConnection; const ASource: TDataSet;
  const ASourceTableName: string; const ADatabaseName: string;
  const ATargetTableName: string; const ATableType: TCustomTableType;
  const ADataSourceType: TDataSourceType; const ADriverType: TDriverType;
  const AUserName: string; const APassword: string; const ALogging: Boolean;
  const ALogFile: string; const AErrorLogFile: string;
  const ASuppressPrompts: Boolean; const AProgressMessage: string;
  const AShowProgress: Boolean; var AConfiguration: TStringList;
  const AOnProgressEvent: TOnProgressEvent;
  const AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent): Boolean;
begin
  Result := False;

  if not IQMS.Common.Miscellaneous.EnsureConnectionExists then
    // 'You are not logged in.  You must be logged ' +
    // 'into an IQMS database to proceed.'
    raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000205);

  if (ASource = nil) then
    raise Exception.Create
      (IQMS.DBTrans.dbtrscstr.
      cTXT0000045 { 'Application Error:  Source dataset not supplied.' } );

  // check for errors
  if ADatabaseName = '' then
    raise Exception.Create('Database name required.');
  if ((ADataSourceType in [dstDSN, dstOracleAlias]) or
    (ATableType = dttMSAccess)) and (Trim(ATargetTableName) = '') then
    raise Exception.Create('Table name required.');

  case ADataSourceType of
    dstDSN, dstOracleAlias:
      with TSystemExport.Create(AOwner) do
        try
          SQLConnection := ASQLConnection;
          DataSourceType := ADataSourceType;
          DriverType := ADriverType;
          DatabaseName := ADatabaseName;
          SourceTableName := ASourceTableName;
          TargetTableName := ATargetTableName;
          UserName := AUserName;
          Password := APassword;
          ProgressMessage := AProgressMessage;
          ShowProgress := AShowProgress;
          Logging := ALogging;
          LogFile := ALogFile;
          ErrorLogFile := AErrorLogFile;
          DataSet := ASource;
          OnProgressEvent := AOnProgressEvent;
          OnCheckProgressAbortedEvent := AOnCheckProgressAbortedEvent;
          Result := Execute;
          if Result then
            GetConfiguration(AConfiguration);
        finally
          Free;
        end;
    dstFile:
      begin
        case ATableType of
          dttASCII, dttMSExcel:
            with TTextFileExport.Create(nil) do
              try
                SQLConnection := ASQLConnection;
                DataSourceType := ADataSourceType;
                DatabaseName := ADatabaseName;
                SourceTableName := ASourceTableName;
                TargetTableName := ATargetTableName;
                TableType := ATableType;
                UserName := AUserName;
                Password := APassword;
                ProgressMessage := AProgressMessage;
                ShowProgress := AShowProgress;
                Logging := ALogging;
                LogFile := ALogFile;
                ErrorLogFile := AErrorLogFile;
                DataSet := ASource;
                OnProgressEvent := AOnProgressEvent;
                OnCheckProgressAbortedEvent := AOnCheckProgressAbortedEvent;
                Result := Execute;
                if Result then
                  GetConfiguration(AConfiguration);
              finally
                Free;
              end;
          dttParadox, dttDBase, dttFoxPro, dttMSAccess, dttXML:
            with TFileExport.Create(nil) do
              try
                SQLConnection := ASQLConnection;
                DataSourceType := ADataSourceType;
                DatabaseName := ADatabaseName;
                SourceTableName := ASourceTableName;
                TargetTableName := ATargetTableName;
                TableType := ATableType;
                UserName := AUserName;
                Password := APassword;
                ProgressMessage := AProgressMessage;
                ShowProgress := AShowProgress;
                Logging := ALogging;
                LogFile := ALogFile;
                ErrorLogFile := AErrorLogFile;
                DataSet := ASource;
                OnProgressEvent := AOnProgressEvent;
                OnCheckProgressAbortedEvent := AOnCheckProgressAbortedEvent;
                Result := Execute;
                if Result then
                  GetConfiguration(AConfiguration);
              finally
                Free;
              end;
        end; // end case
      end; // end begin dstFile
  end; // end case
end;

function DoIQDBTransExportExecuteB(const AOwner: TComponent;
  const ASQLConnection: TSQLConnection; const ASource: TDataSet;
  const ALogging: Boolean; const ALogFile: string; const AErrorLogFile: string;
  const ASuppressPrompts: Boolean; const AShowProgress: Boolean;
  var AConfiguration: TStringList; const AOnProgressEvent: TOnProgressEvent;
  const AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent): Boolean;
var
  AClass: TDataExchange;
begin
  // Initialization
  Result := False;
  // Validation
  if not IQMS.Common.Miscellaneous.EnsureConnectionExists then
    // 'You are not logged in.  You must be logged ' +
    // 'into an IQMS database to proceed.'
    raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000205);

  if not Assigned(ASQLConnection) then
    raise Exception.Create('Application Error: SQL Connection not provided.');
  // Ensure global date variables are set.
  IQMS.Common.Dates.IQCalculateTimeZoneDiff;
  // Get the configuration class.
  if not GetDataExchangeObject(AOwner, AConfiguration, AClass) or
    not(AClass is TCustomExport) then
    raise Exception.Create('Invalid Configuration.  Cannot run import.');
  if Assigned(AClass) then
    try
      // Run the configuration.
      AClass.SQLConnection := ASQLConnection;
      TCustomExport(AClass).DataSet := ASource;
      AClass.SetConfiguration(AConfiguration);
      AClass.Logging := ALogging;
      AClass.LogFile := ALogFile;
      AClass.ErrorLogFile := AErrorLogFile;
      AClass.SuppressPrompts := ASuppressPrompts;
      AClass.ShowProgress := AShowProgress;
      AClass.OnProgressEvent := AOnProgressEvent;
      AClass.OnCheckProgressAbortedEvent := AOnCheckProgressAbortedEvent;
      Result := AClass.Execute;
      // Return the configuration in case it was changed.
      AClass.GetConfiguration(AConfiguration);
    finally
      FreeAndNil(AClass);
    end;
end;

procedure ConvertRecToConfig(const ATransferOptions: TTransferOptions;
  var AConfiguration: TStringList);
begin
  if not Assigned(AConfiguration) then
    Exit;
  AConfiguration.Clear;

  if ATransferOptions.Operation = otImport then
    begin
      case ATransferOptions.DataSourceType of
        dstDSN, dstOracleAlias:
          begin
            with TSystemImport.Create(nil) do
              try
                SQLConnection := nil;
                DataSourceType := ATransferOptions.DataSourceType;
                DatabaseName := ATransferOptions.DatabaseName;
                SourceTableName := ATransferOptions.SourceTableName;
                UserName := ATransferOptions.UserName;
                Password := ATransferOptions.Password;
                Logging := ATransferOptions.Logging;
                LogFile := ATransferOptions.LogFile;
                ErrorLogFile := ATransferOptions.ErrorLogFile;
                SuppressPrompts := ATransferOptions.SuppressPrompts;
                ProgressMessage := ATransferOptions.ProgressMessage;
                ImportIntoTargetTable := ATransferOptions.ImportIntoTargetTable;
                TargetTableName := ATransferOptions.TargetTableName;
                if (ATransferOptions.FieldMapText > '') then
                  FieldMap.AddFromCommaText(ATransferOptions.FieldMapText);
                GetConfiguration(AConfiguration);
              finally
                Free;
              end;
          end; // end begin
        dstFile:
          begin
            case ATransferOptions.CustomTableType of
              dttASCII, dttMSExcel:
                begin
                  with TTextFileImport.Create(nil) do
                    try
                      SQLConnection := nil;
                      DatabaseName := ATransferOptions.DatabaseName;
                      SourceTableName := ATransferOptions.SourceTableName;
                      TableType := ATransferOptions.CustomTableType;
                      Logging := ATransferOptions.Logging;
                      LogFile := ATransferOptions.LogFile;
                      ErrorLogFile := ATransferOptions.ErrorLogFile;
                      ImportIntoTargetTable :=
                        ATransferOptions.ImportIntoTargetTable;
                      TargetTableName := ATransferOptions.TargetTableName;
                      TargetTableIsTemporary :=
                        ATransferOptions.TargetTableIsTemporary;
                      FirstRowHasNames :=
                        (ATransferOptions.TextFileOptions and
                        tfoFirstRowHasNames = tfoFirstRowHasNames);
                      AutoFieldType := (ATransferOptions.TextFileOptions and
                        tfoAutoFieldType = tfoAutoFieldType); // Excel only
                      SuppressPrompts := ATransferOptions.SuppressPrompts;
                      ProgressMessage := ATransferOptions.ProgressMessage;
                      SchemaText := ATransferOptions.TextFileSchema;
                      if (ATransferOptions.FieldMapText > '') then
                        FieldMap.AddFromCommaText(ATransferOptions.FieldMapText);
                      GetConfiguration(AConfiguration);
                    finally
                      Free;
                    end;
                end;
              dttParadox, dttDBase, dttFoxPro, dttMSAccess, dttXML:
                begin
                  with TFileImport.Create(nil) do
                    try
                      SQLConnection := nil;
                      DatabaseName := ATransferOptions.DatabaseName;
                      SourceTableName := ATransferOptions.SourceTableName;
                      SuppressPrompts := ATransferOptions.SuppressPrompts;
                      ProgressMessage := ATransferOptions.ProgressMessage;
                      Logging := ATransferOptions.Logging;
                      LogFile := ATransferOptions.LogFile;
                      ErrorLogFile := ATransferOptions.ErrorLogFile;
                      ImportIntoTargetTable :=
                        ATransferOptions.ImportIntoTargetTable;
                      TargetTableName := ATransferOptions.TargetTableName;
                      TableType := ATransferOptions.CustomTableType;
                      UserName := ATransferOptions.UserName;
                      Password := ATransferOptions.Password;
                      if (ATransferOptions.FieldMapText > '') then
                        FieldMap.AddFromCommaText(ATransferOptions.FieldMapText);
                      GetConfiguration(AConfiguration);
                    finally
                      Free;
                    end;
                end;
            end; // end case
          end; // end begin
      end; // end case
    end // end begin
  else if ATransferOptions.Operation = otExport then
    begin
      case ATransferOptions.DataSourceType of
        dstDSN, dstOracleAlias:
          with TSystemExport.Create(nil) do
            try
              SQLConnection := nil;
              DataSourceType := ATransferOptions.DataSourceType;
              DriverType := ATransferOptions.DriverType;
              DatabaseName := ATransferOptions.DatabaseName;
              SourceTableName := ATransferOptions.SourceTableName;
              TargetTableName := ATransferOptions.TargetTableName;
              UserName := ATransferOptions.UserName;
              Password := ATransferOptions.Password;
              SuppressPrompts := ATransferOptions.SuppressPrompts;
              ProgressMessage := ATransferOptions.ProgressMessage;
              Logging := ATransferOptions.Logging;
              LogFile := ATransferOptions.LogFile;
              ErrorLogFile := ATransferOptions.ErrorLogFile;
              if (ATransferOptions.FieldMapText > '') then
                FieldMap.AddFromCommaText(ATransferOptions.FieldMapText);
              GetConfiguration(AConfiguration);
            finally
              Free;
            end;
        dstFile:
          begin
            case ATransferOptions.CustomTableType of
              dttASCII, dttMSExcel:
                with TTextFileExport.Create(nil) do
                  try
                    SQLConnection := nil;
                    DataSourceType := ATransferOptions.DataSourceType;
                    DatabaseName := ATransferOptions.DatabaseName;
                    SourceTableName := ATransferOptions.SourceTableName;
                    TargetTableName := ATransferOptions.TargetTableName;
                    TableType := ATransferOptions.CustomTableType;
                    UserName := ATransferOptions.UserName;
                    Password := ATransferOptions.Password;
                    SuppressPrompts := ATransferOptions.SuppressPrompts;
                    ProgressMessage := ATransferOptions.ProgressMessage;
                    Logging := ATransferOptions.Logging;
                    LogFile := ATransferOptions.LogFile;
                    ErrorLogFile := ATransferOptions.ErrorLogFile;
                    if (ATransferOptions.FieldMapText > '') then
                      FieldMap.AddFromCommaText(ATransferOptions.FieldMapText);
                    GetConfiguration(AConfiguration);
                  finally
                    Free;
                  end;
              dttParadox, dttDBase, dttFoxPro, dttMSAccess, dttXML:
                with TFileExport.Create(nil) do
                  try
                    SQLConnection := nil;
                    DataSourceType := ATransferOptions.DataSourceType;
                    DatabaseName := ATransferOptions.DatabaseName;
                    SourceTableName := ATransferOptions.SourceTableName;
                    TargetTableName := ATransferOptions.TargetTableName;
                    TableType := ATransferOptions.CustomTableType;
                    UserName := ATransferOptions.UserName;
                    Password := ATransferOptions.Password;
                    SuppressPrompts := ATransferOptions.SuppressPrompts;
                    ProgressMessage := ATransferOptions.ProgressMessage;
                    Logging := ATransferOptions.Logging;
                    LogFile := ATransferOptions.LogFile;
                    ErrorLogFile := ATransferOptions.ErrorLogFile;
                    if (ATransferOptions.FieldMapText > '') then
                      FieldMap.AddFromCommaText(ATransferOptions.FieldMapText);
                    GetConfiguration(AConfiguration);
                  finally
                    Free;
                  end;
            end; // end case
          end; // end begin dstFile
      end; // end case
    end; // end begin
end;

function ConvertConfigToRec(const AConfiguration: TStringList;
  var ATransferOptions: TTransferOptions): Boolean;
var
  AReference: TDataExchange;
begin
  Result := False;
  IQMS.DBTrans.dbttypes.PrepareTransferOptions(ATransferOptions);
  if dbtclass.GetDataExchangeObject(nil, AConfiguration, AReference) then
    try
      Result := True;
      ATransferOptions.Operation := AReference.Operation;
      ATransferOptions.DataSourceType := AReference.DataSourceType;
      if AReference is TSystemExport then
        ATransferOptions.DriverType := TSystemExport(AReference).DriverType;
      ATransferOptions.DatabaseName := AReference.DatabaseName;
      ATransferOptions.SourceTableName := AReference.SourceTableName;
      if AReference is TCustomImport then
        begin
          ATransferOptions.TargetTableName := TCustomImport(AReference)
            .TargetTableName;
          ATransferOptions.ImportIntoTargetTable := TCustomImport(AReference)
            .ImportIntoTargetTable;
          ATransferOptions.TargetTableIsTemporary := TCustomImport(AReference)
            .TargetTableIsTemporary;
        end
      else if AReference is TCustomExport then
        ATransferOptions.TargetTableName := TCustomExport(AReference)
          .TargetTableName;

      if AReference is TFileImport then
        ATransferOptions.CustomTableType := TFileImport(AReference).TableType
      else if AReference is TFileExport then
        ATransferOptions.CustomTableType := TFileExport(AReference).TableType;

      ATransferOptions.ProgressMessage := AReference.ProgressMessage;
      ATransferOptions.UserName := AReference.UserName;
      ATransferOptions.Password := AReference.Password;
      ATransferOptions.TextFileOptions := tfoNone;

      if AReference is TTextFileImport then
        begin
          if TTextFileImport(AReference).FirstRowHasNames then
            ATransferOptions.TextFileOptions := ATransferOptions.TextFileOptions
              + tfoFirstRowHasNames;
          if TTextFileImport(AReference).AutoFieldType then
            ATransferOptions.TextFileOptions := ATransferOptions.TextFileOptions
              + tfoAutoFieldType;
          ATransferOptions.TextFileSchema := TTextFileImport(AReference).SchemaText;
        end
      else if AReference is TTextFileExport then
        begin
          if TTextFileExport(AReference).FirstRowHasNames then
            ATransferOptions.TextFileOptions := ATransferOptions.TextFileOptions
              + tfoFirstRowHasNames;
          if TTextFileExport(AReference).AutoFieldType then
            ATransferOptions.TextFileOptions := ATransferOptions.TextFileOptions
              + tfoAutoFieldType;
          ATransferOptions.TextFileSchema := TTextFileExport(AReference).SchemaText;
        end;

      ATransferOptions.Logging := AReference.Logging;
      ATransferOptions.LogFile := AReference.LogFile;
      ATransferOptions.ErrorLogFile := AReference.ErrorLogFile;
      ATransferOptions.SuppressPrompts := AReference.SuppressPrompts;
      if Assigned(AReference.FieldMap) and
        (AReference.FieldMap.Count > 0) then
        ATransferOptions.FieldMapText := AReference.FieldMap.CommaText;
    finally
      FreeAndNil(AReference);
    end;
end;

procedure GetConfigurationFieldMap(const AConfiguration: TStringList; AFieldMap: TFieldMap);
begin
  if Assigned(AConfiguration) and Assigned(AFieldMap) then
    with TDataExchange.Create(nil) do
      try
        SetConfiguration(AConfiguration);
        AFieldMap.AddMap(FieldMap);
      finally
        Free;
      end;
end;

procedure GetConfigurationFieldMapAs(const AConfiguration: TStringList;
  AFieldMapList: TStringList);
var
  AFieldMap: TFieldMap;
begin
  if Assigned(AConfiguration) and Assigned(AFieldMapList) then
    begin
      AFieldMap := TFieldMap.Create(nil);
      try
        GetConfigurationFieldMap(AConfiguration, AFieldMap);
        AFieldMapList.Clear;
        AFieldMap.AssignStrings({var} AFieldMapList);
      finally
        FreeAndNil(AFieldMap);
      end;
    end;
end;

procedure GetConfigurationFieldMapAs(const AConfiguration: TStringList;
  var AFieldMapText: string);
var
  sl: TStringList;
begin
  if Assigned(AConfiguration) then
    begin
      sl := TStringList.Create;
      try
        GetConfigurationFieldMapAs(AConfiguration, sl);
        AFieldMapText := sl.Text;
      finally
        FreeAndNil(sl);
      end;
    end;
end;
end.

unit dbtclass;

(* ****************************************************************************
  *** Data Exchange (Import/Export) Core Type Declarations ***

  * Objects *
  1.) Import:

  TSystemImport = Import from a system alias or DSN.
  TFileImport = Import a data file (.DB, .DBF, .MDB, and .XML), but not
  text files or Excel spreadsheets;
  TTextFileImport = Import a text file (delimited or fixed),
  or an Excel spreadsheet.

  2.) Export:

  TSystemExport = Export to a system alias or DSN.
  TFileExport = Export to a data file (.DB, .DBF, .MDB, and .XML), but not
  text files or Excel spreadsheets;
  TTextFileExport = Export to a text file (delimited or fixed),
  or an Excel spreadsheet.

  Note:  The following are base classes, and should not be called
  directly: TDataExchange, TCustomImport, and TCustomExport.
  The following are used internally by the primary classes,
  and should not be called directly: TXMLConfig.

  **************************************************************************** *)

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Forms,
  Dialogs,
  Controls,
  IQMS.Common.Registry,
  DB,
  XmlIntf,
  XMLDoc,
  SqlExpr,
  DBClient,
  IQMS.DBTrans.dbttypes,
  IQMS.DBTrans.dbtdb;

type
  { Forwards }
  TXMLConfig = class; // used by import/export classes; do not use directly.

  { TOperationType }
  // TOperationType = (otExport, otImport);

  { TDataSourceType }
  // TDataSourceType = (atUnknown, atDSN, atOracleAlias, dstFile);

  { TCustomTableType }
  { TCustomTableType = (dttDefault,  // 0
    dttParadox,  // 1
    dttDBase,    // 2
    dttFoxPro,   // 3
    dttASCII,    // 4
    dttMSAccess, // 5
    dttMSExcel,  // 6
    dttXML);     // 7
  }
  { TDataExchange }
  TDataExchange = class(TComponent)
    private
      { Private declarations }
      FDataSourceType: TDataSourceType;
      FDatabaseName: string;
      FSourceTableName: string;
      FProgressMessage: string;
      FLogging: Boolean;
      FSuppressPrompts: Boolean;
      FLogFile: string;
      FErrorLogFile: string;
      FSQLConnection: TSQLConnection;
      // FInternalConnection: TSQLConnection;
      FUserName: string;
      FPassword: string;
      FShowProgress: Boolean;
      FFieldMap: TFieldMap;
      FOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent;
      FOnProgressEvent: TOnProgressEvent; // in dbtdb.pas
      procedure CheckSQLConnectionAssigned;
    protected
      { Protected declarations }
      FOperation: TOperationType;
      Configuration: TXMLConfig;
      procedure Initialize; virtual;
      procedure SetDatabaseName(const Value: string);
      procedure UpdateConfiguration; dynamic;
      procedure UpdateDatabaseName; dynamic;
    public
      { Public declarations }
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure GetConfiguration(var ALines: TStringList); dynamic;
      procedure SetConfiguration(const ALines: TStringList); dynamic;
      function Execute: Boolean; dynamic; // executes configuration, as defined.
      function Show: Boolean; dynamic; // shows prompt screens.
    published
      { Published declarations }
      property SQLConnection: TSQLConnection
        read FSQLConnection
        write FSQLConnection;

      // * Required properties *
      // 1.) otExport or otImport
      property Operation: TOperationType
        read FOperation;
      // 2.) System alias or data file
      property DataSourceType: TDataSourceType
        read FDataSourceType
        write FDataSourceType;

      // * Additional properties, as needed *
      // DatabaseName - either the system alias or DSN, or
      // data file name (full path and file name).
      property DatabaseName: string
        read FDatabaseName
        write SetDatabaseName;

      // SourceTableName - table name inside database.  If importing, it is the
      // table containing the data we import.  If exporting, it is the
      // table whose data we are exporting (the IQMS Oracle table name).
      property SourceTableName: string
        read FSourceTableName
        write FSourceTableName;

      // Progress message - Indicates the message displaying during
      // the import/export operation.
      property ProgressMessage: string
        read FProgressMessage
        write FProgressMessage;
      property ShowProgress: Boolean
        read FShowProgress
        write FShowProgress;
      // suppress informational dialogs
      property SuppressPrompts: Boolean
        read FSuppressPrompts
        write FSuppressPrompts;

      // Connection information (so far this only applies to MDB files)
      // User name to pass to connection
      property UserName: string
        read FUserName
        write FUserName;
      // Password to pass to connection
      property Password: string
        read FPassword
        write FPassword;

      property FieldMap: TFieldMap
        read FFieldMap
        write FFieldMap;

      // log files
      property Logging: Boolean
        read FLogging
        write FLogging;
      property LogFile: string
        read FLogFile
        write FLogFile;
      property ErrorLogFile: string
        read FErrorLogFile
        write FErrorLogFile;

      property OnProgressEvent: TOnProgressEvent
        read FOnProgressEvent
        write FOnProgressEvent;
      property OnCheckProgressAbortedEvent: TCheckProgressAbortedEvent
        read FOnCheckProgressAbortedEvent
        write FOnCheckProgressAbortedEvent;

  end;

  { TDataExchangeClass }
  TDataExchangeClass = class of TDataExchange;

  { TCustomImport }
  TCustomImport = class(TDataExchange)
    private
      { Private declarations }
      FImportIntoTargetTable: Boolean;
      FTargetTableIsTemporary: Boolean;
      FTargetTableName: string;
    protected
      { Protected declarations }
      procedure Initialize; override;
      function Validate: Boolean;
      procedure UpdateConfiguration; override;
    public
      { Public declarations }
      procedure GetConfiguration(var ALines: TStringList); override;
      procedure SetConfiguration(const ALines: TStringList); override;
      function Execute: Boolean; override;
      // executes configuration, as defined.
      function Show: Boolean; override; // shows prompt screens.
    published
      { Published declarations }
      property SQLConnection;
      property Operation;
      property DataSourceType;
      property DatabaseName;
      property SourceTableName;
      property ProgressMessage;
      property Logging;
      property LogFile;
      property ErrorLogFile;
      property SuppressPrompts;

      // Options for importing into the target, Oracle table
      // Are we importing into a target table?
      property ImportIntoTargetTable: Boolean
        read FImportIntoTargetTable
        write FImportIntoTargetTable;
      // TargetTableName - target Oracle table we import into
      property TargetTableName: string
        read FTargetTableName
        write FTargetTableName;
      // Set target table as temporary
      property TargetTableIsTemporary: Boolean
        read FTargetTableIsTemporary
        write FTargetTableIsTemporary;

      property OnProgressEvent;
      property OnCheckProgressAbortedEvent;
  end;

  { TCustomExport }
  TCustomExport = class(TDataExchange)
    private
      { Private declarations }
      FDataSet: TDataSet;
      FTargetTableName: string;
      function Validate: Boolean;
    protected
      { Protected declarations }
      procedure Initialize; override;
      procedure UpdateConfiguration; override;
    public
      { Public declarations }
      procedure GetConfiguration(var ALines: TStringList); override;
      procedure SetConfiguration(const ALines: TStringList); override;
      function Execute: Boolean; override;
      // executes configuration, as defined.
    published
      { Published declarations }
      property SQLConnection;
      property Operation;
      property DataSourceType;
      property DatabaseName;
      property SourceTableName;
      property UserName;
      property Password;
      property ProgressMessage;
      property Logging;
      property LogFile;
      property ErrorLogFile;
      property SuppressPrompts;
      property TargetTableName: string
        read FTargetTableName
        write FTargetTableName;
      // Dataset containing records for export
      property DataSet: TDataSet
        read FDataSet
        write FDataSet;

      property OnProgressEvent;
      property OnCheckProgressAbortedEvent;
  end;

  { TFileImport }
  TFileImport = class(TCustomImport)
    private
      { Private declarations }
      FTableType: TCustomTableType;
      FDirectory: string;
      FFileExt: string;
    protected
      { Protected declarations }
      procedure Initialize; override;
      procedure UpdateDatabaseName; override;
      procedure UpdateConfiguration; override;
    public
      { Public declarations }
      function Execute: Boolean; override;
      // executes configuration, as defined.
      function Show: Boolean; override; // shows prompt screens.
      procedure GetConfiguration(var ALines: TStringList); override;
      procedure SetConfiguration(const ALines: TStringList); override;
    published
      { Published declarations }
      property SQLConnection;
      property Operation; // read-only
      property DataSourceType;
      property DatabaseName;
      property SourceTableName;
      property Directory: string
        read FDirectory;
      property FileExt: string
        read FFileExt;
      property UserName;
      property Password;

      // TableType - For data files only, this propery indicates the
      // type of data file being used.
      property TableType: TCustomTableType
        read FTableType
        write FTableType;

      property ProgressMessage;
      property Logging;
      property LogFile;
      property ErrorLogFile;
      property SuppressPrompts;
      property ImportIntoTargetTable;
      property TargetTableName;
      property TargetTableIsTemporary;

      property OnProgressEvent;
      property OnCheckProgressAbortedEvent;
  end;

  { TFileExport }
  TFileExport = class(TCustomExport)
    private
      { Private declarations }
      FTableType: TCustomTableType;
      FDirectory: string;
      FFileExt: string;
    protected
      { Protected declarations }
      procedure Initialize; override;
      procedure UpdateDatabaseName; override;
      procedure UpdateConfiguration; override;
    public
      { Public declarations }
      function Execute: Boolean; override;
      // executes configuration, as defined.
      procedure GetConfiguration(var ALines: TStringList); override;
      procedure SetConfiguration(const ALines: TStringList); override;
    published
      { Published declarations }
      property SQLConnection;
      property Operation; // read-only
      property DataSourceType;
      property DatabaseName;
      property SourceTableName;
      property Directory: string
        read FDirectory;
      property FileExt: string
        read FFileExt;
      property UserName;
      property Password;

      // TableType - For data files only, this propery indicates the
      // type of data file being used.
      property TableType: TCustomTableType
        read FTableType
        write FTableType;
      // Connection information

      property TargetTableName;
      property ProgressMessage;
      property Logging;
      property LogFile;
      property ErrorLogFile;
      property SuppressPrompts;
      property DataSet;

      property OnProgressEvent;
      property OnCheckProgressAbortedEvent;
  end;

  { TSystemImport }
  TSystemImport = class(TCustomImport)
    private
      { Private declarations }
    protected
      { Protected declarations }
      procedure Initialize; override;
    public
      { Public declarations }
      function Execute: Boolean; override;
      // executes configuration, as defined.
      function Show: Boolean; override; // shows prompt screens.
    published
      { Published declarations }
      property SQLConnection;
      property Operation; // read-only
      property DataSourceType;
      property DatabaseName;
      property SourceTableName;
      property UserName;
      property Password;

      property ProgressMessage;
      property Logging;
      property LogFile;
      property ErrorLogFile;
      property SuppressPrompts;
      property ImportIntoTargetTable;
      property TargetTableName;
      property TargetTableIsTemporary;

      property OnProgressEvent;
      property OnCheckProgressAbortedEvent;
  end;

  { TSystemExport }
  TSystemExport = class(TCustomExport)
    private
      FDriverType: TDriverType;
      { Private declarations }
    protected
      { Protected declarations }
      procedure Initialize; override;
    public
      { Public declarations }
      function Execute: Boolean; override;
      // executes configuration, as defined.
    published
      { Published declarations }
      property SQLConnection;
      property Operation; // read-only
      property DataSourceType;
      property DatabaseName;
      property SourceTableName;
      property UserName;
      property Password;

      property TargetTableName;
      property ProgressMessage;
      property Logging;
      property LogFile;
      property ErrorLogFile;
      property SuppressPrompts;
      property DataSet;

      property DriverType: TDriverType
        read FDriverType
        write FDriverType;

      property OnProgressEvent;
      property OnCheckProgressAbortedEvent;
  end;

  { TTextFileImport }
  TTextFileImport = class(TFileImport)
    private
      { Private declarations }
      FFirstRowHasNames: Boolean;
      FAutoFieldType: Boolean;
      FSchemaText: string;
      procedure SetSchemaText(const Value: string);
    protected
      { Protected declarations }
      procedure UpdateConfiguration; override;
      procedure Initialize; override;
    public
      { Public declarations }
      function Execute: Boolean; override;
      // executes configuration, as defined.
      function Show: Boolean; override; // shows prompt screens.
      procedure GetConfiguration(var ALines: TStringList); override;
      procedure SetConfiguration(const ALines: TStringList); override;
    published
      { Published declarations }
      property SQLConnection;
      property Operation; // read-only
      property DataSourceType;
      property DatabaseName;
      property SourceTableName;
      property Directory;
      property FileExt;
      property TableType;
      property FirstRowHasNames: Boolean
        read FFirstRowHasNames
        write FFirstRowHasNames;
      property AutoFieldType: Boolean
        read FAutoFieldType
        write FAutoFieldType; // for Excel only
      property SchemaText: string
        read FSchemaText
        write SetSchemaText;
      property ProgressMessage;
      property Logging;
      property LogFile;
      property ErrorLogFile;
      property SuppressPrompts;
      property ImportIntoTargetTable;
      property TargetTableName;
      property TargetTableIsTemporary;

      property OnProgressEvent;
      property OnCheckProgressAbortedEvent;
  end;

  { TTextFileExport }
  TTextFileExport = class(TFileExport)
    private
      { Private declarations }
      FFirstRowHasNames: Boolean;
      FAutoFieldType: Boolean;
      FSchemaText: string;
      procedure SetSchemaText(const Value: string);
    protected
      { Protected declarations }
      procedure UpdateConfiguration; override;
    public
      { Public declarations }
      function Execute: Boolean; override;
      // executes configuration, as defined.
      procedure GetConfiguration(var ALines: TStringList); override;
      procedure SetConfiguration(const ALines: TStringList); override;
    published
      { Published declarations }
      property SQLConnection;
      property Operation; // read-only
      property DataSourceType;
      property DatabaseName;
      property SourceTableName;
      property Directory;
      property FileExt;
      property TableType;
      property FirstRowHasNames: Boolean
        read FFirstRowHasNames
        write FFirstRowHasNames;
      property SchemaText: string
        read FSchemaText
        write SetSchemaText;
      property AutoFieldType: Boolean
        read FAutoFieldType
        write FAutoFieldType; // for Excel only
      property TargetTableName;
      property ProgressMessage;
      property Logging;
      property LogFile;
      property ErrorLogFile;
      property SuppressPrompts;
      property DataSet;

      property OnProgressEvent;
      property OnCheckProgressAbortedEvent;
  end;

  { TXMLConfig }
  TXMLConfig = class(TComponent)
    private
      { Private declarations }
      FXMLDoc: TXMLDocument;
      function GetLines: TStrings;
    public
      { Public declarations }
      constructor Create(const AOwner: TComponent); reintroduce;
      destructor Destroy; override;

      procedure GetConfig(var ALines: TStringList);
      procedure SetConfig(const ALines: TStringList);

      function ReadString(const Section, Key, default: string): string;
      procedure WriteString(const Section, Key, Value: string);
      function ReadInteger(const Section, Key: string;
        default: Integer): Integer;
      procedure WriteInteger(const Section, Key: string; Value: Integer);
      function ReadBoolean(const Section, Key: string;
        default: Boolean): Boolean;
      procedure WriteBoolean(const Section, Key: string; Value: Boolean);

    published
      property Lines: TStrings
        read GetLines;
  end;

const
  TAG_DATA_EXCHANGE_ROOT = 'DataExchange';
  TAG_SECTION_CLASS = 'Class';
  TAG_SECTION_CONFIGURATION = 'Configuration';
  TAG_SECTION_NOTIFICATION = 'Notification';
  TAG_SECTION_LOGGING = 'Logging';
  TAG_SECTION_IMPORT = 'Import';
  TAG_SECTION_EXPORT = 'Export';
  TAG_SECTION_DATAFILE = 'DataFile';
  TAG_SECTION_SCHEMA = 'Schema';
  TAG_SECTION_FIELDMAP = 'FieldMap';
  TAG_KEY_NAME = 'Name';
  TAG_KEY_OPERATION = 'Operation';
  TAG_KEY_DATASOURCETYPE = 'DataSourceType';
  TAG_KEY_DATABASENAME = 'DatabaseName';
  TAG_KEY_TABLENAME = 'SourceTableName';
  TAG_KEY_PROGRESSMSG = 'ProgressMessage';
  TAG_KEY_SUPPRESS = 'SuppressPrompts';
  TAG_KEY_ENABLED = 'Enabled';
  TAG_KEY_LOGFILE = 'LogFile';
  TAG_KEY_ERRORLOGFILE = 'ErrorLogFile';
  TAG_KEY_TABLETYPE = 'TableType';
  TAG_KEY_DIRECTORY = 'Directory';
  TAG_KEY_FILEEXT = 'FileExt';
  TAG_KEY_FIRSTROWHASNAMES = 'FirstRowHasNames';
  TAG_KEY_AUTOFIELDTYPE = 'AutoFieldType';
  TAG_KEY_SCHEMATEXT = 'Text';
  TAG_KEY_APPENDTOTARGET = 'ImportIntoTargetTable';
  TAG_KEY_TARGETTABLENAME = 'TargetTableName';
  TAG_KEY_TARGETISTEMPORARY = 'TargetTableIsTemporary';
  TAG_KEY_USERNAME = 'UserName';
  TAG_KEY_PASSWORD = 'Password';
  TAG_KEY_FIELDMAPCOUNT = 'Count';

function GetDataExchangeClass(const AConfiguration: TStringList;
  var AClass: TDataExchangeClass): Boolean;
function GetDataExchangeObject(const AOwner: TComponent;
  const AConfiguration: TStringList; var AReference: TDataExchange): Boolean;

// Returns the value for a specific element in the configuration.
function GetConfigString(const AConfiguration: TStringList;
  const ASection: string; const AKey: string): string;
function GetConfigInteger(const AConfiguration: TStringList;
  const ASection: string; const AKey: string): Integer;
function GetConfigBoolean(const AConfiguration: TStringList;
  const ASection: string; const AKey: string): Boolean;
// Sets the value of an element in the configuration.
procedure SetConfigString(const ASection: string; const AKey: string;
  const AValue: string; var AConfiguration: TStringList);
procedure SetConfigInteger(const ASection: string; const AKey: string;
  const AValue: Integer; var AConfiguration: TStringList);
procedure SetConfigBoolean(const ASection: string; const AKey: string;
  const AValue: Boolean; var AConfiguration: TStringList);

implementation

uses
  dbtcommon,
  IQMS.DBTrans.dbtdbexp,
  dbthiddn,
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
  IQMS.Common.FileUtils,
  IQMS.Common.Dialogs;

{$REGION 'Global Wrapper Implementation'}

function GetDataExchangeClass(const AConfiguration: TStringList;
  var AClass: TDataExchangeClass): Boolean;
var
  AClassName: string;
begin
  // Initialization
  Result := False;
  AClass := nil;

  // Read the configuration
  if not Assigned(AConfiguration) then
    Exit;

  AClassName := GetConfigString(AConfiguration, TAG_SECTION_CLASS,
    TAG_KEY_NAME);
  if AClassName = '' then
    AClassName := 'TDataExchange';

  // Determine class
  if AClassName = 'TCustomImport' then
    AClass := TCustomImport
  else if AClassName = 'TCustomExport' then
    AClass := TCustomExport
  else if AClassName = 'TSystemImport' then
    AClass := TSystemImport
  else if AClassName = 'TSystemExport' then
    AClass := TSystemExport
  else if AClassName = 'TFileImport' then
    AClass := TFileImport
  else if AClassName = 'TFileExport' then
    AClass := TFileExport
  else if AClassName = 'TTextFileImport' then
    AClass := TTextFileImport
  else if AClassName = 'TTextFileExport' then
    AClass := TTextFileExport
  else
    AClass := nil;

  Result := AClass <> nil;

end;

function GetDataExchangeObject(const AOwner: TComponent;
  const AConfiguration: TStringList; var AReference: TDataExchange): Boolean;
var
  AClass: TDataExchangeClass;
begin
  Result := GetDataExchangeClass(AConfiguration, AClass);
  if not Result then
    Exit;
  AReference := AClass.Create(AOwner);
  AReference.SetConfiguration(AConfiguration);
end;

function GetConfigString(const AConfiguration: TStringList;
  const ASection: string; const AKey: string): string;
var
  o: TXMLConfig;
begin
  o := nil;
  if Assigned(AConfiguration) then
    try
      o := TXMLConfig.Create(nil);
      o.SetConfig(AConfiguration);
      Result := o.ReadString(ASection, AKey, '');
    finally
      if Assigned(o) then
        FreeAndNil(o);
    end;
end;

function GetConfigInteger(const AConfiguration: TStringList;
  const ASection: string; const AKey: string): Integer;
var
  s: string;
begin
  Result := 0;
  s := GetConfigString(AConfiguration, ASection, AKey);
  SysUtils.TryStrToInt(s, Result);
end;

function GetConfigBoolean(const AConfiguration: TStringList;
  const ASection: string; const AKey: string): Boolean;
var
  i: Integer;
begin
  i := GetConfigInteger(AConfiguration, ASection, AKey);
  Result := Boolean(i);
end;

procedure SetConfigString(const ASection: string; const AKey: string;
  const AValue: string; var AConfiguration: TStringList);
var
  o: TXMLConfig;
begin
  o := nil;
  if Assigned(AConfiguration) then
    try
      o := TXMLConfig.Create(nil);
      o.SetConfig(AConfiguration);
      o.WriteString(ASection, AKey, AValue);
      AConfiguration.Clear;
      AConfiguration.AddStrings(o.Lines);
    finally
      if Assigned(o) then
        FreeAndNil(o);
    end;
end;

procedure SetConfigInteger(const ASection: string; const AKey: string;
  const AValue: Integer; var AConfiguration: TStringList);
begin
  SetConfigString(ASection, AKey, IntToStr(AValue), AConfiguration);
end;

procedure SetConfigBoolean(const ASection: string; const AKey: string;
  const AValue: Boolean; var AConfiguration: TStringList);
begin
  SetConfigString(ASection, AKey, IntToStr(Integer(AValue)), AConfiguration);
end;

{$ENDREGION 'Global Wrapper Implementation'}

{$REGION 'TDataExchange'}

{ TDataExchange }

constructor TDataExchange.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  // FInternalConnection := TSQLConnection.Create(nil);
  Configuration := TXMLConfig.Create(Self);
  FFieldMap := TFieldMap.Create(Self);
  FOperation := TOperationType(0);
  FDataSourceType := TDataSourceType(0);
  FDatabaseName := '';
  FSourceTableName := '';
  FLogging := False;
  FLogFile := '';
  FErrorLogFile := '';
  FProgressMessage := '';
  FSuppressPrompts := False;
  Initialize;
end;

destructor TDataExchange.Destroy;
begin
//  if Assigned(FInternalConnection) then
//    FreeAndNil(FInternalConnection);
  if Assigned(Configuration) then
    FreeAndNil(Configuration);
  if Assigned(FFieldMap) then
    FreeAndNil(FFieldMap);
  inherited Destroy;
end;

procedure TDataExchange.Initialize;
begin
  // Provided by descendent classes
end;

procedure TDataExchange.UpdateConfiguration;
var
  i: Integer;
begin
  Configuration.WriteString(TAG_SECTION_CLASS, TAG_KEY_NAME, Self.ClassName);
  Configuration.WriteInteger(TAG_SECTION_CONFIGURATION, TAG_KEY_OPERATION,
    Ord(FOperation));
  Configuration.WriteInteger(TAG_SECTION_CONFIGURATION, TAG_KEY_DATASOURCETYPE,
    Ord(FDataSourceType));
  Configuration.WriteString(TAG_SECTION_CONFIGURATION, TAG_KEY_DATABASENAME,
    FDatabaseName);
  Configuration.WriteString(TAG_SECTION_CONFIGURATION, TAG_KEY_TABLENAME,
    FSourceTableName);
  Configuration.WriteString(TAG_SECTION_CONFIGURATION, TAG_KEY_USERNAME,
    FUserName);
  Configuration.WriteString(TAG_SECTION_CONFIGURATION, TAG_KEY_PASSWORD,
    FPassword);
  Configuration.WriteString(TAG_SECTION_NOTIFICATION, TAG_KEY_PROGRESSMSG,
    FProgressMessage);
  Configuration.WriteBoolean(TAG_SECTION_NOTIFICATION, TAG_KEY_SUPPRESS,
    FSuppressPrompts);
  Configuration.WriteBoolean(TAG_SECTION_LOGGING, TAG_KEY_ENABLED, FLogging);
  Configuration.WriteString(TAG_SECTION_LOGGING, TAG_KEY_LOGFILE, FLogFile);
  Configuration.WriteString(TAG_SECTION_LOGGING, TAG_KEY_ERRORLOGFILE,
    FErrorLogFile);

  Configuration.WriteInteger(TAG_SECTION_FIELDMAP, TAG_KEY_FIELDMAPCOUNT,
    FFieldMap.Count);
  for i := 0 to FFieldMap.Count - 1 do
    Configuration.WriteString(
      TAG_SECTION_FIELDMAP,
      Format('Field%d', [i + 1]),
      FFieldMap.Items[i]);
end;

procedure TDataExchange.GetConfiguration(var ALines: TStringList);
var
  sl: TStringList;
begin
  // Validation
  if not Assigned(ALines) then
    Exit;
  ALines.Clear;
  UpdateConfiguration;
  // Apply configuration to the list
  try
    sl := TStringList.Create;
    Configuration.GetConfig(sl);
    ALines.AddStrings(sl);
  finally
    if Assigned(sl) then
      FreeAndNil(sl);
  end;
end;

procedure TDataExchange.SetConfiguration(const ALines: TStringList);
var
  ACount, i: Integer;
  s: string;
begin
  if not Assigned(ALines) then
    Exit;
  Configuration.SetConfig(ALines);
  FOperation := TOperationType
    (Configuration.ReadInteger(TAG_SECTION_CONFIGURATION,
    TAG_KEY_OPERATION, 0));
  FDataSourceType := TDataSourceType
    (Configuration.ReadInteger(TAG_SECTION_CONFIGURATION,
    TAG_KEY_DATASOURCETYPE, 0));
  DatabaseName := Configuration.ReadString(TAG_SECTION_CONFIGURATION,
    TAG_KEY_DATABASENAME, '');
  FUserName := Configuration.ReadString(TAG_SECTION_CONFIGURATION,
    TAG_KEY_USERNAME, '');
  FPassword := Configuration.ReadString(TAG_SECTION_CONFIGURATION,
    TAG_KEY_PASSWORD, '');
  FSourceTableName := Configuration.ReadString(TAG_SECTION_CONFIGURATION,
    TAG_KEY_TABLENAME, '');
  FProgressMessage := Configuration.ReadString(TAG_SECTION_NOTIFICATION,
    TAG_KEY_PROGRESSMSG, '');
  FSuppressPrompts := Configuration.ReadBoolean(TAG_SECTION_NOTIFICATION,
    TAG_KEY_SUPPRESS, False);
  FLogging := Configuration.ReadBoolean(TAG_SECTION_LOGGING,
    TAG_KEY_ENABLED, False);
  FLogFile := Configuration.ReadString(TAG_SECTION_LOGGING,
    TAG_KEY_LOGFILE, '');
  FErrorLogFile := Configuration.ReadString(TAG_SECTION_LOGGING,
    TAG_KEY_ERRORLOGFILE, '');

  ACount := Configuration.ReadInteger(TAG_SECTION_FIELDMAP,
    TAG_KEY_FIELDMAPCOUNT, 0);
  FFieldMap.Clear;
  for i := 0 to ACount - 1 do
    begin
      s := Configuration.ReadString(
        TAG_SECTION_FIELDMAP,
        Format('Field%d', [i + 1]),
        '');
      FFieldMap.AddLine(s);
    end;
end;

procedure TDataExchange.SetDatabaseName(const Value: string);
begin
  FDatabaseName := Value;
  UpdateDatabaseName;
end;

function TDataExchange.Execute: Boolean;
begin
  // Provided by descendent class
  Result := True;
end;

function TDataExchange.Show: Boolean;
begin
  // Provided by descendent class
  Result := True;
end;

procedure TDataExchange.CheckSQLConnectionAssigned;
begin
  if not Assigned(FSQLConnection) then
    raise Exception.Create('Application Error:  SQLConnection undefined.');
{    begin
      IQMS.DBTrans.dbtdbexp.DBX_ConfigureSQLConnection(FInternalConnection);
      FInternalConnection.Connected := True;
      FSQLConnection := FInternalConnection;
    end; }
end;

procedure TDataExchange.UpdateDatabaseName;
begin
  // provided by descendent
end;

{$ENDREGION 'TDataExchange'}

{$REGION 'TCustomImport'}

{ TCustomImport }

procedure TCustomImport.Initialize;
begin
  inherited;
  FOperation := otImport;
  FImportIntoTargetTable := True;
end;

procedure TCustomImport.UpdateConfiguration;
begin
  inherited;

  Configuration.WriteBoolean(TAG_SECTION_IMPORT, TAG_KEY_APPENDTOTARGET,
    FImportIntoTargetTable);
  Configuration.WriteString(TAG_SECTION_IMPORT, TAG_KEY_TARGETTABLENAME,
    FTargetTableName);
  Configuration.WriteBoolean(TAG_SECTION_IMPORT, TAG_KEY_TARGETISTEMPORARY,
    FTargetTableIsTemporary);

end;

procedure TCustomImport.GetConfiguration(var ALines: TStringList);
var
  sl: TStringList;
begin
  if not Assigned(ALines) then
    Exit;
  ALines.Clear;
  UpdateConfiguration;
  try
    sl := TStringList.Create;
    Configuration.GetConfig(sl);
    ALines.AddStrings(sl);
  finally
    if Assigned(sl) then
      FreeAndNil(sl);
  end;
end;

procedure TCustomImport.SetConfiguration(const ALines: TStringList);
begin
  if not Assigned(ALines) then
    Exit;

  inherited SetConfiguration(ALines);

  FImportIntoTargetTable := Configuration.ReadBoolean(TAG_SECTION_IMPORT,
    TAG_KEY_APPENDTOTARGET, False);
  FTargetTableName := Configuration.ReadString(TAG_SECTION_IMPORT,
    TAG_KEY_TARGETTABLENAME, '');
  FTargetTableIsTemporary := Configuration.ReadBoolean(TAG_SECTION_IMPORT,
    TAG_KEY_TARGETISTEMPORARY, False);
end;

function TCustomImport.Validate: Boolean;
begin
  // Is the current TransferOptions record valid for importing data?
  Result := Operation = otImport;
  if not Result then
    raise Exception.Create('Invalid operation type.');

  case DataSourceType of
    dstDSN, dstOracleAlias:
      begin
        Result := Trim(DatabaseName) > '';
        if not Result then
          raise Exception.Create('Database name required.');
        Result := Trim(SourceTableName) > '';
        if not Result then
          raise Exception.Create('Table name required.');
      end;
    dstFile:
      begin
        Result := FileExists(DatabaseName);
        if not Result then
          raise Exception.Create('File not found.');
      end;
  end;

  Result := Trim(TargetTableName) > '';
  if not Result then
    raise Exception.Create('Target table name not supplied.');

end;

function TCustomImport.Execute: Boolean;
begin
  Result := Validate;
end;

function TCustomImport.Show: Boolean;
begin
  // Do not validate on Show
  Result := True;
end;

{$ENDREGION 'TCustomImport'}

{$REGION 'TCustomExport'}

{ TCustomExport }

procedure TCustomExport.Initialize;
begin
  inherited;
  FOperation := otExport;
  FDataSet := nil;
end;

function TCustomExport.Validate: Boolean;
begin
  // Is the current TransferOptions record valid for exporting data?
  Result := Operation = otExport;
  if not Result then
    raise Exception.Create('Invalid operation type.');

  Result := TargetTableName > '';
  if not Result then
    raise Exception.Create('Target table name required.');

  Result := SourceTableName > '';
  if not Result then
    raise Exception.Create('Source table name required.');

  case DataSourceType of
    dstDSN, dstOracleAlias:
      begin
        Result := Trim(DatabaseName) > '';
        if not Result then
          raise Exception.Create('Database name required.');
      end;
    dstFile:
      begin
        Result := Trim(DatabaseName) > '';
        if not Result then
          raise Exception.Create('File name required.');
      end;
  end;
end;

function TCustomExport.Execute: Boolean;
begin
  Result := Validate;
end;

procedure TCustomExport.UpdateConfiguration;
begin
  inherited;

  Configuration.WriteString(TAG_SECTION_EXPORT, TAG_KEY_TARGETTABLENAME,
    FTargetTableName);
end;

procedure TCustomExport.GetConfiguration(var ALines: TStringList);
var
  sl: TStringList;
begin
  if not Assigned(ALines) then
    Exit;
  ALines.Clear;
  UpdateConfiguration;
  try
    sl := TStringList.Create;
    Configuration.GetConfig(sl);
    ALines.AddStrings(sl);
  finally
    if Assigned(sl) then
      FreeAndNil(sl);
  end;
end;

procedure TCustomExport.SetConfiguration(const ALines: TStringList);
begin
  if not Assigned(ALines) then
    Exit;

  inherited SetConfiguration(ALines);

  FTargetTableName := Configuration.ReadString(TAG_SECTION_EXPORT,
    TAG_KEY_TARGETTABLENAME, '');
end;

{$ENDREGION 'TCustomExport'}

{$REGION 'TFileImport'}

{ TFileImport }

procedure TFileImport.Initialize;
begin
  inherited;
  FDataSourceType := dstFile;
  FTableType := dttDefault;
end;

procedure TFileImport.UpdateConfiguration;
begin
  inherited;
  Configuration.WriteInteger(TAG_SECTION_DATAFILE, TAG_KEY_TABLETYPE,
    Ord(FTableType));
  Configuration.WriteString(TAG_SECTION_DATAFILE, TAG_KEY_DIRECTORY,
    FDirectory);
  Configuration.WriteString(TAG_SECTION_DATAFILE, TAG_KEY_FILEEXT, FileExt);
end;

procedure TFileImport.GetConfiguration(var ALines: TStringList);
var
  sl: TStringList;
begin
  if not Assigned(ALines) then
    Exit;
  ALines.Clear;
  UpdateConfiguration;
  try
    sl := TStringList.Create;
    Configuration.GetConfig(sl);
    ALines.AddStrings(sl);
  finally
    if Assigned(sl) then
      FreeAndNil(sl);
  end;
end;

procedure TFileImport.SetConfiguration(const ALines: TStringList);
begin
  if not Assigned(ALines) then
    Exit;

  inherited SetConfiguration(ALines);

  FTableType := TCustomTableType(Configuration.ReadInteger(TAG_SECTION_DATAFILE,
    TAG_KEY_TABLETYPE, 0));
end;

procedure TFileImport.UpdateDatabaseName;
begin
  if (FTargetTableName = '') then
    FTargetTableName := ExtractFileName(FDatabaseName);
  FDirectory := ExtractFilePath(FDatabaseName);
  FFileExt := Trim(UpperCase(ExtractFileExt(FDatabaseName)));
end;

function TFileImport.Execute: Boolean;
var
  AFormDBF: TFrmIQDBTransImportDBF;
  AFormMDB: TFrmDBTransImportMDB;
  AFormXML: TFrmDBTransImportXML;
  // AForm: TDBTransForm; // = class of TFrmDBTransHidden
begin
  UpdateDatabaseName;
  Result := inherited Execute;
  if not Result then
    Exit;

  // Ensure we have a file by this point
  if not FileExists(DatabaseName) then
    Exit;
  CheckSQLConnectionAssigned;
  case TableType of
    // == Import a DBF or DB file == //
    dttParadox, dttDBase, dttFoxPro:
      begin
        AFormDBF := TFrmIQDBTransImportDBF.Create( DatabaseName,
          TargetTableName, TableType, ImportIntoTargetTable); // dbtimpdb.pas
        try
          AFormDBF.SQLConnection := Self.SQLConnection;
          AFormDBF.Logging := Self.Logging;
          AFormDBF.LogFile := Self.LogFile;
          AFormDBF.ErrorLogFile := Self.ErrorLogFile;
          AFormDBF.ProgressMessage := Self.ProgressMessage;
          AFormDBF.ShowProgress := Self.ShowProgress;
          AFormDBF.FieldMap.Clear;
          AFormDBF.FieldMap.AddMap(Self.FieldMap);
          AFormDBF.OnProgressEvent := Self.OnProgressEvent;
          AFormDBF.OnCheckProgressAbortedEvent :=
            Self.OnCheckProgressAbortedEvent;
          Result := AFormDBF.BatchMoveDefaultToOracle;
        finally
          if Assigned(AFormDBF) then
            FreeAndNil(AFormDBF);
        end;
      end;
    // == Import from MS Access == //
    dttMSAccess:
      begin
        AFormMDB := TFrmDBTransImportMDB.Create(Owner, DatabaseName,
          SourceTableName, UserName, Password, TargetTableName,
          ImportIntoTargetTable); // dbtimpm.pas
        try
          AFormMDB.SQLConnection := Self.SQLConnection;
          AFormMDB.Logging := Self.Logging;
          AFormMDB.LogFile := Self.LogFile;
          AFormMDB.ErrorLogFile := Self.ErrorLogFile;
          AFormMDB.InitializeConnection;
          AFormMDB.FieldMap.Clear;
          AFormMDB.FieldMap.AddMap(Self.FieldMap);
          AFormMDB.ShowProgress := Self.ShowProgress;
          AFormMDB.ProgressMessage := Self.ProgressMessage;
          AFormMDB.OnProgressEvent := Self.OnProgressEvent;
          AFormMDB.OnCheckProgressAbortedEvent :=
            Self.OnCheckProgressAbortedEvent;
          AFormMDB.DoProcessExec;
        finally
          if Assigned(AFormMDB) then
            FreeAndNil(AFormMDB);
        end;
      end;
    // == Import XML == //
    dttXML:
      begin
        AFormXML := TFrmDBTransImportXML.Create( DatabaseName,
          SourceTableName, TargetTableName, ImportIntoTargetTable,
          TargetTableIsTemporary); // dbtimxml.pas
        try
          AFormXML.SQLConnection := Self.SQLConnection;
          AFormXML.Logging := Self.Logging;
          AFormXML.LogFile := Self.LogFile;
          AFormXML.ErrorLogFile := Self.ErrorLogFile;
          AFormXML.ProgressMessage := Self.ProgressMessage;
          AFormXML.ShowProgress := Self.ShowProgress;
          AFormXML.OnProgressEvent := Self.OnProgressEvent;
          AFormXML.OnCheckProgressAbortedEvent :=
            Self.OnCheckProgressAbortedEvent;
          AFormXML.DoProcessExec;
        finally
          if Assigned(AFormXML) then
            FreeAndNil(AFormXML);
        end;
      end;
  end; // end case
end;

function TFileImport.Show: Boolean;
var
  AFormDBF: TFrmIQDBTransImportDBF;
  AFormMDB: TFrmDBTransImportMDB;
  AFormXML: TFrmDBTransImportXML;
  // AForm: TDBTransForm; // = class of TFrmDBTransHidden
begin
  Result := inherited Show;
  if not Result then
    Exit;

  CheckSQLConnectionAssigned;

  case TableType of
    // == Import a DBF or DB file == //
    dttParadox, dttDBase, dttFoxPro:
      begin
        AFormDBF := TFrmIQDBTransImportDBF.Create( DatabaseName,
          TargetTableName, TableType, ImportIntoTargetTable); // dbtimpdb.pas
        try
          AFormDBF.SQLConnection := Self.SQLConnection;
          AFormDBF.Logging := Self.Logging;
          AFormDBF.LogFile := Self.LogFile;
          AFormDBF.ErrorLogFile := Self.ErrorLogFile;
          AFormDBF.ProgressMessage := Self.ProgressMessage;
          AFormDBF.ShowProgress := Self.ShowProgress;
          AFormDBF.OnProgressEvent := Self.OnProgressEvent;
          AFormDBF.OnCheckProgressAbortedEvent :=
            Self.OnCheckProgressAbortedEvent;

          Result := AFormDBF.BatchMoveDefaultToOracle;
          if Result then
            begin
              Self.ImportIntoTargetTable := AFormDBF.ImportIntoTargetTable;
              Self.TargetTableName := AFormDBF.TargetTableName;
              Self.FieldMap.Clear;
              Self.FieldMap.AddMap(AFormDBF.FieldMap);
            end;
        finally
          if Assigned(AFormDBF) then
            FreeAndNil(AFormDBF);
        end;
      end;
    // == Import from MS Access == //
    dttMSAccess:
      begin
        AFormMDB := TFrmDBTransImportMDB.Create(Owner, DatabaseName,
          SourceTableName, UserName, Password, TargetTableName,
          ImportIntoTargetTable); // dbtimpm.pas
        try
          AFormMDB.SQLConnection := Self.SQLConnection;
          AFormMDB.Logging := Self.Logging;
          AFormMDB.LogFile := Self.LogFile;
          AFormMDB.ErrorLogFile := Self.ErrorLogFile;
          AFormMDB.OnProgressEvent := Self.OnProgressEvent;
          AFormMDB.OnCheckProgressAbortedEvent :=
            Self.OnCheckProgressAbortedEvent;
          AFormMDB.ShowProgress := Self.ShowProgress;
          Result := AFormMDB.ShowModal = mrOk;
          if Result then
            begin
              Self.SourceTableName := AFormMDB.SourceTableName;
              Self.UserName := AFormMDB.UserName;
              Self.Password := AFormMDB.Password;
              Self.ImportIntoTargetTable := AFormMDB.ImportIntoTargetTable;
              Self.TargetTableName := AFormMDB.TargetTableName;
              Self.FieldMap.Clear;
              Self.FieldMap.AddMap(AFormMDB.FieldMap);
            end;
        finally
          if Assigned(AFormMDB) then
            FreeAndNil(AFormMDB);
        end;
      end;
    // == Import XML == //
    dttXML:
      begin
        AFormXML := TFrmDBTransImportXML.Create( DatabaseName,
          SourceTableName, TargetTableName, ImportIntoTargetTable,
          TargetTableIsTemporary); // dbtimxml.pas
        try
          AFormXML.SQLConnection := Self.SQLConnection;
          AFormXML.Logging := Self.Logging;
          AFormXML.LogFile := Self.LogFile;
          AFormXML.ErrorLogFile := Self.ErrorLogFile;
          AFormXML.ProgressMessage := Self.ProgressMessage;
          AFormXML.ShowProgress := Self.ShowProgress;
          AFormXML.OnProgressEvent := Self.OnProgressEvent;
          AFormXML.OnCheckProgressAbortedEvent :=
            Self.OnCheckProgressAbortedEvent;
          Result := AFormXML.ShowModal = mrOk;
          if Result then
            begin
              Self.SourceTableName := AFormXML.SourceTableName;
              Self.ImportIntoTargetTable := AFormXML.ImportIntoTargetTable;
              Self.TargetTableName := AFormXML.TargetTableName;
            end;
        finally
          AFormXML.Release;
          AFormXML := nil;
        end;
      end;
  end; // end case
end;

{$ENDREGION 'TFileImport'}

{$REGION 'TFileExport'}

{ TFileExport }

procedure TFileExport.Initialize;
begin
  inherited;
  FDataSourceType := dstFile;
  FTableType := dttDefault;
end;

procedure TFileExport.UpdateDatabaseName;
begin
  if (FTargetTableName = '') then
    FTargetTableName := ExtractFileName(FDatabaseName);
  FDirectory := ExtractFilePath(FDatabaseName);
  FFileExt := Trim(UpperCase(ExtractFileExt(FDatabaseName)));
end;

function TFileExport.Execute: Boolean;
var
  ATableName: string;
begin
  UpdateDatabaseName;
  Result := inherited Execute;
  if not Result then
    Exit;
  CheckSQLConnectionAssigned;
  ATableName := TargetTableName;
  case TableType of
    // dttASCII:
    dttParadox, dttDBase, dttFoxPro:
      begin
        if (DatabaseName = '') then
          raise Exception.Create('Application Error:  File name not provided.');
        Result := ExportToStandardFormat(DataSet, DatabaseName, TableType,
          ShowProgress, Logging, LogFile, ErrorLogFile, OnProgressEvent,
          OnCheckProgressAbortedEvent);
      end;
    dttMSAccess:
      begin
        // Ensure provided
        if (TargetTableName = '') then
          TargetTableName := SourceTableName;

        // Prompt user
        if TargetTableName = '' then
          begin
            // IQMS.DBTrans.dbtrscstr.cTXT0000041 = 'Export into this table:'
            if not IQMS.DBTrans.dbtshare.PromptTableName( { var } ATableName,
              IQMS.DBTrans.dbtrscstr.cTXT0000041) then
              TargetTableName := ATableName
            else
              Exit;
          end;

        // Run export
        Result := ExportToMSAccess(DataSet, // source dataset
          SourceTableName, // source table name
          DatabaseName, // MS Access file (.mdb)
          TargetTableName, // target table name
          Logging, LogFile, ErrorLogFile, UserName, Password, ProgressMessage,
          ShowProgress, OnProgressEvent, OnCheckProgressAbortedEvent);
        // dbtexp.pas
      end;
    // dttMSExcel:
    dttXML:
      begin
        if (DatabaseName = '') then
          raise Exception.Create('Application Error:  File name not provided.');
        Result := ExportToXML(DataSet, DatabaseName, TargetTableName, True,
          OnProgressEvent, OnCheckProgressAbortedEvent); // dbtexp.pas
      end;
  end; // end case
end;

procedure TFileExport.UpdateConfiguration;
begin
  inherited;
  Configuration.WriteInteger(TAG_SECTION_DATAFILE, TAG_KEY_TABLETYPE,
    Ord(FTableType));
  Configuration.WriteString(TAG_SECTION_DATAFILE, TAG_KEY_DIRECTORY,
    FDirectory);
  Configuration.WriteString(TAG_SECTION_DATAFILE, TAG_KEY_FILEEXT, FileExt);
end;

procedure TFileExport.GetConfiguration(var ALines: TStringList);
var
  sl: TStringList;
begin
  if not Assigned(ALines) then
    Exit;
  ALines.Clear;
  UpdateConfiguration;
  try
    sl := TStringList.Create;
    Configuration.GetConfig(sl);
    ALines.AddStrings(sl);
  finally
    if Assigned(sl) then
      FreeAndNil(sl);
  end;
end;

procedure TFileExport.SetConfiguration(const ALines: TStringList);
begin
  if not Assigned(ALines) then
    Exit;

  inherited SetConfiguration(ALines);

  FTableType := TCustomTableType(Configuration.ReadInteger(TAG_SECTION_DATAFILE,
    TAG_KEY_TABLETYPE, 0));
end;

{$ENDREGION 'TFileExport'}

{$REGION 'TSystemImport'}

{ TSystemImport }

procedure TSystemImport.Initialize;
begin
  inherited;
  FDataSourceType := dstOracleAlias;
end;

function TSystemImport.Execute: Boolean;
var
  AForm: TFrmDBTransImportAlias;
begin
  Result := inherited Execute;
  if not Result then
    Exit;
  // Ensure we have an alias by this point
  if Trim(DatabaseName) = '' then
    Exit;
  CheckSQLConnectionAssigned;
  AForm := TFrmDBTransImportAlias.Create( DatabaseName, DataSourceType,
    UserName, Password, SourceTableName); // dbtimpa.pas
  try
    AForm.SQLConnection := Self.SQLConnection;
    AForm.Logging := Self.Logging;
    AForm.LogFile := Self.LogFile;
    AForm.ErrorLogFile := Self.ErrorLogFile;
    AForm.TargetTableName := Self.TargetTableName;
    AForm.ImportIntoTargetTable := Self.ImportIntoTargetTable;
    AForm.ProgressMessage := Self.ProgressMessage;
    AForm.ShowProgress := Self.ShowProgress;
    AForm.OnProgressEvent := Self.OnProgressEvent;
    AForm.OnCheckProgressAbortedEvent := Self.OnCheckProgressAbortedEvent;
    AForm.DoProcessExec; // run the import
  finally
    if Assigned(AForm) then
      FreeAndNil(AForm);
  end;
end;

function TSystemImport.Show: Boolean;
var
  AForm: TFrmDBTransImportAlias;
begin
  Result := inherited Show;
  if not Result then
    Exit;
  // Ensure we have an alias by this point
  if Trim(DatabaseName) = '' then
    Exit;

  CheckSQLConnectionAssigned;

  UserName := ''; // this will ensure the user logs in

  AForm := TFrmDBTransImportAlias.Create( DatabaseName, DataSourceType,
    UserName, Password, SourceTableName); // dbtimpa.pas
  try
    AForm.SQLConnection := Self.SQLConnection;
    AForm.Logging := Self.Logging;
    AForm.LogFile := Self.LogFile;
    AForm.ErrorLogFile := Self.ErrorLogFile;
    AForm.TargetTableName := Self.TargetTableName;
    AForm.ImportIntoTargetTable := Self.ImportIntoTargetTable;
    AForm.ProgressMessage := Self.ProgressMessage;
    AForm.OnProgressEvent := Self.OnProgressEvent;
    AForm.OnCheckProgressAbortedEvent := Self.OnCheckProgressAbortedEvent;
    // Display form and return result
    Result := AForm.ShowModal = mrOk;
    // If OK, then fill return values
    if Result then
      begin
        Self.SourceTableName := AForm.SourceTableName;
        Self.TargetTableName := AForm.TargetTableName;
        Self.UserName := AForm.UserName;
        Self.Password := AForm.Password;
      end;
  finally
    if Assigned(AForm) then
      FreeAndNil(AForm);
  end;
end;

{$ENDREGION 'TSystemImport'}

{$REGION 'TSystemExport'}

{ TSystemExport }

procedure TSystemExport.Initialize;
begin
  inherited;
  FDataSourceType := dstOracleAlias;
end;

function TSystemExport.Execute: Boolean;
var
  AUserName, APassword: string;
  AFileName: string;
begin
  Result := inherited Execute;
  if not Result then
    Exit;
  CheckSQLConnectionAssigned;
  AUserName := UserName;
  APassword := Password;

  if (DataSourceType = dstDSN) and (DriverType = TDriverType(0)) then
    raise Exception.Create('Application Error:  Driver Type not assigned.');

  if (DriverType = dvMicrosoftAccess) then
    begin
      AFileName := IQMS.DBTrans.dbtshare.GetJetDSNPhysicalFileName(DatabaseName);

      if (AFileName = '') then
        // 'The DSN is invalid or incomplete.  The Microsoft Jet
        // database has not been specified in the DSN.'
        raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000202);

      if not FileExists(AFileName) then
        // 'The target database, %s, referenced by the DSN could not be found.'
        raise Exception.CreateFmt(IQMS.DBTrans.dbtrscstr.cTXT0000203, [AFileName]);

      Result := ExportToMSAccess(DataSet, // source dataset
        SourceTableName, // source table name
        AFileName, // MS Access file (.mdb)
        TargetTableName, // target table name
        Logging, LogFile, ErrorLogFile, UserName, Password, ProgressMessage,
        ShowProgress, OnProgressEvent, OnCheckProgressAbortedEvent);
      // dbtexp.pas

    end
  else
    Result := ExportToAlias(Self.SQLConnection, DataSet, SourceTableName,
      DatabaseName, TargetTableName, DataSourceType, DriverType, Logging,
      LogFile, ErrorLogFile, AUserName, APassword, OnProgressEvent,
      OnCheckProgressAbortedEvent); // dbtexp.pas

  if Result then
    begin
      UserName := AUserName;
      Password := APassword;
    end;

end;

{$ENDREGION 'TSystemExport'}

{$REGION 'TTextFileImport'}

{ TTextFileImport }

procedure TTextFileImport.Initialize;
begin
  inherited;
  FDataSourceType := dstFile;
  FTableType := dttASCII;
end;

procedure TTextFileImport.UpdateConfiguration;
begin
  inherited;
  Configuration.WriteBoolean(TAG_SECTION_DATAFILE, TAG_KEY_FIRSTROWHASNAMES,
    FirstRowHasNames);
  Configuration.WriteBoolean(TAG_SECTION_DATAFILE, TAG_KEY_AUTOFIELDTYPE,
    FAutoFieldType);
  Configuration.WriteString(TAG_SECTION_SCHEMA, TAG_KEY_SCHEMATEXT, SchemaText);
end;

procedure TTextFileImport.GetConfiguration(var ALines: TStringList);
var
  sl: TStringList;
begin
  if not Assigned(ALines) then
    Exit;
  ALines.Clear;
  UpdateConfiguration;
  try
    sl := TStringList.Create;
    Configuration.GetConfig(sl);
    ALines.AddStrings(sl);
  finally
    if Assigned(sl) then
      FreeAndNil(sl);
  end;
end;

procedure TTextFileImport.SetConfiguration(const ALines: TStringList);
begin
  if not Assigned(ALines) then
    Exit;

  inherited SetConfiguration(ALines);

  FirstRowHasNames := Configuration.ReadBoolean(TAG_SECTION_DATAFILE,
    TAG_KEY_FIRSTROWHASNAMES, False);
  FAutoFieldType := Configuration.ReadBoolean(TAG_SECTION_DATAFILE,
    TAG_KEY_AUTOFIELDTYPE, False);
  SchemaText := Configuration.ReadString(TAG_SECTION_SCHEMA,
    TAG_KEY_SCHEMATEXT, '');
end;

procedure TTextFileImport.SetSchemaText(const Value: string);
var
  sl: TStringList;
begin
  try
    sl := TStringList.Create;
    sl.Text := Value;
    FSchemaText := sl.Text;
  finally
    if Assigned(sl) then
      FreeAndNil(sl);
  end;
end;

function TTextFileImport.Execute: Boolean;
var
  AFormAscii: TFrmIQDBTransImportTextFile;
  AFormExcel: TFrmIQDBTransImportExcel;
begin
  Result := inherited Execute;
  if not Result then
    Exit;
  // Ensure we have a file by this point
  if not FileExists(DatabaseName) then
    Exit;
  CheckSQLConnectionAssigned;
  case TableType of
    // == Import a text file == //
    dttASCII:
      begin
        AFormAscii := TFrmIQDBTransImportTextFile.Create(Owner, DatabaseName,
          FirstRowHasNames); // dbtimptx.pas
        try
          AFormAscii.SQLConnection := Self.SQLConnection;
          AFormAscii.DatabaseName := Self.DatabaseName;
          AFormAscii.Logging := Self.Logging;
          AFormAscii.LogFile := Self.LogFile;
          AFormAscii.ErrorLogFile := Self.ErrorLogFile;
          AFormAscii.ImportIntoTargetTable := Self.ImportIntoTargetTable;
          AFormAscii.TargetTableName := Self.TargetTableName;
          AFormAscii.Schema := Self.SchemaText;
          AFormAscii.ShowProgress := Self.ShowProgress;
          AFormAscii.OnProgressEvent := Self.OnProgressEvent;
          AFormAscii.OnCheckProgressAbortedEvent :=
            Self.OnCheckProgressAbortedEvent;
          AFormAscii.DoRefreshTextFileData; // 09/12/2006
          AFormAscii.DoProcessExec; // run the import
        finally
          if Assigned(AFormAscii) then
            FreeAndNil(AFormAscii);
        end;
      end;
    // == Import from MS Excel == //
    dttMSExcel:
      begin
        AFormExcel := TFrmIQDBTransImportExcel.Create(Owner, DatabaseName,
          SourceTableName, ImportIntoTargetTable, TargetTableName,
          FirstRowHasNames, AutoFieldType); // dbtimpx.pas
        try
          AFormExcel.SQLConnection := Self.SQLConnection;
          AFormExcel.Logging := Self.Logging;
          AFormExcel.LogFile := Self.LogFile;
          AFormExcel.ErrorLogFile := Self.ErrorLogFile;
          AFormExcel.SuppressPrompts := Self.SuppressPrompts;
          AFormExcel.ProgressMessage := Self.ProgressMessage;
          AFormExcel.ShowProgress := Self.ShowProgress;
          AFormExcel.FieldMap.Clear;
          AFormExcel.FieldMap.AddMap(Self.FieldMap);
          AFormExcel.OnProgressEvent := Self.OnProgressEvent;
          AFormExcel.OnCheckProgressAbortedEvent :=
            Self.OnCheckProgressAbortedEvent;
          AFormExcel.DoProcessExec;
        finally
          if Assigned(AFormExcel) then
            FreeAndNil(AFormExcel);
        end;
      end;
  end; // end case

end;

function TTextFileImport.Show: Boolean;
var
  AFormAscii: TFrmIQDBTransImportTextFile;
  AFormExcel: TFrmIQDBTransImportExcel;
begin
  Result := inherited Show;
  if not Result then
    Exit;
  // Ensure we have a file by this point
  if not FileExists(DatabaseName) then
    Exit;

  CheckSQLConnectionAssigned;

  case TableType of
    // == Import a text file == //
    dttASCII:
      begin
        // check the file name
        AFormAscii := TFrmIQDBTransImportTextFile.Create(Owner, DatabaseName,
          FirstRowHasNames); // dbtimptx.pas
        try
          AFormAscii.SQLConnection := Self.SQLConnection;
          AFormAscii.DatabaseName := Self.DatabaseName;
          AFormAscii.Logging := Self.Logging;
          AFormAscii.LogFile := Self.LogFile;
          AFormAscii.ErrorLogFile := Self.ErrorLogFile;
          AFormAscii.ImportIntoTargetTable := Self.ImportIntoTargetTable;
          AFormAscii.TargetTableName := Self.TargetTableName;
          AFormAscii.Schema := Self.SchemaText;
          AFormAscii.ShowProgress := Self.ShowProgress;
          AFormAscii.ProgressMessage := Self.ProgressMessage;
          AFormAscii.OnProgressEvent := Self.OnProgressEvent;
          AFormAscii.OnCheckProgressAbortedEvent :=
            Self.OnCheckProgressAbortedEvent;
          Result := AFormAscii.ShowModal = mrOk;
          if Result then
            begin
              Self.FirstRowHasNames := AFormAscii.FirstRowHasNames;
              Self.SchemaText := AFormAscii.Schema;
              Self.ImportIntoTargetTable := AFormAscii.ImportIntoTargetTable;
              Self.TargetTableName := AFormAscii.TargetTableName;
            end;
        finally
          if Assigned(AFormAscii) then
            FreeAndNil(AFormAscii);
        end;
      end;
    // == Import from MS Excel == //
    dttMSExcel:
      begin
        // Dev Note:  This does not save the field map!
        AFormExcel := TFrmIQDBTransImportExcel.Create(Owner, DatabaseName,
          SourceTableName, ImportIntoTargetTable, TargetTableName,
          FirstRowHasNames, AutoFieldType); // dbtimpx.pas
        try
          AFormExcel.SQLConnection := Self.SQLConnection;
          AFormExcel.Logging := Self.Logging;
          AFormExcel.LogFile := Self.LogFile;
          AFormExcel.ErrorLogFile := Self.ErrorLogFile;
          AFormExcel.SuppressPrompts := Self.SuppressPrompts;
          AFormExcel.ProgressMessage := Self.ProgressMessage;
          AFormExcel.ShowProgress := Self.ShowProgress;
          AFormExcel.OnProgressEvent := Self.OnProgressEvent;
          AFormExcel.OnCheckProgressAbortedEvent :=
            Self.OnCheckProgressAbortedEvent;
          Result := AFormExcel.ShowModal = mrOk;
          if Result then
            begin
              Self.SourceTableName := AFormExcel.SourceTableName;
              Self.AutoFieldType := AFormExcel.EstimateFieldTypes;
              Self.FirstRowHasNames := AFormExcel.FirstRowHasNames;
              Self.FieldMap.Clear;
              Self.FieldMap.AddMap(AFormExcel.FieldMap);
            end;
        finally
          if Assigned(AFormExcel) then
            FreeAndNil(AFormExcel);
        end;
      end;
  end; // end case
end;

procedure TTextFileExport.SetSchemaText(const Value: string);
var
  sl: TStringList;
begin
  try
    sl := TStringList.Create;
    sl.Text := Value;
    FSchemaText := sl.Text;
  finally
    if Assigned(sl) then
      FreeAndNil(sl);
  end;
end;

function TTextFileExport.Execute: Boolean;
begin
  Result := inherited Execute;
  if not Result then
    Exit;
  CheckSQLConnectionAssigned;
  case TableType of
    dttASCII:
      begin
        if (DatabaseName = '') then
          raise Exception.Create('Application Error:  File name not provided.');

        if UpperCase(ExtractFileExt(DatabaseName)) = '.CSV' then
          Result := ExportToCSV(DataSet, DatabaseName, ShowProgress,
            OnProgressEvent, OnCheckProgressAbortedEvent)
        else
          Result := ExportToAscii(SQLConnection, DataSet, SourceTableName,
            DatabaseName, Logging, LogFile, ErrorLogFile, ShowProgress,
            ProgressMessage, SuppressPrompts, True { ExecuteImmediate } ,
            OnProgressEvent, OnCheckProgressAbortedEvent); // dbtexp
      end;
    dttMSExcel:
      begin
        if (DatabaseName = '') then
          raise Exception.Create('Application Error:  File name not provided.');

        Result := ExportToExcel(DataSet, // Source
          SourceTableName, // Source Table Name
          DatabaseName, // Target File
          Logging, // Logging
          LogFile, // Log File
          ErrorLogFile, // Error Log File
          ProgressMessage, // Progress Message
          ShowProgress, // Show Progress
          SuppressPrompts, // Suppress Prompts
          OnProgressEvent, OnCheckProgressAbortedEvent); // dbtexp.pas
      end;
  end; // end case
end;

procedure TTextFileExport.UpdateConfiguration;
begin
  inherited;

  Configuration.WriteBoolean(TAG_SECTION_DATAFILE, TAG_KEY_FIRSTROWHASNAMES,
    FirstRowHasNames);
  Configuration.WriteBoolean(TAG_SECTION_DATAFILE, TAG_KEY_AUTOFIELDTYPE,
    FAutoFieldType);
  Configuration.WriteString(TAG_SECTION_SCHEMA, TAG_KEY_SCHEMATEXT, SchemaText);
end;

procedure TTextFileExport.GetConfiguration(var ALines: TStringList);
var
  sl: TStringList;
begin
  if not Assigned(ALines) then
    Exit;
  ALines.Clear;
  UpdateConfiguration;
  try
    sl := TStringList.Create;
    Configuration.GetConfig(sl);
    ALines.AddStrings(sl);
  finally
    if Assigned(sl) then
      FreeAndNil(sl);
  end;
end;

procedure TTextFileExport.SetConfiguration(const ALines: TStringList);
begin
  if not Assigned(ALines) then
    Exit;

  inherited SetConfiguration(ALines);

  FirstRowHasNames := Configuration.ReadBoolean(TAG_SECTION_DATAFILE,
    TAG_KEY_FIRSTROWHASNAMES, False);
  FAutoFieldType := Configuration.ReadBoolean(TAG_SECTION_DATAFILE,
    TAG_KEY_AUTOFIELDTYPE, False);
  SchemaText := Configuration.ReadString(TAG_SECTION_SCHEMA,
    TAG_KEY_SCHEMATEXT, '');
end;

{$ENDREGION 'TTextFileImport'}

{$REGION 'TXMLConfig'}

{ TXMLConfig }

constructor TXMLConfig.Create(const AOwner: TComponent);
var
  node: IXMLNode;
begin
  inherited Create(AOwner);
  FXMLDoc := TXMLDocument.Create(Self); // iqdbexpress
  FXMLDoc.SetSubComponent(True);
  FXMLDoc.Options := [doNodeAutoIndent];
  FXMLDoc.Active := True;
  node := FXMLDoc.AddChild(TAG_DATA_EXCHANGE_ROOT);
  node.AddChild(TAG_SECTION_CLASS);
  node.AddChild(TAG_SECTION_CONFIGURATION);
  node.AddChild(TAG_SECTION_NOTIFICATION);
  node.AddChild(TAG_SECTION_LOGGING);
end;

destructor TXMLConfig.Destroy;
begin
  FXMLDoc.Destroy;
  inherited;
end;

function TXMLConfig.ReadBoolean(const Section, Key: string;
  default: Boolean): Boolean;
begin
  Result := Boolean(ReadInteger(Section, Key, Integer(default)));
end;

function TXMLConfig.ReadInteger(const Section, Key: string;
  default: Integer): Integer;
begin
  Result := StrToInt(ReadString(Section, Key, IntToStr(default)));
end;

function TXMLConfig.ReadString(const Section, Key, default: string): string;
var
  node: IXMLNode;
begin
  Result := '';

  if not Assigned(FXMLDoc) or not Assigned(FXMLDoc.DocumentElement) or
    not Assigned(FXMLDoc.DocumentElement.ChildNodes) then
    Exit;

  node := FXMLDoc.DocumentElement.ChildNodes.FindNode(Section);
  if Assigned(node) and node.HasAttribute(Key) then
    Result := node.Attributes[Key]
  else
    Result := default;
end;

procedure TXMLConfig.GetConfig(var ALines: TStringList);
begin
  if not Assigned(ALines) then
    Exit;
  ALines.Clear;
  ALines.AddStrings(FXMLDoc.XML);
end;

procedure TXMLConfig.SetConfig(const ALines: TStringList);
begin
  if not Assigned(ALines) then
    Exit;

  if not Assigned(FXMLDoc) or not Assigned(FXMLDoc.XML) then
    Exit;

  FXMLDoc.XML.Clear;
  FXMLDoc.XML.AddStrings(ALines);
  FXMLDoc.Active := True;
end;

procedure TXMLConfig.WriteBoolean(const Section, Key: string; Value: Boolean);
begin
  WriteInteger(Section, Key, Integer(Value));
end;

procedure TXMLConfig.WriteInteger(const Section, Key: string; Value: Integer);
begin
  WriteString(Section, Key, IntToStr(Value));
end;

procedure TXMLConfig.WriteString(const Section, Key, Value: string);
var
  node: IXMLNode;
begin
  if not Assigned(FXMLDoc) or not Assigned(FXMLDoc.DocumentElement) or
    not Assigned(FXMLDoc.DocumentElement.ChildNodes) then
    Exit;

  if ReadString(Section, Key, '') = Value then
    Exit;
  node := FXMLDoc.DocumentElement.ChildNodes.FindNode(Section);
  if not Assigned(node) then
    node := FXMLDoc.DocumentElement.AddChild(Section);
  node.Attributes[Key] := Value;
end;

function TXMLConfig.GetLines: TStrings;
begin
  Result := FXMLDoc.XML;
end;

{$ENDREGION 'TXMLConfig'}

end.

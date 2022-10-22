{ ******************************************************* }
{ }
{ Constants, types and record definitions for }
{ IQDBTRANS }
{ }
{ ******************************************************* }

unit IQMS.DBTrans.dbttypes;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  IQMS.Common.Registry,
  DB;

const
  tfoNone = DWORD($000000);
  tfoFirstRowHasNames = DWORD($000008);
  tfoAutoFieldType = DWORD($000010);

type
  { TOperationType }
  TOperationType = (otExport, otImport);

  { TCustomTableType }
  TCustomTableType = (dttDefault, // 0
    dttParadox, // 1
    dttDBase, // 2
    dttFoxPro, // 3
    dttASCII, // 4
    dttMSAccess, // 5
    dttMSExcel, // 6
    dttXML, // 7
    dttSQLite); //8
  { TDataSourceType }
  // OLD:  TDataSourceType = (dstAlias, dstFile);
  TDataSourceType = (dstUnknown, dstDSN, dstOracleAlias, dstFile);

  { TDriverType }
  TDriverType = (dvUnknown, dvDB2, dvIB, dvInformix, dvMicrosoftSQL, dvMySQL,
    dvOracle, dvMicrosoftAccess, dvAdaptiveServerAnywhere);

  { TTransferOptions }
  // If you add params, be sure to update PrepareTransferOptions and CopyTransferOptions below
  TTransferOptions = record
    Operation: TOperationType; // otExport, otImport
    DataSourceType: TDataSourceType; // dsn, oracle sid, or file
    DriverType: TDriverType; // DSN driver type
    // DatabaseName = Either the ODBC DSN, the Oracle SID, or the file name,
    // depending on the DataSourceType.
    DatabaseName: string;
    SourceTableName: string; // source table name
    CustomTableType: TCustomTableType; // custom table type
    ProgressMessage: string;
    UserName: string; // User name to pass to connection
    Password: string; // Password to pass to connection

    TargetTableName: string;
    ImportIntoTargetTable: Boolean; // Are we importing into a target table?
    TargetTableIsTemporary: Boolean; // Set target table as temporary

    // Text files
    { Options include the following constants:
      tfoFirstRowHasNames (text file contains field names in first row)
      tfoAutoFieldType    (Excel - automatically determine field types)
      To set or add options, do this:
      TextFileOptions := TextFileOptions + tfoFirstRowHasNames;
      To get options, do this:
      if (TextFileOptions and tfoFirstRowHasNames = tfoFirstRowHasNames) then
      ... // do something
      To clear options, do this:
      TextFileOptions := tfoNone;
    }
    TextFileOptions: Word;
    TextFileSchema: string; // schema for text files

    // log files
    Logging: Boolean;
    LogFile: TFileName;
    ErrorLogFile: TFileName;
    SuppressPrompts: Boolean; // suppress informational dialogs
    FieldMapText: string;
  end;

type
  { TSelectedDatabase }
  TSelectedDatabase = record
    DataSourceType: TDataSourceType;
    DatabaseName: string; // alias or file name
    FileExt: string; // if file, then extension
    CustomTableType: TCustomTableType;
    TableName: string; // optional; only as it applies
    // For table name prompt.  This is used when prompting for a MS Access table
    SuggestedTableName: string;
    // TDriverType = for exports to a DSN.
    DriverType: TDriverType;
  end;

type
  { TFieldData }
  TFieldData = packed record
    FieldName: string;
    FieldSize: Integer;
    DataType: TFieldType;
    DisplayLabel: string;
    Visible: Boolean;
    index: Integer;
    ShortFieldName: string; // for dBase
  end;

type
  { TFieldData }
  TFieldDataDef = packed record
    FieldName: string;
    FieldSize: Integer;
    DataType: TFieldType;
    DisplayLabel: string;
    Visible: Boolean;
    index: Integer;
    OraDataType: string;
    OraSize: Integer;
    OraPrecision: Integer;
    OraDefinition: string;
  end;

type
  { TFieldDataArray }
  TFieldDataArray = array of TFieldData;

type
  { Callback methods }
  { TOnProgressEvent }
  TOnProgressEvent = procedure(const AMaxPos, ACurPos: Integer;
    const AMsgText: string) of object;
  { TCheckProgressAbortedEvent }
  TCheckProgressAbortedEvent = function: Boolean of object;

procedure PrepareTransferOptions(var ATransferOptions: TTransferOptions);
procedure CopyTransferOptions(const ASource: TTransferOptions;
  var ATarget: TTransferOptions);

function GetCustomTableType(const AFileName: string): TCustomTableType;
function GetCustomTableTypeExt(const AExtension: string): TCustomTableType;

procedure ClearSelectedDatabaseRec(var ASelectedDatabase: TSelectedDatabase);
procedure CopySelectedDatabase(const ASource: TSelectedDatabase;
  var ATarget: TSelectedDatabase);

procedure CopyFieldToFieldData(const AField: TField;
  var AFieldData: TFieldData);
procedure CopyFieldDefToFieldData(const AFieldDef: TFieldDef;
  var AFieldData: TFieldData);
procedure CopyFieldDataToFieldDataDef(const AFieldData: TFieldData;
  var AFieldDataDef: TFieldDataDef);

const
  CustomTableType: array [TCustomTableType] of string = ('Default', 'Paradox',
    'DBase', 'FoxPro', 'Text File', 'Microsoft Access',
    'Microsoft Excel', 'XML', 'SQLite');

  CustomTableType2: array [TCustomTableType] of string = ('Default', 'Paradox',
    'DBase', 'FoxPro', 'Comma-Delimited Text File', 'Microsoft Access',
    'Microsoft Excel', 'XML', 'SQLite');

  CustomTableExt: array [TCustomTableType] of string = ('', '.db', '.dbf',
    '.db', '.txt', '.mdb', '.xls', '.xml', '.SQLite3');

  ConnectionName: array [TDriverType] of string = ('', // dvUnknown
    'IBM DB2', // dvDB2
    'InterBase', // dvIB
    'Informix', // dvInformix
    'SQL Server', // dvMicrosoftSQL
    'MySQL', // dvMySQL
    'Oracle', // dvOracle
    'Microsoft Access', // dvMicrosoftAccess
    'Adaptive Server Anywhere'); // dvAdaptiveServerAnywhere

  // This lists the drivers we support (because we have tested them).
  SupportedDriverTypes = [dvOracle, dvMicrosoftAccess,
    dvAdaptiveServerAnywhere];

implementation

uses
  IQMS.Common.StringUtils;

procedure PrepareTransferOptions(var ATransferOptions: TTransferOptions);
begin
  ZeroMemory(@ATransferOptions, SizeOf(TTransferOptions));
  with ATransferOptions do
    begin
      ImportIntoTargetTable := True; // default to True
    end;
end;

procedure CopyTransferOptions(const ASource: TTransferOptions;
  var ATarget: TTransferOptions);
begin
  ATarget.Operation := ASource.Operation;
  ATarget.DataSourceType := ASource.DataSourceType;
  ATarget.DriverType := ASource.DriverType;
  ATarget.DatabaseName := ASource.DatabaseName;
  ATarget.SourceTableName := ASource.SourceTableName;
  ATarget.TargetTableName := ASource.TargetTableName;
  ATarget.ImportIntoTargetTable := ASource.ImportIntoTargetTable;
  ATarget.TargetTableIsTemporary := ASource.TargetTableIsTemporary;
  ATarget.CustomTableType := ASource.CustomTableType;
  ATarget.ProgressMessage := ASource.ProgressMessage;
  ATarget.UserName := ASource.UserName;
  ATarget.Password := ASource.Password;
  ATarget.TextFileOptions := ASource.TextFileOptions;
  ATarget.Logging := ASource.Logging;
  ATarget.LogFile := ASource.LogFile;
  ATarget.ErrorLogFile := ASource.ErrorLogFile;
  ATarget.SuppressPrompts := ASource.SuppressPrompts;
  ATarget.FieldMapText := ASource.FieldMapText;
end;

function GetCustomTableType(const AFileName: string): TCustomTableType;
begin
  Result := GetCustomTableTypeExt(ExtractFileExt(AFileName)); // see below
end;

function GetCustomTableTypeExt(const AExtension: string): TCustomTableType;
var
  AUseExt: string;
begin
  Result := TCustomTableType(0);

  AUseExt := UpperCase(Trim(AExtension));
  if AUseExt = '' then
    Exit;

  if (AUseExt = '.DBF') then
    Result := dttDBase
  else if (AUseExt = '.DB') then
    Result := dttParadox
  else if (AUseExt = '.TXT') or (AUseExt = '.CSV') then
    Result := dttASCII
  else if IQMS.Common.StringUtils.StrInList(AUseExt, ['.MDB', '.MDE', '.ACCDB', '.ACCDE']) then
    Result := dttMSAccess
  else if IQMS.Common.StringUtils.StrInList(AUseExt, ['.XLS', '.XLSX', '.XLSM', '.XLTX',
    '.XLTM', '.XLSB']) then
    Result := dttMSExcel
  else if (AUseExt = '.XML') then
    Result := dttXML
  else
    Result := dttDefault;
end;

procedure ClearSelectedDatabaseRec(var ASelectedDatabase: TSelectedDatabase);
begin
  with ASelectedDatabase do
    begin
      DataSourceType := TDataSourceType(0);
      DatabaseName := '';
      FileExt := '';
      CustomTableType := TCustomTableType(0);
      TableName := '';
      SuggestedTableName := '';
      DriverType := TDriverType(0);
    end;
end;

procedure CopySelectedDatabase(const ASource: TSelectedDatabase;
  var ATarget: TSelectedDatabase);
begin
  ATarget.DataSourceType := ASource.DataSourceType;
  ATarget.DatabaseName := ASource.DatabaseName;
  ATarget.FileExt := ASource.FileExt;
  ATarget.CustomTableType := ASource.CustomTableType;
  ATarget.TableName := ASource.TableName;
  ATarget.SuggestedTableName := ASource.SuggestedTableName;
  ATarget.DriverType := ASource.DriverType;
end;

procedure CopyFieldToFieldData(const AField: TField;
  var AFieldData: TFieldData);
begin
  AFieldData.FieldName := AField.FieldName;
  AFieldData.FieldSize := AField.Size;
  AFieldData.DataType := AField.DataType;
  AFieldData.DisplayLabel := AField.DisplayLabel;
  AFieldData.Visible := AField.Visible;
  AFieldData.Index := AField.Index;
end;

procedure CopyFieldDefToFieldData(const AFieldDef: TFieldDef;
  var AFieldData: TFieldData);
begin
  AFieldData.FieldName := AFieldDef.Name;
  AFieldData.FieldSize := AFieldDef.Size;
  AFieldData.DataType := AFieldDef.DataType;
  AFieldData.DisplayLabel := AFieldDef.DisplayName;
  AFieldData.Visible := True;
  AFieldData.Index := AFieldDef.Index;
end;

procedure CopyFieldDataToFieldDataDef(const AFieldData: TFieldData;
  var AFieldDataDef: TFieldDataDef);
begin
  AFieldDataDef.FieldName := AFieldData.FieldName;
  AFieldDataDef.FieldSize := AFieldData.FieldSize;
  AFieldDataDef.DataType := AFieldData.DataType;
  AFieldDataDef.DisplayLabel := AFieldData.DisplayLabel;
  AFieldDataDef.Visible := AFieldData.Visible;
  AFieldDataDef.Index := AFieldData.Index;
  AFieldDataDef.OraDefinition := '';
  AFieldDataDef.OraDataType := '';
  AFieldDataDef.OraSize := AFieldData.FieldSize;
  AFieldDataDef.OraPrecision := 0;
end;

end.

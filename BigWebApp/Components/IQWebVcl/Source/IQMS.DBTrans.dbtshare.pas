{ ******************************************************* }
{ }
{ Shared methods used in the import/export process. }
{ }
{ See dbtfields.pas for field-related methods. }
{ }
{ ******************************************************* }

unit IQMS.DBTrans.dbtshare;

interface

uses
  Windows,
  Forms,
  Dialogs,
  Messages,
  SysUtils,
  Classes,
  Controls,
  IQMS.Common.Registry,
  IQMS.Common.DataConst,
  DB,
  Variants,
  IQMS.DBTrans.dbttypes,
  ADODB,
  FMTBcd,
  SqlExpr,
  IQMS.WebVcl.DBExpress,
  Grids,
  FireDAC.Stan.Param,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniBasicGrid,
  uniStringGrid;

// Fix field name string, returning valid field name text
function GetFieldName(const AFieldName: string): string;

// Returns list of DSN names
procedure GetAliasNamesEx(List: TStrings);
procedure GetAliasNames(List: TStrings);
// Returns list of Oracle SID's
procedure GetTNSListenerNames(List: TStrings);

procedure GetFieldDataArray(DataSet: TDataSet; var AArray: TFieldDataArray); overload;
procedure GetFieldDataArray(ATableName: string; var AArray: TFieldDataArray); overload;

function GetFieldDataDefinition(const AFieldData: TFieldData;
  var AFieldDataDef: TFieldDataDef): Boolean;
function GetFieldDefinition(AFieldData: TFieldData;
  var ADefinition: string): Boolean;
function GetTFieldDefinition(AField: TField; var ADefinition: string): Boolean;

// Returns the physical file that this Jet DSN points to.
{ IFDEF UNICODE }
// function GetJetDSNPhysicalFileName(const ADSN: AnsiString): AnsiString;
{ ELSE }
function GetJetDSNPhysicalFileName(const ADSN: string): string;
{ ENDIF }
function CreateOracleView(const ASQLConnection: TSQLConnection;
  const AViewName: string; const AViewBodySQL: TStringList): Boolean;

function CreateOracleTable(ADataSet: TDataSet; ANewTableName: string;
  ATemporary: Boolean): Boolean;

{ GetOracleCreateTableSQL()
  Purpose: Returns SQL that will create an Oracle table, based on the
  provided dataset.
  Parameters:
  ADataSet = The dataset on which the SQL should be based.  The field
  definition will be based on the dataset fields.
  ANewTableName = The name of the new table.
  ATemporary = If true, this will be a temporary, Oracle table.
  ASQL = Returns the SQL.
  AIncludeFields = A list of fields to be included.  Any field in the
  dataset that is not in the list will be skipped.
}
function GetOracleCreateTableSQL(const ADataSet: TDataSet;
  const ANewTableName: string; const ATemporary: Boolean; var ASQL: TStringList;
  AIncludeFields: TStringList = nil): Boolean;
function GetJetCreateTableSQL(const ADataSet: TDataSet;
  const ANewTableName: string; var ASQL: TStringList;
  AIncludeFields: TStringList = nil): Boolean;

function GetMicrosoftJetTableDefinition(const ADataSet: TDataSet;
  const ANewTableName: string; var ADefinition: TStringList): Boolean;

function GetSQLServerCreateTableSQL(const ADataSet: TDataSet;
  const ANewTableName: string; var ASQL: TStringList;
  AIncludeFields: TStringList = nil): Boolean;

function GetDB2CreateTableSQL(const ADataSet: TDataSet;
  const ANewTableName: string; var ASQL: TStringList;
  AIncludeFields: TStringList = nil): Boolean;

function GetInterbaseCreateTableSQL(const ADataSet: TDataSet;
  const ANewTableName: string; var ASQL: TStringList;
  AIncludeFields: TStringList = nil): Boolean;

function GetInformixCreateTableSQL(const ADataSet: TDataSet;
  const ANewTableName: string; var ASQL: TStringList;
  AIncludeFields: TStringList = nil): Boolean;

function GetMySQLCreateTableSQL(const ADataSet: TDataSet;
  const ANewTableName: string; var ASQL: TStringList;
  AIncludeFields: TStringList = nil): Boolean;

function CreateOracleTableByDef(const ASQLConnection: TSQLConnection;
  const AFieldList: TFieldDataArray; const ANewTableName: string;
  const ATemporary: Boolean): Boolean;

function CreateDBaseTableByDef(AFieldList: TFieldDataArray; AFileName: string;
  ATableType: TCustomTableType = dttDBase): Boolean;

// Returns table primary key field name (TablePK, PK)
function GetTablePrimaryKey(const ATableName: string): string;

// procedure DropTable(ATableName: String);
// procedure DropView(AViewName: String);

function TableExists(ASQLConnection: TSQLConnection;
  ATableName: string): Boolean;
function ViewExists(ASQLConnection: TSQLConnection; AViewName: string): Boolean;
function OracleObjectExists(ASQLConnection: TSQLConnection;
  AObjectName: string): Boolean;

procedure DropTable(SQLConnection: TSQLConnection; ATableName: string);
procedure DropView(SQLConnection: TSQLConnection; AViewName: string);

procedure DeleteSchemaFiles;
function ValidFieldName(const AFieldName: string; var AError: string): Boolean;
function IsForbiddenField(AFieldName: string): Boolean;
function CheckValidFields(ADataSet: TDataSet): Boolean;

function IQViewExists(SQLConnection: TSQLConnection;
  const ViewName: string): Boolean;
function IQTableExists(SQLConnection: TSQLConnection;
  const ATableName: string): Boolean;
function IQOracleObjectExists(SQLConnection: TSQLConnection;
  const AObjectName: string): Boolean;

function GetPrimaryKey(SQLConnection: TSQLConnection;
  const ATableName: string): string;

// Prompts for a table name.  Before returning true,
// user must enter a valid table.  Reserved words for
// Microsoft Jet and Oracle are checked.
function PromptTableName(var ATableName: string; const APrompt: string = '')
  : Boolean; overload;

// Prompts for Oracle table name for use in IQMS database.
function PromptTableName(ASQLConnection: TSQLConnection; var ATableName: string;
  const APrompt: string = ''; AForceUpperCase: Boolean = True)
  : Boolean; overload;

// used for parsing a lookup type of key
procedure ParseLookupKeySQL(const ASQL: string; var ALookupTable, AResultField,
  ALookupField, ALookupKey: string);
// For Advanced SQL lookups.  If the user included a lookup field from the current
// table, return it.
// function ParseLookupKeyFieldNameInSQLText(const ASQL: String): String;
function ValidDataFileName(AFileName: TFileName): Boolean;

// parses SQL entered in a lookup on the Fieldkeys screen
function ParseLookupSQL(const ADataSet: TDataSet; const ARawSQL: string;
  var AParsedSQL: string): Boolean;

// Returns Query text (i.e., for a log), with params filled with values
// This is necessary since we are using parameterized queries.
procedure GetParsedSQL(ADataSet: TDataSet; const AParams: TParams;
  const SQL: TStrings; var ASQLText: string); overload;
procedure GetParsedSQL(ADataSet: TDataSet; const AParams: TParameters;
  const SQL: TStrings; var ASQLText: string); overload;
procedure GetParsedSQL(ADataSet: TDataSet; const AParams: TFDParams;
  const SQL: TStrings; var ASQLText: string); overload;
procedure GetParsedSQL(AQuery: TSQLQuery; var ASQLText: string); overload;
procedure GetParsedSQL(AQuery: TIQWebDbxQuery; var ASQLText: string); overload;
procedure GetParsedSQL(AQuery: TADOQuery; var ASQLText: string); overload;
procedure GetParsedSQL(AQuery: TFDQuery; var ASQLText: string); overload;

procedure SplitOracleCmdTextIntoWords(const AText: string;
  AWordList: TStringList);

// Returns True if the SQL represents an "action" query
function IsActionQuery(const ASQL: string): Boolean;

// Runs Jet SQL containing params
procedure ExecuteJetSQLWithParams(const ASourceData: TADOQuery;
  // Data set containing data to be plugged into params
  const ATargetConnection: TADOConnection; // Target connection
  const ASQL: string; // Complete SQL to run, containing params
  // * Key Fields and Values are param values you want to use instead of the
  // values contained in the ASourceData.
  const AKeyFields: array of string; // Key fields, if any
  const AKeyValues: array of Real); // Key values, if any

// Similar to CommaText, but more reliable
function GetDelimText(const AStringList: TStringList;
  const ADelim: string = ' ' { Space } ): string;

function StartEndText(const AStart, AEnd: TDateTime): string;

// procedure GetDBFieldList(ASelectedDatabase: TSelectedDatabase; AUserName, APassWord: String;
// var AFieldList: TStringList);

// Wraps text, but also indents each wrapped line by the specified
// indent value.
function BlockWrapText(const S: string; const AIndent: Integer): string;

procedure PopulatePreviewGrid(AOwner: TComponent; ADataSet: TDataSet;
  AStringGrid: TUniStringGrid; AMaxRows: Integer = 50);

// Returns comma text.  Data chunks are not wrapped in double quotation
// marks, but are returned "as is."
function GetStrictCommaText(const AStringList: TStringList): string;

function MaxFieldNameSize(const ATableType: TCustomTableType): Byte;

procedure DebugListFieldTypes(const ADataSet: TDataSet; var AList: TStringList);
procedure DebugListParamTypes(const AParams: TParams; var AList: TStringList);

function GetRecordCount(const ADataSet: TDataSet): Integer;

procedure InitSQLConnections(const AOwner: TComponent;
  const ASQLConnection: TSQLConnection; const AActive: Boolean);

const
  constNUMBERS = ['0' .. '9'];
  constLOWER = ['a' .. 'z'];
  constUPPER = ['A' .. 'Z'];
  constSPECIAL = ['_', ':'];
  constVALID_CHARS = constNUMBERS + constLOWER + constUPPER + constSPECIAL;

implementation

uses
  Character,
  IQMS.DBTrans.dbtado,
  IQMS.DBTrans.dbtdbexp,
  IQMS.DBTrans.dbtdsn,
  IQMS.DBTrans.dbtrscstr,
  IQMS.DBTrans.dbtfields,
  IQMS.Common.ErrorDialog,
  IQMS.Common.InputQuery,
  IQMS.Common.DataLib,
  IQMS.Common.FileUtils,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.ProgressDialog,
  IQMS.Common.Screen,
  IQMS.Common.StringUtils,
  StrUtils,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication;

{ ---------------------------------------------------------------------------- }
{ Internal Methods }
{ ---------------------------------------------------------------------------- }
procedure ShowErrorMsg_UnsupportedFieldType(const AFieldName: string;
  const AFieldType: TFieldType);
begin
  // IQMS.DBTrans.dbtrscstr.cTXT0000211 = 'The field, %s, is of an unknown or
  // unsupported type (%s).'
  IQError(Format(IQMS.DBTrans.dbtrscstr.cTXT0000211, [AFieldName,
    DB.FieldTypeNames[AFieldType]]));
end;

{ End Internal methods }
{ ---------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------- }

function GetFieldName(const AFieldName: string): string;
var
  i: Integer;
  ATempStrA, ATempStrB: string;
begin
  Result := UpperCase(AFieldName);
  Result := IQMS.Common.StringUtils.RemoveWhiteSpace(Result, '_');
  // Note:  Do not call IQMS.Common.StringUtils.AlphaNumeric() because we want
  // to keep the underscore characters.
  ATempStrA := Result;
  ATempStrB := '';
  for i := 1 to Length(ATempStrA) do
    if (ATempStrA[i] = '_') or Windows.IsCharAlphaNumeric(ATempStrA[i]) then
      ATempStrB := ATempStrB + ATempStrA[i];
  Result := ATempStrB;
end;

function GetFieldDataDefinition(const AFieldData: TFieldData;
  var AFieldDataDef: TFieldDataDef): Boolean;

  function _GetStandardSize(const nSize: Integer): Integer;
  var
    n: Integer;
  begin
    Result := nSize;
    Exit;

    n := IQMS.Common.Numbers.RoundUp(nSize, 10);

    case n of
      0:
        Result := 1;
      1 .. 255:
        Result := n;
      256 .. 2000:
        Result := 2000;
      2001 .. 4000:
        Result := 4000;
    else
      Result := n;
    end;

  end;

begin
  // Initialization
  Result := False;
  IQMS.DBTrans.dbttypes.CopyFieldDataToFieldDataDef(AFieldData, AFieldDataDef);

  case AFieldData.DataType of
    ftString, ftFixedChar:
      begin
        AFieldDataDef.OraDataType := 'VARCHAR2';
        // AFieldDataDef.OraSize := _GetStandardSize(AFieldData.FieldSize);
        AFieldDataDef.OraSize := AFieldData.FieldSize;
        AFieldDataDef.OraDefinition := Format('%s VARCHAR2(%d)',
          [AFieldData.FieldName, AFieldDataDef.OraSize]);
      end;
    ftWideString, ftFixedWideChar:
      begin
        // AFieldDataDef.OraSize := _GetStandardSize((AFieldData.FieldSize * 2) + 2);
        AFieldDataDef.OraSize := AFieldData.FieldSize;
        if AFieldDataDef.OraSize > 4000 then
          begin
            AFieldDataDef.OraDataType := 'CLOB';
            AFieldDataDef.OraSize := 4000;
            AFieldDataDef.OraDefinition :=
              Format('%s CLOB', [AFieldData.FieldName]);
          end
        else
          begin
            AFieldDataDef.OraDataType := 'VARCHAR2';
            AFieldDataDef.OraDefinition := Format('%s VARCHAR2(%d)',
              [AFieldData.FieldName, AFieldDataDef.OraSize]);
          end;
      end;
    ftGuid:
      begin
        AFieldDataDef.OraDataType := 'VARCHAR2';
        AFieldDataDef.OraSize := 38;
        AFieldDataDef.OraDefinition := Format('%s VARCHAR2(%d)',
          [AFieldData.FieldName, AFieldDataDef.OraSize]);
      end;
    ftBoolean:
      begin
        AFieldDataDef.OraDataType := 'VARCHAR2';
        AFieldDataDef.OraSize := 1;
        AFieldDataDef.OraDefinition := Format('%s VARCHAR2(1)',
          [AFieldData.FieldName]);
      end;
    ftMemo, ftFmtMemo:
      begin
        AFieldDataDef.OraDataType := 'VARCHAR2';
        AFieldDataDef.OraSize := 4000;
        AFieldDataDef.OraDefinition := Format('%s VARCHAR2(%d)',
          [AFieldData.FieldName, AFieldDataDef.OraSize]);
      end;
    ftAutoInc, ftLargeint:
      begin
        // Note:  the size number can go to 30, if required
        AFieldDataDef.OraDataType := 'NUMBER';
        AFieldDataDef.OraSize := 22;
        AFieldDataDef.OraPrecision := 0;
        AFieldDataDef.OraDefinition := Format('%s NUMBER(%d)',
          [AFieldData.FieldName, AFieldDataDef.OraSize]);
      end;
    ftByte, ftShortint:
      begin
        AFieldDataDef.OraDataType := 'NUMBER';
        AFieldDataDef.OraSize := 3;
        AFieldDataDef.OraPrecision := 0;
        AFieldDataDef.OraDefinition := Format('%s NUMBER(%d)',
          [AFieldData.FieldName, AFieldDataDef.OraSize]);
      end;
    ftSmallint:
      begin
        AFieldDataDef.OraDataType := 'NUMBER';
        AFieldDataDef.OraSize := 6;
        AFieldDataDef.OraPrecision := 0;
        AFieldDataDef.OraDefinition := Format('%s NUMBER(%d)',
          [AFieldData.FieldName, AFieldDataDef.OraSize]);
      end;
    ftInteger, ftWord, ftSingle, ftLongWord:
      begin
        AFieldDataDef.OraDataType := 'NUMBER';
        AFieldDataDef.OraSize := 15;
        AFieldDataDef.OraPrecision := 0;
        AFieldDataDef.OraDefinition := Format('%s NUMBER(%d)',
          [AFieldData.FieldName, AFieldDataDef.OraSize]);
      end;
    ftCurrency:
      begin
        AFieldDataDef.OraDataType := 'NUMBER';
        AFieldDataDef.OraSize := 16;
        AFieldDataDef.OraPrecision := 6;
        AFieldDataDef.OraDefinition := Format('%s NUMBER(%d, %d)',
          [AFieldData.FieldName, AFieldDataDef.OraSize,
          AFieldDataDef.OraPrecision]);
      end;
    ftFloat, ftBCD, ftFMTBcd:
      begin
        AFieldDataDef.OraDataType := 'NUMBER';
        AFieldDataDef.OraSize := 16;
        AFieldDataDef.OraPrecision := 6;
        AFieldDataDef.OraDefinition := Format('%s NUMBER(%d, %d)',
          [AFieldData.FieldName, AFieldDataDef.OraSize,
          AFieldDataDef.OraPrecision]);
      end;
    ftExtended:
      begin
        AFieldDataDef.OraDataType := 'NUMBER';
        AFieldDataDef.OraSize := 22;
        AFieldDataDef.OraPrecision := 10;
        AFieldDataDef.OraDefinition := Format('%s NUMBER(%d, %d)',
          [AFieldData.FieldName, AFieldDataDef.OraSize,
          AFieldDataDef.OraPrecision]);
      end;
    ftDate, ftTime, ftDateTime, ftTimeStamp:
      begin
        AFieldDataDef.OraDataType := 'DATE';
        AFieldDataDef.OraSize := 7;
        AFieldDataDef.OraDefinition :=
          Format('%s DATE', [AFieldData.FieldName]);
      end;
    ftBytes, ftVarBytes, ftBlob, ftGraphic, ftParadoxOle .. ftTypedBinary,
      ftOraBlob, ftObject:
      begin
        AFieldDataDef.OraDataType := 'BLOB';
        AFieldDataDef.OraSize := 0;
        AFieldDataDef.OraDefinition :=
          Format('%s BLOB', [AFieldData.FieldName]);
      end;
    ftWideMemo:
      begin
        AFieldDataDef.OraDataType := 'VARCHAR2';
        AFieldDataDef.OraSize := 4000;
        // This may eventually need to be a CLOB, but so far this works.
        AFieldDataDef.OraDefinition := Format('%s VARCHAR2(%d)',
          [AFieldData.FieldName, AFieldDataDef.OraSize]);
      end;
    ftOraClob:
      begin
        AFieldDataDef.OraDataType := 'CLOB';
        AFieldDataDef.OraSize := 0;
        AFieldDataDef.OraDefinition :=
          Format('%s CLOB', [AFieldData.FieldName]);
      end;
  else
    begin
      ShowErrorMsg_UnsupportedFieldType(AFieldData.FieldName,
        AFieldData.DataType);
      AFieldDataDef.OraDefinition := '';
    end;
  end;

  // return result
  Result := AFieldDataDef.OraDefinition > '';
end;

function GetFieldDefinition(AFieldData: TFieldData;
  var ADefinition: string): Boolean;
var
  AFieldDataDef: TFieldDataDef;
begin
  // Initialization
  Result := False;
  ADefinition := '';
  if GetFieldDataDefinition(AFieldData, { var } AFieldDataDef) then
    ADefinition := AFieldDataDef.OraDefinition;
  Result := Length(ADefinition) > 0;
end;

function GetTFieldDefinition(AField: TField; var ADefinition: string): Boolean;
var
  AFieldData: IQMS.DBTrans.dbttypes.TFieldData;
begin
  if (AField = nil) then
    // IQMS.DBTrans.dbtrscstr.cTXT0000136 =  'Application Error:  Field is null.'
    raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000136);
  IQMS.DBTrans.dbttypes.CopyFieldToFieldData(AField, AFieldData);
  Result := GetFieldDefinition(AFieldData, ADefinition);
end;

procedure GetTNSListenerNames(List: TStrings);
const
  C_TNSNAMES_ORA = 'tnsnames.ora';
  C_REGPATH = '\SOFTWARE\ORACLE'; // HKEY_LOCAL_MACHINE
  C_REGKEY = 'ORACLE_HOME';
var
  APath, AFile, tmp: string;
  sl: TStringList;
  i, x: Integer;
begin
  sl := nil;
  if not Assigned(List) then
    Exit;

  // Example: 'C:\oracle\iqms\network\ADMIN';
  APath := IQMS.Common.Registry.LoadStrFromLocalMachineRegistry(C_REGPATH, C_REGKEY);
  if APath = '' then
    Exit;
  APath := SysUtils.IncludeTrailingPathDelimiter(APath) + 'network\ADMIN';
  AFile := SysUtils.IncludeTrailingPathDelimiter(APath) + C_TNSNAMES_ORA;
  if FileExists(AFile) then
    begin
      sl := TStringList.Create;
      try
        sl.LoadFromFile(AFile);
        for i := 0 to sl.Count - 1 do
          begin
            tmp := Trim(sl.Strings[i]);
            // Return the tns name
            if (Trim(tmp) = '') or (Pos('#', tmp) > 0) or (Pos('(', tmp) > 0) or
              (Pos(')', tmp) > 0) then
              Continue;
            x := Pos('=', tmp);
            if x > 0 then
              List.Add(Trim(Copy(tmp, 1, x - 1)));
          end;
      finally
        if Assigned(sl) then
          FreeAndNil(sl);
      end;
    end;
end;

procedure GetAliasNamesEx(List: TStrings);
var
  sources, tmp: TStringList;

  procedure _AppendWithSuffix(const ASuffix: string);
  var
    i: Integer;
  begin
    for i := 0 to tmp.Count - 1 do
      sources.Add(Format('%s=%s', [tmp.Strings[i], ASuffix]));
  end;

begin
  if Assigned(List) then
    begin
      tmp := TStringList.Create;
      try
        sources := TStringList.Create;
        try
          sources.Sorted := True;
          sources.Duplicates := dupIgnore;
          IQMS.DBTrans.dbtdsn.GetSystemDSNNames(tmp);
          _AppendWithSuffix('DSN');
          tmp.Clear;
          GetTNSListenerNames(tmp);
          _AppendWithSuffix('ORACLE');
          List.AddStrings(sources);
        finally
          if Assigned(sources) then
            FreeAndNil(sources);
        end;
      finally
        if Assigned(tmp) then
          FreeAndNil(tmp);
      end;
    end;
end;

procedure GetAliasNames(List: TStrings);
var
  sources: TStringList;
begin
  sources := TStringList.Create;
  try
    sources.Sorted := True;
    sources.Duplicates := dupIgnore;
    IQMS.DBTrans.dbtdsn.GetSystemDSNNames(sources);
    GetTNSListenerNames(sources);
    List.AddStrings(sources);
  finally
    FreeAndNil(sources);
  end;
end;

procedure GetFieldDataArray(DataSet: TDataSet; var AArray: TFieldDataArray);
var
  i: Integer;

  procedure _SetFieldArrayLength(const ANewLength: Integer);
  begin
    try
      SetLength(AArray, ANewLength);
    except
      on E: EOutOfMemory do
        // 'The number of fields exceeds requested limit (%d):'#13'%s'
        raise Exception.CreateFmt(IQMS.DBTrans.dbtrscstr.cTXT0000175,
          [ANewLength, E.Message])
    end;
  end;

  function _ExistsInArray(AFieldName: string): Boolean;
  var
    i: Integer;
  begin
    Result := False;
    for i := Low(AArray) to High(AArray) do
      if CompareText(AFieldName, AArray[i].ShortFieldName) = 0 then
        begin
          Result := True;
          Break;
        end;
  end;

  function _GetShortFieldName(AFieldName: string): string;
  var
    i: Integer;
    ANumber, S: string;
  begin
    i := 0;
    ANumber := '0';
    S := LeftStr(AFieldName, 10);
    if _ExistsInArray(S) then
      begin
        repeat
          Inc(i);
          ANumber := IntToStr(i);
          S := LeftStr(AFieldName, 10 - Length(ANumber)) + ANumber;
        until not _ExistsInArray(S);
      end;
    Result := S;
  end;

  procedure _AddField(AFieldName: string; AFieldSize: Integer;
    AFieldType: TFieldType; AFieldIndex: Integer);
  var
    j: Integer;
  begin
    j := high(AArray) + 1;
    _SetFieldArrayLength(j + 1);
    AArray[j].ShortFieldName := _GetShortFieldName(AFieldName);
    AArray[j].FieldName := AFieldName;
    AArray[j].DataType := AFieldType;
    AArray[j].FieldSize := AFieldSize; // default for numeric
    AArray[j].Visible := True;
    AArray[j].Index := AFieldIndex;
  end;

begin
  SetLength(AArray, 0);
  for i := 0 to DataSet.FieldCount - 1 do
    if DataSet.Fields[i].Visible then
      _AddField(DataSet.Fields[i].FieldName, DataSet.Fields[i].DataSize,
        DataSet.Fields[i].DataType, i);
end;

procedure GetFieldDataArray(ATableName: string; var AArray: TFieldDataArray); overload;
var
  AFieldType: TFieldType;
  i, AFieldSize, APrecision: Integer;

  procedure _SetFieldArrayLength(const ANewLength: Integer);
  begin
    try
      SetLength(AArray, ANewLength);
    except
      on E: EOutOfMemory do
        // 'The number of fields exceeds requested limit (%d):'#13'%s'
        raise Exception.CreateFmt(IQMS.DBTrans.dbtrscstr.cTXT0000175,
          [ANewLength, E.Message])
    end;
  end;

  function _ExistsInArray(AFieldName: string): Boolean;
  var
    i: Integer;
  begin
    Result := False;
    for i := Low(AArray) to High(AArray) do
      if CompareText(AFieldName, AArray[i].ShortFieldName) = 0 then
        begin
          Result := True;
          Break;
        end;
  end;

  function _GetShortFieldName(AFieldName: string): string;
  var
    i: Integer;
    ANumber, S: string;
  begin
    i := 0;
    ANumber := '0';
    S := LeftStr(AFieldName, 10);
    if _ExistsInArray(S) then
      begin
        repeat
          Inc(i);
          ANumber := IntToStr(i);
          S := LeftStr(AFieldName, 10 - Length(ANumber)) + ANumber;
        until not _ExistsInArray(S);
      end;
    Result := S;
  end;

  procedure _AddField(AFieldName: string; AFieldSize: Integer;
    AFieldType: TFieldType; AFieldIndex: Integer);
  var
    j: Integer;
  begin
    j := high(AArray) + 1;
    _SetFieldArrayLength(j + 1);
    AArray[j].ShortFieldName := _GetShortFieldName(AFieldName);
    AArray[j].FieldName := AFieldName;
    AArray[j].DataType := AFieldType;
    AArray[j].FieldSize := AFieldSize; // default for numeric
    AArray[j].Visible := True;
    AArray[j].Index := AFieldIndex;
  end;

begin
  SetLength(AArray, 0);
  with TFDQuery.Create(nil) do
  try
    ConnectionName := cnstFDConnectionName;
    SQL.Add('  SELECT column_name,');
    SQL.Add('         data_type,');
    SQL.Add('         data_length,');
    SQL.Add('         data_precision,');
    SQL.Add('         data_scale');
    SQL.Add('    FROM cols');
    SQL.Add(Format('   WHERE table_name = ''%s''',[ATableName]));
    SQL.Add('ORDER BY column_id');
    Open;
    while not Eof do
      begin
        IQMS.DBTrans.dbtfields.GetFieldDefForOracleDataType_BDE(
          FieldByName('data_type').AsString,
          FieldByName('data_length').AsInteger,
          FieldByName('data_precision').AsInteger,
          FieldByName('data_scale').AsInteger,
          {var} AFieldType,
          {var} AFieldSize,
          {var} APrecision);

        _AddField(
          FieldByName('column_name').AsString,
          AFieldSize,
          AFieldType, // data type
          i);
        Next;
      end;
  finally
    Free;
  end;
end;

function CreateOracleView(const ASQLConnection: TSQLConnection;
  const AViewName: string; const AViewBodySQL: TStringList): Boolean;
var
  AScript: TStringList;
begin
  // Initialization
  Result := False;
  AScript := nil;

  // validation
  if not Assigned(ASQLConnection) then
    Exit;
  if (Trim(AViewName) = '') then
    raise Exception.Create('Application Error:  View name not provided.');
  if (AViewBodySQL = nil) or (AViewBodySQL.Count = 0) then
    raise Exception.Create('Application Error: View SQL not provided.');

  // build script
  try
    AScript := TStringList.Create;
    try
      AScript.Add(Format('CREATE OR REPLACE VIEW %s AS',
        [UpperCase(AViewName)]));
      AScript.AddStrings(AViewBodySQL);
      with TSQLQuery.Create(nil) do
        try
          SQLConnection := ASQLConnection;
          SQL.AddStrings(AScript);
          ExecSQL;
          Result := True;
        finally
          Free;
        end;
    finally
      if Assigned(AScript) then
        FreeAndNil(AScript);
    end;
  except
    on E: Exception do
      IQMS.Common.ErrorDialog.ShowIQErrorMessage('Error creating view.', E.Message,
        AScript.Text);
  end;
end;

function CreateOracleTable(ADataSet: TDataSet; ANewTableName: string;
  ATemporary: Boolean): Boolean;
var
  ADefinition: TStringList;
  ASQL: string;
begin
  ADefinition := TStringList.Create;
  try
    try // except
      Result := GetOracleCreateTableSQL(ADataSet, ANewTableName, ATemporary,
        ADefinition);
      if Result then
        begin
          // Drop the temporary table if it exists
//          if TableExists(IQMS.Common.DBDM.SQLConnection, ANewTableName) then
//            begin
//              if ATemporary then
//                DropTable(IQMS.Common.DBDM.SQLConnection, ANewTableName)
//              else
//                Exit;
//            end;
//          // Create a new temporary table
//          with TSQLQuery.Create(nil) do // Set owner to NIL to prevent AV
//            try
//              SQLConnection := IQMS.Common.DBDM.SQLConnection;
//              SQL.AddStrings(ADefinition);
//              ExecSQL;
//            finally
//              Free;
//            end;
        end;
    except
      on E: Exception do
        IQMS.Common.ErrorDialog.ShowIQErrorMessage
          (IQMS.DBTrans.dbtrscstr.cTXT0000121 { 'Error creating table.' } , E.Message,
          ADefinition.Text);
    end;
  finally
    if Assigned(ADefinition) then
      FreeAndNil(ADefinition);
  end;
end;

function CreateOracleTableByDef(const ASQLConnection: TSQLConnection;
  const AFieldList: TFieldDataArray; const ANewTableName: string;
  const ATemporary: Boolean): Boolean;
var
  ASQL: TStringList;
  AFieldSQL: TStringList;
  i: Integer;
  AFieldListText, ADefinition: string;
  AFailed: Boolean;
begin
  Result := False;
  ASQL := nil;

  Result := high(AFieldList) > - 1;
  if not Result then
    Exit;

  try // except
    ASQL := TStringList.Create;
    try
      ASQL.Clear;
      if ATemporary then
        ASQL.Add(Format('CREATE GLOBAL TEMPORARY TABLE %s ', [ANewTableName]))
      else
        ASQL.Add(Format('CREATE TABLE %s ', [ANewTableName]));
      ASQL.Add('(');

      AFieldSQL := TStringList.Create;
      try
        for i := low(AFieldList) to high(AFieldList) do
          begin
            if AFieldList[i].DataType = ftUnknown then
              begin
                ShowErrorMsg_UnsupportedFieldType(AFieldList[i].FieldName,
                  AFieldList[i].DataType);
                SysUtils.Abort;
              end;

            AFailed := not GetFieldDefinition(AFieldList[i], ADefinition);

            if not AFailed then
              AFieldSQL.Add(ADefinition);
            // else BREAK;
          end;
        AFieldListText := Trim(AFieldSQL.CommaText);
        AFieldListText := StrTran(AFieldListText, '",', ', '#13);
        AFieldListText := StrTran(AFieldListText, '"', '');
      finally
        if Assigned(AFieldSQL) then
          FreeAndNil(AFieldSQL);
      end;

      ASQL.Add(AFieldListText);
      ASQL.Add(')');
      if ATemporary then
        ASQL.Add('ON COMMIT PRESERVE ROWS');
      if AFailed then
        ASQL.Clear
      else
        Result := True;

      if Result then
        begin
          // Drop the temporary table if it exists
          if TableExists(ASQLConnection, ANewTableName) then
            begin
              if ATemporary then
                DropTable(ASQLConnection, ANewTableName)
              else
                Exit;
            end;
          // Create a new temporary table
          with TSQLQuery.Create(nil) do // Set owner to NIL to prevent AV
            try
              SQLConnection := ASQLConnection;
              SQL.AddStrings(ASQL);
              ExecSQL;
            finally
              Free;
            end;
        end;
    finally
      if Assigned(ASQL) then
        FreeAndNil(ASQL);
    end;
  except
    on E: Exception do
      IQMS.Common.ErrorDialog.ShowIQErrorMessage
        (IQMS.DBTrans.dbtrscstr.cTXT0000121 { 'Error creating table.' } , E.Message,
        ASQL.Text);
  end;

end;

function CreateDBaseTableByDef(AFieldList: TFieldDataArray; AFileName: string;
  ATableType: TCustomTableType): Boolean;
var
  ASQL: TStringList;
  AFieldSQL: TStringList;
  ADirectory, ANewTableName: string;

  i: Integer;
  AFieldListText, ADefinition: string;
  AFailed: Boolean;

  // ---------------------------------------------------------------------------
  function _GetFieldDefinition(AFieldData: TFieldData;
    var ADefinition: string): Boolean;
  var
    AFieldName: string;
  begin
    // Initialize
    AFieldName := Trim(UpperCase(AFieldData.ShortFieldName));
    ADefinition := '';
    {
      (ftUnknown, ftString, ftSmallint, ftInteger, ftWord, ftBoolean,
      ftFloat, ftCurrency, ftBCD, ftDate, ftTime, ftDateTime, ftBytes,
      ftVarBytes, ftAutoInc, ftBlob, ftMemo, ftGraphic, ftFmtMemo,
      ftParadoxOle, ftDBaseOle, ftTypedBinary, ftCursor, ftFixedChar,
      ftWideString, ftLargeint, ftADT, ftArray, ftReference,
      ftDataSet, ftOraBlob, ftOraClob, ftVariant, ftInterface,
      ftIDispatch, ftGuid, ftTimeStamp, ftFMTBcd)
    }

    {
      Field Type:
      00 NO TYPE - CONSTRAINT
      01 CHAR
      02 NUMERIC
      03 MEMO
      04 LOGICAL
      05 DATE
      06 FLOAT
      08 OLE
      09 BINARY
      11 LONG
      12 TIMESTAMP
      13 DOUBLE
      14 AUTOINCREMENT (NOT SETTABLE FROM THE INSPECTOR)
    }
    case AFieldData.DataType of
      ftString, ftFixedChar, ftWideString, ftGuid:
        begin
          // 01/04/2016 (EIQ-10087) Reduced value from 255 to 250.
          if (AFieldData.FieldSize in [1 .. 250]) then
            ADefinition := Format('[%s] CHAR(%d)',
              [AFieldName, AFieldData.FieldSize])
          else
            ADefinition := Format('[%s] MEMO', [AFieldName]);
          { case AFieldData.FieldSize of
            0:
            ADefinition := Format('[%s] MEMO', [AFieldName]);
            1 .. 254:
            ADefinition := Format('[%s] CHAR(%d)',
            [AFieldName, AFieldData.FieldSize]);
            255 .. 4000:
            ADefinition := Format('[%s] MEMO', [AFieldName]);
            else
            ADefinition := Format('[%s] CHAR(250)', [AFieldName]);
            end; }
        end;
      ftMemo, ftFmtMemo, ftOraClob:
        ADefinition := Format('[%s] MEMO', [AFieldName]);
      ftBoolean:
        ADefinition := Format('[%s] LOGICAL', [AFieldName]);
      ftBlob, ftOraBlob, ftGraphic, ftParadoxOle, ftDBaseOle:
        ADefinition := Format('[%s] OLE', [AFieldName]);
      ftSmallint, ftInteger, ftWord, ftBytes, ftVarBytes:
        ADefinition := Format('[%s] NUMERIC', [AFieldName]);
      ftAutoInc:
        ADefinition := Format('[%s] AUTOINCREMENT', [AFieldName]);
      ftLargeint:
        ADefinition := Format('[%s] NUMERIC', [AFieldName]);
      ftCurrency, ftBCD:
        ADefinition := Format('[%s] FLOAT', [AFieldName]);
      ftFloat, ftFMTBcd:
        ADefinition := Format('[%s] DOUBLE', [AFieldName]);
      ftDate, ftTime, ftDateTime:
        ADefinition := Format('[%s] DATE', [AFieldName]);
      ftTimeStamp:
        ADefinition := Format('[%s] TIMESTAMP', [AFieldName]);
    else
      begin
        ShowErrorMsg_UnsupportedFieldType(AFieldName, AFieldData.DataType);

        // 01/18/2006 Set the TField Visible=FALSE.  We will not import
        // this field.  We let the user know so he isn't wondering
        // what happened.  But I dont' want to halt the import, just
        // because we can't import one of the fields.
        // ADataSet.FieldByName(AFieldName).Visible := FALSE;
        ADefinition := '';
      end;
    end;

    // return result
    Result := ADefinition > '';

  end;
// ---------------------------------------------------------------------------

begin
  Result := False;
  ASQL := nil;

  if not (ATableType in [dttParadox, dttDBase, dttFoxPro]) then
    raise Exception.Create
      ('Application Error:  Invalid data type.  Cannot create DBase table.');

  Result := high(AFieldList) > - 1;
  if not Result then
    Exit;

  ADirectory := ExtractFilePath(AFileName);
  ANewTableName := IQMS.Common.FileUtils.FileNameNoExt(AFileName);

  ASQL := TStringList.Create;
  try
    try
      ASQL.Clear;

      ASQL.Add(Format('CREATE TABLE %s ', [ANewTableName]));
      ASQL.Add('(');

      AFieldSQL := TStringList.Create;
      try

        for i := low(AFieldList) to high(AFieldList) do
          begin
            if AFieldList[i].DataType = ftUnknown then
              begin
                ShowErrorMsg_UnsupportedFieldType(AFieldList[i].FieldName,
                  AFieldList[i].DataType);

                SysUtils.Abort;
              end;

            AFailed := not _GetFieldDefinition(AFieldList[i], ADefinition);

            if not AFailed then
              AFieldSQL.Add(ADefinition)
            else
              Break;
          end;
        // AFieldListText := Trim(AFieldSQL.CommaText);
        AFieldListText := Trim(IQMS.Common.StringUtils.StringListToStr(AFieldSQL, ','));
        // AFieldListText := StrTran(AFieldListText, '",', ', '#13);
        // AFieldListText := StrTran(AFieldListText, '"', '');
      finally
        if Assigned(AFieldSQL) then
          FreeAndNil(AFieldSQL);
      end;

      ASQL.Add(AFieldListText);
      ASQL.Add(')');
      if AFailed then
        ASQL.Clear
      else
        Result := True;

      if Result then
        begin
          if FileExists(AFileName) then
            DeleteFile(AFileName);
          // Create a new temporary table
          with TADOCommand.Create(nil) do // Set owner to NIL to prevent AV
            try
              case ATableType of
                dttParadox:
                  ConnectionString := IQMS.DBTrans.dbtado.ADO_ConnectionStringForParadox
                    (SysUtils.IncludeTrailingPathDelimiter(ADirectory));
                dttDBase:
                  ConnectionString := IQMS.DBTrans.dbtado.ADO_ConnectionStringForDBF
                    (SysUtils.IncludeTrailingPathDelimiter(ADirectory));
                dttFoxPro:
                  ConnectionString := IQMS.DBTrans.dbtado.ADO_ConnectionStringForVisualFoxPro
                    (ADirectory);
              end;
              CommandText := ASQL.Text;
              Execute;
            finally
              Free;
            end;
        end;
    except
      on E: Exception do
        begin
          Result := False;
          IQMS.Common.ErrorDialog.ShowIQErrorMessage
            (IQMS.DBTrans.dbtrscstr.cTXT0000121 { 'Error creating table.' } , E.Message,
            ASQL.Text);
        end;
    end;
  finally
    if Assigned(ASQL) then
      FreeAndNil(ASQL);
  end;
end;

function GetOracleCreateTableSQL(const ADataSet: TDataSet;
  const ANewTableName: string; const ATemporary: Boolean; var ASQL: TStringList;
  AIncludeFields: TStringList = nil): Boolean;
// ---------------------------------------------------------------------------
  function _GetFieldDef(AField: TField; var ADefinition: string): Boolean;
  var
    AFieldData: IQMS.DBTrans.dbttypes.TFieldData;
  begin
    if (AField = nil) then
      // IQMS.DBTrans.dbtrscstr.cTXT0000136 =  'Application Error:  Field is null.'
      raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000136);
    AFieldData.FieldName := Trim(UpperCase(AField.DisplayLabel));
    AFieldData.FieldSize := AField.Size;
    AFieldData.DataType := AField.DataType;
    AFieldData.Visible := AField.Visible;
    AFieldData.Index := AField.Index;
    Result := GetFieldDefinition(AFieldData, ADefinition);
    if not Result then
      AField.Visible := False;
  end;
// ---------------------------------------------------------------------------

var
  i: Integer;
  AFieldListText, ADefinition: string;
  AFieldList: TStringList;
  AFailed: Boolean;
  AFieldData: TFieldData;
begin
  Result := False;

  if ASQL = nil then
    Exit;

  ASQL.Clear;
  if ATemporary then
    ASQL.Add(Format('CREATE GLOBAL TEMPORARY TABLE %s ', [ANewTableName]))
  else
    ASQL.Add(Format('CREATE TABLE %s ', [ANewTableName]));
  ASQL.Add('(');

  // with ADataSet do
  AFieldList := TStringList.Create;
  try
    if not ADataSet.Active then
      ADataSet.Open;
    // for i := 0 to ADataSet.FieldCount - 1 do
    for i := 0 to ADataSet.FieldDefs.Count - 1 do
      begin
        // If an "include fields" list is provided, check it.  If the
        // field is in the list, then add it; otherwise, skip it.
        if (AIncludeFields <> nil) and
          (AIncludeFields.IndexOf(ADataSet.FieldDefs[i].Name) = - 1) then
          Continue;

        if ADataSet.FieldDefs[i].DataType = ftUnknown then
          begin
            ShowErrorMsg_UnsupportedFieldType(ADataSet.FieldDefs[i].DisplayName,
              ADataSet.FieldDefs[i].DataType);
            SysUtils.Abort;
          end;
        IQMS.DBTrans.dbttypes.CopyFieldDefToFieldData(ADataSet.FieldDefs[i], AFieldData);
        AFieldData.FieldName :=
          GetFieldName(ADataSet.FieldByName(ADataSet.FieldDefs[i].Name)
          .DisplayLabel);
        AFailed := not GetFieldDefinition(AFieldData, ADefinition);
        // AFailed := not GetTFieldDefinition(ADataSet.Fields[i], ADefinition);
        if not AFailed then
          AFieldList.Add(ADefinition);
        // else BREAK;
      end;
    AFieldListText := Trim(AFieldList.CommaText);
    AFieldListText := StrTran(AFieldListText, '",', ', '#13);
    AFieldListText := StrTran(AFieldListText, '"', '');
  finally
    if Assigned(AFieldList) then
      FreeAndNil(AFieldList);
  end;
  ASQL.Add(AFieldListText);
  ASQL.Add(')');
  if ATemporary then
    ASQL.Add('ON COMMIT PRESERVE ROWS');
  if AFailed then
    ASQL.Clear
  else
    Result := True;
end;

function GetJetCreateTableSQL(const ADataSet: TDataSet;
  const ANewTableName: string; var ASQL: TStringList;
  AIncludeFields: TStringList = nil): Boolean;
// ---------------------------------------------------------------------------
{ IFDEF UNICODE }
// function _GetFieldDef(AField: TField; var ADefinition: AnsiString): Boolean;
{ ELSE }
  function _GetFieldDef(AField: TField; var ADefinition: string): Boolean;
  { ENDIF }
  var
    { IFDEF UNICODE }
    // AFieldName: AnsiString;
    { ELSE }
    AFieldName: string;
    { ENDIF }
  begin
    if (AField = nil) then
      raise Exception.Create
        (IQMS.DBTrans.dbtrscstr.cTXT0000136 { 'Application Error:  Field is null.' } );
    AFieldName := Trim(UpperCase(AField.DisplayLabel));
    ADefinition := '';
    {
      (ftUnknown, ftString, ftSmallint, ftInteger, ftWord, ftBoolean,
      ftFloat, ftCurrency, ftBCD, ftDate, ftTime, ftDateTime,
      ftBytes, ftVarBytes, ftAutoInc, ftBlob, ftMemo, ftGraphic,
      ftFmtMemo, ftParadoxOle, ftDBaseOle, ftTypedBinary, ftCursor,
      ftFixedChar, ftWideString, ftLargeint, ftADT, ftArray,
      ftReference, ftDataSet, ftOraBlob, ftOraClob, ftVariant,
      ftInterface, ftIDispatch, ftGuid, ftTimeStamp, ftFMTBcd)
    }

    case AField.DataType of
      ftString, ftFixedChar, ftWideString, ftGuid:
        begin
          if AField.Size in [1 .. 255] then
            ADefinition := Format('%s TEXT(%d)', [AFieldName, AField.Size])
          else
            ADefinition := Format('%s MEMO', [AFieldName]);
        end;
      ftBoolean:
        ADefinition := Format('%s LOGICAL', [AFieldName]);
      ftMemo, ftFmtMemo, ftOraClob, ftWideMemo:
        ADefinition := Format('%s MEMO', [AFieldName]);
      ftAutoInc, ftSmallint, ftInteger, ftWord, ftBytes, ftVarBytes:
        ADefinition := Format('%s INT', [AFieldName]);
      ftLargeint, ftFloat, ftCurrency, ftBCD, ftFMTBcd:
        ADefinition := Format('%s FLOAT', [AFieldName]);
      ftDate, ftTime, ftDateTime, ftTimeStamp:
        ADefinition := Format('%s DATETIME', [AFieldName]);
      ftBlob, ftGraphic, ftParadoxOle .. ftTypedBinary, ftOraBlob:
        ADefinition := Format('%s OLEOBJECT', [AFieldName]);
    else
      begin
        ShowErrorMsg_UnsupportedFieldType(AFieldName, AField.DataType);

        // 01/18/2006 Set the TField Visible=FALSE.  We will not import
        // this field.  We let the user know so he isn't wondering
        // what happened.  But I dont' want to halt the import, just
        // because we can't import one of the fields.
        ADataSet.FieldByName(AFieldName).Visible := False;
        ADefinition := '';
      end;
    end;

    // return result
    Result := ADefinition > '';

  end;
// ---------------------------------------------------------------------------

var
  i: Integer;
  { IFDEF UNICODE }
  // AFieldListText, ADefinition: AnsiString;
  { ELSE }
  AFieldListText, ADefinition: string;
  { ENDIF }
  AFieldList: TStringList;
  AFailed: Boolean;
begin
  Result := False;

  if ASQL = nil then
    Exit;

  ASQL.Clear;
  ASQL.Add(Format('CREATE TABLE %s ', [ANewTableName]));
  ASQL.Add('(');

  with ADataSet do
    begin
      AFieldList := TStringList.Create;
      try
        if not Active then
          Open;
        for i := 0 to FieldCount - 1 do
          begin
            // If an "include fields" list is provided, check it.  If the
            // field is in the list, then add it; otherwise, skip it.
            if (AIncludeFields <> nil) and
              (AIncludeFields.IndexOf(Fields[i].FieldName) = - 1) then
              Continue;

            if Fields[i].DataType = ftUnknown then
              begin
                ShowErrorMsg_UnsupportedFieldType(Fields[i].DisplayLabel,
                  Fields[i].DataType);
                SysUtils.Abort;
              end;

            AFailed := not _GetFieldDef(Fields[i], ADefinition);
            if not AFailed then
              AFieldList.Add(ADefinition);
          end;
        AFieldListText := Trim(AFieldList.CommaText);
        AFieldListText := StrTran(AFieldListText, '",', ', '#13#10);
        AFieldListText := StrTran(AFieldListText, '"', '');
      finally
        if Assigned(AFieldList) then
          FreeAndNil(AFieldList);
      end;
    end;
  ASQL.Add(AFieldListText);
  ASQL.Add(')');
  if AFailed then
    ASQL.Clear
  else
    Result := True;
end;

function GetSQLServerCreateTableSQL(const ADataSet: TDataSet;
  const ANewTableName: string; var ASQL: TStringList;
  AIncludeFields: TStringList = nil): Boolean;
// ---------------------------------------------------------------------------
{ IFDEF UNICODE }
// function _GetFieldDef(AField: TField; var ADefinition: AnsiString): Boolean;
{ ELSE }
  function _GetFieldDef(AField: TField; var ADefinition: string): Boolean;
  { ENDIF }
  var
    { IFDEF UNICODE }
    // AFieldName: AnsiString;
    { ELSE }
    AFieldName: string;
    { ENDIF }
  begin
    if (AField = nil) then
      raise Exception.Create
        (IQMS.DBTrans.dbtrscstr.cTXT0000136 { 'Application Error:  Field is null.' } );
    AFieldName := Trim(UpperCase(AField.DisplayLabel));
    ADefinition := '';
    {
      (ftUnknown, ftString, ftSmallint, ftInteger, ftWord, ftBoolean,
      ftFloat, ftCurrency, ftBCD, ftDate, ftTime, ftDateTime,
      ftBytes, ftVarBytes, ftAutoInc, ftBlob, ftMemo, ftGraphic,
      ftFmtMemo, ftParadoxOle, ftDBaseOle, ftTypedBinary, ftCursor,
      ftFixedChar, ftWideString, ftLargeint, ftADT, ftArray,
      ftReference, ftDataSet, ftOraBlob, ftOraClob, ftVariant,
      ftInterface, ftIDispatch, ftGuid, ftTimeStamp, ftFMTBcd)
    }

    case AField.DataType of
      ftString, ftWideString:
        begin
          if AField.Size in [1 .. 255] then
            ADefinition := Format('%s VARCHAR(%d)', [AFieldName, AField.Size])
          else
            ADefinition := Format('%s VARCHAR(2000)', [AFieldName]);
        end;
      ftFixedChar:
        ADefinition := Format('%s CHAR(%d)', [AFieldName, AField.Size]);
      ftGuid:
        ADefinition := Format('%s UNIQUEIDENTIFIER', [AFieldName]);
      ftBoolean:
        ADefinition := Format('%s LOGICAL', [AFieldName]);
      ftMemo, ftFmtMemo:
        ADefinition := Format('%s VARCHAR(4000)', [AFieldName]);
      ftOraClob:
        ADefinition := Format('%s VARCHAR(8000)', [AFieldName]);
      ftSmallint:
        ADefinition := Format('%s SMALLINT', [AFieldName]);
      ftAutoInc, ftInteger, ftWord:
        ADefinition := Format('%s INT', [AFieldName]);
      ftLargeint:
        ADefinition := Format('%s BIGINT', [AFieldName]);
      ftCurrency:
        ADefinition := Format('%s MONEY', [AFieldName]);
      ftFloat, ftBCD, ftFMTBcd:
        ADefinition := Format('%s REAL', [AFieldName]);
      ftDate, ftTime, ftDateTime:
        ADefinition := Format('%s DATETIME', [AFieldName]);
      ftTimeStamp:
        ADefinition := Format('%s TIMESTAMP', [AFieldName]);
      ftGraphic, ftBlob, ftParadoxOle, ftDBaseOle, ftOraBlob:
        ADefinition := Format('%s IMAGE', [AFieldName]);
      ftBytes:
        ADefinition := Format('%s BINARY(%d)', [AFieldName, AField.Size]);
      ftVarBytes, ftTypedBinary:
        ADefinition := Format('%s VARBINARY(8000)', [AFieldName]);
    else
      begin
        ShowErrorMsg_UnsupportedFieldType(AFieldName, AField.DataType);

        // 01/18/2006 Set the TField Visible=FALSE.  We will not import
        // this field.  We let the user know so he isn't wondering
        // what happened.  But I dont' want to halt the import, just
        // because we can't import one of the fields.
        ADataSet.FieldByName(AFieldName).Visible := False;
        ADefinition := '';
      end;
    end;

    // return result
    Result := ADefinition > '';

  end;
// ---------------------------------------------------------------------------

var
  i: Integer;
  { IFDEF UNICODE }
  // AFieldListText, ADefinition: AnsiString;
  { ELSE }
  AFieldListText, ADefinition: string;
  { ENDIF }
  AFieldList: TStringList;
  AFailed: Boolean;
begin
  Result := False;

  if ASQL = nil then
    Exit;

  ASQL.Clear;
  ASQL.Add(Format('CREATE TABLE %s ', [ANewTableName]));
  ASQL.Add('(');

  with ADataSet do
    begin
      AFieldList := TStringList.Create;
      try
        if not Active then
          Open;
        for i := 0 to FieldCount - 1 do
          begin
            // If an "include fields" list is provided, check it.  If the
            // field is in the list, then add it; otherwise, skip it.
            if (AIncludeFields <> nil) and
              (AIncludeFields.IndexOf(Fields[i].FieldName) = - 1) then
              Continue;

            if Fields[i].DataType = ftUnknown then
              begin
                ShowErrorMsg_UnsupportedFieldType(Fields[i].DisplayLabel,
                  Fields[i].DataType);
                SysUtils.Abort;
              end;

            AFailed := not _GetFieldDef(Fields[i], ADefinition);
            if not AFailed then
              AFieldList.Add(ADefinition);
          end;
        AFieldListText := Trim(AFieldList.CommaText);
        AFieldListText := StrTran(AFieldListText, '",', ', '#13#10);
        AFieldListText := StrTran(AFieldListText, '"', '');
      finally
        if Assigned(AFieldList) then
          FreeAndNil(AFieldList);
      end;
    end;
  ASQL.Add(AFieldListText);
  ASQL.Add(')');
  if AFailed then
    ASQL.Clear
  else
    Result := True;
end;

function GetDB2CreateTableSQL(const ADataSet: TDataSet;
  const ANewTableName: string; var ASQL: TStringList;
  AIncludeFields: TStringList = nil): Boolean;
// ---------------------------------------------------------------------------
{ IFDEF UNICODE }
// function _GetFieldDef(AField: TField; var ADefinition: AnsiString): Boolean;
{ ELSE }
  function _GetFieldDef(AField: TField; var ADefinition: string): Boolean;
  { ENDIF }
  var
    { IFDEF UNICODE }
    // AFieldName: AnsiString;
    { ELSE }
    AFieldName: string;
    { ENDIF }
  begin
    if (AField = nil) then
      raise Exception.Create
        (IQMS.DBTrans.dbtrscstr.cTXT0000136 { 'Application Error:  Field is null.' } );
    AFieldName := Trim(UpperCase(AField.DisplayLabel));
    ADefinition := '';
    {
      (ftUnknown, ftString, ftSmallint, ftInteger, ftWord, ftBoolean,
      ftFloat, ftCurrency, ftBCD, ftDate, ftTime, ftDateTime,
      ftBytes, ftVarBytes, ftAutoInc, ftBlob, ftMemo, ftGraphic,
      ftFmtMemo, ftParadoxOle, ftDBaseOle, ftTypedBinary, ftCursor,
      ftFixedChar, ftWideString, ftLargeint, ftADT, ftArray,
      ftReference, ftDataSet, ftOraBlob, ftOraClob, ftVariant,
      ftInterface, ftIDispatch, ftGuid, ftTimeStamp, ftFMTBcd)
    }

    case AField.DataType of
      ftString, ftWideString:
        begin
          if AField.Size in [1 .. 255] then
            ADefinition := Format('%s VARCHAR(%d)', [AFieldName, AField.Size])
          else
            ADefinition := Format('%s VARCHAR(2000)', [AFieldName]);
        end;
      ftFixedChar, ftGuid:
        ADefinition := Format('%s CHAR(%d)', [AFieldName, AField.Size]);
      ftMemo, ftFmtMemo:
        ADefinition := Format('%s VARCHAR(4000)', [AFieldName]);
      ftOraClob:
        ADefinition := Format('%s CLOB', [AFieldName]);
      ftSmallint, ftBoolean:
        ADefinition := Format('%s SMALLINT', [AFieldName]);
      ftAutoInc, ftInteger, ftWord:
        ADefinition := Format('%s INTEGER', [AFieldName]);
      ftLargeint:
        ADefinition := Format('%s BIGINT', [AFieldName]);
      ftCurrency:
        ADefinition := Format('%s REAL', [AFieldName]);
      ftFloat, ftBCD, ftFMTBcd:
        ADefinition := Format('%s DOUBLE', [AFieldName]);
      ftDate:
        ADefinition := Format('%s DATE', [AFieldName]);
      ftTime:
        ADefinition := Format('%s TIME', [AFieldName]);
      ftTimeStamp, ftDateTime:
        ADefinition := Format('%s TIMESTAMP', [AFieldName]);
      ftGraphic:
        ADefinition := Format('%s GRAPHIC', [AFieldName]);
      ftBlob, ftParadoxOle, ftDBaseOle, ftOraBlob:
        ADefinition := Format('%s BLOB', [AFieldName]);
      ftBytes:
        ADefinition := Format('%s BINARY(%d)', [AFieldName, AField.Size]);
      ftVarBytes, ftTypedBinary:
        ADefinition := Format('%s VARBINARY(8000)', [AFieldName]);
    else
      begin
        ShowErrorMsg_UnsupportedFieldType(AFieldName, AField.DataType);

        // 01/18/2006 Set the TField Visible=FALSE.  We will not import
        // this field.  We let the user know so he isn't wondering
        // what happened.  But I dont' want to halt the import, just
        // because we can't import one of the fields.
        ADataSet.FieldByName(AFieldName).Visible := False;
        ADefinition := '';
      end;
    end;

    // return result
    Result := ADefinition > '';

  end;
// ---------------------------------------------------------------------------

var
  i: Integer;
  { IFDEF UNICODE }
  // AFieldListText, ADefinition: AnsiString;
  { ELSE }
  AFieldListText, ADefinition: string;
  { ENDIF }
  AFieldList: TStringList;
  AFailed: Boolean;
begin
  Result := False;

  if ASQL = nil then
    Exit;

  ASQL.Clear;
  ASQL.Add(Format('CREATE TABLE %s ', [ANewTableName]));
  ASQL.Add('(');

  with ADataSet do
    begin
      AFieldList := TStringList.Create;
      try
        if not Active then
          Open;
        for i := 0 to FieldCount - 1 do
          begin
            // If an "include fields" list is provided, check it.  If the
            // field is in the list, then add it; otherwise, skip it.
            if (AIncludeFields <> nil) and
              (AIncludeFields.IndexOf(Fields[i].FieldName) = - 1) then
              Continue;

            if Fields[i].DataType = ftUnknown then
              begin
                ShowErrorMsg_UnsupportedFieldType(Fields[i].DisplayLabel,
                  Fields[i].DataType);
                SysUtils.Abort;
              end;

            AFailed := not _GetFieldDef(Fields[i], ADefinition);
            if not AFailed then
              AFieldList.Add(ADefinition);
          end;
        AFieldListText := Trim(AFieldList.CommaText);
        AFieldListText := StrTran(AFieldListText, '",', ', '#13#10);
        AFieldListText := StrTran(AFieldListText, '"', '');
      finally
        if Assigned(AFieldList) then
          FreeAndNil(AFieldList);
      end;
    end;
  ASQL.Add(AFieldListText);
  ASQL.Add(')');
  if AFailed then
    ASQL.Clear
  else
    Result := True;
end;

function GetInterbaseCreateTableSQL(const ADataSet: TDataSet;
  const ANewTableName: string; var ASQL: TStringList;
  AIncludeFields: TStringList = nil): Boolean;
// ---------------------------------------------------------------------------
{ IFDEF UNICODE }
// function _GetFieldDef(AField: TField; var ADefinition: AnsiString): Boolean;
{ ELSE }
  function _GetFieldDef(AField: TField; var ADefinition: string): Boolean;
  { ENDIF }
  var
    { IFDEF UNICODE }
    // AFieldName: AnsiString;
    { ELSE }
    AFieldName: string;
    { ENDIF }
  begin
    if (AField = nil) then
      raise Exception.Create
        (IQMS.DBTrans.dbtrscstr.cTXT0000136 { 'Application Error:  Field is null.' } );
    AFieldName := Trim(UpperCase(AField.DisplayLabel));
    ADefinition := '';
    {
      (ftUnknown, ftString, ftSmallint, ftInteger, ftWord, ftBoolean,
      ftFloat, ftCurrency, ftBCD, ftDate, ftTime, ftDateTime,
      ftBytes, ftVarBytes, ftAutoInc, ftBlob, ftMemo, ftGraphic,
      ftFmtMemo, ftParadoxOle, ftDBaseOle, ftTypedBinary, ftCursor,
      ftFixedChar, ftWideString, ftLargeint, ftADT, ftArray,
      ftReference, ftDataSet, ftOraBlob, ftOraClob, ftVariant,
      ftInterface, ftIDispatch, ftGuid, ftTimeStamp, ftFMTBcd)
    }

    case AField.DataType of
      ftString, ftWideString:
        begin
          if AField.Size in [1 .. 255] then
            ADefinition := Format('%s VARCHAR(%d)', [AFieldName, AField.Size])
          else
            ADefinition := Format('%s VARCHAR(2000)', [AFieldName]);
        end;
      ftGuid:
        ADefinition := Format('%s CHAR(38)', [AFieldName]);
      ftFixedChar:
        ADefinition := Format('%s CHAR(%d)', [AFieldName, AField.Size]);
      ftMemo, ftFmtMemo:
        ADefinition := Format('%s VARCHAR(4000)', [AFieldName]);
      ftOraClob:
        ADefinition := Format('%s VARCHAR(8000)', [AFieldName]);
      ftBoolean, ftSmallint:
        ADefinition := Format('%s SMALLINT', [AFieldName]);
      ftAutoInc, ftInteger, ftWord:
        ADefinition := Format('%s INTEGER', [AFieldName]);
      ftLargeint:
        ADefinition := Format('%s INT64', [AFieldName]);
      ftCurrency:
        ADefinition := Format('%s DECIMAL(10, 4)', [AFieldName]);
      ftFloat, ftBCD, ftFMTBcd:
        ADefinition := Format('%s FLOAT', [AFieldName]);
      ftDate, ftTime, ftDateTime:
        ADefinition := Format('%s TIMESTAMP', [AFieldName]);
      ftTimeStamp:
        ADefinition := Format('%s INTEGER', [AFieldName]);
      ftGraphic, ftBlob, ftParadoxOle, ftDBaseOle, ftOraBlob:
        ADefinition := Format('%s BLOB', [AFieldName]);
      ftBytes, ftVarBytes, ftTypedBinary:
        ADefinition := Format('%s CHAR(%d)', [AFieldName, AField.Size]);
    else
      begin
        ShowErrorMsg_UnsupportedFieldType(AFieldName, AField.DataType);

        // 01/18/2006 Set the TField Visible=FALSE.  We will not import
        // this field.  We let the user know so he isn't wondering
        // what happened.  But I dont' want to halt the import, just
        // because we can't import one of the fields.
        ADataSet.FieldByName(AFieldName).Visible := False;
        ADefinition := '';
      end;
    end;

    // return result
    Result := ADefinition > '';

  end;
// ---------------------------------------------------------------------------

var
  i: Integer;
  { IFDEF UNICODE }
  // AFieldListText, ADefinition: AnsiString;
  { ELSE }
  AFieldListText, ADefinition: string;
  { ENDIF }
  AFieldList: TStringList;
  AFailed: Boolean;
begin
  Result := False;

  if ASQL = nil then
    Exit;

  ASQL.Clear;
  ASQL.Add(Format('CREATE TABLE %s ', [ANewTableName]));
  ASQL.Add('(');

  with ADataSet do
    begin
      AFieldList := TStringList.Create;
      try
        if not Active then
          Open;
        for i := 0 to FieldCount - 1 do
          begin
            // If an "include fields" list is provided, check it.  If the
            // field is in the list, then add it; otherwise, skip it.
            if (AIncludeFields <> nil) and
              (AIncludeFields.IndexOf(Fields[i].FieldName) = - 1) then
              Continue;

            if Fields[i].DataType = ftUnknown then
              begin
                ShowErrorMsg_UnsupportedFieldType(Fields[i].DisplayLabel,
                  Fields[i].DataType);
                SysUtils.Abort;
              end;

            AFailed := not _GetFieldDef(Fields[i], ADefinition);
            if not AFailed then
              AFieldList.Add(ADefinition);
          end;
        AFieldListText := Trim(AFieldList.CommaText);
        AFieldListText := StrTran(AFieldListText, '",', ', '#13#10);
        AFieldListText := StrTran(AFieldListText, '"', '');
      finally
        if Assigned(AFieldList) then
          FreeAndNil(AFieldList);
      end;
    end;
  ASQL.Add(AFieldListText);
  ASQL.Add(')');
  if AFailed then
    ASQL.Clear
  else
    Result := True;
end;

function GetInformixCreateTableSQL(const ADataSet: TDataSet;
  const ANewTableName: string; var ASQL: TStringList;
  AIncludeFields: TStringList = nil): Boolean;
// ---------------------------------------------------------------------------
{ IFDEF UNICODE }
// function _GetFieldDef(AField: TField; var ADefinition: AnsiString): Boolean;
{ ELSE }
  function _GetFieldDef(AField: TField; var ADefinition: string): Boolean;
  { ENDIF }
  var
    { IFDEF UNICODE }
    // AFieldName: AnsiString;
    { ELSE }
    AFieldName: string;
    { ENDIF }
  begin
    if (AField = nil) then
      raise Exception.Create
        (IQMS.DBTrans.dbtrscstr.cTXT0000136 { 'Application Error:  Field is null.' } );
    AFieldName := Trim(UpperCase(AField.DisplayLabel));
    ADefinition := '';
    {
      (ftUnknown, ftString, ftSmallint, ftInteger, ftWord, ftBoolean,
      ftFloat, ftCurrency, ftBCD, ftDate, ftTime, ftDateTime,
      ftBytes, ftVarBytes, ftAutoInc, ftBlob, ftMemo, ftGraphic,
      ftFmtMemo, ftParadoxOle, ftDBaseOle, ftTypedBinary, ftCursor,
      ftFixedChar, ftWideString, ftLargeint, ftADT, ftArray,
      ftReference, ftDataSet, ftOraBlob, ftOraClob, ftVariant,
      ftInterface, ftIDispatch, ftGuid, ftTimeStamp, ftFMTBcd)
    }

    case AField.DataType of
      ftString, ftWideString:
        begin
          if AField.Size in [1 .. 255] then
            ADefinition := Format('%s VARCHAR(%d)', [AFieldName, AField.Size])
          else
            ADefinition := Format('%s VARCHAR(2000)', [AFieldName]);
        end;
      ftFixedChar:
        ADefinition := Format('%s CHAR(%d)', [AFieldName, AField.Size]);
      ftGuid:
        ADefinition := Format('%s CHAR(38)', [AFieldName]);
      ftBoolean:
        ADefinition := Format('%s BOOLEAN', [AFieldName]);
      ftMemo, ftFmtMemo, ftOraClob:
        ADefinition := Format('%s TEXT', [AFieldName]);
      ftSmallint:
        ADefinition := Format('%s SMALLINT', [AFieldName]);
      ftAutoInc, ftInteger, ftWord, ftLargeint:
        ADefinition := Format('%s INTEGER', [AFieldName]);
      ftCurrency:
        ADefinition := Format('%s MONEY', [AFieldName]);
      ftFloat, ftBCD, ftFMTBcd:
        // ADefinition:= Format('%s DECIMAL(10)', [AFieldName]);
        ADefinition := Format('%s FLOAT', [AFieldName]);
      ftDate:
        ADefinition := Format('%s DATE', [AFieldName]);
      ftTime, ftDateTime, ftTimeStamp:
        ADefinition := Format('%s DATETIME', [AFieldName]);
      ftGraphic, ftBlob, ftParadoxOle, ftDBaseOle, ftOraBlob, ftBytes,
        ftVarBytes, ftTypedBinary:
        ADefinition := Format('%s BYTE', [AFieldName]);
    else
      begin
        ShowErrorMsg_UnsupportedFieldType(AFieldName, AField.DataType);

        // 01/18/2006 Set the TField Visible=FALSE.  We will not import
        // this field.  We let the user know so he isn't wondering
        // what happened.  But I dont' want to halt the import, just
        // because we can't import one of the fields.
        ADataSet.FieldByName(AFieldName).Visible := False;
        ADefinition := '';
      end;
    end;

    // return result
    Result := ADefinition > '';

  end;
// ---------------------------------------------------------------------------

var
  i: Integer;
  { IFDEF UNICODE }
  // AFieldListText, ADefinition: AnsiString;
  { ELSE }
  AFieldListText, ADefinition: string;
  { ENDIF }
  AFieldList: TStringList;
  AFailed: Boolean;
begin
  Result := False;

  if ASQL = nil then
    Exit;

  ASQL.Clear;
  ASQL.Add(Format('CREATE TABLE %s ', [ANewTableName]));
  ASQL.Add('(');

  with ADataSet do
    begin
      AFieldList := TStringList.Create;
      try
        if not Active then
          Open;
        for i := 0 to FieldCount - 1 do
          begin
            // If an "include fields" list is provided, check it.  If the
            // field is in the list, then add it; otherwise, skip it.
            if (AIncludeFields <> nil) and
              (AIncludeFields.IndexOf(Fields[i].FieldName) = - 1) then
              Continue;

            if Fields[i].DataType = ftUnknown then
              begin
                ShowErrorMsg_UnsupportedFieldType(Fields[i].DisplayLabel,
                  Fields[i].DataType);
                SysUtils.Abort;
              end;

            AFailed := not _GetFieldDef(Fields[i], ADefinition);
            if not AFailed then
              AFieldList.Add(ADefinition);
          end;
        AFieldListText := Trim(AFieldList.CommaText);
        AFieldListText := StrTran(AFieldListText, '",', ', '#13#10);
        AFieldListText := StrTran(AFieldListText, '"', '');
      finally
        if Assigned(AFieldList) then
          FreeAndNil(AFieldList);
      end;
    end;
  ASQL.Add(AFieldListText);
  ASQL.Add(')');
  if AFailed then
    ASQL.Clear
  else
    Result := True;
end;

function GetMySQLCreateTableSQL(const ADataSet: TDataSet;
  const ANewTableName: string; var ASQL: TStringList;
  AIncludeFields: TStringList = nil): Boolean;
// ---------------------------------------------------------------------------
{ IFDEF UNICODE }
// function _GetFieldDef(AField: TField; var ADefinition: AnsiString): Boolean;
{ ELSE }
  function _GetFieldDef(AField: TField; var ADefinition: string): Boolean;
  { ENDIF }
  var
    { IFDEF UNICODE }
    // AFieldName: AnsiString;
    { ELSE }
    AFieldName: string;
    { ENDIF }
  begin
    if (AField = nil) then
      raise Exception.Create
        (IQMS.DBTrans.dbtrscstr.cTXT0000136 { 'Application Error:  Field is null.' } );
    AFieldName := Trim(UpperCase(AField.DisplayLabel));
    ADefinition := '';
    {
      (ftUnknown, ftString, ftSmallint, ftInteger, ftWord, ftBoolean,
      ftFloat, ftCurrency, ftBCD, ftDate, ftTime, ftDateTime,
      ftBytes, ftVarBytes, ftAutoInc, ftBlob, ftMemo, ftGraphic,
      ftFmtMemo, ftParadoxOle, ftDBaseOle, ftTypedBinary, ftCursor,
      ftFixedChar, ftWideString, ftLargeint, ftADT, ftArray,
      ftReference, ftDataSet, ftOraBlob, ftOraClob, ftVariant,
      ftInterface, ftIDispatch, ftGuid, ftTimeStamp, ftFMTBcd)
    }

    case AField.DataType of
      ftString, ftWideString:
        begin
          if AField.Size in [1 .. 255] then
            ADefinition := Format('%s VARCHAR(%d)', [AFieldName, AField.Size])
          else
            ADefinition := Format('%s VARCHAR(2000)', [AFieldName]);
        end;
      ftFixedChar:
        ADefinition := Format('%s CHAR(%d)', [AFieldName, AField.Size]);
      ftGuid:
        ADefinition := Format('%s CHAR(38)', [AFieldName]);
      ftBoolean:
        ADefinition := Format('%s LOGICAL', [AFieldName]);
      ftMemo, ftFmtMemo:
        ADefinition := Format('%s VARCHAR(4000)', [AFieldName]);
      ftOraClob:
        ADefinition := Format('%s TEXT', [AFieldName]);
      ftSmallint:
        ADefinition := Format('%s SMALLINT', [AFieldName]);
      ftAutoInc, ftInteger, ftWord:
        ADefinition := Format('%s INT', [AFieldName]);
      ftLargeint:
        ADefinition := Format('%s BIGINT', [AFieldName]);
      ftCurrency:
        ADefinition := Format('%s DECIMAL(22, 6)', [AFieldName]);
      ftFloat, ftBCD, ftFMTBcd:
        ADefinition := Format('%s DECIMAL(22, 10)', [AFieldName]);
      // ADefinition:= Format('%s FLOAT(10)', [AFieldName]);
      ftDate:
        ADefinition := Format('%s DATE', [AFieldName]);
      ftTime, ftDateTime:
        ADefinition := Format('%s DATETIME', [AFieldName]);
      ftTimeStamp:
        ADefinition := Format('%s TIMESTAMP', [AFieldName]);
      ftGraphic, ftBlob, ftParadoxOle, ftDBaseOle, ftOraBlob, ftBytes,
        ftVarBytes, ftTypedBinary:
        ADefinition := Format('%s BLOB', [AFieldName]);
    else
      begin
        ShowErrorMsg_UnsupportedFieldType(AFieldName, AField.DataType);

        // 01/18/2006 Set the TField Visible=FALSE.  We will not import
        // this field.  We let the user know so he isn't wondering
        // what happened.  But I dont' want to halt the import, just
        // because we can't import one of the fields.
        ADataSet.FieldByName(AFieldName).Visible := False;
        ADefinition := '';
      end;
    end;

    // return result
    Result := ADefinition > '';

  end;
// ---------------------------------------------------------------------------

var
  i: Integer;
  { IFDEF UNICODE }
  // AFieldListText, ADefinition: AnsiString;
  { ELSE }
  AFieldListText, ADefinition: string;
  { ENDIF }
  AFieldList: TStringList;
  AFailed: Boolean;
begin
  Result := False;

  if ASQL = nil then
    Exit;

  ASQL.Clear;
  ASQL.Add(Format('CREATE TABLE %s ', [ANewTableName]));
  ASQL.Add('(');

  with ADataSet do
    begin
      AFieldList := TStringList.Create;
      try
        if not Active then
          Open;
        for i := 0 to FieldCount - 1 do
          begin
            // If an "include fields" list is provided, check it.  If the
            // field is in the list, then add it; otherwise, skip it.
            if (AIncludeFields <> nil) and
              (AIncludeFields.IndexOf(Fields[i].FieldName) = - 1) then
              Continue;

            if Fields[i].DataType = ftUnknown then
              begin
                ShowErrorMsg_UnsupportedFieldType(Fields[i].DisplayLabel,
                  Fields[i].DataType);
                SysUtils.Abort;
              end;

            AFailed := not _GetFieldDef(Fields[i], ADefinition);
            if not AFailed then
              AFieldList.Add(ADefinition);
          end;
        AFieldListText := Trim(AFieldList.CommaText);
        AFieldListText := StrTran(AFieldListText, '",', ', '#13#10);
        AFieldListText := StrTran(AFieldListText, '"', '');
      finally
        if Assigned(AFieldList) then
          FreeAndNil(AFieldList);
      end;
    end;
  ASQL.Add(AFieldListText);
  ASQL.Add(')');
  if AFailed then
    ASQL.Clear
  else
    Result := True;
end;

function TableExists(ASQLConnection: TSQLConnection;
  ATableName: string): Boolean;
begin
  Result := False;
  if Assigned(ASQLConnection) and (Trim(ATableName) > '') then
    begin
      ATableName := Trim(UpperCase(ATableName));
      Result := DBX_GetValStrFmt(ASQLConnection,
        'SELECT object_name FROM all_objects ' +
        'WHERE owner = SYS_CONTEXT(''USERENV'', ''SESSION_USER'') AND ' +
        'object_type = ''TABLE'' AND ' +
        ' UPPER(object_name) = TRIM(UPPER(''%s'')) AND status = ''VALID'' ',
        [ATableName]) = ATableName;
    end;
end;

function ViewExists(ASQLConnection: TSQLConnection; AViewName: string): Boolean;
begin
  Result := False;
  if Assigned(ASQLConnection) and (Trim(AViewName) > '') then
    begin
      AViewName := Trim(UpperCase(AViewName));
      Result := DBX_GetValStrFmt(ASQLConnection,
        'SELECT object_name FROM all_objects ' +
        'WHERE owner = SYS_CONTEXT(''USERENV'', ''SESSION_USER'') AND ' +
        '  object_type = ''VIEW'' AND ' +
        '  UPPER(object_name) = TRIM(UPPER(''%s'')) AND status = ''VALID'' ',
        [AViewName]) = AViewName;
    end;
end;

function OracleObjectExists(ASQLConnection: TSQLConnection;
  AObjectName: string): Boolean;
begin
  Result := False;
  if Assigned(ASQLConnection) and (Trim(AObjectName) > '') then
    begin
      AObjectName := Trim(UpperCase(AObjectName));
      Result := DBX_GetValStrFmt(ASQLConnection,
        'SELECT object_name FROM all_objects ' +
        'WHERE owner = SYS_CONTEXT(''USERENV'', ''SESSION_USER'') AND ' +
        'UPPER(object_name) = TRIM(UPPER(''%s'')) AND ' +
        '  status = ''VALID''', [AObjectName]) = AObjectName;
    end;
end;

procedure DropTable(SQLConnection: TSQLConnection; ATableName: string);
begin
  if (Trim(ATableName) > '') and Assigned(SQLConnection) then
    try
      if TableExists(SQLConnection, ATableName) then
        begin
          DBX_RunSQLFmt(SQLConnection, 'TRUNCATE TABLE %s',
            [LowerCase(ATableName)]);
          DBX_RunSQLFmt(SQLConnection,
            'DROP TABLE %s CASCADE CONSTRAINTS',
            [LowerCase(ATableName)]);
        end;
    except // suppress
    end;
end;

procedure DropView(SQLConnection: TSQLConnection; AViewName: string);
begin
  if (Trim(AViewName) > '') and Assigned(SQLConnection) then
    try
      DBX_RunSQLFmt(SQLConnection, 'DROP VIEW %s',
        [LowerCase(AViewName)]);
    except // suppress
    end;
end;

procedure DeleteSchemaFiles;
var
  i: Integer;
  ASystemPath: array [0 .. MAX_PATH] of char;
  AFilesList: TStringList;
begin
  AFilesList := TStringList.Create;
  try
    GetSystemDirectory(ASystemPath, SizeOf(ASystemPath));
    FindFiles(IQGetLocalHomePath, 'BDESC*.SCF', AFilesList); // IQMS.Common.FileUtils.pas
    FindFiles(IQGetLocalHomePath, 'SCACHE.INI', AFilesList);
    FindFiles(ASystemPath, 'BDESC*.SCF', AFilesList);
    FindFiles(ASystemPath, 'SCACHE.INI', AFilesList);
    for i := 0 to AFilesList.Count - 1 do
      DeleteFile(AFilesList[i]);
  finally
    FreeAndNil(AFilesList);
  end;
end;

function IsForbiddenField(AFieldName: string): Boolean;
begin
  Result := StrInList(AFieldName, cForbiddenFields) and
    (Pos('_ID', AFieldName) = 0);
end;

function ValidFieldName(const AFieldName: string; var AError: string): Boolean;
const
  // cValidChar = ['A' .. 'Z', '0' .. '9', '_'];
  cUnderscore: char = '_';
var
  ATmp: string;
  i: Integer;
begin
  // Validates the field name for Oracle

  // Get a temporary string we can work with
  ATmp := UpperCase(AFieldName);

  // ensure > ''
  AError := IQMS.DBTrans.dbtrscstr.cTXT0000143; // 'Field name is empty.';
  Result := (Trim(ATmp) > '');
  if not Result then
    Exit;

  AError := IQMS.DBTrans.dbtrscstr.cTXT0000114;
  // 'Field names must be from 2 to 30 characters.'
  Result := Length(ATmp) in [2 .. 30];
  if not Result then
    Exit;

  AError := Format
    (IQMS.DBTrans.dbtrscstr.cTXT0000115 { 'The field name, %s, has invalid characters.' } ,
    [AFieldName]);
  // Valid characters
  for i := 1 to Length(ATmp) do
    begin
      if ATmp[i] = #0 then
        Continue;
      Result := (ATmp[i] = cUnderscore) or Character.IsLetterOrDigit(ATmp[i]);
      if not Result then
        Break;
    end;
  if not Result then
    Exit;

  // Reserved words
  AError := Format
    (IQMS.DBTrans.dbtrscstr.cTXT0000116 { 'The field name, %s, is a reserved word.' } ,
    [AFieldName]);

  { NOTE:  08/10/2006 I remmed some of these reserved words because you can still
    add them as fields and select on them. }
  Result := not StrInList(ATmp, // iqstring
    ['ACCESS',
    // 'ACCOUNT',
    // 'ACTIVATE',
    'ADD',
    // 'ADMIN',
    // 'ADVISE',
    // 'AFTER',
    'ALL',
    // 'ALL_ROWS',
    // 'ALLOCATE',
    'ALTER',
    // 'ANALYZE',
    'AND', 'ANY',
    // 'ARCHIVE',
    // 'ARCHIVELOG',
    // 'ARRAY',
    // 'ARRAYLEN',
    'AS', 'ASC',
    // 'AT',
    'AUDIT',
    // 'AUTHENTICATED',
    // 'AUTHORIZATION',
    // 'AUTOEXTEND',
    // 'AUTOMATIC',
    // 'AVG',
    // 'BACKUP',
    // 'BECOME',
    // 'BEFORE',
    // 'BEGIN',
    'BETWEEN',
    // 'BFILE',
    // 'BITMAP',
    // 'BLOB',
    // 'BLOCK',
    // 'BODY',
    'BY',
    // 'CACHE',
    // 'CACHE_INSTANCES',
    // 'CANCEL',
    // 'CASCADE',
    // 'CAST',
    // 'CFILE',
    // 'CHAINED',
    // 'CHANGE',
    'CHAR',
    // 'CHAR_CS',
    // 'CHARACTER',
    'CHECK',
    // 'CHECKPOINT',
    // 'CHOOSE',
    // 'CHUNK',
    // 'CLEAR',
    // 'CLOB',
    // 'CLONE',
    // 'CLOSE',
    // 'CLOSE_CACHED_OPEN_CURSORS',
    'CLUSTER',
    // 'COALESCE',
    // 'COBOL',
    'COLUMN',
    // 'COLUMNS',
    'COMMENT',
    // 'COMMIT',
    // 'COMMITTED',
    // 'COMPATIBILITY',
    // 'COMPILE',
    // 'COMPLETE',
    // 'COMPOSITE_LIMIT',
    'COMPRESS',
    // 'COMPUTE',
    'CONNECT',
    // 'CONNECT_TIME',
    // 'CONSTRAINT',
    // 'CONSTRAINTS',
    // 'CONTENTS',
    // 'CONTINUE',
    // 'CONTROLFILE',
    // 'CONVERT',
    // 'COST',
    // 'COUNT',
    // 'CPU_PER_CALL',
    // 'CPU_PER_SESSION',
    'CREATE', 'CURRENT',
    // 'CURRENT_SCHEMA',
    // 'CURRENT_USER',
    // 'CURSOR',
    // 'CYCLE',
    // 'DANGLING',
    // 'DATABASE',
    // 'DATAFILE',
    // 'DATAFILES',
    // 'DATAOBJNO',
    'DATE',
    // 'DBA',
    // 'DBHIGH',
    // 'DBLOW',
    // 'DBMAC',
    // 'DEALLOCATE',
    // 'DEBUG',
    // 'DEC',
    'DECIMAL',
    // 'DECLARE',
    'DEFAULT',
    // 'DEFERRABLE',
    // 'DEFERRED',
    // 'DEGREE',
    'DELETE',
    // 'DEREF',
    'DESC',
    // 'DIRECTORY',
    // 'DISABLE',
    // 'DISCONNECT',
    // 'DISMOUNT',
    'DISTINCT',
    // 'DISTRIBUTED',
    // 'DML',
    // 'DOUBLE',
    'DROP',
    // 'DUMP',
    // 'EACH',
    'ELSE',
    // 'ENABLE',
    // 'END',
    // 'ENFORCE',
    // 'ENTRY',
    // 'ESCAPE',
    // 'ESTIMATE',
    // 'EVENTS',
    // 'EXCEPT',
    // 'EXCEPTIONS',
    // 'EXCHANGE',
    // 'EXCLUDING',
    'EXCLUSIVE',
    // 'EXEC',
    // 'EXECUTE',
    'EXISTS',
    // 'EXPIRE',
    // 'EXPLAIN',
    // 'EXTENT',
    // 'EXTENTS',
    // 'EXTERNALLY',
    // 'FAILED_LOGIN_ATTEMPTS',
    // 'FALSE',
    // 'FAST',
    // 'FETCH',
    'FILE',
    // 'FIRST_ROWS',
    // 'FLAGGER',
    'FLOAT',
    // 'FLOB',
    // 'FLUSH',
    'FOR',
    // 'FORCE',
    // 'FOREIGN',
    // 'FORTRAN',
    // 'FOUND',
    // 'FREELIST',
    // 'FREELISTS',
    'FROM',
    // 'FULL',
    // 'FUNCTION',
    // 'GLOBAL',
    // 'GLOBAL_NAME',
    // 'GLOBALLY',
    // 'GO',
    // 'GOTO',
    'GRANT', 'GROUP',
    // 'GROUPS',
    // 'HASH',
    // 'HASHKEYS',
    'HAVING',
    // 'HEADER',
    // 'HEAP',
    'IDENTIFIED',
    // 'IDGENERATORS',
    // 'IDLE_TIME',
    // 'IF',
    'IMMEDIATE', 'IN',
    // 'INCLUDING',
    'INCREMENT',
    // 'IND_PARTITION',
    'INDEX',
    // 'INDEXED',
    // 'INDEXES',
    // 'INDICATOR',
    'INITIAL',
    // 'INITIALLY',
    // 'INITRANS',
    'INSERT',
    // 'INSTANCE',
    // 'INSTANCES',
    // 'INSTEAD',
    // 'INT',
    'INTEGER',
    // 'INTERMEDIATE',
    'INTERSECT', 'INTO', 'IS',
    // 'ISOLATION',
    // 'ISOLATION_LEVEL',
    // 'KEEP',
    // 'KEY',
    // 'KILL',
    // 'LABEL',
    // 'LANGUAGE',
    // 'LAYER',
    // 'LESS',
    'LEVEL',
    // 'LIBRARY',
    'LIKE',
    // 'LIMIT',
    // 'LINK',
    // 'LIST',
    // 'LISTS',
    // 'LOB',
    // 'LOCAL',
    'LOCK',
    // 'LOCKED',
    // 'LOG',
    // 'LOGFILE',
    // 'LOGGING',
    // 'LOGICAL_READS_PER_CALL',
    // 'LOGICAL_READS_PER_SESSION',
    'LONG',
    // 'MANAGE',
    // 'MANUAL',
    // 'MASTER',
    // 'MAX',
    // 'MAXARCHLOGS',
    // 'MAXDATAFILES',
    'MAXEXTENTS',
    // 'MAXINSTANCES',
    // 'MAXLOGFILES',
    // 'MAXLOGHISTORY',
    // 'MAXLOGMEMBERS',
    // 'MAXSIZE',
    // 'MAXTRANS',
    // 'MAXVALUE',
    // 'MEMBER',
    // 'MIN',
    // 'MINEXTENTS',
    // 'MINIMUM',
    'MINUS',
    // 'MINVALUE',
    // 'MLS_LABEL_FORMAT',
    'MLSLABEL', 'MODE', 'MODIFY',
    // 'MODULE',
    // 'MOUNT',
    // 'MOVE',
    // 'MTS_DISPATCHERS',
    // 'MULTISET',
    // 'NATIONAL',
    // 'NCHAR',
    // 'NCHAR_CS',
    // 'NCLOB',
    // 'NEEDED',
    // 'NESTED',
    // 'NETWORK',
    // 'NEW',
    // 'NEXT',
    // 'NOARCHIVELOG',
    'NOAUDIT',
    // 'NOCACHE',
    'NOCOMPRESS',
    // 'NOCYCLE',
    // 'NOFORCE',
    // 'NOLOGGING',
    // 'NOMAXVALUE',
    // 'NOMINVALUE',
    // 'NONE',
    // 'NOORDER',
    // 'NOOVERRIDE',
    // 'NOPARALLEL',
    // 'NORESETLOGS',
    // 'NOREVERSE',
    // 'NORMAL',
    // 'NOSORT',
    'NOT',
    // 'NOTFOUND',
    // 'NOTHING',
    'NOWAIT', 'NULL', 'NUMBER',
    // 'NUMERIC',
    // 'NVARCHAR2',
    // 'OBJECT',
    // 'OBJNO',
    // 'OBJNO_REUSE',
    'OF',
    // 'OFF',
    'OFFLINE',
    // 'OID',
    // 'OIDINDEX',
    // 'OLD',
    'ON', 'ONLINE',
    // 'ONLY',
    // 'OPCODE',
    // 'OPEN',
    // 'OPTIMAL',
    // 'OPTIMIZER_GOAL',
    'OPTION', 'OR', 'ORDER',
    // 'ORGANIZATION',
    // 'OSLABEL',
    'OVERFLOW',
    // 'OWN',
    // 'PACKAGE',
    // 'PACKED',
    // 'PARALLEL',
    // 'PARTITION',
    // 'PASSWORD',
    // 'PASSWORD_GRACE_TIME',
    // 'PASSWORD_LIFE_TIME',
    // 'PASSWORD_LOCK_TIME',
    // 'PASSWORD_REUSE_MAX',
    // 'PASSWORD_REUSE_TIME',
    // 'PASSWORD_VERIFY_FUNCTION',
    'PCTFREE',
    // 'PCTINCREASE',
    // 'PCTTHRESHOLD',
    // 'PCTUSED',
    // 'PCTVERSION',
    // 'PERCENT',
    // 'PERMANENT',
    // 'PLAN',
    // 'PLI',
    // 'PLSQL_DEBUG',
    // 'POST_TRANSACTION',
    // 'PRECISION',
    // 'PRESERVE',
    // 'PRIMARY',
    'PRIOR',
    // 'PRIVATE',
    // 'PRIVATE_SGA',
    // 'PRIVILEGE',
    'PRIVILEGES',
    // 'PROCEDURE',
    // 'PROFILE',
    'PUBLIC',
    // 'PURGE',
    // 'QUEUE',
    // 'QUOTA',
    // 'RANGE',
    'RAW',
    // 'RBA',
    // 'READ',
    // 'READUP',
    // 'REAL',
    // 'REBUILD',
    // 'RECOVER',
    // 'RECOVERABLE',
    // 'RECOVERY',
    // 'REF',
    // 'REFERENCES',
    // 'REFERENCING',
    // 'REFRESH',
    'RENAME',
    // 'REPLACE',
    // 'RESET',
    // 'RESETLOGS',
    // 'RESIZE',
    'RESOURCE',
    // 'RESTRICTED',
    // 'RETURN',
    // 'RETURNING',
    // 'REUSE',
    // 'REVERSE',
    'REVOKE',
    // 'ROLE',
    // 'ROLES',
    // 'ROLLBACK',
    'ROW', 'ROWID',
    // 'ROWLABEL',
    'ROWNUM', 'ROWS',
    // 'RULE',
    // 'SAMPLE',
    // 'SAVEPOINT',
    // 'SB4',
    // 'SCAN_INSTANCES',
    // 'SCHEMA',
    // 'SCN',
    // 'SCOPE',
    // 'SD_ALL',
    // 'SD_INHIBIT',
    // 'SD_SHOW',
    // 'SECTION',
    // 'SEG_BLOCK',
    // 'SEG_FILE',
    // 'SEGMENT',
    'SELECT',
    // 'SEQUENCE',
    // 'SERIALIZABLE',
    'SESSION',
    // 'SESSION_CACHED_CURSORS',
    // 'SESSIONS_PER_USER',
    'SET', 'SHARE',
    // 'SHARED',
    // 'SHARED_POOL',
    // 'SHRINK',
    'SIZE',
    // 'SKIP',
    // 'SKIP_UNUSABLE_INDEXES',
    'SMALLINT',
    // 'SNAPSHOT',
    // 'SOME',
    // 'SORT',
    // 'SPECIFICATION',
    // 'SPLIT',
    // 'SQL',
    // 'SQL_TRACE',
    // 'SQLBUF',
    // 'SQLCODE',
    // 'SQLERROR',
    // 'SQLSTATE',
    // 'STANDBY',
    'START',
    // 'STATEMENT_ID',
    // 'STATISTICS',
    // 'STOP',
    // 'STORAGE',
    // 'STORE',
    // 'STRUCTURE',
    'SUCCESSFUL',
    // 'SUM',
    // 'SWITCH',
    'SYNONYM',
    // 'SYS_OP_ENFORCE_NOT_NULL$',
    // 'SYS_OP_NTCIMG$',
    'SYSDATE',
    // 'SYSDBA',
    // 'SYSOPER',
    // 'SYSTEM',
    'TABLE',
    // 'TABLES',
    // 'TABLESPACE',
    // 'TABLESPACE_NO',
    // 'TABNO',
    // 'TEMPORARY',
    // 'THAN',
    // 'THE',
    'THEN',
    // 'THREAD',
    // 'TIME',
    // 'TIMESTAMP',
    'TO',
    // 'TOPLEVEL',
    // 'TRACE',
    // 'TRACING',
    // 'TRANSACTION',
    // 'TRANSITIONAL',
    'TRIGGER',
    // 'TRIGGERS',
    // 'True',
    // 'TRUNCATE',
    // 'TX',
    // 'TYPE',
    // 'UB2',
    // 'UBA',
    'UID',
    // 'UNARCHIVED',
    // 'UNDER',
    // 'UNDO',
    'UNION', 'UNIQUE',
    // 'UNLIMITED',
    // 'UNLOCK',
    // 'UNPACKED',
    // 'UNRECOVERABLE',
    // 'UNTIL',
    // 'UNUSABLE',
    // 'UNUSED',
    // 'UPDATABLE',
    'UPDATE',
    // 'USAGE',
    // 'USE',
    'USER',
    // 'USING',
    'VALIDATE',
    // 'VALIDATION',
    // 'VALUE',
    'VALUES', 'VARCHAR', 'VARCHAR2',
    // 'VARYING',
    'VIEW',
    // 'WHEN',
    'WHENEVER', 'WHERE', 'WITH'
    // 'WITHOUT',
    // 'WORK',
    // 'WRITE',
    // 'WRITEDOWN',
    // 'WRITEUP',
    // 'XID'
    ]);

  if Result then
    AError := '';

end;

function PromptTableName(var ATableName: string; const APrompt: string)
  : Boolean;
begin
  // Calls overload below, but passes NIL for SQLConnection
  Result := PromptTableName(nil, { var } ATableName, APrompt, False);
end;

function PromptTableName(ASQLConnection: TSQLConnection; var ATableName: string;
  const APrompt: string; AForceUpperCase: Boolean): Boolean;
const
  { cUpper = ['A' .. 'Z'];
    cLower = ['a' .. 'z'];
    cNumber = ['0' .. '9']; }
  cUnderscore: char = '_';
  cOther = ['_'];
var
  ADone, ACancelled, AInvalidChar: Boolean;
  i: Integer;
  APromptText: string;

  function _ValidChar(const c: char): Boolean;
  begin
    if AForceUpperCase then
      Result := Character.IsUpper(c) or Character.IsDigit(c) or
        SysUtils.CharInSet(c, cOther)
    else
      Result := Character.IsLetterOrDigit(c) or SysUtils.CharInSet(c, cOther);
  end;

begin
  // initial
  ACancelled := False;
  ADone := False;
  Result := False;
  APromptText := APrompt;
  if IQMS.Common.StringUtils.IsEmpty(APromptText) then
    // IQMS.DBTrans.dbtrscstr.cTXT0000212 = 'Please enter a unique table name:';
    APromptText := IQMS.DBTrans.dbtrscstr.cTXT0000212;

  // get a unique table name
  repeat
    // IQMS.DBTrans.dbtrscstr.cTXT0000040 = 'Table Name'
    if AForceUpperCase then
      ACancelled := not IQMS.Common.InputQuery.IQInputQueryUpper(IQMS.DBTrans.dbtrscstr.cTXT0000040,
        APromptText, ATableName)
    else
      ACancelled := not IQMS.Common.InputQuery.IQInputQuery(IQMS.DBTrans.dbtrscstr.cTXT0000040, APromptText,
        ATableName);

    if ACancelled then
      Break;
    AInvalidChar := False; // reset

    // validate table name
    if AForceUpperCase then
      ATableName := Trim(UpperCase(ATableName))
    else
      ATableName := Trim(ATableName);
    ATableName := IQMS.Common.StringUtils.RemoveWhiteSpace(ATableName, cUnderscore);

    for i := 1 to Length(ATableName) do
      if not _ValidChar(ATableName[i]) then
        begin
          AInvalidChar := True;
          Break;
        end;

    // IQMS.DBTrans.dbtrscstr.cTXT0000213 = 'Invalid character in table name.';
    // IQMS.DBTrans.dbtrscstr.cTXT0000214 = 'Table name must not be longer than 30
    // characters.';
    // IQMS.DBTrans.dbtrscstr.cTXT0000215 = 'Table already exists.  Please enter a unique
    // table name.';
    // IQMS.DBTrans.dbtrscstr.cTXT0000216 = 'Please enter a table name.';
    // IQMS.DBTrans.dbtrscstr.cTXT0000217 = 'The table name you entered is a reserved word.
    // Please enter a different table name.';

    if ATableName = '' then
      IQError(IQMS.DBTrans.dbtrscstr.cTXT0000216)
    else if Length(ATableName) > 30 then
      IQError(IQMS.DBTrans.dbtrscstr.cTXT0000214)
    else if AInvalidChar then
      IQError(IQMS.DBTrans.dbtrscstr.cTXT0000213)
    else if IQMS.DBTrans.dbtfields.IsJetReservedWord(ATableName) or
      IQMS.DBTrans.dbtfields.IsOracleReservedWord(ATableName) or
      IQMS.DBTrans.dbtfields.IsSQLServerReservedWord(ATableName) then
      IQError(IQMS.DBTrans.dbtrscstr.cTXT0000217)
    else if Assigned(ASQLConnection) and TableExists(ASQLConnection,
      ATableName) then
      IQError(IQMS.DBTrans.dbtrscstr.cTXT0000215)
    else
      ADone := not ACancelled;

  until ADone = True;

  Result := not ACancelled and (ATableName > '');

end;

procedure ParseLookupKeySQL(const ASQL: string; var ALookupTable, AResultField,
  ALookupField, ALookupKey: string);
var
  S: string;
begin
  S := ASQL;
  S := StrTran(S, '{', '');
  S := StrTran(S, '}', '');
  S := StrTran(S, 'SELECT', '');
  S := StrTran(S, 'FROM', '|');
  S := StrTran(S, 'WHERE', '|');
  S := StrTran(S, '=', '|');
  // S should be something like ARCUSTO_ID|CONTACT|FIRST_NAME|CUSER1
  AResultField := Trim(IQMS.Common.StringUtils.GetToken(S, '|', 1));
  ALookupTable := Trim(IQMS.Common.StringUtils.GetToken(S, '|', 2));
  ALookupField := Trim(IQMS.Common.StringUtils.GetToken(S, '|', 3));
  ALookupKey := Trim(IQMS.Common.StringUtils.GetToken(S, '|', 4));
end;

function ValidDataFileName(AFileName: TFileName): Boolean;
(*
  const
  cUpper = ['A'..'Z'];
  cLower = ['a'..'z'];
  cNumber= ['0'..'9'];
  cOther = [' ', '_', '-', '~', '!', '@', '#',
  '$', '%', '^', '&', '*', '(', ')', '{', '}',
  '[', ']', '|', '"', '?', '<', '>'];
  cValidChar = cUpper + cLower + cNumber + cOther;
*)
var
  AExt, S: string;
  i: Integer;
begin
  // 03/02/2006 Added this method.  For text files, an extra period in a text file
  // name will mess up the schema file.

  // if it is not a text file, skip it and pass True
  AExt := UpperCase(ExtractFileExt(AFileName));
  if (AExt <> '.TXT') and (AExt <> '.CSV') then
    begin
      Result := True;
      Exit;
    end;

  // if we are working with a text file, check the file name for an extra period
  S := FileNameNoExt(AFileName);
  if Pos('.', S) > 0 then
    // 'Invalid file name.  Data file names cannot contain extra periods.'
    raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000139);

  { I remmed this but kept it in case we need to go this route in the future
    for i := 1 to Length(S) do
    if not (S[i] in cValidChar) then
    raise Exception.Create('Invalid file name.  Text file names should contain only letters and numbers.'); }

  // if we get here, all is well; pass True
  Result := True;
end;

function CheckValidFields(ADataSet: TDataSet): Boolean;
var
  i: Integer;
  AList: TStringList;
  AFieldName, AError: string;
begin
  { This method cycles the fields in a dataset.  Each field name is checked
    against the master list of forbidden fields and reserved words.  If a field
    name is a reserved word, then it is added to the list (AList).  And error
    is displayed if there are bad fields in the list. }

  // initial result
  Result := True;

  // the table must be opened before we get here
  if not ADataSet.Active then
    Exit;

  // create the list that will hold bad field names
  AList := TStringList.Create;
  try
    // cycle the field list and check each field name
    for i := 0 to ADataSet.FieldCount - 1 do
      begin
        AFieldName := ADataSet.Fields[i].FieldName;
        // if this is a bad field, add it to the list
        if not ValidFieldName(AFieldName, AError) then
          AList.Add(Format('%s - %s', [AFieldName, AError]));
      end;

    // A good result (True) means we have NO BAD FIELDS.  If we have any items
    // in the list, then return FALSE -- an error condition.
    Result := AList.Count = 0;

    // If we have an error condition, display the list to the user
    if not Result then
      IQError(IQMS.DBTrans.dbtrscstr.
        cTXT0000144 { 'The data file cannot be imported because the following fields are invalid:' }
        + #13#13 + AList.Text); // iqmesg

  finally
    // free the TStringList
    if Assigned(AList) then
      FreeAndNil(AList);
  end;
end;

{ Parses Lookup SQL }
function ParseLookupSQL(const ADataSet: TDataSet; const ARawSQL: string;
  var AParsedSQL: string): Boolean;
var
  i: Integer;
  bGetField: Boolean;
  AFieldName, AFieldValue: string;
begin
  // Source fields referenced in the SQL are surround by curly braces.
  bGetField := False; // initial
  AParsedSQL := ''; // clear the var param first
  for i := 1 to Length(ARawSQL) do
    begin
      // set flag to start/stop getting field name
      if ARawSQL[i] = '{' then
        begin
          bGetField := True;
          Continue;
        end
      else if ARawSQL[i] = '}' then
        begin
          AFieldName := Trim(AFieldName); // compensate for user error
          if ADataSet.FindField(AFieldName) <> nil then
            begin
              AFieldValue := GetFormattedDataAsString
                (ADataSet.FieldByName(AFieldName)); // IQMS.DBTrans.dbtfields.pas
              AParsedSQL := AParsedSQL + AFieldValue;
            end
          else
            AParsedSQL := AParsedSQL + 'NULL'; // in case something goes wrong

          bGetField := False;
          AFieldName := ''; // reset
          Continue;
        end;

      if not bGetField then
        AParsedSQL := AParsedSQL + ARawSQL[i]
      else
        AFieldName := AFieldName + ARawSQL[i];
    end;

  Result := Trim(AParsedSQL) > '';

end;

procedure GetParsedSQL(ADataSet: TDataSet; const AParams: TParams;
  const SQL: TStrings; var ASQLText: string);

  procedure _ReplaceParam(AParam, AValue: string);
  begin
    ASQLText := IQMS.Common.StringUtils.ReplaceWords(ASQLText, AParam, AValue,
      [rfReplaceAll, rfIgnoreCase]);
  end;

var
  i: Integer;
  AParamLabel, AParamValue: string;
  AParam: TParam;
begin
  if not Assigned(ADataSet) then
    Exit;
  if not Assigned(AParams) then
    Exit;

  try
    try
      // Initial value (default)
      ASQLText := SQL.Text;
      { (ftUnknown, ftString, ftSmallint, ftInteger, ftWord, ftBoolean, ftFloat,
        ftCurrency, ftBCD, ftDate, ftTime, ftDateTime, ftBytes, ftVarBytes,
        ftAutoInc, ftBlob, ftMemo, ftGraphic, ftFmtMemo, ftParadoxOle, ftDBaseOle,
        ftTypedBinary, ftCursor, ftFixedChar, ftWideString, ftLargeint, ftADT,
        ftArray, ftReference, ftDataSet, ftOraBlob, ftOraClob, ftVariant,
        ftInterface, ftIDispatch, ftGuid, ftTimeStamp, ftFMTBcd, ftFixedWideChar,
        ftWideMemo, ftOraTimeStamp, ftOraInterval, ftLongWord, ftShortint,
        ftByte, ftExtended, ftConnection, ftParams, ftStream, ftTimeStampOffset,
        ftObject, ftSingle) }
      for i := 0 to AParams.Count - 1 do
        begin
          AParam := AParams[i];
          AParamLabel := ':' + UpperCase(AParams[i].Name);

          // NOTE:  For future development, I've never encountered ftOraClob type;
          // I'm not sure if it should be treated as a string.
          if AParam.IsNull or Variants.VarIsEmpty(AParam.Value) then
            begin
              _ReplaceParam(AParamLabel, 'NULL');
              Continue;
            end;

          // else if (AParams[i].DataType in db.ftNonTextTypes)
          // AParamValue := '(Binary)'
          case AParam.DataType of
            // Text field types
            ftAdt, ftFixedChar, ftFixedWideChar, ftFmtMemo, ftMemo, ftString,
              ftWideMemo, ftWideString:
              begin
                if AParam.AsString = '' then
                  AParamValue := 'NULL'
                else
                  AParamValue := Format('''%s''', [AParams[i].AsString]);
              end;

            // Integer field types
            ftAutoInc, ftByte, ftInteger, ftLargeint, ftLongWord, ftShortint,
              ftSingle, ftSmallint, ftWord:
              AParamValue := Format('%d', [AParams[i].AsInteger]);

            // Floating point field types
            ftBCD, ftCurrency, ftExtended, ftFloat, ftFMTBcd:
              AParamValue := Format('%f', [AParams[i].AsFloat]);

            // Date/Time field types
            ftDate, ftDateTime, ftOraTimeStamp, ftTime, ftTimeStamp,
              ftTimeStampOffset:
              AParamValue := Format('TO_DATE(''%s'', ''MM/DD/RRRR'')',
                [FormatDateTime('mm/dd/yyyy', StrToDate(AParams[i].AsString))]);

            // GUID
            // Note:  I've never run into this so ...
            ftGuid:
              AParamValue := Format('''%s''', [AParams[i].AsString]);

            // Clob
            // Note:  This is untested
            ftOraClob:
              AParamValue := Format('''%s''', [AParams[i].AsString]);

          else
            AParamValue := Format('(%s)', [FieldTypeNames[AParam.DataType]]);
          end; // end case

          // Change param text to value
          _ReplaceParam(AParamLabel, AParamValue);

        end;
    finally
      AParam := nil; // dereference
    end;
  except // suppress
  end;
end;

procedure GetParsedSQL(ADataSet: TDataSet; const AParams: TFDParams;
  const SQL: TStrings; var ASQLText: string);

  procedure _ReplaceParam(AParam, AValue: string);
  begin
    ASQLText := IQMS.Common.StringUtils.ReplaceWords(ASQLText, AParam, AValue,
      [rfReplaceAll, rfIgnoreCase]);
  end;

var
  i: Integer;
  AParamLabel, AParamValue: string;
begin
  if not Assigned(ADataSet) then
    Exit;
  if not Assigned(AParams) then
    Exit;

  try

    // Initial value (default)
    ASQLText := SQL.Text;

    for i := 0 to AParams.Count - 1 do
      begin
        AParamLabel := ':' + UpperCase(AParams[i].Name);
        if (AParams[i].DataType in [ftString, ftMemo, ftFmtMemo, ftFixedChar,
          ftWideString]) then
          begin
            AParamValue := AParams[i].Value;
            AParamValue := Format('''%s''', [AParamValue])
          end
        else
          begin
            if AParams[i].IsNull or Variants.VarIsEmpty(AParams[i].Value) then
            //if (AParams[i].Value = Unassigned) then
              AParamValue := 'NULL'
            else
              AParamValue := Variants.VarAsType(AParams[i].Value, varString);
          end;

        // Change param text to value
        _ReplaceParam(AParamLabel, AParamValue);

      end;

  except // suppress
  end;
end;

procedure GetParsedSQL(ADataSet: TDataSet; const AParams: TParameters;
  const SQL: TStrings; var ASQLText: string);

  procedure _ReplaceParam(AParam, AValue: string);
  begin
    ASQLText := IQMS.Common.StringUtils.ReplaceWords(ASQLText, AParam, AValue,
      [rfReplaceAll, rfIgnoreCase]);
  end;

var
  i: Integer;
  AParamLabel, AParamValue: string;
begin
  if not Assigned(ADataSet) then
    Exit;
  if not Assigned(AParams) then
    Exit;

  try

    // Initial value (default)
    ASQLText := SQL.Text;

    for i := 0 to AParams.Count - 1 do
      begin
        AParamLabel := ':' + UpperCase(AParams[i].Name);
        if (AParams[i].DataType in [ftString, ftMemo, ftFmtMemo, ftFixedChar,
          ftWideString]) then
          begin
            AParamValue := AParams[i].Value;
            AParamValue := Format('''%s''', [AParamValue])
          end
        else
          begin
            if Variants.VarIsEmpty(AParams[i].Value) then
              AParamValue := 'NULL'
            else
              AParamValue := Variants.VarAsType(AParams[i].Value, varString);
          end;

        // Change param text to value
        _ReplaceParam(AParamLabel, AParamValue);

      end;

  except // suppress
  end;
end;

procedure GetParsedSQL(AQuery: TSQLQuery; var ASQLText: string);
begin
  GetParsedSQL(TDataSet(AQuery), AQuery.Params, AQuery.SQL, ASQLText);
end;

procedure GetParsedSQL(AQuery: TIQWebDbxQuery; var ASQLText: string);
begin
  GetParsedSQL(TDataSet(AQuery), AQuery.Params, AQuery.SQL, ASQLText);
end;

procedure GetParsedSQL(AQuery: TFDQuery; var ASQLText: string);
begin
  GetParsedSQL(TDataSet(AQuery), AQuery.Params, AQuery.SQL, ASQLText);
end;

procedure GetParsedSQL(AQuery: TADOQuery; var ASQLText: string);

// ---------------------------------------------------------------------------
  function _ReplaceParam(AParam, AValue: string): string;
  var
    AStart, AEnd: Integer;
  begin
    try
      AStart := Pos(UpperCase(AParam), UpperCase(ASQLText));
      AEnd := AStart; // initial value
      // Find the end position of the word
      while (AEnd < Length(ASQLText)) and
        (ASQLText[AEnd] in constVALID_CHARS) do
        Inc(AEnd);

      ASQLText := Copy(ASQLText, 0, AStart - 1) + AValue +
        Copy(ASQLText, AEnd, Length(ASQLText));

    except // suppress
    end;
  end;

// ---------------------------------------------------------------------------
var
  i: Integer;
  AParam, AValue: string;
begin
  if not Assigned(AQuery) then
    Exit;

  // 06/10/2010 Changed to this call to keep the code in one place
  GetParsedSQL(AQuery, AQuery.Parameters, AQuery.SQL, ASQLText);
end;

function GetDelimText(const AStringList: TStringList;
  const ADelim: string): string;
var
  i: Integer;
begin
  if not Assigned(AStringList) then
    Exit;

  Result := ''; // initial

  for i := 0 to AStringList.Count - 1 do
    // NOTE:  Don't add delimiter to the first item
    Result := Result + sIIf(i = 0, '', ADelim) + AStringList.Strings[i];
end;

function GetMicrosoftJetTableDefinition(const ADataSet: TDataSet;
  const ANewTableName: string; var ADefinition: TStringList): Boolean;
// ---------------------------------------------------------------------------
  function GetMSAccessFieldDefinition(AField: TField): string;
  var
    AFieldName: string;
  begin
    AFieldName := AField.FieldName;
    if (AField.DataType in [ftMemo, ftFmtMemo]) then
      Result := Format('%s Memo', [AFieldName])
    else if IsStringFieldType(AField.DataType) then
      begin
        if AField.Size in [1 .. 255] then
          Result := Format('%s Text(%d)', [AFieldName, AField.Size])
        else
          Result := Format('%s Memo', [AFieldName]);
      end
    else if IsFloatFieldType(AField.DataType) or
      IsIntegerFieldType(AField.DataType) then
      Result := Format('%s Number', [AFieldName])
    else if IsDateTimeFieldType(AField.DataType) then
      Result := Format('%s DateTime', [AFieldName])
    else
      begin
        ShowErrorMsg_UnsupportedFieldType(AField.FieldName, AField.DataType);
        SysUtils.Abort;
      end;
  end;

// ---------------------------------------------------------------------------
var
  i: Integer;
  { IFDEF UNICODE }
  // AFieldListText: AnsiString;
  { ELSE }
  AFieldListText: string;
  { ENDIF }
  AFieldList: TStringList;
begin
  Result := False;

  // 05/26/2009 Changed silent check to this exception
  if (ADefinition = nil) then
    raise Exception.Create('Application Error: Field definition not ' +
      'provided. Cannot create table.');

  // 05/26/2009 Changed silent check to this exception
  if (ADataSet = nil) then
    raise Exception.Create('Application Error: Source dataset not ' +
      'provided. Cannot create table.');

  // 05/26/2009
  if (Trim(ANewTableName) = '') then
    raise Exception.Create('Application Error: Table name not provided.  ' +
      'Cannot create table.');

  ADefinition.Clear;
  ADefinition.Add(Format('CREATE TABLE %s ', [ANewTableName]));
  ADefinition.Add('(');

  with ADataSet do
    begin
      AFieldList := TStringList.Create;
      try
        if not Active then
          Open;
        for i := 0 to FieldCount - 1 do
          if Fields[i].Visible then
            begin
              if Fields[i].DataType = ftUnknown then
                begin
                  ShowErrorMsg_UnsupportedFieldType(Fields[i].FieldName,
                    Fields[i].DataType);
                  SysUtils.Abort;
                end;

              AFieldList.Add(GetMSAccessFieldDefinition(Fields[i]));
            end;
        AFieldListText := Trim(AFieldList.CommaText);
        AFieldListText := StrTran(AFieldListText, '",', ', '#13);
        AFieldListText := StrTran(AFieldListText, '"', '');
      finally
        if Assigned(AFieldList) then
          FreeAndNil(AFieldList);
      end;
    end;
  ADefinition.Add(AFieldListText);
  ADefinition.Add(')');
  Result := True;
end;

function StartEndText(const AStart, AEnd: TDateTime): string;
begin
  Result := '';

  // Prevent weird conditions
  if (AEnd < 60) or (AStart < 60) then
    Exit;

  Result := Format('[%s]' + #13#10 + '[%9.4f %s]',
    [FormatDateTime('ddddd tt', AStart), (AEnd - AStart) * 86400,
    IQMS.DBTrans.dbtrscstr.cTXT0000151 { sec } ]);
end;

procedure ExecuteJetSQLWithParams(const ASourceData: TADOQuery;
  // Data set containing data to be plugged into params
  const ATargetConnection: TADOConnection; // Target connection
  const ASQL: string; // Complete SQL to run, containing params
  // * Key Fields and Values are param values you want to use instead of the
  // values contained in the ASourceData.
  const AKeyFields: array of string; // Key fields, if any
  const AKeyValues: array of Real); // Key values, if any

const
  constNUMBERS = ['0' .. '9'];
  constLOWER = ['a' .. 'z'];
  constUPPER = ['A' .. 'Z'];
  constSPECIAL = ['_', ':'];
  constVALID_CHARS = constNUMBERS + constLOWER + constUPPER + constSPECIAL;
  cUserName = 'Admin';
  cPassword = '';

  // ---------------------------------------------------------------------------
  function _KeyFieldValue(AFieldName: string): Real;
  var
    i, j: Integer;
  begin
    // initialize
    Result := 0;
    j := - 1;
    // cycle field list to find a match
    for i := low(AKeyFields) to high(AKeyFields) do
      if (AKeyFields[i] = AFieldName) then
        begin
          // return the index of the list
          j := i;
          Break;
        end;
    // return the value
    if (j > - 1) then
      Result := AKeyValues[j];
  end;
// ---------------------------------------------------------------------------
  function _ReplaceParam(const AOldSQL, AParam, AValue: string;
    var ANewSQL: string): string;
  var
    AStart, AEnd: Integer;
  begin
    try
      AStart := Pos(UpperCase(AParam), UpperCase(AOldSQL));
      AEnd := AStart; // initial value
      // Find the end position of the word
      while (AEnd < Length(AOldSQL)) and (AOldSQL[AEnd] in constVALID_CHARS) do
        Inc(AEnd);

      ANewSQL := Copy(AOldSQL, 0, AStart - 1) + AValue +
        Copy(AOldSQL, AEnd, Length(AOldSQL));

    except // suppress
    end;
  end;
// ---------------------------------------------------------------------------
  procedure ModifySQL(var ANewSQL: string);
  var
    i: Integer;
    AKeyValue: Real;
    AParam, AValue: string;
  begin
    ANewSQL := ASQL; // default
    with TADOQuery.Create(nil) do
      try
        Connection := ASourceData.Connection;
        // doesn't matter; we're not opening the query
        SQL.Add(ASQL);
        for i := 0 to ParamCount - 1 do
          begin
            AParam := ':' + UpperCase(Parameters.Items[i].Name);
            // check if we have a special, key value
            AKeyValue := _KeyFieldValue(Parameters.Items[i].Name);
            // apply key value, if > 0
            if AKeyValue > 0 then
              AValue := Format('%.0f', [AKeyValue])
              // get field value
            else
              AValue := IQMS.DBTrans.dbtfields.GetFormattedDataAsString
                (ASourceData.FieldByName(Parameters.Items[i].Name), // TField
                ASourceData.FieldByName(Parameters.Items[i].Name).Size,
                // Field Size (strings only)
                False, // Return as string ('''')
                btTrueFalse); // Boolean type for Jet
            // AValue := SysUtils.AnsiDequotedStr(AValue, '''');
            // Change param text to value
            _ReplaceParam(ANewSQL, AParam, AValue, ANewSQL);
          end;
      finally
        Free; // free query
      end;
  end;

// ---------------------------------------------------------------------------
var
  ATmpDSNName, AConnectionString, ACommandText: string;
  AFields: string;
  AData: string;
  ACount: Integer;
begin

  { NOTE:  DO NOT USE A PARAMETERIZED QUERY WITH JET SQL.
    For string fields, a parameterized query only works for fields
    255 characters or less.  It will not work for Memo fields. }

  try

    // Does the user expect to update the database, but no SQL is provided?
    // If so, then inform user of error condition
    if (ASourceData = nil) then
      raise Exception.Create
        (IQMS.DBTrans.dbtrscstr.
        cTXT0000045 { 'Application Error:  Source dataset not supplied.' } );

    ModifySQL(ACommandText);
    ACommandText := IQMS.Common.StringUtils.StrTran(ACommandText, '''''', '''');
    ACommandText := SysUtils.AnsiDequotedStr(ACommandText, '''');
    IQMS.DBTrans.dbtado.DBX_RunSQLParamDataSet(ATargetConnection, ACommandText, ASourceData);
{    with TADOQuery.Create(nil) do
      try
        Connection := ATargetConnection;
        SQL.Text := ACommandText;
        // Execute the SQL
        ExecSQL;
      finally
        Free; // free the TADOQuery object
      end;
}
  except
    on E: Exception do
      begin
        if E.ClassType <> EAbort then
          IQMS.Common.ErrorDialog.ShowIQErrorMessage
            (IQMS.DBTrans.dbtrscstr.cTXT0000159 { 'Execution Error' } , E.Message,
            ACommandText);
      end;
  end;
end;

function GetTablePrimaryKey(const ATableName: string): string;
begin
  Result := '';
  try
    Result := DBX_GetValStrFmt('SELECT b.column_name '#13 +
      '  FROM user_constraints a, user_cons_columns b '#13 +
      ' WHERE a.table_name = TRIM(UPPER(''%s'')) AND '#13 +
      '       a.constraint_type = ''P'' AND '#13 +
      '       b.constraint_name = a.constraint_name', [ATableName]);
  except
  end;
end;

procedure PopulatePreviewGrid(AOwner: TComponent; ADataSet: TDataSet;
  AStringGrid: TUniStringGrid; AMaxRows: Integer);
var
  i, j, AVisColCount, ARow, ACol: Integer;
  AFields: array of string;
  ACaptions: array of string;
  AField: TField;
  tmp: string;
begin
  if (AStringGrid = nil) or (ADataSet = nil) then
    Exit;
  if not ADataSet.Active then
    Exit;

  // Get visible column count
  AVisColCount := 0;
  for i := 0 to ADataSet.Fields.Count - 1 do
    if ADataSet.Fields[i].Visible then
      Inc(AVisColCount);
  SetLength(AFields, AVisColCount);
  SetLength(ACaptions, AVisColCount);

  // Add heading row
  j := 0; // counter
  for i := 0 to ADataSet.Fields.Count - 1 do
    begin
      if not ADataSet.Fields[i].Visible then
        Continue;
      AFields[j] := ADataSet.Fields[i].FieldName;
      ACaptions[j] := ADataSet.Fields[i].DisplayLabel;
      Inc(j);
      if j > high(ACaptions) then
        Break;
    end;

  AStringGrid.RowCount := 1;
  AStringGrid.ColCount := 1;
  AStringGrid.Cells[0, 0] := '';
  AStringGrid.ColCount := high(ACaptions) + 1;
  AStringGrid.DefaultRowHeight := 17;

  // Add Table Heading Row
  for i := 0 to high(ACaptions) do
    begin
      AStringGrid.Cells[i, 0] := ACaptions[i];
      AStringGrid.ColWidths[i] := IQMS.Common.Screen.GetTextWidthPixels(AStringGrid.Font,
        ACaptions[i], TUniForm(AOwner)) + 6;
    end;

  // Add field rows
  ADataSet.First;
  ARow := 1;
  while not ADataSet.EOF do
    begin
      SetLength(ACaptions, 0);
      SetLength(ACaptions, AVisColCount);
      AStringGrid.RowCount := AStringGrid.RowCount + 1;
      ACol := 0;

      for i := low(AFields) to high(AFields) do
        begin

          AField := ADataSet.FieldByName(AFields[i]);
          if AField = nil then
            Continue;

          if (AField is TFloatField) and
            (TFloatField(AField).DisplayFormat > '') then
            tmp := FormatFloat(TFloatField(ADataSet.Fields[i]).DisplayFormat,
              ADataSet.Fields[i].AsFloat)
          else
            tmp := AField.AsString;
          AStringGrid.Cells[ACol, ARow] := tmp;
          Inc(ACol);
        end;
      ADataSet.Next;
      Inc(ARow);

      if (AMaxRows > 0) and (ARow > AMaxRows) then
        Break;
    end;

  if AStringGrid.RowCount > 1 then
    AStringGrid.FixedRows := 1;
  AStringGrid.FixedCols := 0;

end;

function GetStrictCommaText(const AStringList: TStringList): string;
var
  i: Integer;
begin
  // Initialize
  Result := '';
  // Validate
  if not Assigned(AStringList) then
    Exit;
  // Get a single string from the string list.
  for i := 0 to AStringList.Count - 1 do
    begin
      if Trim(Result) = '' then
        Result := AStringList.Strings[i]
      else
        Result := Result + ', ' + AStringList.Strings[i];
    end;
end;

function MaxFieldNameSize(const ATableType: TCustomTableType): Byte;
begin
  case ATableType of
    // dttParadox  : Result := 30;
    // 01/27/2010 Changed the dbase value from 30 to 10.
    dttDBase:
      Result := 10; // Note:  DBase can handle > 8
    dttFoxPro:
      Result := 10;
    // dttASCII    : Result := 30;
    // dttMSAccess : Result := 30;
    // dttMSExcel  : Result := 30;
    // dttXML      : Result := 30;
  else
    Result := 30;
  end;
end;

function IQTableExists(SQLConnection: TSQLConnection;
  const ATableName: string): Boolean;
var
  table: string;
begin
  Result := False;
  if not Assigned(SQLConnection) then
    Exit;
  table := Trim(UpperCase(ATableName));
  if table > '' then
    Result := DBX_GetValStrFmt(SQLConnection,
      'SELECT object_name FROM all_objects WHERE ' +
      'owner = SYS_CONTEXT(''USERENV'', ''SESSION_USER'') ' +
      'AND object_type = ''TABLE'' AND UPPER(object_name) = ' +
      'TRIM(UPPER(''%s'')) AND status = ''VALID'' ', [table]) = table;
end;

function IQViewExists(SQLConnection: TSQLConnection;
  const ViewName: string): Boolean;
var
  view: string;
begin
  Result := False;
  if not Assigned(SQLConnection) then
    Exit;
  view := Trim(UpperCase(ViewName));
  if view > '' then
    Result := DBX_GetValStrFmt(SQLConnection,
      'SELECT object_name from all_objects ' +
      'WHERE owner = SYS_CONTEXT(''USERENV'', ''SESSION_USER'') ' +
      'AND object_type = ''VIEW'' AND ' +
      'UPPER(object_name) = TRIM(UPPER(''%s'')) ' +
      'AND status = ''VALID''',
      [view]) = view;
end;

function IQOracleObjectExists(SQLConnection: TSQLConnection;
  const AObjectName: string): Boolean;
var
  obj: string;
begin
  Result := False;
  if not Assigned(SQLConnection) then
    Exit;
  obj := UpperCase(Trim(AObjectName));
  if obj > '' then
    Result := DBX_GetValStrFmt(SQLConnection,
      'SELECT object_name FROM all_objects ' +
      'WHERE owner = SYS_CONTEXT(''USERENV'', ''SESSION_USER'') ' +
      'AND UPPER(object_name) = TRIM(UPPER(''%s'')) AND status = ''VALID''',
      [obj]) = obj;
end;

function GetPrimaryKey(SQLConnection: TSQLConnection;
  const ATableName: string): string;
begin
  Result := '';

  if (ATableName = '') or (SQLConnection = nil) then
    Exit;

  Result := DBX_GetValStrFmt(SQLConnection,
    '  SELECT cols.column_name'#13 +
    '    FROM all_constraints cons, all_cons_columns cols'#13 +
    '   WHERE cols.table_name = TRIM(UPPER(''%s'')) AND'#13 +
    '         cons.constraint_type = ''P'' AND'#13 +
    '         cons.constraint_name = cols.constraint_name AND'#13 +
    '         cons.owner = cols.owner'#13 +
    'ORDER BY cols.table_name, cols.position', [Trim(UpperCase(ATableName))]);
end;

procedure DebugListFieldTypes(const ADataSet: TDataSet; var AList: TStringList);
var
  i: Integer;
  AFieldName: string;
  ADataType: TFieldType;
  ADataTypeStr: string;
begin
  if not Assigned(ADataSet) or not Assigned(AList) then
    Exit;
  for i := 0 to ADataSet.FieldCount - 1 do
    begin
      AFieldName := ADataSet.Fields[i].FieldName;
      ADataType := ADataSet.Fields[i].DataType;
      ADataTypeStr := FieldTypeNames[ADataType];
      AList.Add(Format('%s=ft%s', [AFieldName, ADataTypeStr]));
    end;
end;

procedure DebugListParamTypes(const AParams: TParams; var AList: TStringList);
var
  i: Integer;
  AParamName: string;
  ADataType: TFieldType;
  ADataTypeStr: string;
begin
  if not Assigned(AParams) or not Assigned(AList) then
    Exit;
  for i := 0 to AParams.Count - 1 do
    begin
      AParamName := AParams[i].Name;
      ADataType := AParams[i].DataType;
      ADataTypeStr := FieldTypeNames[ADataType];
      AList.Add(Format('%s=ft%s', [AParamName, ADataTypeStr]));
    end;
end;

procedure SplitOracleCmdTextIntoWords(const AText: string;
  AWordList: TStringList);
const
  // List of characters supported in Oracle SQL
  CHAR_ALPHA = ['a' .. 'z', 'A' .. 'Z', '0' .. '9', '_', '#', '$'];
var
  iStartPos, iEndPos: Integer;
  // ---------------------------------------------------------------------------
  function _IsCharSupported(const c: char): Boolean;
  begin
    // Note: Do not use Windows function, IsCharAlpha or IsCharAlphaNumeric.
    // These do not work for what we need.
    Result := c in CHAR_ALPHA;
  end;

// ---------------------------------------------------------------------------
begin
  Assert(Assigned(AWordList));
  AWordList.Clear;
  iStartPos := 1;
  while iStartPos <= Length(AText) do
    begin
      // skip non-letters
      while (iStartPos <= Length(AText)) and
        not _IsCharSupported(AText[iStartPos]) do
        Inc(iStartPos);
      if iStartPos <= Length(AText) then
        begin
          // find next non-letter
          iEndPos := iStartPos + 1;
          while (iEndPos <= Length(AText)) and
            _IsCharSupported(AText[iEndPos]) do
            Inc(iEndPos);
          AWordList.Add(Copy(AText, iStartPos, iEndPos - iStartPos));
          iStartPos := iEndPos + 1;
        end; { If }
    end; { While }
end; { SplitTextIntoWords }

function IsActionQuery(const ASQL: string): Boolean;
var
  AWordList: TStringList;
begin
  AWordList := TStringList.Create;
  try
    AWordList.Sorted := True;
    AWordList.Duplicates := dupIgnore;
    // get list of words used in SQL
    SplitOracleCmdTextIntoWords(UpperCase(ASQL), AWordList);
    // check if SQL contains "command" key words.  We cannot use Pos()
    // because some field names my include some of these key words.
    Result := (AWordList.IndexOf('BEGIN') > - 1) or
      (AWordList.IndexOf('DELETE') > - 1) or (AWordList.IndexOf('INSERT') > - 1)
      or (AWordList.IndexOf('UPDATE') > - 1) or
      (AWordList.IndexOf('ALTER') > - 1) or
      (AWordList.IndexOf('TRUNCATE') > - 1) or (AWordList.IndexOf('DROP') > - 1)
      or (AWordList.IndexOf('CREATE') > - 1) or
      (AWordList.IndexOf('AUDIT') > - 1) or
      (AWordList.IndexOf('EXECUTE') > - 1);
  finally
    if Assigned(AWordList) then
      FreeAndNil(AWordList);
  end;
end;

function BlockWrapText(const S: string; const AIndent: Integer): string;
var
  sl: TStringList;
  tmp: string;
  i: Integer;
begin
  // Initialization
  Result := S;
  // Get the wrapped text
  sl := TStringList.Create;
  try
    tmp := WrapText(S, #13, ['.', ',', ' ', #9, '-'], 65);
    sl.Text := tmp;
    if AIndent > 0 then
      for i := 0 to sl.Count - 1 do
        sl.Strings[i] := StrUtils.DupeString(' ', AIndent) +
          Trim(sl.Strings[i]);
    Result := SysUtils.TrimRight(sl.Text);
  finally
    if Assigned(sl) then
      FreeAndNil(sl);
  end;
end;

function GetJetDSNPhysicalFileName;
const
{$IFDEF UNICODE}
  C_REGPATH_ODBC_INI: AnsiString = 'SOFTWARE\ODBC\ODBC.INI\';
{$ELSE}
  C_REGPATH_ODBC_INI: string = 'SOFTWARE\ODBC\ODBC.INI\';
{$ENDIF}
begin
  Result := '';

  with TIQWebRegistry.Create do
    try
      RootKey := HKEY_LOCAL_MACHINE;
      if OpenKeyReadOnly(C_REGPATH_ODBC_INI + ADSN) then
        Result := ReadString('DBQ');
      CloseKey;
    finally
      Free;
    end;

  if Result > '' then
    Exit;

  with TIQWebRegistry.Create do
    try
      RootKey := HKEY_CURRENT_USER;
      if OpenKeyReadOnly(C_REGPATH_ODBC_INI + ADSN) then
        Result := ReadString('DBQ');
      CloseKey;
    finally
      Free;
    end;

end;

function GetRecordCount(const ADataSet: TDataSet): Integer;
begin

  Result := 0;

  if not Assigned(ADataSet) then
    Exit;

  try
    if not ADataSet.Active then
      ADataSet.Open;

    if (ADataSet is TSQLTable) then
      Result := DBX_GetRecordCount(TSQLTable(ADataSet))

    else if (ADataSet is TSQLQuery) then
      Result := DBX_GetRecordCount(TSQLQuery(ADataSet))

    else
    if (ADataSet is TADOTable) then
      Result := IQMS.DBTrans.dbtado.ADO_GetRecordCount(TADOTable(ADataSet))

    else if (ADataSet is TADOQuery) then
      Result := IQMS.DBTrans.dbtado.ADO_GetRecordCount(TADOQuery(ADataSet))

    else if (ADataSet is TIQWebDbxQuery) then
      Result := TIQWebDbxQuery(ADataSet).RecordCount

    else if (ADataSet is TIQWebDbxTable) then
      Result := TIQWebDbxTable(ADataSet).RecordCount

    else
      Result := ADataSet.RecordCount;

    // Some datasets return -1 on prior versions
    if Result < 0 then
      Result := 0;

  except
    Result := 0;
  end;
end;

procedure InitSQLConnections(const AOwner: TComponent;
  const ASQLConnection: TSQLConnection; const AActive: Boolean);
var
  i: Integer;
  s_name: string;
begin
  if not Assigned(AOwner) or not Assigned(ASQLConnection) then
    Exit;

  for i := 0 to AOwner.ComponentCount - 1 do
    try
      // TDbxCustomDataSet
      if (AOwner.Components[i] is TIQWebDbxCustomDataSet) then
        with (AOwner.Components[i] as TIQWebDbxCustomDataSet) do
          begin
            s_name := name;
            Close;
            SQLConnection := ASQLConnection;
            if AActive then
              Open;
          end
        // TCustomSQLDataSet
      else if (AOwner.Components[i] is TCustomSQLDataSet) then
        with (AOwner.Components[i] as TCustomSQLDataSet) do
          begin
            s_name := name;
            Close;
            SQLConnection := ASQLConnection;
            if AActive then
              Open;
          end;
    except
      on E: Exception do
        raise Exception.CreateFmt('Error setting dataset connection:'#13 +
          '%s'#13'[%s]', [E.Message, s_name]);
    end;
end;

end.

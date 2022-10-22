unit dbtddl;

// *********************************************************
//
// Component used to extract Oracle object DDL
//
// Create an instance TDDLEngine to generate a DDL script.
//
// *********************************************************

interface

uses
  Winapi.Windows,
  Vcl.Forms,
  System.SysUtils,
  System.Classes,
  System.Variants,
  IQMS.Common.DataConst,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet;

type
  { TOracleObjectType }
  TOracleObjectType = (UnknownType, OracleTable, OracleView, OraclePackage,
    OracleProcedure, OracleFunction, OracleTrigger, OracleIndex, OracleSequence,
    OracleSynonym);

  { TOracleDDLOptions }
  TOracleDDLOption = (IncludeHeader, IncludeFooter, IncludeComments,
    IncludeDropSQL);
  TOracleDDLOptions = set of TOracleDDLOption;

  { TTableDefOption }
  TTableDefOption = (tdoComments, tdoConstraints, tdoIndexes, tdoTriggers,
    tdoForeignKeys, tdoBlobDef);
  TTableDefOptions = set of TTableDefOption;

const
  AllTableDefOptions = [tdoComments, tdoConstraints, tdoIndexes, tdoTriggers,
    tdoForeignKeys, tdoBlobDef];
  AllOracleDDLOptions = [IncludeHeader, IncludeFooter, IncludeComments,
    IncludeDropSQL];

type
  { TOracleDDLEngine }
  TOracleDDLEngine = class(TComponent)
  private
    { Private declarations }
    FObjectName: string;
    FObjectType: TOracleObjectType;
    FDDL: TStrings;
    // db_dm.FDConnection: TFDConnection;
    FTemporary: Boolean;
    FValid: Boolean;
    FOwner: string;
    FNewObjectName: string;
    FTableDefOptions: TTableDefOptions;
    //FDDLComments: Boolean;
    FMetaData: Boolean;
    //FIncludeDropSQL: Boolean;
    FOptions: TOracleDDLOptions;

    function FieldFloatValue(const AField: TField): string;
    function FieldIntegerValue(const AField: TField): string;

    procedure SetObjectName(const Value: string);
    function GetObjectType(const AObjectTypeStr: string): TOracleObjectType;
    procedure UpdateObjectVars;
    procedure RemoveTrailingBlankLines(var ALines: TStringList);

    function GetDDL_Table: Boolean; // Done
    function GetDDL_View: Boolean; // Done
    function GetDDL_Package: Boolean; // Done
    function GetDDL_Procedure: Boolean; // Done
    function GetDDL_Function: Boolean; // Done
    function GetDDL_Trigger: Boolean; // Done
    function GetDDL_Index: Boolean; // Done
    function GetDDL_Sequence: Boolean; // Done
    function GetDDL_Synonym: Boolean; // Done

    function GetTableDef(var ALines: TStringList): Boolean;
    function GetTableFieldDef(var ALines: TStringList): Boolean;
    function GetTableCommentDef(var ALines: TStringList): Boolean;
    function GetTableConstraintDef(var ALines: TStringList): Boolean;
    function GetTableIndexDef(var ALines: TStringList): Boolean;
    function GetTableTriggerDef(var ALines: TStringList): Boolean;
    function GetTableForeignKeyDef(var ALines: TStringList): Boolean;

    function GetTriggerDef(const ATriggerName: string;
      var ALines: TStringList): Boolean;
    function GetPackageDef(const APackageName: string;
      var ALines: TStringList): Boolean;
    function GetPackageBodyDef(const APackageName: string;
      var ALines: TStringList): Boolean;

    function GetDropSQL: Boolean;

    procedure AddDDLFooter;
    procedure AddDDLHeader;
    function Get_METADATA_DDL(const AObjectType, AObjectName, AOwner: string;
      var ALines: TStringList): Boolean;
    procedure Init;
    procedure Validate;
    function ExecuteBase: Boolean;
    function Get_METADATA_DEPENDENT_DDL(const AObjectsOfType,
      ATableName: string; var ALines: TStringList): Boolean;
    procedure SetDDLComments(const Value: Boolean);
    procedure SetIncludeDropSQL(const Value: Boolean);
    function GetDDLComments: Boolean;
    function GetIncludeDropSQL: Boolean;
    // function RTrim(const s: String): String;

  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
    function Execute: Boolean;
    function CopyTableAs(const AOldTableName, ANewTableName: string): Boolean;
  published
    { Published declarations }
    // Required properties
    //    property Connection: TFDConnection read db_dm.FDConnection
    //      write db_dm.FDConnection;
    property ObjectName: string read FObjectName write SetObjectName;
    property MetaData: Boolean read FMetaData write FMetaData;

    // General options
    property Options: TOracleDDLOptions read FOptions write FOptions;

    // For "TABLE" objects only
    property TableDefOptions: TTableDefOptions read FTableDefOptions
      write FTableDefOptions;

    property IncludeDDLComments: Boolean read GetDDLComments write SetDDLComments
      default True;
    property IncludeDropSQL: Boolean read GetIncludeDropSQL write SetIncludeDropSQL
      default True;

    // Calculated properties
    property ObjectType: TOracleObjectType read FObjectType write FObjectType;
    property Temporary: Boolean read FTemporary;
    property Valid: Boolean read FValid;
    property DDL: TStrings read FDDL;
  end;

procedure DoShowDDL(
  AOwner: TComponent;
  AObjectName: string;
  AObjectType: TOracleObjectType = TOracleObjectType.UnknownType;
  AOptions: TOracleDDLOptions = AllOracleDDLOptions);

procedure DoShowMetaData(AOwner: TComponent; AObjectName: string);

{ function GetDataTypeDef(const ADataType: String; ADataLength,
  ADataPrecision, ADataScale: Integer; ANotNull: Boolean): String;
}
const
  ObjectTypeName: array [TOracleObjectType] of string = (
    '',
    'TABLE',
    'VIEW',
    'PACKAGE',
    'PROCEDURE',
    'FUNCTION',
    'TRIGGER',
    'INDEX',
    'SEQUENCE',
    'SYNONYM');

implementation

uses
  IQMS.DBTrans.dbtdb,
  MainModule,
  IQMS.DBTrans.dbtrscstr,
  dbtsqlfrm,
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils,
  IQMS.Common.PanelMsg,
  IQMS.Common.DataLib;

procedure DoShowDDL(
  AOwner: TComponent;
  AObjectName: string;
  AObjectType: TOracleObjectType = TOracleObjectType.UnknownType;
  AOptions: TOracleDDLOptions = AllOracleDDLOptions);
begin
  with TOracleDDLEngine.Create(nil) do
    try
      ObjectName := AObjectName;
      ObjectType := AObjectType;
      Options := AOptions;
      Execute;
      // 'DLL Script for %s'
      dbtsqlfrm.DoShowSQL(Application, DDL.Text, Format(IQMS.DBTrans.dbtrscstr.cTXT0000186,
        [AObjectName]));
    finally
      Free;
    end;
end;

procedure DoShowMetaData(AOwner: TComponent; AObjectName: string);
begin
  with TOracleDDLEngine.Create(nil) do
    try
      ObjectName := AObjectName;
      MetaData := True;
      Execute;
      // 'DLL Script for %s'
      dbtsqlfrm.DoShowSQL(Application, DDL.Text, Format(IQMS.DBTrans.dbtrscstr.cTXT0000186,
        [AObjectName]));
    finally
      Free;
    end;
end;

{ TOracleDDLEngine }

constructor TOracleDDLEngine.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDDL := TStringList.Create;
  Options := AllOracleDDLOptions;
  TableDefOptions := AllTableDefOptions;
end;

destructor TOracleDDLEngine.Destroy;
begin
  if Assigned(FDDL) then
    FreeAndNil(FDDL);
  inherited Destroy;
end;

function TOracleDDLEngine.CopyTableAs(const AOldTableName,
  ANewTableName: string): Boolean;
var
  ADefinition: TStringList;
begin
  // Initialization
  Result := False;
  ADefinition := nil;
  Init;

  // Set object names and options
  ObjectName := AOldTableName;
  FNewObjectName := ANewTableName;
  TableDefOptions := [];
  IncludeDDLComments := False;

  // Validation
  Validate;

  // Update internal information about the object
  UpdateObjectVars;

  // Validate object type
  if FObjectType <> TOracleObjectType.OracleTable then
    raise Exception.Create('Invalid object type.  ' +
      'Object must be a table.');
  ADefinition := TStringList.Create;
  try
    Result := GetTableDef(ADefinition);
    FDDL.AddStrings(ADefinition);
  finally
    if Assigned(ADefinition) then
      FreeAndNil(ADefinition);
  end;
end;

function TOracleDDLEngine.Execute: Boolean;
var
  hMsg: TPanelMesg;
begin
  // Initialization
  Result := False;
  Init;

  // Validation
  Validate;

  // Update internal information about the object
  UpdateObjectVars;

  // Validate object type
  if FObjectType = TOracleObjectType.UnknownType then
    raise Exception.Create('Application Error: UnknownType object type.  ' +
      'Cannot generate DDL.');

  // If we are attempting to rename a table, then we only return the
  // table definition.
  if (FObjectType = TOracleObjectType.OracleTable) and (ObjectName <> FNewObjectName) then
    TableDefOptions := [];

  // 'Extracting DDL.  Please wait.'
  hMsg := hPleaseWait(IQMS.DBTrans.dbtrscstr.cTXT0000187);
  try
    Result := ExecuteBase;
  finally
    if Assigned(hMsg) then
      FreeAndNil(hMsg);
  end;
end;

function TOracleDDLEngine.ExecuteBase: Boolean;
begin
  // Header
  if (IncludeHeader in Options) then
    AddDDLHeader;

  if not MetaData and IncludeDropSQL then
    GetDropSQL;

  // Generate DDL
  case FObjectType of
    TOracleObjectType.OracleTable:
      Result := GetDDL_Table;
    TOracleObjectType.OracleView:
      Result := GetDDL_View;
    TOracleObjectType.OraclePackage:
      Result := GetDDL_Package;
    TOracleObjectType.OracleProcedure:
      Result := GetDDL_Procedure;
    TOracleObjectType.OracleFunction:
      Result := GetDDL_Function;
    TOracleObjectType.OracleTrigger:
      Result := GetDDL_Trigger;
    TOracleObjectType.OracleIndex:
      Result := GetDDL_Index;
    TOracleObjectType.OracleSequence:
      Result := GetDDL_Sequence;
    TOracleObjectType.OracleSynonym:
      Result := GetDDL_Synonym;
  end;

  // Header
  if (IncludeFooter in Options) then
    AddDDLFooter;

  if not Result then
    FDDL.Clear;
end;

procedure TOracleDDLEngine.Init;
begin
  if not Assigned(FDDL) then
    FDDL := TStringList.Create;
  FDDL.Clear;
end;

procedure TOracleDDLEngine.RemoveTrailingBlankLines(var ALines: TStringList);
var
  i: Integer;
begin
  for i := ALines.Count - 1 downto 0 do
    begin
      if Trim(ALines.Strings[i]) = '' then
        ALines.Delete(i)
      else
        Break;
    end;
end;

procedure TOracleDDLEngine.Validate;
begin
  if Trim(FObjectName) = '' then
    raise Exception.Create('Application Error: Object name unassigned.  ' +
      'Cannot generate DDL.');
end;

procedure TOracleDDLEngine.SetDDLComments(const Value: Boolean);
begin
  if Value then
    Options := Options + [TOracleDDLOption.IncludeComments]
  else
    Options := Options - [TOracleDDLOption.IncludeComments];
end;

procedure TOracleDDLEngine.SetIncludeDropSQL(const Value: Boolean);
begin
  if Value then
    Options := Options + [TOracleDDLOption.IncludeDropSQL]
  else
    Options := Options - [TOracleDDLOption.IncludeDropSQL];
end;

procedure TOracleDDLEngine.SetObjectName(const Value: string);
begin
  FObjectName := UpperCase(Trim(Value));
  if FNewObjectName = '' then
    FNewObjectName := FObjectName;
end;

function TOracleDDLEngine.GetObjectType(const AObjectTypeStr: string)
  : TOracleObjectType;
var
  i: Integer;
  AObjType: TOracleObjectType;
begin
  Result := TOracleObjectType.UnknownType;
  for i := Ord(low(AObjType)) to Ord(high(AObjType)) do
    if AObjectTypeStr = ObjectTypeName[TOracleObjectType(i)] then
      Result := TOracleObjectType(i);
end;

function TOracleDDLEngine.GetTableDef(var ALines: TStringList): Boolean;
var
  ADefinition: TStringList;
  AData: Variant;
  q: TFDQuery;
  s: string;

  function _GetLogIndStr(const ACache, ALogging: Boolean): string;

    procedure _AppendStr(const APropertyString: string);
    begin
      if Result = '' then
        Result := APropertyString
      else
        Result := Result + ' ' + APropertyString;
    end;

  begin
    Result := '';
    if ACache then
      _AppendStr('CACHE')
    else
      _AppendStr('NOCACHE');

    if ALogging then
      _AppendStr('LOGGING')
    else
      _AppendStr('NOLOGGING');
  end;

begin
  // Initialization
  Result := False;

  // Validation
  if not Assigned(ALines) then
    raise Exception.Create('Application Error:  Field list object not ' +
      'supplied to GetTableDef().');

  // Clear lines - this requires the calling method to supply
  // a "temporary" (ad hoc) string list.
  ALines.Clear;

  ADefinition := TStringList.Create;
  try
    // CREATE TABLE <table name>
    // (column list)
    // [physical attributes]
    // [storage clause]
    // [LOB (<lobcol1> [, <lobcol2>...])
    // STORE AS
    // [<lob_segment_name>]
    // (
    // [TABLESPACE <tablespace_name>]
    // [{ENABLE | DISABLE} STORAGE IN ROW]
    // [CHUNK <chunk_size>]
    // [PCTVERSION <version_number>]
    // [ { CACHE | NO CACHE [{LOGGING | NOLOGGING}]
    // | CACHE READS [{LOGGING | NOLOGGING}]
    // }
    // ]
    // [<storage_clause_for_LOB_segment>]
    // [INDEX [<lob_index_name>] [physical attributes] [<storage_for_LOB_index>] ]
    // )
    // ]
    // [LOB (<lobcol1> [, <lobcol2>...]) ... ]
    //
    //

    // Table definition
    GetTableFieldDef(ADefinition);
    Result := ADefinition.Count > 0;

    if Temporary then
      ALines.Add(Format('CREATE GLOBAL TEMPORARY TABLE %s ', [FNewObjectName]))
    else
      ALines.Add(Format('CREATE TABLE %s ', [FNewObjectName]));
    ALines.AddStrings(ADefinition);

    // Storage attributes
    try

      AData := SelectValueArrayFmt(
        'SELECT pct_free, ini_trans, max_trans'#13 + 'FROM user_tables'#13 +
        'WHERE table_name = UPPER(TRIM(''%s'')) '#13 + ' AND rownum < 2',
        [ObjectName]);
      if System.Variants.VarArrayDimCount(AData) > 0 then
      begin
        ALines.Add(Format('  PCTFREE     %d', [Integer(AData[0])]));
        ALines.Add(Format('  INITRANS    %d', [Integer(AData[1])]));
        ALines.Add(Format('  MAXTRANS    %d', [Integer(AData[2])]));
      end;
    finally
      AData := Unassigned;
    end;

    // LOB clause
    if (tdoBlobDef in FTableDefOptions) then
    begin
      q := TFDQuery.Create(nil);
      try
        q.ConnectionName := cnstFDConnectionName;
        q.SQL.Add('SELECT a.table_name, a.column_name, a.segment_name, ');
        q.SQL.Add('       a.index_name, a.chunk, a.cache, a.logging, ');
        q.SQL.Add('       a.in_row, a.pctversion, ');
        q.SQL.Add('       b.segment_type, b.tablespace_name, ');
        q.SQL.Add('       b.extents, b.initial_extent, b.min_extents, ');
        q.SQL.Add('       b.max_extents, b.buffer_pool');
        q.SQL.Add('FROM user_lobs a, user_segments b');
        q.SQL.Add(Format('WHERE a.table_name = UPPER(TRIM(''%s'')) AND',
          [ObjectName]));
        q.SQL.Add('      b.segment_name(+) = a.segment_name');
        q.Open;
        while not q.EOF do
        begin
          ALines.Add(Format('  LOB ("%s") STORE AS %s',
            [q.FieldByName('COLUMN_NAME').AsString,
            q.FieldByName('SEGMENT_NAME').AsString]));
          ALines.Add('  (');
          ALines.Add(Format('   TABLESPACE %s',
            [q.FieldByName('TABLESPACE_NAME').AsString]));
          ALines.Add(Format('   %s STORAGE IN ROW',
            [IQMS.Common.Numbers.sIIF(q.FieldByName('IN_ROW').AsString = 'YES', 'ENABLE',
            'DISABLE')]));
          ALines.Add(Format('   CHUNK %d',
            [q.FieldByName('CHUNK').AsInteger]));
          if q.FieldByName('PCTVERSION').AsString > '' then
            ALines.Add(Format('    PCTVERSION %s',
              [q.FieldByName('PCTVERSION').AsString]));

          s := _GetLogIndStr(q.FieldByName('CACHE').AsString = 'YES',
            q.FieldByName('LOGGING').AsString = 'YES');
          if Trim(s) > '' then
            ALines.Add(Format('   %s', [s])); // i.e., '   NOCACHE LOGGING'
          ALines.Add(Format('   STORAGE (MINEXTENTS %d)',
            [q.FieldByName('MIN_EXTENTS').AsInteger]));
          // LOB Index?
          // ALines.Add(Format('   INDEX %s (',
          // [q.FieldByName('INDEX_NAME').AsString]));
          // ALines.Add('      TABLESPACE %s',
          // [q.FieldByName('SEGMENT_TYPE').AsString]));
          //
          // ALines.Add('      STORAGE (MAXEXTENTS %d)',
          // [q.FieldByName('MAX_EXTENTS').AsInteger]));
          // //ALines.Add('      STORAGE (MAXEXTENTS UNLIMITED)', []));
          // ALines.Add('     )');
          ALines.Add('  )');
          q.Next;
        end;
      finally
        if Assigned(q) then
          FreeAndNil(q);
      end;
    end;

    // Physical attributes
    try
      AData := SelectValueArrayFmt(
        'SELECT logging, monitoring'#13 + 'FROM user_tables'#13 +
        'WHERE table_name = UPPER(TRIM(''%s'')) '#13 + ' AND rownum < 2',
        [ObjectName]);
      if System.Variants.VarArrayDimCount(AData) > 0 then
      begin
        ALines.Add('  NOPARALLEL'); // ?
        if UpperCase(Trim(AData[0])) = 'YES' then
          ALines.Add('  LOGGING');
        if UpperCase(Trim(AData[1])) = 'YES' then
          ALines.Add('  MONITORING');
      end;
    finally
      AData := Unassigned;
    end;
  finally
    if Assigned(ADefinition) then
      FreeAndNil(ADefinition);
  end;
end;

function TOracleDDLEngine.GetTableFieldDef(var ALines: TStringList): Boolean;
var
  q: TFDQuery;
  ALPar, ARPar, ACol, ADef, AComma: string;
begin
  // Initialization
  Result := False;
  // Validation
  if not Assigned(ALines) then
    raise Exception.Create('Application Error:  Field list object not ' +
      'supplied to GetTableFieldDef().');

  // Clear lines - this requires the calling method to supply
  // a "temporary" (ad hoc) string list.
  ALines.Clear;

  // Query the database, and build a fields definition for the table.
  // Example:
  // (id                             NUMBER,
  // source                         VARCHAR2(50 BYTE),
  // source_id                      NUMBER,
  // received_date                  DATE,
  // received_from                  VARCHAR2(250 BYTE),
  // subject                        VARCHAR2(250 BYTE),
  // comment1                       LONG,
  // mesg_blob                      BLOB,
  // kind                           NUMBER,
  // body_text                      CLOB)

  q := TFDQuery.Create(nil);
  try
    q.ConnectionName := cnstFDConnectionName;
    q.SQL.Add('select');
    q.SQL.Add('  column_name,');
    q.SQL.Add('  data_type,');
    q.SQL.Add('  data_length,');
    q.SQL.Add('  data_precision,');
    q.SQL.Add('  data_scale,');
    q.SQL.Add('  nullable');
    q.SQL.Add('from cols');
    q.SQL.Add(Format('where table_name = UPPER(TRIM(''%s''))', [ObjectName]));
    q.Open;
    Result := not (q.BOF and q.EOF);
    while not q.EOF do
    begin
      if q.BOF then
        ALPar := '('
      else
        ALPar := ' ';
      ACol := Trim(LowerCase(q.FieldByName('COLUMN_NAME').AsString));
      ADef := GetDataTypeDef(
        q.FieldByName('DATA_TYPE').AsString,
        q.FieldByName('DATA_LENGTH').AsInteger,
        q.FieldByName('DATA_PRECISION').AsInteger,
        q.FieldByName('DATA_SCALE').AsInteger,
        q.FieldByName('NULLABLE').AsString = 'N');
      q.Next;
      AComma := IQMS.Common.Numbers.sIIF(not q.EOF, ',', '');
      if q.EOF then
        ARPar := ')'
      else
        ARPar := '';

      ALines.Add(Format('   %s%s %s%s%s',
        [ALPar,
        IQMS.Common.StringUtils.PadR(ACol, 30),
        ADef,
        AComma,
        ARPar]));
    end;
  finally
    if Assigned(q) then
      FreeAndNil(q);
  end;
end;

function TOracleDDLEngine.GetTableCommentDef(var ALines: TStringList): Boolean;
var
  q: TFDQuery;
  s: string;
begin
  // Initialization
  Result := False;
  // Validation
  if not Assigned(ALines) then
    raise Exception.Create('Application Error:  Field list object not ' +
      'supplied to GetTableCommentDef().');

  // Clear lines - this requires the calling method to supply
  // a "temporary" (ad hoc) string list.
  ALines.Clear;

  // Table Comment

  s := SelectValueFmtAsString('SELECT comments '#13 +
    '  FROM user_tab_comments'#13 +
    ' WHERE table_name = TRIM(UPPER(''%s'')) AND'#13 +
    '       comments IS NOT NULL', [ObjectName]);
  if s > '' then
  begin
    ALines.Add(Format('COMMENT ON TABLE %s IS ''%s''',
      [LowerCase(FNewObjectName), s]));
    ALines.Add('/');
  end;

  // Column Comments
  q := TFDQuery.Create(nil);
  try
    q.ConnectionName := cnstFDConnectionName;
    q.SQL.Add('SELECT column_name, comments');
    q.SQL.Add('FROM user_col_comments');
    q.SQL.Add(Format('WHERE table_name = TRIM(UPPER(''%s'')) AND',
      [ObjectName]));
    q.SQL.Add('      comments IS NOT NULL');
    q.SQL.Add('ORDER BY column_name');
    q.Open;
    Result := not (q.BOF and q.EOF);
    while not q.EOF do
    begin
      ALines.Add(Format('COMMENT ON COLUMN %s.%s IS ''%s''',
        [LowerCase(FNewObjectName),
        LowerCase(q.FieldByName('COLUMN_NAME').AsString),
        q.FieldByName('COMMENTS').AsString]));
      ALines.Add('/');
      q.Next;
    end;
  finally
    if Assigned(q) then
      FreeAndNil(q);
  end;
end;

function TOracleDDLEngine.GetTableConstraintDef
  (var ALines: TStringList): Boolean;
var
  q: TFDQuery;
begin
  // Initialization
  Result := False;

  // Validation
  if not Assigned(ALines) then
    raise Exception.Create('Application Error:  Field list object not ' +
      'supplied to GetTableConstraintDef().');

  // Clear lines - this requires the calling method to supply
  // a "temporary" (ad hoc) string list.
  ALines.Clear;

  // Get_METADATA_DEPENDENT_DDL('CONSTRAINT', ObjectName, ALines);

  q := TFDQuery.Create(nil);
  try
    q.ConnectionName := cnstFDConnectionName;
    q.SQL.Add('SELECT ucc.constraint_name, ucc.column_name, uc.constraint_type,');
    q.SQL.Add('       uc.search_condition, uc2.table_name AS references_table,');
    q.SQL.Add('       idx.uniqueness, idx.compression, idx.pct_free, idx.ini_trans,');
    q.SQL.Add('       idx.max_trans');
    q.SQL.Add('FROM user_cons_columns ucc, user_constraints uc, user_constraints uc2,');
    q.SQL.Add('     user_indexes idx');
    q.SQL.Add('WHERE ucc.constraint_name = uc.constraint_name AND');
    q.SQL.Add('      uc.r_constraint_name = uc2.constraint_name(+) AND');
    q.SQL.Add('      idx.index_name(+) = ucc.constraint_name AND');
    q.SQL.Add(Format('      ucc.table_name = TRIM(UPPER(''%s'')) AND',
      [ObjectName]));
    q.SQL.Add(Format('      uc.owner = TRIM(UPPER(''%s'')) AND', [FOwner]));
    q.SQL.Add('      uc.constraint_type in (''P'',''C'') AND');
    q.SQL.Add('      uc.generated = ''USER NAME''');
    q.SQL.Add('ORDER BY uc.constraint_type desc, ucc.constraint_name');
    q.Open;
    while not q.EOF do
    begin
      if q.FieldByName('CONSTRAINT_TYPE').AsString = 'P' then
      begin
        ALines.Add(Format('ALTER TABLE %s', [LowerCase(FNewObjectName)]));
        ALines.Add(Format('ADD CONSTRAINT %s PRIMARY KEY (%s)',
          [LowerCase(q.FieldByName('CONSTRAINT_NAME').AsString),
          LowerCase(q.FieldByName('COLUMN_NAME').AsString)]));
        ALines.Add('USING INDEX');
        ALines.Add(Format('  PCTFREE     %d',
          [q.FieldByName('PCT_FREE').AsInteger]));
        ALines.Add(Format('  INITRANS    %d',
          [q.FieldByName('INI_TRANS').AsInteger]));;
        ALines.Add(Format('  MAXTRANS    %d',
          [q.FieldByName('MAX_TRANS').AsInteger]));
        ALines.Add('/');
        ALines.Add('');
      end
      else if (q.FieldByName('SEARCH_CONDITION').AsString > '') then
      begin
        ALines.Add(Format('ALTER TABLE %s', [LowerCase(FNewObjectName)]));
        ALines.Add(Format('ADD CONSTRAINT %s CHECK (%s)',
          [LowerCase(q.FieldByName('CONSTRAINT_NAME').AsString),
          q.FieldByName('SEARCH_CONDITION').AsString]));
        ALines.Add('/');
        ALines.Add('');
      end
      else
      begin
        q.Next;
        Continue;
      end;

      q.Next;
    end;
    // Pass result
    Result := ALines.Count > 0;
  finally
    if Assigned(q) then
      FreeAndNil(q);
  end;
end;

function TOracleDDLEngine.GetTableIndexDef(var ALines: TStringList): Boolean;
var
  q: TFDQuery;

  procedure _GetIndexCols(const AIndexName: string);
  var
    AIntQuery: TFDQuery;
    ADef, AComma: string;
  begin
    AIntQuery := TFDQuery.Create(nil);
    try
      AIntQuery.ConnectionName := cnstFDConnectionName;
      AIntQuery.SQL.Add('SELECT column_name, descend');
      AIntQuery.SQL.Add('FROM user_ind_columns');
      AIntQuery.SQL.Add(Format('WHERE table_name = TRIM(UPPER(''%s'')) AND',
        [ObjectName]));
      AIntQuery.SQL.Add(Format('  UPPER(index_name) = TRIM(UPPER(''%s'')) ',
        [AIndexName]));
      AIntQuery.SQL.Add('ORDER BY index_name');
      AIntQuery.Open;
      while not AIntQuery.EOF do
      begin
        ADef := Format('  %s %s',
          [PadR(LowerCase(AIntQuery.FieldByName('COLUMN_NAME').AsString), 30),
          AIntQuery.FieldByName('DESCEND').AsString]);
        AIntQuery.Next;
        AComma := IQMS.Common.Numbers.sIIF(not AIntQuery.EOF, ',', '');
        ALines.Add(ADef + AComma);
      end;
    finally
      if Assigned(AIntQuery) then
        FreeAndNil(AIntQuery);
    end;
  end;

begin
  // Initialization
  Result := False;
  // Validation
  if not Assigned(ALines) then
    raise Exception.Create('Application Error:  Field list object not ' +
      'supplied to GetTableIndexDef().');
  // Clear lines - this requires the calling method to supply
  // a "temporary" (ad hoc) string list.
  ALines.Clear;

  // Get_METADATA_DEPENDENT_DDL('INDEX', ObjectName, ALines);

  q := TFDQuery.Create(nil);
  try
    q.ConnectionName := cnstFDConnectionName;
    q.SQL.Add('SELECT index_name, pct_free, ini_trans, max_trans, ');
    q.SQL.Add('  logging, uniqueness');
    q.SQL.Add('FROM user_indexes');
    q.SQL.Add(Format('WHERE table_name = TRIM(UPPER(''%s'')) AND',
      [ObjectName]));
    q.SQL.Add('      NOT index_name IN (SELECT constraint_name');
    q.SQL.Add('                         FROM user_constraints');
    q.SQL.Add(Format
      ('                         WHERE table_name = TRIM(UPPER(''%s''))) AND',
      [ObjectName]));
    q.SQL.Add('      index_type not in (''LOB'',''DOMAIN'') ');
    q.SQL.Add('ORDER BY index_name');
    q.Open;
    while not q.EOF do
    begin
      if q.FieldByName('UNIQUENESS').AsString = 'UNIQUE' then
        ALines.Add(Format('CREATE UNIQUE INDEX %s ON %s',
          [LowerCase(q.FieldByName('index_name').AsString),
          LowerCase(FNewObjectName)]))
      else
        ALines.Add(Format('CREATE INDEX %s ON %s',
          [LowerCase(q.FieldByName('index_name').AsString),
          LowerCase(FNewObjectName)]));
      ALines.Add('  (');
      _GetIndexCols(q.FieldByName('index_name').AsString);
      ALines.Add('  )');
      ALines.Add(Format('  PCTFREE     %d',
        [q.FieldByName('PCT_FREE').AsInteger]));
      ALines.Add(Format('  INITRANS    %d',
        [q.FieldByName('INI_TRANS').AsInteger]));
      ALines.Add(Format('  MAXTRANS    %d',
        [q.FieldByName('MAX_TRANS').AsInteger]));
      ALines.Add('NOPARALLEL');
      if UpperCase(Trim(q.FieldByName('LOGGING').AsString)) = 'YES' then
        ALines.Add('LOGGING');
      ALines.Add('/');
      ALines.Add('');
      q.Next;
    end;
    // Pass result
    Result := ALines.Count > 0;
  finally
    if Assigned(q) then
      FreeAndNil(q);
  end;
end;

function TOracleDDLEngine.GetTableTriggerDef(var ALines: TStringList): Boolean;
var
  q: TFDQuery;
  ATempLines: TStringList;
begin
  // Initialization
  Result := False;
  // Validation
  if not Assigned(ALines) then
    raise Exception.Create('Application Error:  Field list object not ' +
      'supplied to GetTableTriggerDef().');
  // Clear lines - this requires the calling method to supply
  // a "temporary" (ad hoc) string list.
  ALines.Clear;
  ATempLines := TStringList.Create;
  try
    q := TFDQuery.Create(nil);
    try
      q.ConnectionName := cnstFDConnectionName;
      q.SQL.Add('SELECT trigger_name');
      q.SQL.Add('FROM user_triggers');
      q.SQL.Add(Format('WHERE table_name = TRIM(UPPER(''%s'')) ',
        [ObjectName]));
      q.SQL.Add('ORDER BY trigger_name');
      q.Open;
      while not q.EOF do
      begin
        if GetTriggerDef(q.FieldByName('TRIGGER_NAME').AsString, ATempLines)
        then
        begin
          ALines.AddStrings(ATempLines);
          ALines.Add('');
        end;
        q.Next;
      end;

      // Pass result
      Result := ALines.Count > 0;
    finally
      if Assigned(q) then
        FreeAndNil(q);
    end;
  finally
    if Assigned(ATempLines) then
      FreeAndNil(ATempLines);
  end;
end;

function TOracleDDLEngine.GetTriggerDef(const ATriggerName: string;
  var ALines: TStringList): Boolean;
var
  AData: Variant;
  s: string;
  ATempLines, AColLines: TStringList;
  q1, q2: TFDQuery;
begin
  // Initialization
  Result := False;
  q1 := nil;
  q2 := nil;
  ATempLines := nil;

  // Validation
  if not Assigned(ALines) then
    Exit;
  ALines.Clear;

  ATempLines := TStringList.Create;
  try
    if FMetaData then
    begin
      Result := Get_METADATA_DDL('TRIGGER', ATriggerName, FOwner, ATempLines);
      if Result then
      begin
        ALines.AddStrings(ATempLines);
        ALines.Add('/');
        ALines.Add('');
      end;
    end
    else
    begin
      q1 := TFDQuery.Create(nil);
      try
        q1.ConnectionName := cnstFDConnectionName;
        q1.SQL.Add('SELECT trigger_type, triggering_event, table_name,');
        q1.SQL.Add('       column_name, referencing_names, when_clause,');
        q1.SQL.Add('       action_type, trigger_body, owner, table_owner');
        q1.SQL.Add('  FROM all_triggers');
        q1.SQL.Add(Format(' WHERE trigger_name = ''%s''', [ObjectName]));
        q1.Open;
        if (q1.BOF and q1.EOF) then
          Exit;

        q2 := TFDQuery.Create(nil);
        try
          q2.ConnectionName := cnstFDConnectionName;
          q2.SQL.Add('SELECT column_name');
          q2.SQL.Add('FROM user_trigger_cols');
          q2.SQL.Add(Format('WHERE trigger_name = ''%s'' AND', [ObjectName]));
          q2.SQL.Add('      column_list = ''YES''');
          q2.Open;

          AColLines := TStringList.Create;
          try
            while not q2.EOF do
            begin
              AColLines.Add(LowerCase(q2.FieldByName('COLUMN_NAME').AsString));
              q2.Next;
            end;

            ATempLines.Add(Format('CREATE OR REPLACE TRIGGER %s',
              [LowerCase(ObjectName)]));

            if Pos('AFTER', q1.FieldByName('TRIGGER_TYPE').AsString) > 0 then
              ATempLines.Add(' AFTER')
            else if Pos('BEFORE', q1.FieldByName('TRIGGER_TYPE').AsString) > 0
            then
              ATempLines.Add(' BEFORE');

            if (AColLines.Count > 0) then
              ATempLines.Add(Format('   %s OF %s',
                [q1.FieldByName('TRIGGERING_EVENT').AsString,
                AColLines.CommaText]))
            else
              ATempLines.Add(q1.FieldByName('TRIGGERING_EVENT').AsString);

            ATempLines.Add(Format(' ON %s',
              [LowerCase(q1.FieldByName('TABLE_NAME').AsString)]));
            ATempLines.Add('  ' + Trim(q1.FieldByName('REFERENCING_NAMES')
              .AsString));

            if Pos('EACH ROW', q1.FieldByName('TRIGGER_TYPE').AsString) > 0 then
              ATempLines.Add(' FOR EACH ROW');
            ATempLines.Add(q1.FieldByName('TRIGGER_BODY').AsString);
            ATempLines.Add('/');
            ATempLines.Add('');
            ALines.AddStrings(ATempLines);
            Result := True;
          finally
            if Assigned(AColLines) then
              FreeAndNil(AColLines);
          end;
        finally
          if Assigned(q2) then
            FreeAndNil(q2);
        end;
      finally
        if Assigned(q1) then
          FreeAndNil(q1);
      end;
    end;
  finally
    if Assigned(ATempLines) then
      FreeAndNil(ATempLines);
  end;
end;

function TOracleDDLEngine.GetTableForeignKeyDef
  (var ALines: TStringList): Boolean;
var
  q: TFDQuery;
  ATempLines: TStringList;

  procedure _GetIndexCols(const AIndexName: string);
  var
    qi: TFDQuery;
    ADef: string;
  begin
    qi := TFDQuery.Create(nil);
    try
      qi.ConnectionName := cnstFDConnectionName;
      qi.SQL.Add('SELECT b.column_name');
      qi.SQL.Add('FROM user_constraints a, user_ind_columns b');
      qi.SQL.Add(Format('WHERE a.index_name = ''%s'' AND', [AIndexName]));
      qi.SQL.Add('      b.index_name = a.index_name');
      qi.Open;
      while not qi.EOF do
      begin
        ADef := LowerCase(qi.FieldByName('COLUMN_NAME').AsString);
        ATempLines.Add(ADef);
        qi.Next;
      end;
    finally
      if Assigned(qi) then
        FreeAndNil(qi);
    end;
  end;

begin
  // Initialization
  Result := False;

  // Validation
  if not Assigned(ALines) then
    raise Exception.Create('Application Error:  Field list object not ' +
      'supplied to GetTableTriggerDef().');

  // Clear lines - this requires the calling method to supply
  // a "temporary" (ad hoc) string list.
  ALines.Clear;

  ATempLines := TStringList.Create;
  try
    q := TFDQuery.Create(nil);
    try
      q.ConnectionName := cnstFDConnectionName;
      q.SQL.Add('SELECT ucc.constraint_name, ucc.column_name,');
      q.SQL.Add('       uc.search_condition, uc2.table_name AS references_table,');
      q.SQL.Add('       uc.r_constraint_name');
      q.SQL.Add(
        'FROM user_cons_columns ucc, user_constraints uc, user_constraints uc2');
      q.SQL.Add('WHERE ucc.constraint_name = uc.constraint_name AND');
      q.SQL.Add('      uc.r_constraint_name = uc2.constraint_name(+) AND');
      q.SQL.Add(Format('      ucc.table_name = TRIM(UPPER(''%s'')) AND',
        [ObjectName]));
      q.SQL.Add('      uc.constraint_type = ''R''');
      q.SQL.Add('ORDER BY ucc.constraint_name');
      q.Open;
      while not q.EOF do
      begin
        ATempLines.Clear;
        _GetIndexCols(q.FieldByName('R_CONSTRAINT_NAME').AsString);
        ALines.Add(Format('ALTER TABLE %s', [LowerCase(FNewObjectName)]));
        ALines.Add(Format('ADD CONSTRAINT %s FOREIGN KEY (%s)',
          [LowerCase(q.FieldByName('CONSTRAINT_NAME').AsString),
          LowerCase(q.FieldByName('COLUMN_NAME').AsString)]));
        ALines.Add(Format('REFERENCES %s (%s)',
          [LowerCase(q.FieldByName('REFERENCES_TABLE').AsString),
          ATempLines.CommaText]));
        ALines.Add('/');
        ALines.Add('');
        q.Next;
      end;
      // Pass result
      Result := ALines.Count > 0;
    finally
      if Assigned(q) then
        FreeAndNil(q);
    end;
  finally
    if Assigned(ATempLines) then
      FreeAndNil(ATempLines);
  end;
end;

function TOracleDDLEngine.GetDDLComments: Boolean;
begin
  Result := (TOracleDDLOption.IncludeComments in Options);
end;

function TOracleDDLEngine.GetDDL_Function: Boolean;
var
  ATempLines: TStringList;
  q: TFDQuery;
begin
  // Initialization
  Result := False;

  ATempLines := TStringList.Create;
  try
    if FMetaData then
    begin
      Result := Get_METADATA_DDL('FUNCTION', ObjectName, FOwner, ATempLines);
      if Result then
      begin
        FDDL.AddStrings(ATempLines);
        FDDL.Add('/');
        FDDL.Add('');
      end;
    end
    else
    begin
      q := TFDQuery.Create(nil);
      try
        q.ConnectionName := cnstFDConnectionName;
        q.SQL.Add('SELECT text');
        q.SQL.Add('FROM user_source');
        q.SQL.Add(Format('WHERE name = ''%s'' AND', [UpperCase(ObjectName)]));
        q.SQL.Add('      TYPE = ''FUNCTION''');
        q.SQL.Add('ORDER BY line');
        q.SQL.Add('');
        q.Open;
        Result := not (q.Bof and q.Eof);
        if Result then
        begin
          ATempLines.Add('CREATE OR REPLACE ' +
            System.SysUtils.TrimRight(q.Fields[0].AsString));
          q.Next;
          while not q.EOF do
          begin
            ATempLines.Add(System.SysUtils.TrimRight(q.Fields[0].AsString));
            q.Next;
          end;
          // Remove any blank lines at the end before adding the slash
          RemoveTrailingBlankLines(ATempLines);
          ATempLines.Add('/');
          ATempLines.Add('');
          FDDL.AddStrings(ATempLines);
        end;
      finally
        if Assigned(q) then
          FreeAndNil(q);
      end;
    end;
  finally
    if Assigned(ATempLines) then
      FreeAndNil(ATempLines);
  end;
end;

function TOracleDDLEngine.GetDDL_Index: Boolean;
var
  ATempLines: TStringList;
  q1, q2: TFDQuery;
begin
  // Initialization
  Result := False;

  ATempLines := TStringList.Create;
  try
    if FMetaData then
    begin
      Result := Get_METADATA_DDL('INDEX', ObjectName, FOwner, ATempLines);
      if Result then
      begin
        FDDL.AddStrings(ATempLines);
        FDDL.Add('/');
        FDDL.Add('');
      end;
    end
    else
    begin
      q1 := TFDQuery.Create(nil);
      try
        q1.ConnectionName := cnstFDConnectionName;
        q1.SQL.Add('SELECT index_type, table_owner, table_name, table_type,');
        q1.SQL.Add('       uniqueness, compression, prefix_length, tablespace_name,');
        q1.SQL.Add('       ini_trans, max_trans, initial_extent, next_extent,');
        q1.SQL.Add('       min_extents, max_extents, pct_increase, include_column,');
        q1.SQL.Add('       pct_free, logging, blevel, partitioned, temporary');
        q1.SQL.Add('FROM user_indexes');
        q1.SQL.Add(Format('WHERE index_name = ''%s''', [ObjectName]));
        q1.Open;
        Result := not (q1.BOF and q1.EOF);
        if not Result then
          Exit;
        q2 := TFDQuery.Create(nil);
        try
          q2.ConnectionName := cnstFDConnectionName;
          q2.SQL.Add('SELECT column_name, column_length, char_length, descend');
          q2.SQL.Add('FROM user_ind_columns');
          q2.SQL.Add(Format('WHERE index_name = ''%s''', [ObjectName]));
          q2.SQL.Add('ORDER BY column_position');
          q2.Open;
          Result := not (q2.BOF and q2.EOF);
          if not Result then
            Exit;
          ATempLines.Add(Format('CREATE UNIQUE INDEX %s ON %s',
            [LowerCase(ObjectName),
            LowerCase(q1.FieldByName('TABLE_NAME').AsString)]));
          ATempLines.Add('  (');
          while not q2.EOF do
          begin
            ATempLines.Add(Format('    %s  %s',
              [IQMS.Common.StringUtils.PadR(LowerCase(q2.FieldByName('COLUMN_NAME').AsString),
              30), q2.FieldByName('DESCEND').AsString]));
            q2.Next;
          end;
          ATempLines.Add('  )');
          ATempLines.Add(Format('  PCTFREE     %d',
            [q1.FieldByName('PCT_FREE').AsInteger]));
          ATempLines.Add(Format('  INITRANS    %d',
            [q1.FieldByName('INI_TRANS').AsInteger]));
          ATempLines.Add(Format('  MAXTRANS    %d',
            [q1.FieldByName('MAX_TRANS').AsInteger]));
          ATempLines.Add('NOPARALLEL');
          if (q1.FieldByName('LOGGING').AsString = 'YES') then
            ATempLines.Add('LOGGING');
          ATempLines.Add('/');
          ATempLines.Add('');
          FDDL.AddStrings(ATempLines);
        finally
          if Assigned(q2) then
            FreeAndNil(q2);
        end;
      finally
        if Assigned(q1) then
          FreeAndNil(q1);
      end;
    end;
  finally
    if Assigned(ATempLines) then
      FreeAndNil(ATempLines);
  end;
end;

function TOracleDDLEngine.GetDDL_Package: Boolean;
var
  ATempLines: TStringList;
begin
  // Initialization
  Result := False;
  ATempLines := TStringList.Create;
  try
    if FMetaData then
    begin
      Result := Get_METADATA_DDL('PACKAGE', ObjectName, FOwner, ATempLines);
      if Result then
      begin
        FDDL.AddStrings(ATempLines);
        FDDL.Add('/');
        FDDL.Add('');
      end;
    end
    else
    begin
      // Package def
      Result := GetPackageDef(ObjectName, ATempLines);
      if Result then
        FDDL.AddStrings(ATempLines)
      else
        Exit;

      // Package body def
      ATempLines.Clear;
      if GetPackageBodyDef(ObjectName, ATempLines) then
        FDDL.AddStrings(ATempLines);
    end;
  finally
    if Assigned(ATempLines) then
      FreeAndNil(ATempLines);
  end;
end;

function TOracleDDLEngine.GetDDL_Procedure: Boolean;
var
  ATempLines: TStringList;
  q: TFDQuery;
begin
  // Initialization
  Result := False;

  ATempLines := TStringList.Create;
  try
    if FMetaData then
    begin
      Result := Get_METADATA_DDL('PROCEDURE', ObjectName, FOwner, ATempLines);
      if Result then
      begin
        FDDL.AddStrings(ATempLines);
        FDDL.Add('/');
        FDDL.Add('');
      end;
    end
    else
    begin
      q := TFDQuery.Create(nil);
      try
        q.ConnectionName := cnstFDConnectionName;
        q.SQL.Add('SELECT RTRIM(text, CHR(32) || CHR(10) || CHR(13)) AS text');
        q.SQL.Add('FROM user_source');
        q.SQL.Add(Format('WHERE name = ''%s'' AND', [UpperCase(ObjectName)]));
        q.SQL.Add('      TYPE = ''PROCEDURE''');
        q.SQL.Add('ORDER BY line');
        q.SQL.Add('');
        q.Open;
        Result := not (q.Bof and q.Eof);
        if Result then
        begin
          ATempLines.Add('CREATE OR REPLACE');
          while not q.EOF do
          begin
            ATempLines.Add(q.Fields[0].AsString);
            q.Next;
          end;
          // Remove blank lines at the end before adding slash
          RemoveTrailingBlankLines(ATempLines);
          ATempLines.Add('/');
          ATempLines.Add('');
          FDDL.AddStrings(ATempLines);
        end;
      finally
        if Assigned(q) then
          FreeAndNil(q);
      end;
    end;
  finally
    if Assigned(ATempLines) then
      FreeAndNil(ATempLines);
  end;
end;

function TOracleDDLEngine.GetDDL_Sequence: Boolean;
var
  ATempLines: TStringList;
  q: TFDQuery;
begin
  // Initialization
  Result := False;
  ATempLines := TStringList.Create;
  try
    if FMetaData then
    begin
      Result := Get_METADATA_DDL('SEQUENCE', ObjectName, FOwner, ATempLines);
      if Result then
      begin
        FDDL.AddStrings(ATempLines);
        FDDL.Add('/');
        FDDL.Add('');
      end;
    end
    else
    begin
      q := TFDQuery.Create(nil);
      try
        q.ConnectionName := cnstFDConnectionName;
        q.SQL.Add('SELECT min_value, max_value, increment_by, cycle_flag,');
        q.SQL.Add('       order_flag, cache_size, last_number');
        q.SQL.Add('  FROM user_sequences');
        q.SQL.Add(Format(' WHERE sequence_name = ''%s''',
          [UpperCase(ObjectName)]));
        q.SQL.Add('');
        q.Open;
        Result := not (q.Bof and q.Eof);
        if Result then
        begin
        ATempLines.Add(Format('CREATE SEQUENCE %s', [LowerCase(ObjectName)]));
        ATempLines.Add(Format('  INCREMENT BY %s',
          [FieldIntegerValue(q.FieldByName('INCREMENT_BY'))]));
        ATempLines.Add(Format('  START WITH %s',
          [FieldIntegerValue(q.FieldByName('LAST_NUMBER'))]));
        ATempLines.Add(Format('  MINVALUE %s',
          [FieldIntegerValue(q.FieldByName('MIN_VALUE'))]));
        ATempLines.Add(Format('  MAXVALUE %s',
          [FieldIntegerValue(q.FieldByName('MAX_VALUE'))]));

        if (q.FieldByName('CYCLE_FLAG').AsString = 'N') then
          ATempLines.Add('  NOCYCLE')
        else
          ATempLines.Add('  CYCLE');

        if (q.FieldByName('ORDER_FLAG').AsString = 'N') then
          ATempLines.Add('  NOORDER')
        else
          ATempLines.Add('  ORDER');

        if (Trunc(q.FieldByName('CACHE_SIZE').AsFloat) = 0) then
          ATempLines.Add('  NOCACHE')
        else
          ATempLines.Add(Format('  CACHE %s',
            [FieldIntegerValue(q.FieldByName('CACHE_SIZE'))]));

        ATempLines.Add('/');
        ATempLines.Add('');
        FDDL.AddStrings(ATempLines);
        end;
      finally
        if Assigned(q) then
          FreeAndNil(q);
      end;
    end;
  finally
    if Assigned(ATempLines) then
      FreeAndNil(ATempLines);
  end;
end;

function TOracleDDLEngine.GetDDL_Synonym: Boolean;
var
  ATempLines: TStringList;
  q: TFDQuery;
begin
  // Initialization
  Result := False;

  ATempLines := TStringList.Create;
  try
    if FMetaData then
    begin
      Result := Get_METADATA_DDL('SYNONYM', ObjectName, FOwner, ATempLines);
      if Result then
      begin
        FDDL.AddStrings(ATempLines);
        FDDL.Add('/');
        FDDL.Add('');
      end;
    end
    else
    begin
      q := TFDQuery.Create(nil);
      try
        q.ConnectionName := cnstFDConnectionName;
        q.SQL.Add('SELECT table_owner, table_name, db_link');
        q.SQL.Add('  FROM all_synonyms');
        q.SQL.Add(Format(' WHERE synonym_name = TRIM(UPPER(''%s'')) ',
          [ObjectName]));
        q.Open;
        Result := not (q.BOF and q.EOF);
        if not Result then
          Exit;

        ATempLines.Add(Format('CREATE SYNONYM %s', [LowerCase(ObjectName)]));

        if (q.FieldByName('DB_LINK').AsString > '') then
          ATempLines.Add(Format('  FOR %s.%s@%s',
            [q.FieldByName('TABLE_OWNER').AsString,
            q.FieldByName('TABLE_NAME').AsString,
            q.FieldByName('DB_LINK').AsString]))
        else
          ATempLines.Add(Format('  FOR %s.%s',
            [q.FieldByName('TABLE_OWNER').AsString,
            q.FieldByName('TABLE_NAME').AsString]));
        ATempLines.Add('/');
        ATempLines.Add('');

        FDDL.AddStrings(ATempLines);
      finally
        if Assigned(q) then
          FreeAndNil(q);
      end;
    end;
  finally
    if Assigned(ATempLines) then
      FreeAndNil(ATempLines);
  end;
end;

function TOracleDDLEngine.GetDDL_Table: Boolean;
var
  ATempLines: TStringList;
begin
  ATempLines := nil;

  ATempLines := TStringList.Create;
  try
    if FMetaData then
    begin
      Result := Get_METADATA_DDL('TABLE', ObjectName, FOwner, ATempLines);
      if Result then
      begin
        FDDL.AddStrings(ATempLines);
        FDDL.Add('/');
        FDDL.Add('');
      end;
    end
    else
    begin
      // Table definition
      Result := GetTableDef(ATempLines);
      if Result then // get script lines
      begin
        FDDL.AddStrings(ATempLines); // add script lines
        FDDL.Add('/');
        FDDL.Add(''); // blank line
        ATempLines.Clear; // clear list
      end;

      // Indexes
      if (tdoIndexes in FTableDefOptions) and GetTableIndexDef(ATempLines) then
      // get script lines
      begin
        FDDL.Add(Format('-- Indexes for %s', [FNewObjectName])); // title
        FDDL.Add(''); // blank line
        FDDL.AddStrings(ATempLines); // add script lines
        FDDL.Add(''); // blank line
        ATempLines.Clear; // clear list
      end;

      // Constraints
      if (tdoConstraints in FTableDefOptions) and
        GetTableConstraintDef(ATempLines)
      then // get script lines
      begin
        FDDL.Add(Format('-- Constraints for %s', [FNewObjectName]));
        // title
        FDDL.Add(''); // blank line
        FDDL.AddStrings(ATempLines); // add script lines
        FDDL.Add(''); // blank line
        ATempLines.Clear; // clear list
      end;

      // Triggers
      if (tdoTriggers in FTableDefOptions) and GetTableTriggerDef(ATempLines)
      then
      // get script lines
      begin
        FDDL.Add(Format('-- Triggers for %s', [FNewObjectName])); // title
        FDDL.Add(''); // blank line
        FDDL.AddStrings(ATempLines); // add script lines
        FDDL.Add(''); // blank line
        ATempLines.Clear; // clear list
      end;

      // Comments
      if (tdoComments in FTableDefOptions) and GetTableCommentDef(ATempLines)
      then
      // get script lines
      begin
        FDDL.Add(Format('-- Comments for %s', [FNewObjectName])); // title
        FDDL.Add(''); // blank line
        FDDL.AddStrings(ATempLines); // add script lines
        FDDL.Add(''); // blank line
        ATempLines.Clear; // clear list
      end;

      // Foreign Keys
      if (tdoForeignKeys in FTableDefOptions) and
        GetTableForeignKeyDef(ATempLines)
      then // get script lines
      begin
        FDDL.Add(Format('-- Foreign Keys for %s', [FNewObjectName]));
        // title
        FDDL.Add(''); // blank line
        FDDL.AddStrings(ATempLines); // add script lines
        FDDL.Add(''); // blank line
        ATempLines.Clear; // clear list
      end;
    end;
  finally
    if Assigned(ATempLines) then
      FreeAndNil(ATempLines);
  end;
end;

function TOracleDDLEngine.GetDDL_Trigger: Boolean;
var
  ATempLines: TStringList;
begin
  ATempLines := TStringList.Create;
  try
    if FMetaData then
      Result := Get_METADATA_DDL('TRIGGER', ObjectName, FOwner, ATempLines)
    else
      Result := GetTriggerDef(ObjectName, ATempLines);
    FDDL.AddStrings(ATempLines);
  finally
    if Assigned(ATempLines) then
      FreeAndNil(ATempLines);
  end;
end;

function TOracleDDLEngine.GetDDL_View: Boolean;
var
  ATempLines: TStringList;
  AText: string;
begin
  if FMetaData then
  begin
    ATempLines := TStringList.Create;
    try
      Result := Get_METADATA_DDL('VIEW', ObjectName, FOwner, ATempLines);
      if Result then
      begin
        FDDL.AddStrings(ATempLines);
        FDDL.Add('/');
        FDDL.Add('');
      end;
    finally
      FreeAndNil(ATempLines);
    end
  end
  else
  begin
    AText := SelectValueFmtAsString(
      'SELECT text FROM user_views WHERE view_name = ''%s''',
      [ObjectName]);
    Result := Trim(AText) > '';
    if not Result then
      Exit;
    FDDL.Add(Format('CREATE OR REPLACE VIEW %s AS', [LowerCase(ObjectName)]));
    FDDL.Add(Trim(AText));
    FDDL.Add('/');
  end;
end;

procedure TOracleDDLEngine.AddDDLHeader;
begin
  if not IncludeDDLComments then
    Exit;
  if MetaData then
  begin
    FDDL.Add(Format('-- Generated by SYS.DBMS_METADATA for %s %s.%s',
      [ObjectTypeName[FObjectType], FOwner, FNewObjectName]));
    FDDL.Add(Format('-- Generated %s', [FormatDateTime('ddddd tt', Now())]));
    FDDL.Add(''); // blank line
  end
  else
  begin
    FDDL.Add(Format('-- Start of DDL Script for %s %s.%s',
      [ObjectTypeName[FObjectType], FOwner, FNewObjectName]));
    FDDL.Add(Format('-- Generated %s', [FormatDateTime('ddddd tt', Now())]));
    FDDL.Add(''); // blank line
  end;
end;

procedure TOracleDDLEngine.AddDDLFooter;
begin
  if not IncludeDDLComments then
    Exit;
  if MetaData then
    FDDL.Add(Format('-- End of SYS.DBMS_METADATA Script for %s %s.%s',
      [ObjectTypeName[FObjectType], FOwner, FNewObjectName]))
  else
    FDDL.Add(Format('-- End of DDL Script for %s %s.%s',
      [ObjectTypeName[FObjectType], FOwner, FNewObjectName]));
end;

function TOracleDDLEngine.Get_METADATA_DDL(const AObjectType, AObjectName,
  AOwner: string; var ALines: TStringList): Boolean;
var
  q: TFDQuery;
  s: string;
  i: Integer;
begin
  // Initialization
  Result := False;

  // Validation
  if not Assigned(ALines) then
    raise Exception.Create('Application Error:  Field list object not ' +
      'supplied to Get_METADATA_DDL().');
  // Clear lines - this requires the calling method to supply
  // a "temporary" (ad hoc) string list.
  ALines.Clear;

  q := TFDQuery.Create(nil);
  try
    q.ConnectionName := cnstFDConnectionName;
    q.SQL.Add(Format
      ('SELECT DBMS_METADATA.get_ddl(''%s'', ''%s'', ''%s'') AS text',
      [AObjectType, AObjectName, AOwner]));
    q.SQL.Add('FROM DUAL');
    q.Open;
    Result := not (q.BOF and q.EOF);
    s := q.FieldByName('TEXT').AsString;
    ALines.Text := Trim(StrTran(s, #9, '        '));
    // Note:  Do not add '/' here.
  finally
    if Assigned(q) then
      FreeAndNil(q);
  end;
end;

function TOracleDDLEngine.Get_METADATA_DEPENDENT_DDL(const AObjectsOfType,
  ATableName: string; var ALines: TStringList): Boolean;
var
  q: TFDQuery;
  s: string;
  i: Integer;
begin
  // Initialization
  Result := False;
  q := nil;

  // Validation
  if not Assigned(ALines) then
    raise Exception.Create('Application Error:  Field list object not ' +
      'supplied to Get_METADATA_DEPENDENT_DDL().');
  // Clear lines - this requires the calling method to supply
  // a "temporary" (ad hoc) string list.
  ALines.Clear;

  q := TFDQuery.Create(nil);
  try
    q.ConnectionName := cnstFDConnectionName;
    q.SQL.Add(Format(
      'SELECT DBMS_METADATA.get_dependent_ddl(''%s'', ''%s'') AS text',
      [AObjectsOfType, ATableName]));
    q.SQL.Add('FROM DUAL');
    q.Open;
    Result := not (q.BOF and q.EOF);
    s := q.FieldByName('TEXT').AsString;
    ALines.Text := Trim(StrTran(s, #9, '        '));

    // The trouble with this method is that it doesn't include the
    // forward slashes where needed.  But we can do the following
    // because some body text (such as, trigger body) includes empty lines.
    { for i := 0 to ALines.Count - 1 do
      if Trim(ALines.Strings[i]) = '' then
     ALines.Strings[i] := '/'; }
  finally
    if Assigned(q) then
      FreeAndNil(q);
  end;
end;

procedure TOracleDDLEngine.UpdateObjectVars;
var
  AData: Variant;
  tmpStr: string;
begin
  // The object type may have been assigned before calling Execute.
  // If that is the case, then evaluate by type.  Otherwise,
  // the type will need to be obtained.
  if ObjectType = TOracleObjectType.UnknownType then
  begin
    AData := SelectValueArrayFmt(
      'SELECT object_type, status, temporary, owner FROM all_objects ' +
      'WHERE object_name = TRIM(UPPER(''%s'')) AND object_type = ''TABLE'' ',
      [FObjectName]);
    if System.Variants.VarArrayDimCount(AData) = 0 then
      AData := SelectValueArrayFmt(
        'SELECT object_type, status, temporary, owner FROM all_objects ' +
        'WHERE object_name = TRIM(UPPER(''%s'')) ', [FObjectName]);
  end
  else
  begin
    AData := SelectValueArrayFmt(
      'SELECT object_type, status, temporary, owner FROM all_objects ' +
      'WHERE object_name = TRIM(UPPER(''%s'')) AND object_type = ''%s'' ',
      [FObjectName, ObjectTypeName[FObjectType]]);
  end;

  if System.Variants.VarArrayDimCount(AData) = 0 then
    Exit;

  if ObjectType = TOracleObjectType.UnknownType then
    begin
      tmpStr := System.Variants.VarToStr(AData[0]);
      FObjectType := GetObjectType(tmpStr);
    end;

  tmpStr := System.Variants.VarToStr(AData[1]);
  FValid := tmpStr = 'Y';

  tmpStr := System.Variants.VarToStr(AData[2]);
  FTemporary := tmpStr = 'Y';

  FOwner := AData[3];

end;

function TOracleDDLEngine.GetPackageBodyDef(const APackageName: string;
  var ALines: TStringList): Boolean;
var
  q: TFDQuery;
begin
  // Initialization
  Result := False;

  if not Assigned(ALines) then
    raise Exception.Create('Application Error:  Field list object not ' +
      'supplied to GetPackageBodyDef().');
  // Clear lines - this requires the calling method to supply
  // a "temporary" (ad hoc) string list.
  ALines.Clear;

  q := TFDQuery.Create(nil);
  try
    q.ConnectionName := cnstFDConnectionName;
    q.SQL.Add('SELECT RTRIM(text, CHR(32) || CHR(10) || CHR(13)) AS text');
    q.SQL.Add('FROM user_source');
    q.SQL.Add(Format('WHERE name = ''%s'' AND', [ObjectName]));
    q.SQL.Add('      TYPE = ''PACKAGE BODY''');
    q.SQL.Add('ORDER BY line');
    q.Open;
    Result := not (q.BOF and q.EOF);
    if Result then
    begin
      ALines.Add('CREATE OR REPLACE');
      while not q.EOF do
      begin
        ALines.Add(q.FieldByName('TEXT').AsString);
        q.Next;
      end;
      // Remove blank lines at the end before adding slash
      RemoveTrailingBlankLines(ALines);
      ALines.Add('/');
      ALines.Add('');
    end;
  finally
    if Assigned(q) then
      FreeAndNil(q);
  end;
end;

function TOracleDDLEngine.GetPackageDef(const APackageName: string;
  var ALines: TStringList): Boolean;
var
  q: TFDQuery;
begin
  // Initialization
  Result := False;

  if not Assigned(ALines) then
    raise Exception.Create('Application Error:  Field list object not ' +
      'supplied to GetPackageDef().');
  // Clear lines - this requires the calling method to supply
  // a "temporary" (ad hoc) string list.
  ALines.Clear;

  q := TFDQuery.Create(nil);
  try
    q.ConnectionName := cnstFDConnectionName;
    q.SQL.Add('SELECT RTRIM(text, CHR(32) || CHR(10) || CHR(13)) AS text');
    q.SQL.Add('FROM user_source');
    q.SQL.Add(Format('WHERE name = ''%s'' AND', [ObjectName]));
    q.SQL.Add('      TYPE = ''PACKAGE'' ');
    q.SQL.Add('ORDER BY line');
    q.Open;
    Result := not (q.BOF and q.EOF);
    if Result then
    begin
      ALines.Add('CREATE OR REPLACE ' + q.FieldByName('TEXT').AsString);
      q.Next;
      while not q.EOF do
      begin
        ALines.Add(q.FieldByName('TEXT').AsString);
        q.Next;
      end;
      // Remove blank lines at the end before adding slash
      RemoveTrailingBlankLines(ALines);
      ALines.Add('/');
      ALines.Add('');
    end;

    //    ALines.Add('CREATE OR REPLACE');
    //    Result := not (q.BOF and q.EOF);
    //    while not q.EOF do
    //      begin
    //        ALines.Add(q.FieldByName('TEXT').AsString);
    //        q.Next;
    //      end;
    //    ALines.Add('/');
    //    ALines.Add('');
  finally
    if Assigned(q) then
      FreeAndNil(q);
  end;
end;

function TOracleDDLEngine.GetDropSQL: Boolean;
begin
  Result := False;

  if not Assigned(FDDL) or (ObjectName = '') or
    (ObjectTypeName[ObjectType] = '') then
    Exit;

  if (ObjectType = TOracleObjectType.OracleTable) then
    FDDL.Add(Format('DROP TABLE %s CASCADE CONSTRAINTS',
      [LowerCase(ObjectName)]))
  else
    FDDL.Add(Format('DROP %s %s', [UpperCase(ObjectTypeName[ObjectType]),
      LowerCase(ObjectName)]));

  FDDL.Add('/');
  FDDL.Add('');
end;

function TOracleDDLEngine.GetIncludeDropSQL: Boolean;
begin
  Result := (TOracleDDLOption.IncludeDropSQL in Options);
end;

function TOracleDDLEngine.FieldFloatValue(const AField: TField): string;
begin
  Result := '';
  if not Assigned(AField) then
    Exit;
  Result := AField.AsString;
end;

function TOracleDDLEngine.FieldIntegerValue(const AField: TField): string;
var
  i: Integer;
begin
  Result := '';
  if not Assigned(AField) then
    Exit;
  Result := AField.AsString;
  i := Pos(FormatSettings.DecimalSeparator, Result);
  if i > 0 then
    Result := Copy(Result, 1, i - 1);
end;

end.

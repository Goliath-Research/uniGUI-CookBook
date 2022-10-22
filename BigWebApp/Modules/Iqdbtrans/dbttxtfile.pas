unit dbttxtfile;

(* *** Import Text (ASCII) Files ***

  This unit handles import both delimited and fixed text files.
  Speed is maintained by outputting data to either a string grid,
  for display purposes only, or directly to an Oracle table.

  1.) Example - Write a fixed text to a string grid.
  Note:  You must set the format to fmtFixed, and provide
  a list of field names with their widths.

  with TTextFileImport.Create(NIL) do
  try
  FileName := edtFileName.Text;
  Format := fmtFixed;
  FirstRowHasNames := False;
  Fields.Add('COUNTRY', 150);
  Fields.Add('CHR3', 10);
  Fields.Add('DIGITS3',11);
  Options := [foCreateTable, foValidateFieldSizes, foShowProgressDlg];
  WriteToStringGrid(Grid, 10);
  finally
  Free;
  end;

  2.) Example - Write a delimited text to a string grid with a given
  delimiter and separator.

  with TTextFileImport.Create(NIL) do
  try
  FileName := edtFileName.Text;
  Format := fmtDelimited;
  FirstRowHasNames := True;
  DelimitedFileOptions.Delimiter := '"';
  DelimitedFileOptions.Separator := ',';
  Options := [foCreateTable, foValidateFieldSizes, foShowProgressDlg];
  WriteToStringGrid(Grid, 10);
  finally
  Free;
  end;

  3.) Example - Write a delimited .CSV text file to Oracle, using
  defaults:

  with TTextFileImport.Create(NIL) do
  try
  FileName := edtFileName.Text;
  FirstRowHasNames := True;
  Options := [foCreateTable, foValidateFieldSizes, foShowProgressDlg];
  WriteToOracleTable(SQLConnection, 'TMP_MYTABLENAME');
  finally
  Free;
  end;

  NOTE:  You may need to configure the SQL Connection.  This may be done
  with a call to a dbtdbexp procedure as follows:
  dbtdbexp.DBX_ConfigureSQLConnection(SQLConnection1);


  ************************************************************************** *)

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
  StdCtrls,
  Grids,
  Math,
  StrUtils,
  DB,
  SqlExpr,
  uniGUIApplication,
  DBClient,
  UniStringGrid,
  IQMS.DBTrans.dbtdb,
  IQMS.DBTrans.dbttypes,
  IQMS.Common.ProgressDialog;

type
  { Forwards }
  TTextFileImport = class;

  { TTextFileFormat }
  TTextFileFormat = (fmtDelimited, fmtFixed);

  { TDelimitedFileParams }
  TDelimitedFileParams = class
    Separator: AnsiChar; // field separator (such as, ',')
    Delimiter: AnsiChar; // text delimiter (such as, '"')
  end;

  { TTextFileImportOptions }
  TTextFileImportOption = (foValidateFieldSizes, foCreateTable,
    foShowProgressDlg);
  TTextFileImportOptions = set of TTextFileImportOption;

  { TTargetOut }
  TTargetOut = (toTable, toGrid, toSample);

  { TTextFileImport }
  TTextFileImport = class(TComponent)
  private
    { Private declarations }
    FFileName: string;
    FColNameHeader: Boolean;
    FMaxRows: Integer;
    FDelimiterOptions: TDelimitedFileParams;
    FFormat: TTextFileFormat;
    FOut: TTargetOut;
    FTargetGrid: TUniStringGrid;
    FSQLConnection: TSQLConnection;
    FTargetTableName: string;
    FSQL: string;
    FRowCount: Integer;
    FColCount: Integer;
    FFields: TCustomFieldList;
    FSchemaText: string;
    FSampleRowCount: Integer;
    FSQLParams: TStringList;
    FSeparator, FDelimiter: string;
    FOptions: TTextFileImportOptions;
    FQuery: TSQLQuery;
    FOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent;
    FOnProgressEvent: TOnProgressEvent;
    FProgressMessage: string;
    procedure LoadFile;
    procedure ProcessLine(const Value: string);
    procedure SetTextStr(const Value: AnsiString);
    procedure AddLineToTable(const Value: string);
    procedure AddLineToGrid(const Value: string);
    procedure AddLineToSampling(const Value: string);
    procedure AddFieldNamesToGrid;
    function NextFieldName(const AIndex: Integer): string;
    function SplitDelimited(const Value: string): string;
    function SplitFixed(const Value: string): string;
    function GetSchemaText: string;
    procedure SetSchemaText(const Value: string);
    function FormatName(const AFormat: TTextFileFormat): string;
    function FormatType(const AFormat: string): TTextFileFormat;
    procedure ProcessHeader(const Value: string);
    procedure GetSQL;
    procedure CreateOracleTable;
    procedure EstimateFieldDataTypes;
    procedure FinalizeDataTypes;
    function CheckIncreaseTextFieldSize(const AFieldItem: TFieldListItem;
      const AValue: string): Boolean;
    function CheckIncreaseNumberFieldSize(const AFieldItem: TFieldListItem;
      const AValue: string): Boolean;
    procedure ClearFieldDataTypes;
    procedure ClearFieldValues;
    procedure DoQueryInit;
    procedure DoQueryExec(const AParamValues: TStringList);
    procedure DoQueryAddParams;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
    procedure ResetValues;
    procedure WriteToStringGrid(const AGrid: TUniStringGrid;
      AMaxRows: Integer = 10);
    procedure WriteToOracleTable(const ASQLConnection: TSQLConnection;
      const ATableName: string);
    procedure GetFieldList(var AList: TStringList);
  published
    { Published declarations }
    property FileName: string read FFileName write FFileName;
    property Format: TTextFileFormat read FFormat write FFormat;
    property FirstRowHasNames: Boolean read FColNameHeader
      write FColNameHeader;
    property MaxRows: Integer read FMaxRows write FMaxRows;
    property DelimitedFileOptions: TDelimitedFileParams read FDelimiterOptions
      write FDelimiterOptions;
    property RowCount: Integer read FRowCount;
    property SampleRowCount: Integer read FSampleRowCount
      write FSampleRowCount;
    property Fields: TCustomFieldList read FFields write FFields;
    // in dbtdb.pas
    property SchemaText: string read GetSchemaText write SetSchemaText;
    property Options: TTextFileImportOptions read FOptions write FOptions;
    property ProgressMessage: string read FProgressMessage
      write FProgressMessage;
    // property ProgressDlgVisible: Boolean read FProgressDlgVisible write FProgressDlgVisible;
    // property ValidateFieldSizes: Boolean read FValidateFieldSizes write FValidateFieldSizes;
    // property DropTableFirst: Boolean read FDropTableFirst write FDropTableFirst;
    property OnProgressEvent: TOnProgressEvent read FOnProgressEvent
      write FOnProgressEvent;
    property OnCheckProgressAbortedEvent: TCheckProgressAbortedEvent
      read FOnCheckProgressAbortedEvent write FOnCheckProgressAbortedEvent;

  end;

const
  FORMAT_FIXED = 'FIXED';
  FORMAT_DELIMITED = 'DELIMITED';
  TAG_FILENAME = 'FILENAME';
  TAG_FORMAT = 'FORMAT';
  TAG_DELIMITER = 'DELIMITER';
  TAG_SEPARATOR = 'SEPARATOR';
  TAG_FIRSTROWHASNAMES = 'FIRSTROWHASNAMES';
  TAG_FIELDCOUNT = 'FIELDCOUNT';
  TAG_FIELD = 'FIELD';

implementation

uses
  IQMS.Common.EditMemoStr,
  IQMS.DBTrans.dbtfields,
  IQMS.DBTrans.dbtshare,
  IQMS.DBTrans.dbtdbexp,
  IQMS.DBTrans.dbtrscstr,
  dbtddl,
  IQMS.WebVcl.DBExpress,
  IQMS.Common.Dates,
  IQMS.Common.ErrorDialog,
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils;

{ TTextFileImport }

constructor TTextFileImport.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FQuery := nil;
  FSampleRowCount := 25;
  Fields := TCustomFieldList.Create; // declared in IQMS.DBTrans.dbtdb.pas
  FDelimiterOptions := TDelimitedFileParams.Create;
  FOptions := [foValidateFieldSizes, foCreateTable, foShowProgressDlg];
  FTargetTableName := '';
  FTargetGrid := nil;
  FSQLParams := TStringList.Create;
  ResetValues;
end;

destructor TTextFileImport.Destroy;
begin
  if Assigned(FDelimiterOptions) then
    FreeAndNil(FDelimiterOptions);
  if Assigned(FSQLParams) then
    FreeAndNil(FSQLParams);
  if Assigned(FQuery) then
    FreeAndNil(FQuery);
  inherited Destroy;
end;

procedure TTextFileImport.ResetValues;
begin
  Format := fmtDelimited;
  FFields.Clear;
  FDelimiterOptions.Separator := ','; // field separator
  FDelimiterOptions.Delimiter := '"'; // text delimiter
  FirstRowHasNames := False;
  FMaxRows := 0;
  FRowCount := 0;
end;

procedure TTextFileImport.WriteToOracleTable(const ASQLConnection
  : TSQLConnection; const ATableName: string);
var
  AMaxRows: Integer;
  AOptions: TTextFileImportOptions;
begin
  FOut := toTable;
  FTargetGrid := nil;

  if not Assigned(ASQLConnection) then
    raise Exception.Create('Application Error:  SQL Connection required.');

  if (ATableName = '') then
    raise Exception.Create('Application Error:  Table name required.');

  FTargetTableName := ATableName;
  FSQLConnection := ASQLConnection;

  if not FSQLConnection.Connected then
    FSQLConnection.Connected := True;

  if (FSchemaText > '') then
    SetSchemaText(FSchemaText);

  // We need to obtain a list of fields
  if (FFields.Count = 0) then
    try
      AMaxRows := FMaxRows;
      FMaxRows := FSampleRowCount;
      FOut := toSample;
      AOptions := FOptions;
      FOptions := FOptions - [foShowProgressDlg];
      LoadFile;
    finally
      FOut := toTable;
      FMaxRows := AMaxRows;
      FOptions := AOptions;
    end;

  if (foCreateTable in FOptions) then
    CreateOracleTable;

  GetSQL;
  DoQueryInit;
  DoQueryAddParams;
  LoadFile;
end;

procedure TTextFileImport.WriteToStringGrid(const AGrid: TUniStringGrid;
  AMaxRows: Integer);
var
  ASavedMax: Integer;
begin
  if not Assigned(AGrid) then
    Exit;
  FOut := toGrid;
  FTargetGrid := AGrid;
  FTargetTableName := '';
  FTargetGrid.RowCount := 2;
  FTargetGrid.ColCount := 2;
  FTargetGrid.cells[0,0] := '';
  FTargetGrid.cells[0,1] := '';
  try
    ASavedMax := FMaxRows;
    FMaxRows := AMaxRows;
    FTargetGrid.DisableAlign;
    LoadFile;
    AddFieldNamesToGrid;
  finally
    FTargetGrid.EnableAlign;
    FMaxRows := ASavedMax;
  end;
end;

procedure TTextFileImport.CreateOracleTable;
var
  ASQL: TStringList;
  i: Integer;
  lpar, rpar, col, def, comma: string;
begin
  // Validation
  if not Assigned(FSQLConnection) then
    raise Exception.Create('Application Error:  SQL connection required.');
  if (FTargetTableName = '') then
    raise Exception.Create
      ('Application Error:  Target table name not provided.');
  if (FFields.Count = 0) then
    // IQMS.DBTrans.dbtrscstr.cTXT0000237 = 'Field list is empty.';
    raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000237);

  IQMS.DBTrans.dbtshare.DropTable(FSQLConnection, FTargetTableName);

  try
    ASQL := TStringList.Create;
    ASQL.Add(SysUtils.Format('CREATE TABLE %s', [FTargetTableName]));
    for i := 0 to FFields.Count - 1 do
      begin
        if i = 0 then
          lpar := '('
        else
          lpar := ' ';
        if (i = (FFields.Count - 1)) then
          rpar := ')'
        else
          rpar := '';
        col := LowerCase(FFields.Items[i].FieldName);
        def := GetDataTypeDef(FFields.Items[i].DataType, FFields.Items[i].Size,
          FFields.Items[i].Precision, FFields.Items[i].Scale,
          FFields.Items[i].Nullable);
        comma := StrUtils.IfThen((FFields.Count > 1) and
          (i < FFields.Count - 1), ', ', '');
        ASQL.Add(SysUtils.Format('   %s%s %s%s%s',
          [lpar, IQMS.Common.StringUtils.PadR(col, 30), def, comma, rpar]));
      end;

    ASQL.Add('  PCTFREE     10');
    ASQL.Add('  INITRANS    1');
    ASQL.Add('  MAXTRANS    255');
    ASQL.Add('  NOPARALLEL');
    ASQL.Add('  LOGGING');
    ASQL.Add('  MONITORING');

    try
      // Run the SQL to create the new table
      IQMS.DBTrans.dbtdbexp.DBX_RunSQL(FSQLConnection, ASQL.Text);
    except
      on E: Exception do
        // IQMS.DBTrans.dbtrscstr.cTXT0000238 = 'Encountered an error creating the table.';
        IQMS.Common.ErrorDialog.ShowIQErrorMessage(IQMS.DBTrans.dbtrscstr.cTXT0000238, E.Message, '');
    end;

  finally
    if Assigned(ASQL) then
      FreeAndNil(ASQL);
  end;
end;

procedure TTextFileImport.GetSQL;
begin
  // Initialization
  FSQL := '';
  FSQLParams.Clear;
  // Validation
  if not Assigned(FSQLConnection) then
    raise Exception.Create('Application Error:  SQL connection required.');
  if (FTargetTableName = '') then
    raise Exception.Create
      ('Application Error:  Target table name not provided.');
  // Get the SQL
  with TSQLGeneratorOracle.Create(nil, FSQLConnection, FTargetTableName) do
    try
      Execute;
      FSQL := InsertSQL.Text;
      FSQLParams.AddStrings(InsertParams);
    finally
      Free;
    end;
end;

procedure TTextFileImport.LoadFile;
var
  Value: AnsiString;
  Stream: TFileStream;
  Size: Integer;
begin
  Value := '';
  FRowCount := 0;
  // Set string values of char properties
  // Field separator
  if (FFormat = fmtDelimited) and (FDelimiterOptions.Separator = #0) then
    // IQMS.DBTrans.dbtrscstr.cTXT0000239 = 'A field separator is required for delimited text files.';
    raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000239);
  // Separator
  if FDelimiterOptions.Separator = #0 then
    FSeparator := ''
  else
    FSeparator := FDelimiterOptions.Separator;
  // Text delimiter
  if FDelimiterOptions.Delimiter = #0 then
    FDelimiter := ''
  else
    FDelimiter := FDelimiterOptions.Delimiter;
  // Load the file
  if not FileExists(FileName) then
    Exit;

  if FSchemaText > '' then
    SetSchemaText(FSchemaText); // reset; forces field names.

  Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    Size := Stream.Size - Stream.Position;
    SetString(Value, nil, Size);
    Stream.Read(Pointer(Value)^, Size);
    SetTextStr(Value);
  finally
    if Assigned(Stream) then
      FreeAndNil(Stream);
  end;

  // When determining data types, internal tags are used ('FLOAT' and 'INTEGER);
  // FinalizeDataTypes changes these to valid, Oracle data types.
  if (FOut in [toGrid, toSample]) then
    FinalizeDataTypes;

end;

procedure TTextFileImport.SetTextStr(const Value: AnsiString);
var
  P, Start: PAnsiChar;
  S: AnsiString;
  APrg: TIQWebProgressDialog;
  AShouldShowPrg, AShowPrg: Boolean;
  AMaxLen, APct, AMax: Integer;
  APctMult: Real;
  AProgressMessage: string;
begin
  APrg := nil;
  FRowCount := 0; // reset property
  Start := '';
  APct := 0;
  AMax := 0;
  APctMult := 0;
  P := Pointer(Value);
  try
    // create and initialize the progress dialog.
    // Note: For large files, this can add several seconds to the import time.
    // So, we check and see if this is small enough to skip the
    // progress dialog.
    AMaxLen := Length(Value);
    if (FFields.Count > 0) then
      AShouldShowPrg := (FFields.Count >= 3) and (AMaxLen >= 4000 { 45000 } )
    else
      AShouldShowPrg := (AMaxLen >= 5000 { 25000 } );
    AShowPrg := AShouldShowPrg and (foShowProgressDlg in FOptions);

    if Length(FProgressMessage) > 0 then
      AProgressMessage := FProgressMessage
    else
      // 'Importing to %s';
      AProgressMessage := SysUtils.Format(IQMS.DBTrans.dbtrscstr.cTXT0000145,
        [FTargetTableName]);

    if AShouldShowPrg then
      APctMult := (100 / AMaxLen);

    if FMaxRows > 0 then
      AMax := FMaxRows
    else
      AMax := 100;

    if AShowPrg then
      begin
        APrg := TIQWebProgressDialog.Create(UniApplication); // IQMS.Common.ProgressDialog.pas
        APrg.Status1 := IQMS.DBTrans.dbtrscstr.cTXT0000024; // 'Importing data...'
        APrg.Status2 := FileName;
        APrg.MinProgress := 0;
        APrg.MaxProgress := AMax;
        APrg.Caption := IQMS.DBTrans.dbtrscstr.cTXT0000057; // 'Import'
        APrg.Execute;
      end;

    if Assigned(OnProgressEvent) then
      begin
        OnProgressEvent(AMax, 0, AProgressMessage);
        Application.ProcessMessages;
      end;

    if P <> nil then
      while P^ <> #0 do
        begin
          // Increment progress
          if AShouldShowPrg then
            begin
              if FMaxRows > 0 then
                APct := FRowCount
              else
                begin
                  APct := 0;
                  // Checking for empty string prevents AV
                  if (Start <> '') then
                    APct := Trunc(APctMult * (AMaxLen - Length(Start)));
                end;
            end;

          if AShowPrg and Assigned(APrg) then
            begin
              if APrg.CheckProgressAborted then
                SysUtils.Abort;
              if Assigned(APrg) then
                APrg.ProgressBar.Position := APct;
              Application.ProcessMessages;
            end;

          if AShouldShowPrg and Assigned(OnProgressEvent) then
            begin
              OnProgressEvent(AMax, APct, AProgressMessage);
              Application.ProcessMessages;
            end;

          // Check max rows
          if (FMaxRows > 0) and (FRowCount >= FMaxRows) then
            Break;

          // Add line
          Start := P;
          // Note:  Do not call CharInSet().
          while not (AnsiChar(P^) in [#0, #10, #13]) do
            Inc(P);
          SetString(S, Start, P - Start);

          // if this is the first row, and it contains field names,
          // do not treat it as normal data; use it to populate the
          // field list
          if FColNameHeader and (FRowCount = 0) then
            begin
              // Process the header only if no schema has been set;
              // or if a schema has been set, then process the header
              // if no fields were able to be applied from the schema.
              // The purpose of ProcessHeader is to update the field list.
              if (FFields.Count = 0) then
                // if ((FSchemaText = '') and (FFields.Count = 0)) or
                // ((FSchemaText > '') and (FFields.Count = 0)) then
                // if (FSchemaText = '') or
                // (FFields.Count = 0) then
                // ((FSchemaText > '') and (FFields.Count = 0)) then
                ProcessHeader(S);
            end
          else
            ProcessLine(S);

          Inc(FRowCount);

          if P^ = #13 then
            Inc(P);
          if P^ = #10 then
            Inc(P);
        end;
  finally
    if Assigned(APrg) then
      FreeAndNil(APrg);
    if Assigned(OnProgressEvent) then
      OnProgressEvent(100, 0, IQMS.DBTrans.dbtrscstr.cTXT0000206 { 'Done.' } );
  end;
end;

procedure TTextFileImport.ProcessHeader(const Value: string);

  procedure _PopulateFieldNames;
  var
    i: Integer;
  begin
    // Since the first line data contains field names, then
    // the field data will equal the field names.
    for i := 0 to FFields.Count - 1 do
      FFields.Items[i].FieldName := FFields.Items[i].Value;
  end;

begin
  case FFormat of
    fmtDelimited:
      begin
        SplitDelimited(Value);
        _PopulateFieldNames;
        FColCount := Fields.Count;
      end;
    fmtFixed:
      begin
        if Fields.Count = 0 then
          { 'Invalid field count (0) in schema.  ' +
            'Cannot evaluate this file as fixed text.' }
          raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000189);
        SplitFixed(Value);
        _PopulateFieldNames;
      end;
  end;
end;

procedure TTextFileImport.ClearFieldDataTypes;
var
  i: Integer;
begin
  for i := 0 to FFields.Count - 1 do
    with FFields.Items[i] do
      DataType := '';
end;

procedure TTextFileImport.ClearFieldValues;
var
  i: Integer;
begin
  for i := 0 to FFields.Count - 1 do
    FFields.Items[i].Value := Unassigned;
end;

procedure TTextFileImport.ProcessLine(const Value: string);
begin
  case FOut of
    toTable:
      if (FTargetTableName > '') then
        AddLineToTable(Value);
    toGrid:
      if Assigned(FTargetGrid) then
        AddLineToGrid(Value);
    toSample:
      AddLineToSampling(Value);
  end;
end;

procedure TTextFileImport.AddLineToGrid(const Value: string);
var
  S: string;
  ARow: Integer;
begin
  FColCount := 0;

  // We clear the data types at the start
  if RowCount = 0 then
    ClearFieldDataTypes;

  case FFormat of
    fmtDelimited:
      begin
        with FTargetGrid do
          begin
            ARow := 1;
            if (Trim(cells[0,ARow]) > '') then
              begin
                ARow := RowCount;
                RowCount := ARow + 1;
              end;
            S := SplitDelimited(Value);
            FTargetGrid.ColCount := Fields.Count;
            cells[0,ARow] := S;
          end;
      end;
    fmtFixed:
      begin
        if Fields.Count = 0 then
          { 'Invalid field count (0) in schema.  ' +
            'Cannot evaluate this file as fixed text.' }
          raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000189);

        FColCount := Fields.Count;

        with FTargetGrid do
          begin
            ColCount := Fields.Count;
            ARow := 1;
            if (Trim(cells[0,ARow]) > '') then
              begin
                ARow := RowCount;
                RowCount := ARow + 1;
              end;
            S := SplitFixed(Value);
            cells[0,ARow] := S;
          end;
      end;
  end;

  if FTargetGrid.RowCount <= FSampleRowCount then
    EstimateFieldDataTypes;

  if FTargetGrid.RowCount = 10 then
    AddFieldNamesToGrid;
end;

procedure TTextFileImport.AddLineToSampling(const Value: string);
begin
  case FFormat of
    fmtDelimited:
      begin
        SplitDelimited(Value);
      end;
    fmtFixed:
      begin
        if Fields.Count = 0 then
          { 'Invalid field count (0) in schema.  ' +
            'Cannot evaluate this file as fixed text.' }
          raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000189);
        SplitFixed(Value);
      end;
  end;

  if FRowCount <= 25 then
    EstimateFieldDataTypes;

end;

procedure TTextFileImport.AddLineToTable(const Value: string);
var
  AValues: TStringList;

  procedure _PopulateParamList;
  var
    i, j: Integer;
  begin
    // Initialization
    i := 0;
    j := 0;
    // Use the params as the basis for filling the values list
    for i := 0 to FSQLParams.Count - 1 do
      begin
        j := FFields.IndexOf(FSQLParams.Strings[i]);
        if (j > - 1) then
          begin
            // Increase field sizes, if desired
            if (foValidateFieldSizes in FOptions) then
              begin
                if (FFields.Items[j].DataType = 'VARCHAR2') then
                  CheckIncreaseTextFieldSize(FFields.Items[j],
                    FFields.Items[j].Value)
                else if (FFields.Items[j].DataType = 'NUMBER') then
                  CheckIncreaseNumberFieldSize(FFields.Items[j],
                    FFields.Items[j].Value);
              end;
            // Truncate string values
            if (FFields.Items[j].DataType = 'VARCHAR2') then
              FFields.Items[j].Value :=
                StrUtils.LeftBStr(FFields.Items[j].Value,
                FFields.Items[j].Size);
            AValues.Add(FFields.Items[j].Value);
          end
        else
          AValues.Add('');
      end;
  end;

begin
  // Validation
  // The SQL is generated only once, at the start of the process, with a call
  // to GetSQL.  It should already exist.
  if FSQL = '' then
    raise Exception.Create('Application Error:  SQL could not be generated.');

  try
    AValues := TStringList.Create;
    case FFormat of
      fmtDelimited:
        begin
          SplitDelimited(Value);
          _PopulateParamList;
          if AValues.Count <> FSQLParams.Count then
            // IQMS.DBTrans.dbtrscstr.cTXT0000240 =
            // 'Malformed text file.  Inconsistent field count for row %d.  ' +
            // 'Expected %d fields, but found %d.';
            raise Exception.CreateFmt(IQMS.DBTrans.dbtrscstr.cTXT0000240,
              [FRowCount + 1, FSQLParams.Count, AValues.Count]);
          try
            // IQMS.DBTrans.dbtdbexp.DBX_RunSQLParamStrings(FSQLConnection, FSQL,
            // FSQLParams, AValues);
            DoQueryExec(AValues);
          except
            on E: Exception do
              // IQMS.DBTrans.dbtrscstr.cTXT0000241 = 'Encountered an error adding a table record.'
              // IQMS.DBTrans.dbtrscstr.cTXT0000242 = 'Row Number: %d';
              IQMS.Common.ErrorDialog.ShowIQErrorMessage(IQMS.DBTrans.dbtrscstr.cTXT0000241,
                E.Message, SysUtils.Format(IQMS.DBTrans.dbtrscstr.cTXT0000242, [FRowCount]));
          end;
        end;
      fmtFixed:
        begin
          if Fields.Count = 0 then
            { 'Invalid field count (0) in schema.  ' +
              'Cannot evaluate this file as fixed text.' }
            raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000189);
          SplitFixed(Value);
          _PopulateParamList;
          if AValues.Count <> FSQLParams.Count then
            // IQMS.DBTrans.dbtrscstr.cTXT0000240 =
            // 'Malformed text file.  Inconsistent field count for row %d.  ' +
            // 'Expected %d fields, but found %d.';
            raise Exception.CreateFmt(IQMS.DBTrans.dbtrscstr.cTXT0000240,
              [FRowCount + 1, FSQLParams.Count, AValues.Count]);
          try
            // IQMS.DBTrans.dbtdbexp.DBX_RunSQLParamStrings(FSQLConnection, FSQL,
            // FSQLParams, AValues);
            DoQueryExec(AValues);
          except
            on E: Exception do
              // IQMS.DBTrans.dbtrscstr.cTXT0000241 = 'Encountered an error adding a table record.'
              // IQMS.DBTrans.dbtrscstr.cTXT0000242 = 'Row Number: %d';
              IQMS.Common.ErrorDialog.ShowIQErrorMessage(IQMS.DBTrans.dbtrscstr.cTXT0000241,
                E.Message, SysUtils.Format(IQMS.DBTrans.dbtrscstr.cTXT0000242, [FRowCount]));
          end;
        end;
    end;
  finally
    if Assigned(AValues) then
      FreeAndNil(AValues);
  end;
end;

function TTextFileImport.SplitDelimited(const Value: string): string;
var
  S: string;
  P, P1, Start: PChar;
  AColCount: Integer;

  procedure _Add(s_value: string);
  begin
    // Add to the result string
    if Result = '' then
      Result := s_value + #13
    else
      Result := Result + s_value + #13;
    // Add field value
    if (FFields.Count - 1 < AColCount) then
      with FFields.Add(NextFieldName(AColCount + 1)) do
        begin
          // DataType := 'VARCHAR2';
          // Size := 255;
          Value := s_value;
        end
    else
      FFields.Items[AColCount].Value := s_value;
    // Increment the column count
    Inc(AColCount);
  end;

begin
  // Initialization
  Result := '';
  AColCount := 0;

  // Separator must be provided
  if FSeparator = '' then
    // IQMS.DBTrans.dbtrscstr.cTXT0000243 = 'Please specify a field separator.';
    raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000243);

  // Clear the field values first
  ClearFieldValues;

  // Validation
  if Value = '' then
    Exit;

  // Method 1:  If no delimiter, then use the fast method
  if FDelimiter = '' then
    begin
      P := Pointer(Value);
      if P <> nil then
        begin
          // Initialize string pointer, regardless of method below
          Start := P;
          repeat
            Inc(P);
            if (P^ = FSeparator[1]) or (P^ in [#0, #10, #13]) then
              begin
                SetString(S, Start, P - Start);
                if S = FSeparator then
                  _Add('')
                else
                  _Add(S);
                if (P^ in [#0, #10, #13]) then
                  Break;
                Inc(P);
                if (P^ = FSeparator[1]) then
                  Dec(P);
                Start := P;
              end;
          until (P^ in [#0, #10, #13]);
        end;
    end
    // Method 2:  If delimiter is provided, evaluate for text delimiter.
  else
    begin
      Result := '';
      P := PChar(Value);
      while P^ in [#1 .. #31 { ' ' } ] do
        Inc(P);
      while P^ <> #0 do
        begin
          if P^ = FDelimiter[1] then
            S := AnsiExtractQuotedStr(P, FDelimiter[1])
          else
            begin
              P1 := P;
              while { (P^ > ' ') and } (P^ > #31) and (P^ <> FSeparator[1]) do
                Inc(P);
              SetString(S, P1, P - P1);
            end;
          _Add(S);
          while P^ in [#1 .. ' '] do
            Inc(P);
          if P^ = FSeparator[1] then
            begin
              P1 := P;
              Inc(P1);
              if P1^ = #0 then
                _Add('');
              repeat
                Inc(P);
              until not (P^ in [#1 .. ' ']);
            end;
        end;
    end;
end;

function TTextFileImport.SplitFixed(const Value: string): string;
var
  i, iStart, iEnd: Integer;
  S: string;

  procedure _Add(s_value: string; AFieldIndex: Integer);
  begin
    // Add to the result string
    if Result = '' then
      Result := s_value + #13
    else
      Result := Result + s_value + #13;
    FFields.Items[AFieldIndex].Value := s_value;
  end;

begin
  // Initialization
  Result := '';
  iStart := 0;
  iEnd := 0;
  S := '';
  for i := 0 to FFields.Count - 1 do
    begin
      iStart := iEnd;
      iEnd := iEnd + FFields.Items[i].FixedWidth;
      S := Copy(Value, iStart, FFields.Items[i].FixedWidth);
      _Add(Trim(S), i);
    end;
end;

procedure TTextFileImport.AddFieldNamesToGrid;
var
  i: Integer;
begin
  if not Assigned(FTargetGrid) then
    Exit;

  if FFields.Count > 0 then
    begin
      for i := 1 to FFields.Count do
        if FTargetGrid.Cells[i - 1, 0] = '' then
          FTargetGrid.Cells[i - 1, 0] := FFields[i - 1].FieldName;
    end
  else
    begin
      for i := 1 to FTargetGrid.ColCount do
        if FTargetGrid.Cells[i - 1, 0] = '' then
          FTargetGrid.Cells[i - 1, 0] := SysUtils.Format('Field%d', [i]);
    end;

end;

function TTextFileImport.GetSchemaText: string;
var
  sl: TStringList;
  i: Integer;
  def: string;

  function _EvalChar(const C: AnsiChar): string;
  begin
    if C = #0 then
      Result := ''
    else
      Result := C;
  end;

begin
  // Initialization
  sl := nil;

  // Validation
  if not Assigned(FDelimiterOptions) or not Assigned(FFields) then
    Exit;
  try
    sl := TStringList.Create;
    sl.Add(SysUtils.Format('%s=%s', [TAG_FILENAME,
      ExtractFileName(FFileName)]));
    sl.Add(SysUtils.Format('%s=%s', [TAG_FORMAT, FormatName(Self.FFormat)]));
    sl.Add(SysUtils.Format('%s=%s', [TAG_DELIMITER,
      _EvalChar(FDelimiterOptions.Delimiter)]));
    sl.Add(SysUtils.Format('%s=%s', [TAG_SEPARATOR,
      _EvalChar(FDelimiterOptions.Separator)]));
    sl.Add(SysUtils.Format('%s=%d', [TAG_FIRSTROWHASNAMES,
      Integer(FColNameHeader)]));
    sl.Add(SysUtils.Format('%s=%d', [TAG_FIELDCOUNT, FFields.Count]));
    for i := 0 to FFields.Count - 1 do
      begin
        def := GetDataTypeDef(FFields.Items[i].DataType, FFields.Items[i].Size,
          FFields.Items[i].Precision, FFields.Items[i].Scale,
          FFields.Items[i].Nullable);
        // Example:
        // 'FIELD1=COUNTRY;VARCHAR2(250);150'
        // 'FIELD2=AMOUNT;NUMBER(12,6);10'
        sl.Add(SysUtils.Format('%s%d=%s;%s;%d', [TAG_FIELD, i + 1,
          FFields.Items[i].FieldName, def, // FFields.Items[i].DataType,
          FFields.Items[i].FixedWidth]));
      end;
    Result := sl.Text;
  finally
    if Assigned(sl) then
      FreeAndNil(sl);
  end;
end;

procedure TTextFileImport.SetSchemaText(const Value: string);
var
  sl: TStringList;
  i, x: Integer;
  S: string;
  AFieldName, AFieldType: string;
  AFieldSize, AFieldPrecision, AFieldScale, AFixedWidth: Integer;

  procedure _ParseFieldLine(def: string; var sFN: string; var sDT: string;
    var iSize: Integer; var iPrecision: Integer; var iScale: Integer;
    var iW: Integer);
  var
    tmp, tmp2, tmp3: string;
    j, k, l: Integer;
  begin
    // Initialize
    sFN := '';
    sDT := '';
    iW := 0;
    iSize := 0;

    // Field name
    tmp := def;
    j := Pos(';', tmp);
    sFN := Trim(Copy(tmp, 1, j - 1));
    tmp := Copy(tmp, j + 1, Length(tmp));

    // Data type, size, precision and scale
    sDT := '';
    iPrecision := 0;
    iScale := 0;
    j := Pos(';', tmp);
    tmp2 := Copy(tmp, 1, j - 1);
    j := Pos('(', tmp2);
    k := Pos(')', tmp2);
    if (j = 0) then
      sDT := tmp2 // i.e., 'NUMBER', 'CLOB', 'BLOB'
    else if (j > 0) and (k > 0) then
      begin
        // data type line (returns, 'NUMBER', 'CLOB', 'BLOB', etc.)
        sDT := Copy(tmp2, 1, j - 1);
        // returns numerics
        tmp3 := Copy(tmp2, j + 1, k - j - 1);
        // if this follows this format: 'VARCHAR2(20 BYTE)'
        if Pos(' ', tmp3) > 0 then
          begin
            // precision or data size
            IQMS.Common.Numbers.IsStringValidInteger
              (Trim(Copy(tmp3, 1, Pos(' ', tmp3) - 1)), iSize);
            iPrecision := iSize;
          end
          // if this follows this format: 'NUMBER(15,6)'
        else if Pos(',', tmp3) > 0 then
          begin
            l := Pos(',', tmp3);
            IQMS.Common.Numbers.IsStringValidInteger(Trim(Copy(tmp3, 1, l - 1)),
              iPrecision);
            IQMS.Common.Numbers.IsStringValidInteger(Trim(Copy(tmp3, l + 1, Length(tmp3))
              ), iScale);
          end
          // if this follows this format: 'NUMBER' or 'VARCHAR2'
        else
          begin
            IQMS.Common.Numbers.IsStringValidInteger(tmp3, iSize);
            iPrecision := iSize;
          end;
      end;

    // Fixed width
    j := Pos(';', tmp);
    tmp := Copy(tmp, j + 1, Length(tmp));
    SysUtils.TryStrToInt(tmp, iW);
  end;

begin
  // Initialization
  sl := nil;
  S := '';
  AFieldName := '';
  AFixedWidth := 0;
  i := 0;
  x := 0;
  FSchemaText := ''; // reset before validating

  // Validation
  // These objects must exist.
  if not Assigned(FDelimiterOptions) or not Assigned(FFields) then
    Exit;

  // Clear values; we will populate based on schema string.
  ResetValues;

  // Set the saved schema text
  FSchemaText := Value;

  // If no value is provided, then exit early.
  if Value = '' then
    Exit;

  try
    sl := TStringList.Create;
    sl.Text := Value;
    if sl.Count = 0 then
      // 'Malformed schema text.  Could not parse.'
      raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000190);
    FFormat := FormatType(sl.Values[TAG_FORMAT]);
    if sl.Values[TAG_DELIMITER] = '' then
      DelimitedFileOptions.Delimiter := #0
    else
      DelimitedFileOptions.Delimiter := AnsiChar(sl.Values[TAG_DELIMITER][1]);
    if sl.Values[TAG_SEPARATOR] = '' then
      DelimitedFileOptions.Separator := #0
    else
      DelimitedFileOptions.Separator := AnsiChar(sl.Values[TAG_SEPARATOR][1]);
    FColNameHeader := AnsiChar(sl.Values[TAG_FIRSTROWHASNAMES][1]) = '1';
    SysUtils.TryStrToInt(sl.Values[TAG_FIELDCOUNT], x);
    for i := 1 to x do
      begin
        // Example:
        // 'FIELD1=COUNTRY;VARCHAR2(250);150'
        // 'FIELD2=AMOUNT;NUMBER(12,6);10'
        S := sl.Values[NextFieldName(i)];
        if S > '' then
          begin
            _ParseFieldLine(S, AFieldName, AFieldType, AFieldSize,
              AFieldPrecision, AFieldScale, AFixedWidth);
            with FFields.Add(AFieldName, AFixedWidth) do
              begin
                DataType := AFieldType;
                Size := AFieldSize;
                Precision := AFieldPrecision;
                Scale := AFieldScale;
              end;
          end;
      end;
  finally
    if Assigned(sl) then
      FreeAndNil(sl);
  end;
end;

function TTextFileImport.FormatName(const AFormat: TTextFileFormat): string;
begin
  if FFormat = fmtFixed then
    Result := FORMAT_FIXED
  else
    Result := FORMAT_DELIMITED;
end;

function TTextFileImport.FormatType(const AFormat: string): TTextFileFormat;
begin
  if AFormat = FORMAT_FIXED then
    Result := fmtFixed
  else
    Result := fmtDelimited;
end;

procedure TTextFileImport.GetFieldList(var AList: TStringList);
var
  i: Integer;
begin
  if not Assigned(AList) then
    Exit;
  AList.Clear;
  for i := 0 to FFields.Count - 1 do
    AList.Add(FFields.Items[i].FieldName);
end;

function TTextFileImport.NextFieldName(const AIndex: Integer): string;
begin
  Result := TAG_FIELD + IntToStr(AIndex);
end;

procedure TTextFileImport.EstimateFieldDataTypes;
var
  i, x, i_scale, i_precision: Integer;
  s_value, data_type: string;

  function _IsDateTimeText(const val: string): Boolean;
  var
    d: TDateTime;
  begin
    Result := IQMS.Common.Dates.IsStringValidDate(val, d);
  end;

  function _IsIntegerText(const val: string): Boolean;
  var
    i: Integer;
    r: Extended;
  begin
    Result := SysUtils.TryStrToFloat(val, r);
    if Result then
      begin
        if Frac(r) > 0 then
          Result := False;
        if not Result then
          Exit;
        Result := SysUtils.TryStrToInt(val, i);
      end;
  end;

  function _IsFloatText(const in_val: string; var out_precision: Integer;
    var out_scale: Integer): Boolean;
  var
    r, d: Extended;
    dec_pos: Integer;
    s_converted, s_before_dot, s_after_dot: string;
  begin
    // Initialize
    out_precision := 0;
    out_scale := 0;
    s_converted := '';
    s_before_dot := '';
    s_after_dot := '';
    dec_pos := 0;
    r := 0;
    d := 0;
    // If this succeeds, then it may be a floating point value;
    // yet, it could still be an integer.
    Result := SysUtils.TryStrToFloat(in_val, r);
    if Result then
      begin
        d := Frac(r);
        s_converted := FloatToStr(r);
        dec_pos := Pos(FormatSettings.DecimalSeparator, s_converted);
        if dec_pos = 0 then
          begin
            s_before_dot := s_converted;
            s_after_dot := '0';
          end
        else
          begin
            s_before_dot := Copy(s_converted, 1, dec_pos - 1);
            s_after_dot := Copy(s_converted, dec_pos + 1, Length(s_converted));
          end;
        out_scale := Length(s_after_dot);
        out_precision := Length(s_before_dot) + out_scale + 1;
      end;
  end;

begin
  {
    _Add('Byte', 'NUMBER', 0, 3, 0);
    _Add('Integer', 'NUMBER', 0, 15, 0);
    _Add('Currency', 'NUMBER', 0, 16, 6);
    _Add('Single', 'NUMBER', 0, 16, 10);
    _Add('Double', 'NUMBER', 0, 20, 10);
    _Add('Date/Time', 'DATE', 7, 0, 0);
    _Add('Text', 'VARCHAR2', 255, 0, 0);
    _Add('Memo', 'VARCHAR2', 2000, 0, 0);
  }
  // This is only used when updating the string grid
  // Cycle field list, and predict datatype, length, etc.
  for i := 0 to FFields.Count - 1 do
    begin
      // NULL value; cannot evaluate for NULL.
      if (FFields.Items[i].Value = Unassigned) or
        (FFields.Items[i].Value = '') then
        Continue;
      s_value := FFields.Items[i].Value;
      i_scale := 0;
      i_precision := 0;
      data_type := FFields.Items[i].DataType;
      // FFields.Items[i].FixedWidth := Max(FFields.Items[i].FixedWidth, Length(s_value));
      if ((data_type = '') or (data_type = 'INTEGER')) and
        _IsIntegerText(s_value) then
        begin
          FFields.Items[i].DataType := 'INTEGER';
          if FFields.Items[i].Precision = 0 then
            FFields.Items[i].Precision := 15;
          FFields.Items[i].Precision := Max(FFields.Items[i].Precision,
            Length(s_value));
          FFields.Items[i].Scale := 0;
          // FFields.Items[i].FixedWidth := Max(FFields.Items[i].FixedWidth,
          // FFields.Items[i].Precision + 1);
        end
      else if ((data_type = '') or (data_type = 'INTEGER') or
        (data_type = 'FLOAT')) and _IsFloatText(s_value, i_precision,
        i_scale) then
        begin
          FFields.Items[i].DataType := 'FLOAT';

          if FFields.Items[i].Precision = 0 then
            begin
              FFields.Items[i].Precision := 16;
              FFields.Items[i].Scale := 10;
            end;

          FFields.Items[i].Precision := Max(FFields.Items[i].Precision,
            i_precision);
          FFields.Items[i].Scale := Max(FFields.Items[i].Scale, i_scale);

          if IQMS.Common.Numbers.IsBetween(FFields.Items[i].Precision, 17, 20) then
            FFields.Items[i].Precision := 20;
          if IQMS.Common.Numbers.IsBetween(FFields.Items[i].Scale, 1, 9) then
            FFields.Items[i].Scale := 10;

          // FFields.Items[i].FixedWidth := Max(FFields.Items[i].FixedWidth,
          // FFields.Items[i].Precision + 1);
        end
      else if ((data_type = '') or (data_type = 'DATE')) and
        _IsDateTimeText(s_value) then
        begin
          FFields.Items[i].DataType := 'DATE';
          FFields.Items[i].Size := 7;
          FFields.Items[i].Precision := 0;
          FFields.Items[i].Scale := 0;
          // FFields.Items[i].FixedWidth := Max(FFields.Items[i].FixedWidth,
          // Length(s_value) + 1);
        end
      else
        begin
          FFields.Items[i].DataType := 'VARCHAR2';
          if FFields.Items[i].Size = 0 then
            FFields.Items[i].Size := 255;
          x := Max(FFields.Items[i].Size, Length(s_value));
          FFields.Items[i].Size := x;
          if IQMS.Common.Numbers.IsBetween(FFields.Items[i].Size, 256, 2000) then
            FFields.Items[i].Size := 2000;
          if IQMS.Common.Numbers.IsBetween(FFields.Items[i].Size, 2001, 4000) then
            FFields.Items[i].Size := 4000;
          // FFields.Items[i].FixedWidth := Max(FFields.Items[i].FixedWidth,
          // x + 1);
        end;
    end;
end;

procedure TTextFileImport.FinalizeDataTypes;
var
  i: Integer;
begin
  // Reset internal data type tags to valid, Oracle data types.
  for i := 0 to FFields.Count - 1 do
    if (FFields.Items[i].DataType = '') then
      begin
        FFields.Items[i].DataType := 'VARCHAR2';
        FFields.Items[i].Size := 255
      end
    else if (FFields.Items[i].DataType = 'VARCHAR2') and
      (FFields.Items[i].Size = 0) then
      FFields.Items[i].Size := 255
    else if (FFields.Items[i].DataType = 'INTEGER') then
      FFields.Items[i].DataType := 'NUMBER'
    else if (FFields.Items[i].DataType = 'FLOAT') then
      FFields.Items[i].DataType := 'NUMBER';
end;

function TTextFileImport.CheckIncreaseTextFieldSize(const AFieldItem
  : TFieldListItem; const AValue: string): Boolean;
var
  ANewSize, ACurSize, AUsedSize: Integer;
begin
  Result := False;
  if not Assigned(AFieldItem) then
    Exit;
  ACurSize := AFieldItem.Size;
  ANewSize := Length(AValue);
  AUsedSize := ACurSize; // initial

  if (ANewSize > ACurSize) and ((ANewSize >= 1) and (ANewSize <= 4000)) then
    AUsedSize := ANewSize
  else if (ACurSize < 4000) and (ANewSize >= 4000) then
    AUsedSize := 4000
  else
    begin
      AUsedSize := ACurSize;
      Exit;
    end;

  if not Assigned(FSQLConnection) then
    Exit;
  if (FTargetTableName = '') then
    Exit;

  IQMS.DBTrans.dbtdbexp.DBX_RunSQLFmt(FSQLConnection, 'ALTER TABLE %s'#13 +
    ' MODIFY %s VARCHAR2(%d)', [LowerCase(FTargetTableName),
    LowerCase(AFieldItem.FieldName), AUsedSize]);
  Result := True;

  if Result then
    begin
      AFieldItem.Size := AUsedSize;
      AFieldItem.Value := StrUtils.LeftStr(AValue, AUsedSize)
    end;
end;

function TTextFileImport.CheckIncreaseNumberFieldSize(const AFieldItem
  : TFieldListItem; const AValue: string): Boolean;
var
  ACurPrecision, ACurScale, ANewPrecision, ANewScale, AUsedPrecision,
    AUsedScale: Integer;
  r, d: Extended;
  dec_pos: Integer;
  s_converted, s_before_dot, s_after_dot: string;
begin
  // Initialize
  Result := False;
  s_converted := '';
  s_before_dot := '';
  s_after_dot := '';
  dec_pos := 0;
  r := 0;
  d := 0;
  ACurPrecision := 0;
  ACurScale := 0;
  ANewPrecision := 0;
  ANewScale := 0;
  AUsedPrecision := 0;
  AUsedScale := 0;

  if not Assigned(AFieldItem) then
    Exit;
  SysUtils.TryStrToFloat(AValue, r);
  d := Frac(r);

  ACurPrecision := AFieldItem.Precision;
  ACurScale := AFieldItem.Scale;
  AUsedPrecision := ACurPrecision;
  AUsedScale := ACurScale;

  Result := SysUtils.TryStrToFloat(AValue, r);
  if not Result then
    Exit;

  d := Frac(r);
  s_converted := FloatToStr(r);
  dec_pos := Pos(FormatSettings.DecimalSeparator, s_converted);
  if dec_pos = 0 then
    begin
      s_before_dot := s_converted;
      s_after_dot := '';
    end
  else
    begin
      s_before_dot := Copy(s_converted, 1, dec_pos - 1);
      s_after_dot := Copy(s_converted, dec_pos + 1, Length(s_converted));
    end;

  ANewScale := Length(s_after_dot);
  ANewPrecision := Length(s_before_dot) + ANewScale + 1;

  if (ANewPrecision <= ACurPrecision) and (ANewScale <= ACurScale) then
    Exit;

  AUsedScale := Max(ANewScale, ACurScale);

  // Precision must be incremented by the difference of the added scale
  if (AUsedScale > ACurScale) then
    ACurPrecision := ACurPrecision + (AUsedScale - ACurScale);
  AUsedPrecision := Max(ANewPrecision, ACurPrecision);

  if (AUsedPrecision > 38) or (AUsedScale < - 84) or (AUsedScale > 127) then
    Exit;

  if not Assigned(FSQLConnection) then
    Exit;
  if (FTargetTableName = '') then
    Exit;

  IQMS.DBTrans.dbtdbexp.DBX_RunSQLFmt(FSQLConnection, 'ALTER TABLE %s'#13 +
    ' MODIFY %s NUMBER(%d,%d)', [LowerCase(FTargetTableName),
    LowerCase(AFieldItem.FieldName), AUsedPrecision, AUsedScale]);
  Result := True;

  if Result then
    begin
      AFieldItem.Precision := AUsedPrecision;
      AFieldItem.Scale := AUsedScale;
    end;
end;

procedure TTextFileImport.DoQueryInit;
begin
  if not Assigned(FSQLConnection) then
    raise Exception.Create('Application Error:  Could not initialize query.  ' +
      'SQL Connection not provided.');
  if not Assigned(FQuery) then
    FQuery := TSQLQuery.Create(nil);
  FQuery.SQLConnection := FSQLConnection;
  FQuery.SQL.Text := FSQL;
end;

procedure TTextFileImport.DoQueryAddParams;
var
  i, x: Integer;
  oParams: TParams;
  AParamName: string;
  AParamTypeStr: string;
  AParamType: TFieldType;
  s_sql: string;

  procedure _AddParam(const AParams: TParams; const AName: string;
    AType: TFieldType = ftString);
  var
    AParam: TParam;
  begin
    if not Assigned(AParams) then
      raise Exception.Create('Application Error:  Params object not created.');
    AParam := TParam.Create(AParams);
    AParam.Name := AName;
    AParam.ParamType := ptInput;
    AParam.DataType := AType; // e.g., ftString;
    AParams.AddParam(AParam);
  end;

begin
  if Assigned(FQuery) then
    try
      oParams := TParams.Create;
      for i := 0 to FSQLParams.Count - 1 do
        begin
          x := FFields.IndexOf(FSQLParams.Strings[i]);
          if x = - 1 then
            Continue;
          AParamType := IQMS.DBTrans.dbtfields.GetFieldTypeForOracleDataType
            (FFields.Items[x].DataType);
          _AddParam(oParams, FSQLParams.Strings[i], AParamType);
        end;
      FQuery.Params.Assign(oParams);
    finally
      if Assigned(oParams) then
        FreeAndNil(oParams);
    end;
end;

procedure TTextFileImport.DoQueryExec(const AParamValues: TStringList);
var
  i: Integer;
  s_sql: string;
begin
  if (FSQLParams.Count <> AParamValues.Count) then
    raise Exception.CreateFmt
      ('Application Error: Params (%d) and Values (%d) do not match.',
      [FSQLParams.Count, AParamValues.Count]);

  if Assigned(FQuery) then
    begin
      for i := 0 to FQuery.Params.Count - 1 do
        DBX_FillParam(FQuery.Params.Items[i], AParamValues.Strings[i]);
      try
        FQuery.ExecSQL();
      except
        on E: Exception do
          begin
            IQMS.DBTrans.dbtshare.GetParsedSQL(FQuery, s_sql);
            raise Exception.CreateFmt('%s'#13'%s', [E.Message, s_sql]);
          end;
      end;
    end;
end;

end.

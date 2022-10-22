unit dbtbatmv;

{ ***                          Batch Move                              *** }
{ The Delphi TBatchMove can be unreliable.  There are cases where field data
  is imported, where there is no data in the original data file.  This can
  occur even when saving one table to the next in the same database.

  In order to control the process, this batch move imports on a record-by-record
  basis.  We ensure that each record is imported as-is, and we can also track
  progress (if desired).

}

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Data.Win.ADODB,
  Data.SqlExpr,
  IQMS.WebVcl.DBExpress,
  IQMS.Common.ProgressDialog,
  IQMS.Common.WriteLogFile,
  IQMS.DBTrans.dbttypes,
  IQMS.DBTrans.dbtdb,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  FireDAC.Comp.DataMove;

type
  { TIQBatchMode }
  TIQBatchMode = (iqbmCopy, iqbmAppend);

  { TMapPart }
  TMapPart = (mpSource, mpTarget);

  { TDbxBatchMoveBase }
  TDbxBatchMoveBase = class(TComponent)
    procedure DoCancelBtnClick(Sender: TObject);
  private
    { Private declarations }
    FBatchMode: TIQBatchMode;
    FTableName: string;
    FTableType: TCustomTableType;
    FShowProgress: Boolean;
    FStatusLine1: string;
    FStatusLine2: string;
    FFieldMap: TStringList;
    FAbort: Boolean;
    FLogging: Boolean;
    FLogFile: TFileName;
    FErrorLogFile: TFileName;
    FLogFileObject: TIQLogFile;
    FErrorLogFileObject: TIQLogFile;
    FTarget: TDataSet;
    FSource: TDataSet;
    FOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent;
    FOnProgressEvent: TOnProgressEvent;
    FProgressMessage: string;

    procedure SetFieldMap(const Value: TStringList);

    function HasFieldMap: Boolean;
    procedure GetFieldMapSourceFields(var AList: TStringList;
      AsParams: Boolean = FALSE);
    procedure GetFieldMapTargetFields(var AList: TStringList;
      AsParams: Boolean = FALSE);
    function GetFieldMapField(AIndex: Integer; AMapPart: TMapPart): string;
    // function CheckProcessAborted(const APrg: TProgressDialog): Boolean;
    procedure EnableTableConstraints(ASQLConnection: TSQLConnection;
      AEnabled: Boolean);
  protected
    { Protected declarations }
    FMoveCount: Integer;
    { TODO -oSanketG -cWebConvert : Replaced TProgressDialog with TIQWebProgressDialog }
    hPrg: TIQWebProgressDialog;
    FProgressMax: Integer;
    FProgressPos: Integer;
    procedure InitLogging;
    function GetSource: TDataSet; virtual;
    function GetTarget: TDataSet; virtual;
    procedure SetSource(const Value: TDataSet); virtual;
    procedure SetTarget(const Value: TDataSet); virtual;
    procedure CheckCreateProgressDialog(const AMax: Integer;
      const AMsgText: string);
    function CheckProgressAbortedEvent: Boolean;
    procedure StepProgress;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
    function Execute: Boolean; virtual;
  published
    { Published declarations }
    property Source: TDataSet read GetSource write SetSource;
    property Target: TDataSet read GetTarget write SetTarget;

    property TableName: string read FTableName write FTableName;
    property TableType: TCustomTableType read FTableType write FTableType
      default dttDefault;

    property BatchMode: TIQBatchMode read FBatchMode write FBatchMode;
    property MoveCount: Integer read FMoveCount;
    property ShowProgress: Boolean read FShowProgress write FShowProgress;
    property StatusMessageLine1: string read FStatusLine1 write FStatusLine1;
    property StatusMessageLine2: string read FStatusLine2 write FStatusLine2;
    property FieldMap: TStringList read FFieldMap write SetFieldMap;
    property LogFile: TFileName read FLogFile write FLogFile;
    property ErrorLogFile: TFileName read FErrorLogFile write FErrorLogFile;
    property Logging: Boolean read FLogging write FLogging;

    property OnProgressEvent: TOnProgressEvent read FOnProgressEvent
      write FOnProgressEvent;
    property OnCheckProgressAbortedEvent: TCheckProgressAbortedEvent
      read FOnCheckProgressAbortedEvent write FOnCheckProgressAbortedEvent;
  end;

  { TDbxBatchImport }
  TDbxBatchImport = class(TDbxBatchMoveBase)
  private
    { Private declarations }
    procedure CreateTableDefinition;
    function ImportRecords: Boolean;
    procedure SetParamValue(AParam : TParam; AField : TField);
    procedure RaiseInvalidSource(const ADataSet: TDataSet);
    procedure RaiseInvalidTarget(const ADataSet: TDataSet);
  protected
    { Protected declarations }
    function GetSource: TDataSet; override;
    function GetTarget: TDataSet; override;
    procedure SetSource(const Value: TDataSet); override;
    procedure SetTarget(const Value: TDataSet); override;
  public
    { Public declarations }
    function Execute: Boolean; override;
  published
    { Published declarations }
    property Source;
    property Target;
    property TableName;
    property TableType;
    property BatchMode;
    property MoveCount;
    property ShowProgress;
    property StatusMessageLine1;
    property StatusMessageLine2;
    property FieldMap;
    property LogFile;
    property ErrorLogFile;
    property Logging;
    property OnProgressEvent;
    property OnCheckProgressAbortedEvent;
  end;

  { TDbxBatchExport }
  TDbxBatchExport = class(TDbxBatchMoveBase)
  private
    { Private declarations }
    FFileName: string;
    FOracleTableName: string;
    procedure CreateTableDefinition;
    function ExportRecordsADO: Boolean;
    function ExportRecordsFireDAC: Boolean;
    procedure RaiseInvalidSource(const ADataSet: TDataSet);
    procedure RaiseInvalidTarget(const ADataSet: TDataSet);
    function TargetDirectory: string;
    procedure SetFileName(const Value: string);
  protected
    { Protected declarations }
    function GetSource: TDataSet; override;
    function GetTarget: TDataSet; override;
    procedure SetSource(const Value: TDataSet); override;
    procedure SetTarget(const Value: TDataSet); override;
  public
    { Public declarations }
    function Execute: Boolean; override;
  published
    { Published declarations }
    property Source; // TDbxCustomDataSet
    property Target; // TCustomADODataSet
    property FileName: string
      read FFileName
      write SetFileName;
    property TableName;
    property SourceOracleTableName: string read FOracleTableName
      write FOracleTableName;
    property TableType;
    property BatchMode;
    property MoveCount;
    property ShowProgress;
    property StatusMessageLine1;
    property StatusMessageLine2;
    property FieldMap;
    property LogFile;
    property ErrorLogFile;
    property Logging;
    property OnProgressEvent;
    property OnCheckProgressAbortedEvent;
  end;

function BatchImport(
  const ASource: TCustomADODataSet;
  const ATarget: TIQWebDbxCustomDataSet;
  const ATableName: string;
  const AIQBatchMode: TIQBatchMode = iqbmCopy;
  const AShowProgress: Boolean = True;
  const AFieldMap: TStringList = nil;
  const AImportMsg1: string = '';
  const AImportMsg2: string = '';
  const ALogFile: TFileName = '';
  const AErrorLogFile: TFileName = '';
  const AOnProgressEvent: TOnProgressEvent = nil;
  const AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent = nil)
  : Boolean;

function BatchImportForSQLite(const ASource: TFDDataset;
  const ATarget: TIQWebDbxCustomDataSet; const ATableName: string;
  const AIQBatchMode: TIQBatchMode; const AShowProgress: Boolean;
  const AFieldMap: TStringList; const AImportMsg1: string;
  const AImportMsg2: string; const ALogFile: TFileName;
  const AErrorLogFile: TFileName; const AOnProgressEvent: TOnProgressEvent;
  const AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent): Boolean;

function BatchImportOracleTable(
  const ASource: TSQLQuery;
  const ATarget: TDataSet;
  const ATableName: string;
  const AIQBatchMode: TIQBatchMode = iqbmCopy;
  const AShowProgress: Boolean = True;
  const AFieldMap: TStringList = nil;
  const AImportMsg1: string = '';
  const AImportMsg2: string = '';
  const ALogFile: TFileName = '';
  const AErrorLogFile: TFileName = '';
  const AOnProgressEvent: TOnProgressEvent = nil;
  const AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent = nil)
  : Boolean;

function BatchExport(
  const ASource: TDataSet; // TDbxCustomDataSet;
  const ATarget: TCustomADODataSet;
  const AFileName: string;
  const ATableType: TCustomTableType;
  const AIQBatchMode: TIQBatchMode = iqbmCopy;
  const AShowProgress: Boolean = True;
  const AFieldMap: TStringList = nil;
  const AExportMsg1: string = '';
  const AExportMsg2: string = '';
  const ALogFile: TFileName = '';
  const AErrorLogFile: TFileName = '';
  const AOnProgressEvent: TOnProgressEvent = nil;
  const AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent = nil;
  const ASourceOracleTableName: string = '')
  : Boolean;

const
  // parse SQL for the log
  cLogParsedSQL = True;
  cBatchSize = 1000;

implementation

uses
  IQMS.DBTrans.dbtado,
  IQMS.DBTrans.dbtdbexp,
  IQMS.DBTrans.dbtfiredac,
  IQMS.DBTrans.dbtrscstr,
  IQMS.DBTrans.dbtshare,
  IQMS.Common.ErrorDialog,
  IQMS.Common.FileUtils,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils,
  SqlTimSt;

{$REGION 'Wrappers'}


function BatchImport(const ASource: TCustomADODataSet;
  const ATarget: TIQWebDbxCustomDataSet; const ATableName: string;
  const AIQBatchMode: TIQBatchMode; const AShowProgress: Boolean;
  const AFieldMap: TStringList; const AImportMsg1: string;
  const AImportMsg2: string; const ALogFile: TFileName;
  const AErrorLogFile: TFileName; const AOnProgressEvent: TOnProgressEvent;
  const AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent): Boolean;
begin
  if (ASource = nil) then
    raise Exception.Create('Application Error: Source dataset not provided.');

  if (ATarget = nil) or (ATableName = '') then
    raise Exception.Create('Application Error: Target table not provided.');

  with TDbxBatchImport.Create(nil) do
    try
      Source := ASource;
      Target := ATarget;
      TableName := ATableName;
      ShowProgress := AShowProgress;
      BatchMode := AIQBatchMode;
      if AImportMsg1 > '' then
        StatusMessageLine1 := AImportMsg1;
      if AImportMsg2 > '' then
        StatusMessageLine2 := AImportMsg2;
      if (AFieldMap <> nil) and Assigned(AFieldMap) then
        FieldMap := AFieldMap;
      LogFile := ALogFile;
      ErrorLogFile := AErrorLogFile;
      Logging := (ALogFile > '') or (AErrorLogFile > '');
      OnProgressEvent := AOnProgressEvent;
      OnCheckProgressAbortedEvent := AOnCheckProgressAbortedEvent;
      Result := Execute;
    finally
      Free;
    end;
end;

{ ------------------------------------------------------------------------------
  Intent: To import data from SQLite file
  Crt By: Vishal Tiwari
  Crt Dt: 20 May 2016
  Params:
      @ASource - TFDDataset component which is connected to SQLite file
      @ATarget - TDbxCustomDataSet component which would be connected to
                   Oracle databaase
      @ATableName - A target table name i.e. Oracle database table name
      @AIQBatchMode - Batch mode type like iqbmAppend, iqbmAppendCopy etc.
      @AShowProgress - A flag to decide whether progressbar to be shown or not
      @AFieldMap - A String list used to map fields
      @AImportMsg1 - A progress message related to progress bar
      @AImportMsg2 - Another progress message related to progress bar
      @ALogFile - LogFile name
      @AErrorLogFile - ErrorLogFile name
      @AOnProgressEvent - TOnProgressEvent type event
      @AOnCheckProgressAbortedEvent - TCheckProgressAbortedEvent type event
  Assumption: Procedure gets called for all export in Data Dictionary
  ------------------------------------------------------------------------------}
function BatchImportForSQLite(const ASource: TFDDataset;
  const ATarget: TIQWebDbxCustomDataSet; const ATableName: string;
  const AIQBatchMode: TIQBatchMode; const AShowProgress: Boolean;
  const AFieldMap: TStringList; const AImportMsg1: string;
  const AImportMsg2: string; const ALogFile: TFileName;
  const AErrorLogFile: TFileName; const AOnProgressEvent: TOnProgressEvent;
  const AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent): Boolean;
begin
  if (ASource = nil) then
    raise Exception.Create('Application Error: Source dataset not provided.');

  if (ATarget = nil) or (ATableName = '') then
    raise Exception.Create('Application Error: Target table not provided.');

  with TDbxBatchImport.Create(nil) do
    try
      Source := ASource;
      Target := ATarget;
      TableName := ATableName;
      ShowProgress := AShowProgress;
      BatchMode := AIQBatchMode;
      if AImportMsg1 > '' then
        StatusMessageLine1 := AImportMsg1;
      if AImportMsg2 > '' then
        StatusMessageLine2 := AImportMsg2;
      if (AFieldMap <> nil) and Assigned(AFieldMap) then
        FieldMap := AFieldMap;
      LogFile := ALogFile;
      ErrorLogFile := AErrorLogFile;
      Logging := (ALogFile > '') or (AErrorLogFile > '');
      OnProgressEvent := AOnProgressEvent;
      OnCheckProgressAbortedEvent := AOnCheckProgressAbortedEvent;
      Result := Execute;
    finally
      Free;
    end;
end;

function BatchImportOracleTable(
  const ASource: TSQLQuery;
  const ATarget: TDataSet;
  const ATableName: string;
  const AIQBatchMode: TIQBatchMode = iqbmCopy;
  const AShowProgress: Boolean = True;
  const AFieldMap: TStringList = nil;
  const AImportMsg1: string = '';
  const AImportMsg2: string = '';
  const ALogFile: TFileName = '';
  const AErrorLogFile: TFileName = '';
  const AOnProgressEvent: TOnProgressEvent = nil;
  const AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent = nil)
  : Boolean;
begin
  if (ASource = nil) then
    raise Exception.Create('Application Error: Source dataset not provided.');

  if (ATarget = nil) or (ATableName = '') then
    raise Exception.Create('Application Error: Target table not provided.');

  with TDbxBatchImport.Create(nil) do
    try
      Source := ASource;
      Target := ATarget;
      TableName := ATableName;
      ShowProgress := AShowProgress;
      BatchMode := AIQBatchMode;
      if AImportMsg1 > '' then
        StatusMessageLine1 := AImportMsg1;
      if AImportMsg2 > '' then
        StatusMessageLine2 := AImportMsg2;
      if (AFieldMap <> nil) and Assigned(AFieldMap) then
        FieldMap := AFieldMap;
      LogFile := ALogFile;
      ErrorLogFile := AErrorLogFile;
      Logging := (ALogFile > '') or (AErrorLogFile > '');
      OnProgressEvent := AOnProgressEvent;
      OnCheckProgressAbortedEvent := AOnCheckProgressAbortedEvent;
      Result := Execute;
    finally
      Free;
    end;
end;

function BatchExport(
  const ASource: TDataSet; // TDbxCustomDataSet;
  const ATarget: TCustomADODataSet;
  const AFileName: string;
  const ATableType: TCustomTableType;
  const AIQBatchMode: TIQBatchMode;
  const AShowProgress: Boolean;
  const AFieldMap: TStringList;
  const AExportMsg1: string;
  const AExportMsg2: string;
  const ALogFile: TFileName;
  const AErrorLogFile: TFileName;
  const AOnProgressEvent: TOnProgressEvent;
  const AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent;
  const ASourceOracleTableName: string): Boolean;
begin
  if (ASource = nil) then
    raise Exception.Create('Application Error: Source dataset not provided.');

  if (ATarget = nil) or (AFileName = '') then
    raise Exception.Create('Application Error: Target table not provided.');

  with TDbxBatchExport.Create(nil) do
    try
      Source := ASource;
      Target := ATarget;
      FileName := AFileName;
      TableType := ATableType;
      ShowProgress := AShowProgress;
      BatchMode := AIQBatchMode;
      if AExportMsg1 > '' then
        StatusMessageLine1 := AExportMsg1;
      if AExportMsg2 > '' then
        StatusMessageLine2 := AExportMsg2;
      if (AFieldMap <> nil) and Assigned(AFieldMap) then
        FieldMap := AFieldMap;
      LogFile := ALogFile;
      ErrorLogFile := AErrorLogFile;
      Logging := (ALogFile > '') or (AErrorLogFile > '');
      OnProgressEvent := AOnProgressEvent;
      OnCheckProgressAbortedEvent := AOnCheckProgressAbortedEvent;
      SourceOracleTableName := ASourceOracleTableName;
      Result := Execute;
    finally
      Free;
    end;
end;

{$ENDREGION 'Wrappers'}

{$REGION 'TDbxBatchMoveBase'}

{ TDbxBatchMoveBase }

constructor TDbxBatchMoveBase.Create(AOwner: TComponent);
begin
  FLogFileObject := nil;
  FErrorLogFileObject := nil;
  FProgressMessage := '';
  FProgressMax := 0;
  FProgressPos := 0;
  inherited Create(AOwner);

  FFieldMap := TStringList.Create;
  BatchMode := iqbmCopy;
  FMoveCount := 0;
  FShowProgress := FALSE;
  StatusMessageLine1 := '';
  StatusMessageLine2 := IQMS.DBTrans.dbtrscstr.cTXT0000064; // 'Please wait.'
end;

destructor TDbxBatchMoveBase.Destroy;
begin
  if Assigned(FLogFileObject) then
    FreeAndNil(FLogFileObject);
  if Assigned(FErrorLogFileObject) then
    FreeAndNil(FErrorLogFileObject);
  if Assigned(FFieldMap) then
    FFieldMap.Free;
  inherited Destroy;
end;

function TDbxBatchMoveBase.Execute: Boolean;
begin
  Result := FALSE;
  if not Assigned(Source) then
    raise Exception.Create('Application Error:  Source dataset not assigned.');
  if not Assigned(Target) then
    raise Exception.Create('Application Error:  Target dataset not assigned.');
  if TableName = '' then
    raise Exception.Create('Application Error:  Table name not provided.');
  InitLogging;
end;

procedure TDbxBatchMoveBase.InitLogging;
begin
  // Create error log files
  if Logging then
    begin
      {Replaced TIQMS.Common.WriteLogFile.Create(LogFile) with IQMS.Common.WriteLogFile.TIQLogFile.Create(LogFile)}
      if LogFile > '' then
        begin
          FLogFileObject := IQMS.Common.WriteLogFile.TIQLogFile.Create(LogFile);
          FLogFileObject.ProcessBatch := True;
          FLogFileObject.BatchSize := cBatchSize;
        end;
      if ErrorLogFile > '' then
        begin
          FErrorLogFileObject := IQMS.Common.WriteLogFile.TIQLogFile.Create(ErrorLogFile);
          FErrorLogFileObject.ProcessBatch := True;
          FErrorLogFileObject.BatchSize := cBatchSize;
        end;
    end;
end;

function TDbxBatchMoveBase.GetSource: TDataSet;
begin
  Result := FSource;
end;

procedure TDbxBatchMoveBase.SetSource(const Value: TDataSet);
begin
  FSource := Value;
end;

function TDbxBatchMoveBase.GetTarget: TDataSet;
begin
  Result := FTarget;
end;

procedure TDbxBatchMoveBase.SetTarget(const Value: TDataSet);
begin
  FTarget := Value;
end;

procedure TDbxBatchMoveBase.SetFieldMap(const Value: TStringList);
begin
  if not Assigned(FFieldMap) then
    FFieldMap := TStringList.Create;
  FFieldMap.AddStrings(Value);
end;

function TDbxBatchMoveBase.HasFieldMap: Boolean;
begin
  Result := (FFieldMap <> nil) and (FFieldMap.Count > 0);
end;

procedure TDbxBatchMoveBase.GetFieldMapSourceFields(var AList: TStringList;
  AsParams: Boolean);
var
  i: Integer;
  S: string;
begin
  if (FFieldMap = nil) or (AList = nil) then
    Exit;

  AList.Clear; // clear first

  // Cycle list and get fields
  for i := 0 to FFieldMap.Count - 1 do
    begin
      // Get the text
      S := GetFieldMapField(i, mpSource);

      // Return as a param?
      if AsParams then
        S := ':' + S;

      // Add field to the list
      AList.Add(S);
    end;
end;

procedure TDbxBatchMoveBase.GetFieldMapTargetFields(var AList: TStringList;
  AsParams: Boolean);
var
  i: Integer;
  S: string;
begin
  if (FFieldMap = nil) or (AList = nil) then
    Exit;

  AList.Clear; // clear first

  // Cycle list and get fields
  for i := 0 to FFieldMap.Count - 1 do
    begin

      // Get the text
      S := GetFieldMapField(i, mpTarget);

      // Return as a param?
      if AsParams then
        S := ':' + S;

      // Add field to the list
      AList.Add(S);
    end;
end;

function TDbxBatchMoveBase.GetFieldMapField(AIndex: Integer;
  AMapPart: TMapPart): string;
var
  i: Integer;
  S: string;
begin

  Result := ''; // default result

  // Check for existence of field map
  if not HasFieldMap then
    Exit;

  // Check for valid index
  if (AIndex < 0) or (AIndex > FFieldMap.Count - 1) then
    Exit;

  // full line of text
  // Example:  TARGET_FIELD=SOURCE_FIELD
  S := FFieldMap.Strings[AIndex];

  // Find the equal (=) sign
  i := Pos('=', S);

  // Return the single field for either part if there is no equal sign
  if i = 0 then
    Result := Trim(S)
    // Otherwise, get the part
  else
    case AMapPart of
      mpSource: // right side
        Result := Trim(Copy(S, i + 1, Length(S)));
      mpTarget: // left side
        Result := Trim(Copy(S, 1, i - 1));
    end;

end;

procedure TDbxBatchMoveBase.DoCancelBtnClick(Sender: TObject);
begin
  FAbort := True;
end;

procedure TDbxBatchMoveBase.EnableTableConstraints(ASQLConnection
  : TSQLConnection; AEnabled: Boolean);
var
  ACmd: string;
  ATableName: string;
  AErrors: TStringList;

  // --------------------------------------------------------------------------
  procedure _Eval(AConstraintName: string);
  begin
    try
      IQMS.DBTrans.dbtdbexp.DBX_RunSQLFmt(ASQLConnection, 'ALTER TABLE %s'#13 +
        '  %s CONSTRAINT %s', [ATableName, ACmd, AConstraintName]);
    except
      on E: Exception do
        AErrors.Add(E.Message);
    end;
  end;
// --------------------------------------------------------------------------

begin
  AErrors := nil;

  try
    ATableName := UpperCase(TableName);
    ACmd := IQMS.Common.Numbers.sIIf(AEnabled, 'ENABLE', 'DISABLE');
    AErrors := TStringList.Create;
    if not IQMS.DBTrans.dbtshare.IQTableExists(ASQLConnection, TableName) then
      Exit;

    with TIQWebDbxQuery.Create(nil) do
      try
        SQLConnection := ASQLConnection;
        SQL.Add(Format('SELECT constraint_name FROM user_constraints ' +
          'WHERE table_name = TRIM(UPPER(''%s''))', [ATableName]));
        Open;
        while not EOF do
          begin
            _Eval(FieldByName('CONSTRAINT_NAME').AsString);
            Next;
          end;
      finally
        Free; // free query
      end;

    if (AErrors.Count > 0) and AEnabled then
      // ShowIQErrorMessageA('Encountered error(s) enabling constraints on the target table.', AErrors.Text,'');
      IQMS.Common.Dialogs.IQWarning
        ('Encountered error(s) enabling constraints on the target table:'#13#13
        + AErrors.Text);

  finally
    if Assigned(AErrors) then
      FreeAndNil(AErrors);
  end;
end;

procedure TDbxBatchMoveBase.CheckCreateProgressDialog(const AMax: Integer;
  const AMsgText: string);
begin
  if ShowProgress then
    begin
      // create and initialize the progress dialog
      hPrg := TIQWebProgressDialog.Create(Application); // IQMS.Common.ProgressDialog.pas
      hPrg.MinProgress := 0;
      hPrg.MaxProgress := AMax;
      hPrg.Caption := IQMS.DBTrans.dbtrscstr.cTXT0000057; // 'Import'
      hPrg.Execute;
      // hPrg.CancelBtn.OnClick := DoCancelBtnClick;
      hPrg.Status1 := AMsgText;
      hPrg.Status2 := '';
      Application.ProcessMessages;
    end;
  if Assigned(FOnProgressEvent) then
    FOnProgressEvent(AMax, 0, AMsgText);
end;

function TDbxBatchMoveBase.CheckProgressAbortedEvent: Boolean;
begin
  Result := FALSE;
  if Assigned(hPrg) then
    Result := hPrg.CheckProgressAborted
  else if Assigned(FOnCheckProgressAbortedEvent) then
    Result := FOnCheckProgressAbortedEvent;
  FAbort := Result;
end;

procedure TDbxBatchMoveBase.StepProgress;
begin
  Inc(FProgressPos);
  if Assigned(hPrg) then
    hPrg.Position := FProgressPos;
  if Assigned(FOnProgressEvent) then
    FOnProgressEvent(FProgressMax, FProgressPos, FProgressMessage);
end;

{$ENDREGION 'TDbxBatchMoveBase'}

{$REGION 'TDbxBatchImport'}

{ ---------------------------------------------------------------------------- }
{ TDbxBatchImport }
{ ---------------------------------------------------------------------------- }

function TDbxBatchImport.Execute: Boolean;
begin
  inherited;

  RaiseInvalidTarget(FTarget);
  RaiseInvalidSource(FSource);

  // Create the new table
  if (BatchMode = iqbmCopy) then
    begin
      if ((Target is TIQWebDbxCustomDataSet) and not IQMS.DBTrans.dbtshare.IQTableExists
        (TIQWebDbxCustomDataSet(Target).SQLConnection, TableName)) or
        ((Target is TSQLQuery) and not IQMS.DBTrans.dbtshare.IQTableExists
        (TSQLQuery(Target).SQLConnection, TableName))
      then
        CreateTableDefinition;
    end;

  // Import records into the new table
  if IQMS.DBTrans.dbtshare.IQTableExists(TIQWebDbxCustomDataSet(Target).SQLConnection,
    TableName) then
    Result := ImportRecords;

end;

procedure TDbxBatchImport.CreateTableDefinition;
var
  TargetName, SourceName: string;
  i: Integer;
  FieldCount: Integer;
  ASQL, AFieldList: TStringList;
begin
  AFieldList := nil;
  ASQL := nil;

  if not Assigned(TIQWebDbxCustomDataSet(Target).SQLConnection) then
    raise Exception.Create
      ('Application Error:  Target connection not assigned.');

  if Target.Active then
    Target.Close;
  if not Source.Active then
    Source.Open;

  try
    ASQL := TStringList.Create;

    // If we have a field map, pass the field list
    if HasFieldMap then
      with TFieldMap.Create(Self) do
        try
          AddStrings(FFieldMap);
          GetTargetFields(AFieldList);
        finally
          Free;
        end;

    // Free the field map list if there are no items; we will want
    // to pass a NIL object to the procedure below.
    if Assigned(AFieldList) and (AFieldList.Count = 0) then
      FreeAndNil(AFieldList);

    // Get the table DDL.  Note:  We base the DDL script on the dataset.
    // There is no other way, because we do not know what database type
    // it may be.  This is not necessarily Oracle.
    IQMS.DBTrans.dbtshare.GetOracleCreateTableSQL(Source, TableName, FALSE, // Temporary
      ASQL, AFieldList);

    EnableTableConstraints(TIQWebDbxCustomDataSet(Target).SQLConnection, FALSE);
    // disable constraints

    // Create the new table
    IQMS.DBTrans.dbtdbexp.DBX_RunSQL(TIQWebDbxCustomDataSet(Target).SQLConnection, ASQL.Text);

    // Change the batch mode; it is now "append," not "copy"
    BatchMode := iqbmAppend;
  finally
    if Assigned(AFieldList) then
      FreeAndNil(AFieldList);
    if Assigned(ASQL) then
      FreeAndNil(ASQL);
  end;
end;

function TDbxBatchImport.ImportRecords: Boolean;
var
  ATargetFieldList, ASourceFieldList, AParamList: TStringList;
  ASQLText: string;
  ACursor, i: Integer;
  AParams: TParams;
  AParam: TParam;
  AQuery: TSQLQuery;
  AField: TField;
  AStart, AEnd: TDateTime;
  o: TSQLGeneratorOracle;
begin
  Result := FALSE;
  hPrg := nil;
  // In order to avoid problems with "missing right quote" errors, and
  // to ensure the data is imported correctly, we create a parameterized
  // query.  We cycle the source dataset, filling in the parameters as we go.

  // initialization
  FAbort := FALSE; // always reset
  FProgressMax := 0;
  FMoveCount := 0;
  try // except
    ACursor := Screen.Cursors[crSQLWait];
    Screen.Cursors[crSQLWait] := Screen.Cursors[crArrow];
    try //
      // disable source controls
      Source.DisableControls;
      try
        if not Source.Active then
          Source.Open;
        // Do we show a progress dialog?
        if ShowProgress or Assigned(OnProgressEvent) then
          begin
            // get the max record count
            try
              if (Source is TADOTable) then
                FProgressMax := IQMS.DBTrans.dbtado.ADO_GetRecordCount(TADOTable(Source))

              else if (Source is TADOQuery) then
                FProgressMax := IQMS.DBTrans.dbtado.ADO_GetRecordCount(TADOQuery(Source))

              else if (Source is TIQWebDbxQuery) then
                FProgressMax := TIQWebDbxQuery(Source).RecordCount

              else if (Source is TIQWebDbxTable) then
                FProgressMax := TIQWebDbxTable(Source).RecordCount

              else if (Source is TSQLQuery) then
                FProgressMax := IQMS.DBTrans.dbtdbexp.DBX_GetRecordCount(TSQLQuery(Source))

              else
                FProgressMax := Source.RecordCount;
            except
              FProgressMax := 0;
            end;

            FProgressMessage := sIIf(StatusMessageLine1 = '',
              Format(IQMS.DBTrans.dbtrscstr.cTXT0000145 { 'Importing to %s' } , [TableName]
              ),
              StatusMessageLine1);
            CheckCreateProgressDialog(FProgressMax, FProgressMessage);
            if Assigned(OnProgressEvent) then
              OnProgressEvent(FProgressMax, 0, FProgressMessage);
          end;
        try
          // Create objects
          ASourceFieldList := TStringList.Create;
          try
            ATargetFieldList := TStringList.Create;
            try
              AParamList := TStringList.Create;
              try
                AParams := TParams.Create;
                try
                  AQuery := TSQLQuery.Create(nil);
                  try
                    AQuery.SQLConnection := TIQWebDbxCustomDataSet(Target)
                      .SQLConnection;

                    // Get field list and parameter list
                    if not HasFieldMap then
                      for i := 0 to Source.FieldCount - 1 do
                        begin
                          ASourceFieldList.Add(Source.Fields[i].FieldName);
                          ATargetFieldList.Add(Source.Fields[i].FieldName);
                          AParamList.Add(':' + Source.Fields[i].FieldName);
                          AParam := TParam.Create(AParams);
                          AParam.Name := Source.Fields[i].FieldName;
                          AParam.AssignField(Source.Fields[i]);
                          AParam.ParamType := ptInput;
                        end
                      // Field Map
                    else
                      begin
                        GetFieldMapSourceFields(ASourceFieldList);
                        GetFieldMapSourceFields(AParamList, True);
                        GetFieldMapTargetFields(ATargetFieldList, FALSE);

                        // Create and assign params
                        for i := 0 to ASourceFieldList.Count - 1 do
                          begin
                            AField := Source.FindField
                              (ASourceFieldList.Strings[i]);
                            if AField = nil then
                              raise Exception.CreateFmt
                                ('Field, %s, not found in source data set.',
                                [ASourceFieldList.Strings[i]]);

                            AParam := TParam.Create(AParams);
                            AParam.Name := ASourceFieldList.Strings[i];
                            AParam.AssignField(AField);
                            AParam.ParamType := ptInput;
                          end;

                      end;

                    // check ...
                    if ASourceFieldList.Count = 0 then
                      Exit;
                  finally
                    FreeAndNil(ASourceFieldList);
                  end;
                  // Build query
                  with AQuery do
                    begin
                      SQL.Add(Format('INSERT /*+ APPEND */ INTO %s',
                        [TableName]));
                      SQL.Add('(');
                      SQL.Add(IQMS.Common.StringUtils.StringListToStr(ATargetFieldList, ','));
                      SQL.Add(')');
                      SQL.Add('VALUES');
                      SQL.Add('(');
                      SQL.Add(IQMS.Common.StringUtils.StringListToStr(AParamList, ','));
                      SQL.Add(')');
                      Params.Assign(AParams); // assign the params
                    end;
                finally
                  FreeAndNil(ATargetFieldList);
                end;
              finally
                FreeAndNil(AParamList);
              end;

              // Position on the first record
              Source.First;

              // Do this once, at the start, just to initialize datatypes, etc.
              IQMS.DBTrans.dbtdbexp.DBX_FillParams(Source, AQuery.Params);

              // Cycle the source table and insert the records
              while not Source.EOF do
                begin

                  // Check to see if user clicked Cancel button
                  if CheckProgressAbortedEvent then
                    Break;
                  if Assigned(OnCheckProgressAbortedEvent) and
                    OnCheckProgressAbortedEvent then
                    Break;

                  // Fill the parameters with new values
                  // DBX_FillParams(Source, AQuery.Params); // in IQMS.DBTrans.dbtdbexp.pas
                  for i := 0 to AQuery.Params.Count - 1 do
                    // 04/18/2014 DBX_FillParam() works well, but assigning the param
                    // value directly also seems to work and may shave a couple of
                    // seconds off a lengthy import.
                    // DBX_FillParam(AQuery.Params[i], Source.FieldByName(AQuery.Params[i].Name).Value);
                    // 07/24/2014 Get the field value by field name, using
                    // the param name because the Source.Fields[i] TField may
                    // not be mapped and may not be for this param.
                    SetParamValue(AQuery.Params[i], Source.FieldByName(AQuery.Params[i].Name));

                  // Get the SQL text only if we are writing to a log file
                  if Logging and Assigned(FLogFileObject) then
                    begin
                      if cLogParsedSQL then
                        IQMS.DBTrans.dbtshare.GetParsedSQL(AQuery, ASQLText)
                      else
                        ASQLText := AQuery.SQL.Text;
                    end;

                  // Run the query
                  try
                    AStart := Now;
                    AEnd := AStart;
                    AQuery.ExecSQL;
                    AEnd := Now;
                  finally
                    if Logging and Assigned(FLogFileObject) then
                      begin
                        FLogFileObject.Write(ASQLText);
                        FLogFileObject.
                          Write(IQMS.DBTrans.dbtshare.StartEndText(AStart, AEnd));
                        FLogFileObject.Write('');
                        FLogFileObject.Write(Repl('-', 60));
                        FLogFileObject.Write('');
                      end;
                  end;

                  // Increment the "moved count"
                  Inc(FMoveCount);

                  // Next record
                  Source.Next;

                  // Step the progress bar
                  Self.StepProgress;

                  if Assigned(OnProgressEvent) then
                    OnProgressEvent(FProgressMax, FMoveCount, FProgressMessage);

                end;
            finally
              FreeAndNil(AQuery);
            end;
          finally
            FreeAndNil(AParams);
          end;
        finally
          // free progress dialog
          if (hPrg <> nil) and Assigned(hPrg) then
            FreeAndNil(hPrg);
          if Assigned(OnProgressEvent) then
            OnProgressEvent(FProgressMax, 0,
              IQMS.DBTrans.dbtrscstr.cTXT0000206 { 'Done.' } );
        end;

        // If we get here, pass true result
        Result := True;

      finally
        // Enable the controls
        Source.EnableControls;
      end;
    finally
      Screen.Cursor := crArrow; // necessary, or SQL wait will appear again
      Screen.Cursors[crSQLWait] := ACursor;
    end;
  except
    on E: Exception do
      begin
        if Logging and Assigned(FErrorLogFileObject) then
          begin
            if (ASQLText > '') then
              FErrorLogFileObject.
                Write(Format('%s'#13'%s', [E.Message, ASQLText]))
            else
              FErrorLogFileObject.Write(E.Message);
          end;

        // Display error - this will also write to the log file, which is handled
        // by the calling form or application.
        if (ASQLText > '') then
          raise Exception.Create(ASQLText + #13#10#13#10 +
            Format('Error in record %d: %s', [FMoveCount + 1, E.Message]))
        else
          raise;
      end;
  end;

  EnableTableConstraints(TIQWebDbxCustomDataSet(Target).SQLConnection, True);
  // re-enable the constraints

end;

function TDbxBatchImport.GetSource: TDataSet;
begin
  if (FSource is TCustomADODataSet) or
    (FSource is TSQLQuery) or (FSource is TFDTable) then
    Result := inherited GetSource
  else
    Result := nil;
end;

procedure TDbxBatchImport.SetSource(const Value: TDataSet);
begin
  RaiseInvalidSource(Value);
  inherited SetSource(Value);
end;

function TDbxBatchImport.GetTarget: TDataSet;
begin
  if (FTarget is TIQWebDbxCustomDataSet) or
    (FTarget is TSQLQuery) then
    Result := inherited GetTarget
  else
    Result := nil;
end;

procedure TDbxBatchImport.SetTarget(const Value: TDataSet);
begin
  RaiseInvalidTarget(Value);
  inherited SetTarget(Value);
end;

procedure TDbxBatchImport.RaiseInvalidSource(const ADataSet: TDataSet);
begin
  if Assigned(ADataSet) then
    begin
      if not (ADataSet is TCustomADODataSet) and
        not (ADataSet is TSQLQuery) and not (ADataSet is TFDTable) then
        raise Exception.CreateFmt
          ('Invalid source type (%s).  Please provide a TCustomADODataSet or TSQLQuery.',
          [ADataSet.ClassName]);
    end;
end;

procedure TDbxBatchImport.RaiseInvalidTarget(const ADataSet: TDataSet);
begin
  if Assigned(ADataSet) then
    begin
      if not (ADataSet is TIQWebDbxCustomDataSet) and
        not (ADataSet is TSQLQuery) then
        raise Exception.CreateFmt
          ('Invalid source type (%s).  Please provide a TDbxCustomDataSet or TSQLQuery.',
          [ADataSet.ClassName]);
    end;
end;

procedure TDbxBatchImport.SetParamValue(AParam : TParam; AField : TField);
begin
{ ------------------------------------------------------------------------------
  Intent: To set parameter data type and value
  Crt By: Vishal Tiwari
  Crt Dt: 13 June 2016
  Params:
      @AParam - A parameter to which data type and value needs to be set.
                Data type and respective value need to set for two reasons:
                1. When AParam data type is Numeric in the database, then
                   dataset is trying to treat as "Currency" data type and
                   when AParam value is Null that time giving an error.
                2. Even when AParam value is Not Null and data tye DateTime in
                   database, even for valid date value it was giving error as,
                   'ORA-01843: not a valid month'.
      @AField - A field from which the value is to be set to AParam when AParam
                is having Not Null value.

                In future, required Case Ordinal Value(s) could be added
  Assumption:
  ------------------------------------------------------------------------------}
  Assert(AParam <> nil, 'Unassigned argument for AParam supplied at SetParamValue');
  Assert(AField <> nil, 'Unassigned argument for AField supplied at SetParamValue');

  if AField.IsNull then
  begin
    AParam.DataType := ftString;
    AParam.Value := Null;
  end
  else
  begin
    case AField.DataType of
      ftDateTime:
        AParam.DataType := ftDateTime;
    end;

    AParam.Value := AField.Value;
  end;
end;

{$ENDREGION 'TDbxBatchImport'}

{$REGION 'TDbxBatchExport'}

{ ---------------------------------------------------------------------------- }
{ TDbxBatchExport }
{ ---------------------------------------------------------------------------- }

function TDbxBatchExport.Execute: Boolean;
begin
  inherited;

  RaiseInvalidTarget(FTarget);
  RaiseInvalidSource(FSource);

  if (FFileName = '') or not DirectoryExists(TargetDirectory) then
    raise Exception.CreateFmt('Target directory not found:  %s',
      [TargetDirectory]);

  if not (TableType in [dttParadox, dttDBase, dttFoxPro]) then
    raise Exception.CreateFmt('Invalid target table type (%s)',
      [CustomTableType[TableType]]);

  // Create the new table
  if (BatchMode = iqbmCopy) then
    // IQMS.DBTrans.dbtshare.IQTableExists(TDbxCustomDataSet(Source).SQLConnection, TableName) then
    CreateTableDefinition;

  // Export the records
  Result := ExportRecordsADO; // ExportRecordsFireDAC;

end;

procedure TDbxBatchExport.CreateTableDefinition;
var
  i: Integer;
  FieldCount: Integer;
  ASQL, AFieldList: TStringList;
  AFieldDataArray: TFieldDataArray;
begin
  AFieldList := nil;
  ASQL := nil;

  if (Source is TIQWebDbxCustomDataSet) and
    not Assigned(TIQWebDbxCustomDataSet(Source).SQLConnection) then
    raise Exception.Create
      ('Application Error:  Source connection not assigned.')
  else if ((Source is TFDTable) and not Assigned(TFDTable(Source).Connection)) or
    ((Source is TFDQuery) and not Assigned(TFDQuery(Source).Connection)) then
    raise Exception.Create
      ('Application Error:  Source connection not assigned.');

  if Target.Active then
    Target.Close;
  if not Source.Active then
    Source.Open;
  AFieldList := TStringList.Create;
  try
    ASQL := TStringList.Create;
    try

      // If we have a field map, pass the field list
      if HasFieldMap then
        with TFieldMap.Create(Self) do
          try
            AddStrings(FFieldMap);
            GetTargetFields(AFieldList);
          finally
            Free;
          end;

      // Free the field map list if there are no items; we will want
      // to pass a NIL object to the procedure below.
      if Assigned(AFieldList) and (AFieldList.Count = 0) then
        FreeAndNil(AFieldList);

      // Create the file
      if FOracleTableName > '' then
        IQMS.DBTrans.dbtshare.GetFieldDataArray(FOracleTableName, AFieldDataArray)
      else
        IQMS.DBTrans.dbtshare.GetFieldDataArray(Source, AFieldDataArray);
      IQMS.DBTrans.dbtshare.CreateDBaseTableByDef(AFieldDataArray, FileName, TableType);

      // Change the batch mode; it is now "append," not "copy"
      BatchMode := iqbmAppend;
    finally
      if Assigned(ASQL) then
        FreeAndNil(ASQL);
    end;
  finally
    if Assigned(AFieldList) then
      FreeAndNil(AFieldList);
  end;
end;

function TDbxBatchExport.ExportRecordsFireDAC: Boolean;
var
  ACursor: Integer;
  ASource: TFDQuery;
  ADestination: TFDTable;
  ADbaseConnection: TFDConnection;
  AErrorMsg: string;

  function _GetTableSQL(const ATableName: string): string;
  var
    APk: string;
  begin
    // Get the primary key field(s).  There could be more than one,
    // as is the case with REPDEF.
    APk := TablePrimaryKeyAsCommaStr(ATableName);
    // Sort the data.  Sometimes data is not sorted by PK when queried.
    // The order of the records will be exported row by row, in this order.
    // This is optional, and if it proves to be a speed issue, it can
    // be removed.
    if APk > '' then
      ASource.SQL.Add(Format('SELECT * FROM %s ORDER BY %s',
        [ATableName, APk]))
    else
      ASource.SQL.Add(Format('SELECT * FROM %s ORDER BY 1',
        [ATableName]));
  end;

begin
  ACursor := Screen.Cursors[crSQLWait];
  Screen.Cursors[crSQLWait] := Screen.Cursors[crArrow];
  try
    ASource := TFDQuery.Create(nil);
    try
      ASource.Connection := UniMainModule.FDConnection1;

      if (Source is TSQLTable) then
        ASource.SQL.Text := _GetTableSQL(TSQLTable(Source).TableName)
      else if (Source is TSQLQuery) then
        ASource.SQL.Text := TSQLQuery(Source).SQL.Text
      else if (Source is TIQWebDbxQuery) then
        ASource.SQL.Text := TIQWebDbxQuery(Source).SQL.Text
      else if (Source is TIQWebDbxTable) then
        ASource.SQL.Text := _GetTableSQL(TIQWebDbxTable(Source).TableName)
      else if (Source is TFDTable) then
        ASource.SQL.Text := _GetTableSQL(TFDTable(Source).TableName)
      else if (Source is TFDQuery) then
        ASource.SQL.Text := TFDQuery(Source).SQL.Text
      else
        raise Exception.Create
          ('Application Error:  Invalid source dataset type.');

      ADbaseConnection := TFDConnection.Create(nil);
      try
        if not IQMS.DBTrans.dbtfiredac.InitConnection(
          ADbaseConnection,
          Self.FileName,
          TCustomTableType.dttDBase,
          '',
          '',
          { var } AErrorMsg) and
          (AErrorMsg > '') then
          begin
            IQMS.Common.Dialogs.IQError(AErrorMsg);
            Exit(FALSE);
          end;

        ADestination := TFDTable.Create(nil);
        try
          ADestination.Connection := ADbaseConnection;
          ADestination.TableName := Self.TableName;

          with TFDDataMove.Create(nil) do
            try
              Mode := TFDDataMoveMode.dmAppend;
              Destination := ADestination;
              Source := ASource;
              try
                Execute;
              except
                on E: Exception do
                  raise Exception.CreateFmt('FireDAC Error:  %s', [E.Message]);
              end;
            finally
              Free;
            end;
        finally
          if Assigned(ADestination) then
            FreeAndNil(ADestination);
        end;
      finally
        if Assigned(ADbaseConnection) then
          FreeAndNil(ADbaseConnection);
      end;
    finally
      if Assigned(ASource) then
        FreeAndNil(ASource);
    end;
  finally
    Screen.Cursor := crArrow; // necessary, or SQL wait will appear again
    Screen.Cursors[crSQLWait] := ACursor;
  end;
end;

function TDbxBatchExport.ExportRecordsADO: Boolean;
var
  ASQL, ATargetFieldList, ASourceFieldList, AParamList: TStringList;
  ASQLText: string;
  ACursor, i: Integer;
  AParams: TParameters;
  AParam: TParameter;
  ACmd: TADOCommand;

  AField: TField;
  // APrg: TProgressDialog;
  AMax: Integer;
  AStart, AEnd: TDateTime;
  o: TSQLGeneratorOracle;
begin
  Result := FALSE;
  hPrg := nil;

  // In order to avoid problems with "missing right quote" errors, and
  // to ensure the data is imported correctly, we create a parameterized
  // query.  We cycle the source dataset, filling in the parameters as we go.
  ACursor := Screen.Cursors[crSQLWait];
  Screen.Cursors[crSQLWait] := Screen.Cursors[crArrow];
  try
    try // except

      // initialization
      FAbort := FALSE; // always reset
      // APrg := NIL;
      AMax := 0;

      // open the source dataset
      if not Source.Active then
        Source.Open;

      // Do we show a progress dialog?
      if ShowProgress or Assigned(OnProgressEvent) then
        begin
          // get the max record count
          try
            if (Source is TSQLTable) then
              AMax := IQMS.DBTrans.dbtdbexp.DBX_GetRecordCount(TSQLTable(Source))

            else if (Source is TSQLQuery) then
              AMax := IQMS.DBTrans.dbtdbexp.DBX_GetRecordCount(TSQLQuery(Source))

            else if (Source is TIQWebDbxQuery) then
              AMax := TIQWebDbxQuery(Source).RecordCount

            else if (Source is TIQWebDbxTable) then
              AMax := TIQWebDbxTable(Source).RecordCount

            else if (Source is TFDTable) then
              AMax := TFDTable(Source).RecordCount

            else if (Source is TFDQuery) then
              AMax := TFDTable(Source).RecordCount

            else
              AMax := Source.RecordCount;
          except
            AMax := 0;
          end;

          // create and initialize the progress dialog
          FProgressMessage := sIIf(StatusMessageLine1 = '',
            Format(IQMS.DBTrans.dbtrscstr.cTXT0000063 { 'Exporting %s' } , [TableName]),
            StatusMessageLine1);
          CheckCreateProgressDialog(AMax, FProgressMessage);
        end;
      try // finally for progress dialog
        if Assigned(OnProgressEvent) then
          OnProgressEvent(AMax, 0, FProgressMessage);
        // disable source controls
        Source.DisableControls;
        try
          // the table must be open in order to get the field list
          if not Source.Active then
            Source.Open;

          // Initialize
          FMoveCount := 0;

          // Create objects
          ASQL := TStringList.Create;
          try
            ASourceFieldList := TStringList.Create;
            try
              ATargetFieldList := TStringList.Create;
              try
                AParamList := TStringList.Create;
                try
                  ACmd := TADOCommand.Create(nil);
                  try
                    ACmd.Connection := TADODataSet(Target).Connection;
                    AParams := TParameters.Create(ACmd, TParameter);
                    try
                      // Get field list and parameter list
                      if not HasFieldMap then
                        for i := 0 to Source.FieldCount - 1 do
                          begin
                            ASourceFieldList.Add(Source.Fields[i].FieldName);
                            ATargetFieldList.Add
                              ('[' + Source.Fields[i].FieldName + ']');
                            AParamList.Add(':' + Source.Fields[i].FieldName);
                          end
                        // Field Map
                      else
                        begin
                          GetFieldMapSourceFields(ASourceFieldList);
                          GetFieldMapSourceFields(AParamList, True);
                          GetFieldMapTargetFields(ATargetFieldList, FALSE);
                        end;

                      // check ...
                      if ASourceFieldList.Count = 0 then
                        Exit;

                      // Build query
                      with ASQL do
                        begin
                          Add(Format('INSERT INTO %s', [TableName]));
                          Add('(');
                          Add(IQMS.Common.StringUtils.StringListToStr(ATargetFieldList, ','));
                          Add(')');
                          Add('VALUES');
                          Add('(');
                          Add(IQMS.Common.StringUtils.StringListToStr(AParamList, ','));
                          Add(')');
                        end;
                      ACmd.CommandText := ASQL.Text;

                      for i := 0 to ASourceFieldList.Count - 1 do
                        begin
                          AField := Source.FindField
                            (ASourceFieldList.Strings[i]);
                          if AField = nil then
                            raise Exception.CreateFmt
                              ('Field, %s, not found in source data set.',
                              [ASourceFieldList.Strings[i]]);
                          AParam := ACmd.Parameters.FindParam(AField.FieldName);
                          if AParam <> nil then
                            AParam.Direction := pdInput;
                          // type = TParameterDirection
                        end;

                      // Position on the first record
                      Source.First;

                      // Cycle the source table and insert the records
                      while not Source.EOF do
                        begin

                          // Check to see if user clicked Cancel button
                          if CheckProgressAbortedEvent then
                            Break;
                          if Assigned(OnCheckProgressAbortedEvent) and
                            OnCheckProgressAbortedEvent then
                            Break;

                          // Fill the parameters with new values
                          ADO_FillParams(Source, ACmd.Parameters);
                          // in IQMS.DBTrans.dbtado.pas

                          // Get the SQL text only if we are writing to a log file
                          if Logging and Assigned(FLogFileObject) then
                            begin
                              if cLogParsedSQL and (Source is TIQWebDbxQuery) then
                                IQMS.DBTrans.dbtshare.GetParsedSQL
                                  (TIQWebDbxQuery(Source), ASQLText)
                              else
                                ASQLText := ASQL.Text;
                            end;

                          // Run the query
                          try
                            AStart := Now;
                            AEnd := AStart;
                            ACmd.Execute;

                            AEnd := Now;
                          finally
                            if Logging and Assigned(FLogFileObject) then
                              begin
                                FLogFileObject.Write(ASQLText);
                                FLogFileObject.
                                  Write(IQMS.DBTrans.dbtshare.StartEndText(AStart, AEnd));
                                FLogFileObject.Write('');
                                FLogFileObject.Write(Repl('-', 60));
                                FLogFileObject.Write('');
                              end;
                          end;

                          // Increment the "moved count"
                          Inc(FMoveCount);

                          // Next record
                          Source.Next;

                          // Step the progress bar
                          // if (APrg <> NIL) and Assigned(APrg) and (AMax > 1) then
                          // APrg.StepProgress;
                          Self.StepProgress;

                          if Assigned(OnProgressEvent) then
                            OnProgressEvent(AMax, FMoveCount, FProgressMessage);
                        end;

                    finally
                      if Assigned(AParams) then
                        FreeAndNil(AParams);
                    end;
                  finally
                    if Assigned(ACmd) then
                      FreeAndNil(ACmd);
                  end;
                finally
                  if Assigned(AParamList) then
                    FreeAndNil(AParamList);
                end;
              finally
                if Assigned(ATargetFieldList) then
                  FreeAndNil(ATargetFieldList);
              end;
            finally
              if Assigned(ASourceFieldList) then
                FreeAndNil(ASourceFieldList);
            end;
          finally
            if Assigned(ASQL) then
              FreeAndNil(ASQL);
          end;
        finally
          // Enable the controls
          Source.EnableControls;
        end;
      finally
        // free progress dialog
        if (hPrg <> nil) and Assigned(hPrg) then
          FreeAndNil(hPrg);
      end;

      Result := True;

    except
      on E: Exception do
        begin
          if Logging and Assigned(FErrorLogFileObject) then
            begin
              if Assigned(ASQL) then
                FErrorLogFileObject.
                  Write(Format('%s'#13'%s', [E.Message, ASQL.Text]))
              else
                FErrorLogFileObject.Write(E.Message);
            end;

          // Display error - this will also write to the log file, which is handled
          // by the calling form or application.
          raise;
        end;
    end;
  finally
    Screen.Cursor := crArrow; // necessary, or SQL wait will appear again
    Screen.Cursors[crSQLWait] := ACursor;
  end;

end;

function TDbxBatchExport.GetSource: TDataSet;
begin
  Result := nil;
  if Assigned(FSource) then
    begin
      if (FSource is TIQWebDbxCustomDataSet) or
        (FSource is TSQLQuery) or
        (FSource is TFDDataSet) then
        Result := inherited GetSource;
    end;
end;

procedure TDbxBatchExport.SetSource(const Value: TDataSet);
begin
  RaiseInvalidSource(Value);
  inherited SetSource(Value);
end;

function TDbxBatchExport.GetTarget: TDataSet;
begin
  Result := nil;
  if Assigned(FTarget) then
    begin
      if (FTarget is TCustomADODataSet) or
        (FTarget is TSQLQuery) then
        Result := inherited GetTarget;
    end;
end;

procedure TDbxBatchExport.SetTarget(const Value: TDataSet);
begin
  RaiseInvalidTarget(Value);
  inherited SetTarget(Value);
end;

procedure TDbxBatchExport.RaiseInvalidSource(const ADataSet: TDataSet);
begin
  if Assigned(ADataSet) then
    begin
      if not (ADataSet is TIQWebDbxCustomDataSet) and
        not (ADataSet is TSQLQuery) and
        not (ADataSet is TFDDataSet) then
        raise Exception.CreateFmt
          ('Invalid source type (%s).  Please provide a TDbxCustomDataSet, TSQLQuery or TFDDataSet.',
          [ADataSet.ClassName]);
    end;
end;

procedure TDbxBatchExport.RaiseInvalidTarget(const ADataSet: TDataSet);
begin
  if Assigned(ADataSet) then
    begin
      if not (ADataSet is TCustomADODataSet) and
        not (ADataSet is TSQLQuery) and
        not (ADataSet is TFDDataSet) then
        raise Exception.CreateFmt
          ('Invalid source type (%s).  Please provide a TCustomADODataSet, TSQLQuery or TFDDataSet.',
          [ADataSet.ClassName]);
    end;
end;

function TDbxBatchExport.TargetDirectory: string;
begin
  Result := '';
  if FFileName > '' then
    Result := ExtractFilePath(FFileName);
end;

procedure TDbxBatchExport.SetFileName(const Value: string);
var
  AExt: string;
begin
  FFileName := Value;
  if Value = '' then
    FTableName := ''
  else
    begin
      FTableName := IQMS.Common.FileUtils.FileNameNoExt(Value);
      AExt := Trim(UpperCase(ExtractFileExt(Value)));
      if AExt = '.DBF' then
        TableType := dttDBase
      else if AExt = '.DB' then
        TableType := dttParadox
      else if AExt = '.DBC' then
        TableType := dttFoxPro;
    end;
end;

{$ENDREGION 'TDbxBatchExport'}

end.

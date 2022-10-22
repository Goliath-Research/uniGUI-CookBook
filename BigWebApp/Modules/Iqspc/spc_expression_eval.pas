unit spc_expression_eval;

interface

uses
  Winapi.Windows,
  System.Classes,
  System.Variants,
  System.SysUtils;

type
  TExprParams = class(TComponent)
  private
    { Private declarations }
    FExpressionEngine: Variant;
    FFormula: string;
    procedure SetFormula(const Value: string);
  public
    { Public declarations }
    ParamID: Integer;
    ParamValue: Real;
    constructor Create(AOwner: TComponent);
    constructor CreateEx(AOwner: TComponent; AFormula: string);
    destructor Destroy; override;
    procedure SetParam(AParamID: Integer; AParamValue: Real);
    function Execute: Real;
  published
    { Published declarations }
    property Formula: string read FFormula write SetFormula;
  end;

function EvalBracePairs(const AFormula: string): Boolean;
function ListFormulaIDValues(const AFormula: string;
  var AList: TStringList): Boolean;
procedure CalculateSPCSample(const ASPCSampleID: Int64);

implementation

uses
  MainModule,
  IQMS.Common.DotNetCOMInterOp,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils,
  panelmsg,
  { TODO -oathite -cWebConvert : Dependent on spc_exec_before_sql
  spc_exec_before_sql, }
  spc_rscstr;

const
  DOTNETDLL = 'IQMS.RTProcUtility';
  DOTNETCOMTYPE = 'IQMS.RTProcUtility.RTFormula';

function EvalBracePairs(const AFormula: string): Boolean;
var
  i1, i2: Integer;
begin
  i1 := IQMS.Common.StringUtils.Occurances('{', AFormula);
  i2 := IQMS.Common.StringUtils.Occurances('}', AFormula);
  Result := i1 = i2;
end;

function ListFormulaIDValues(const AFormula: string;
  var AList: TStringList): Boolean;
var
  i, j, count: Integer;
  b: Boolean;
  tmp: string;
begin
  // Initialization
  Result := False;
  b := False;
  tmp := '';
  count := 0;

  // Validation
  if not Assigned(AList) then
    Exit;

  // Clear list
  AList.Clear;

  // Check brace pairs
  Result := EvalBracePairs(AFormula);
  if not Result then
    raise Exception.Create('Missing expression.');

  // Cycle formula string and retrieve ID values
  for i := 1 to Length(AFormula) do
  begin
    // Starting brace
    if not b and (AFormula[i] = '{') then
    begin
      b := True;
      Continue;
    end;
    // Ending brace
    if AFormula[i] = '}' then
    begin
      Inc(count);

      // We are done with this ID; add it to the list.
      Result := IQMS.Common.Numbers.IsStringValidInteger(tmp, j);

      if not Result then
        raise Exception.CreateFmt('Invalid parameter: %d', [count]);

      if b then
        AList.Add(tmp);
      // Reset values
      b := False;
      tmp := '';
    end;
    // Concatenate temp string
    if b then
      tmp := tmp + AFormula[i];
  end;

  Result := AList.count > 0;
end;

procedure CalculateSPCSample(const ASPCSampleID: Int64);
var
  AData: Variant;
  ASubgroupID, AInspectionID, ADimensionID: Int64;
  ASampleSeq: Integer;
  AFormula: string;
  ACount: Integer;
  AExprEval: TExprParams;
  AResult: Double;
  sl_params, sl_used_params: TStringList;
  AHasNullSample: Boolean;
  { TODO -oathite -cWebConvert : Dependent on spc_exec_before_sql
  AFieldData: TSPCSampleExecuteBeforeFieldDataRec; }

  function _CompareLists: Boolean;
  var
    i: Integer;
  begin
    Result := False;
    if not Assigned(sl_params) or not Assigned(sl_used_params) then
      Exit;
    for i := 0 to sl_params.count - 1 do
      if sl_used_params.IndexOf(sl_params.Strings[i]) = - 1 then
        Exit;
    Result := True;
  end;

begin
  // Initialization
  AHasNullSample := False;

  // Get data
  with TFDQuery.Create(nil) do
    try
      { TODO -oathite -cWebConvert : There is no procedure CheckDBModuleCreated available in MainModule
      if not Assigned(MainModule.UniMainModule) then
        MainModule.CheckDBModuleCreated;  }
      Connection := MainModule.UniMainModule.FDConnection1;
      // SQL.Add('SELECT a.subgroup_id, a.dimension_id, b.spc_inspection_id,');
      // SQL.Add('       a.sample_seq, e.formula, a.cuser1, a.cuser2');
      SQL.Add('SELECT a.subgroup_id,                                     ');
      SQL.Add('       a.dimension_id,                                    ');
      SQL.Add('       b.spc_inspection_id,                               ');
      SQL.Add('       a.sample_seq,                                      ');
      SQL.Add('       e.formula,                                         ');
      SQL.Add('       a.cuser1,                                          ');
      SQL.Add('       a.cuser2                                           ');
      SQL.Add('  FROM spc_sample a, spc_subgroup b, spc_dimension c,');
      SQL.Add('       spc_inspection d, spc_inspection_detail e');
      SQL.Add(Format(' WHERE a.id = %d AND', [ASPCSampleID]));
      SQL.Add('       b.id = a.subgroup_id AND');
      SQL.Add('       c.id = a.dimension_id AND');
      SQL.Add('       NVL(c.calculated, ''N'') = ''Y'' AND');
      SQL.Add('       d.id = b.spc_inspection_id AND');
      SQL.Add('       e.spc_inspection_id = b.spc_inspection_id AND');
      SQL.Add('       e.spc_dimension_id = c.id AND');
      SQL.Add('       e.formula IS NOT NULL');
      Open;
      if not (Bof and Eof) then
      begin
        ASubgroupID := Fields[0].AsLargeInt;
        ADimensionID := Fields[1].AsLargeInt;
        AInspectionID := Fields[2].AsLargeInt;
        ASampleSeq := Fields[3].AsInteger;
        AFormula := Fields[4].AsString;
        { TODO -oathite -cWebConvert : Dependent on spc_exec_before_sql
        AFieldData.SPC_SUBGROUP_ID := ASubgroupID;
        AFieldData.SPC_SAMPLE_ID := ASPCSampleID;
        AFieldData.SPC_DIMENSION_ID := ADimensionID;
        AFieldData.SPC_INSPECTION_ID := AInspectionID;
        AFieldData.CUSER1 := Fields[5].AsString;
        AFieldData.CUSER2 := Fields[6].AsString; }

      end
      else
        Exit;
    finally
      Free;
    end;

  // Use the "Expression Evaluator" to test the formula.
  // This component is declared in spc_expression_eval.pas,
  // and uses a .Net DLL.
  if not string.IsNullOrWhiteSpace(AFormula) then
  begin
    AExprEval := TExprParams.CreateEx(nil, AFormula);
    try
      // Get string list that will contain the parameter ID values.
      // We use this list to verify the parameter count and valid ID's.
      sl_params := TStringList.Create;
      try
        sl_used_params := TStringList.Create;
        try
          // Convert the ID values in the formula.  We use this list below to
          // ensure the expected parameters are passed to the expression evaluator.
          if not ListFormulaIDValues(AFormula, sl_params) then
            // spc_rscstr.cTXT000000690 = 'Formula contains errors:'#13'%s'
            raise Exception.CreateFmt(spc_rscstr.cTXT000000690, [AFormula]);
          // Cycle the other, non-calculated parameters for the sequence
          with TFDQuery.Create(nil) do
            try
              Connection := MainModule.UniMainModule.FDConnection1;
              SQL.Add('SELECT');
              SQL.Add('  a.id,');
              SQL.Add('  a.dimension_id,');
              SQL.Add('  a.nsample');
              SQL.Add('FROM');
              SQL.Add('  spc_sample a, spc_dimension b');
              SQL.Add('WHERE');
              SQL.Add(Format('  a.subgroup_id = %d AND', [ASubgroupID]));
              SQL.Add(Format('  a.sample_seq = %d AND', [ASampleSeq]));
              SQL.Add(Format('  a.id <> %d AND', [ASPCSampleID]));
              SQL.Add('  b.id = a.dimension_id AND');
              SQL.Add('  NVL(a.isattribute, ''N'') <> ''Y'' AND ');
              SQL.Add('  NVL(b.calculated, ''N'') <> ''Y'' ');
              SQL.Add('ORDER BY a.seq');
              Open;
              ACount := 0;
              while not Eof do
              begin
                AExprEval.SetParam(FieldByName('DIMENSION_ID').AsLargeInt,
                  FieldByName('NSAMPLE').AsFloat);
                Inc(ACount);
                // 03/20/2014 Only add the DIMENSION_ID if the NSAMPLE is not NULL.
                // For EIQ-2580  SER# 5295
                if not FieldByName('NSAMPLE').IsNull then
                  sl_used_params.Add
                    (IntToStr(FieldByName('DIMENSION_ID').AsLargeInt));
                Next;
              end;
            finally
              Free;
            end;
          // - Compare the expected parameters with the parameters in the
          // foregoing dataset.
          if not _CompareLists then
          begin
            // 03/20/2014 Instead of raising an exception if a parameter is
            // not included, just set the flag to treat it as if a null value
            // is included. If there is a null sample in this group,
            // then the calculated sample will be set to NULL.
            // For EIQ-2580  SER# 5295
            AHasNullSample := True;
          end;
        finally
          if Assigned(sl_used_params) then
            FreeAndNil(sl_used_params);
        end;
      finally
        if Assigned(sl_params) then
          FreeAndNil(sl_params);
      end;

      // 03/20/2014 If there is a null sample in this group,
      // then just set the calculated field to null.
      // For EIQ-2580  SER# 5295
      if AHasNullSample then
      begin
        ExecuteCommandFmt(
          'UPDATE spc_sample SET nsample = NULL WHERE id = %d',
          [ASPCSampleID]);
      end
      else
      begin
        // Evaluate the formula and return the value
        AResult := AExprEval.Execute;
        // Update the sample value with the calculated value.
        ExecuteCommandFmt(
          'UPDATE spc_sample SET nsample = %.15f WHERE id = %d',
          [AResult, ASPCSampleID]);
      end;
    finally
      if Assigned(AExprEval) then
        FreeAndNil(AExprEval);
    end;
  end;

  // Fire SQL here after calculated fields
  { TODO -oathite -cWebConvert : Dependent on spc_exec_before_sql
  CheckExecuteBeforeSQL(AFieldData); }

end;

{$REGION 'TExprParams'}

{ TExprParams }

constructor TExprParams.Create(AOwner: TComponent);
var
  hMsg: TPanelMesg;
begin
  // Initialization
  hMsg := nil;
  FExpressionEngine := Unassigned;

  inherited Create(AOwner);

  // Check for the existence of the required DLL
  if not FileExists(DOTNETDLL + '.dll') then
    raise Exception.CreateFmt('Could not find required DLL file:'#13 +
      '%s.dll', [DOTNETDLL]);

  try
    hMsg := hPleaseWait('Initializing.  Please wait...');
    CreateDNetCOM(FExpressionEngine, DOTNETDLL, DOTNETCOMTYPE);
  finally
    if Assigned(hMsg) then
      FreeAndNil(hMsg);
  end;

  if VarIsEmpty(FExpressionEngine) then
    raise Exception.Create('Cannot access expression engine.');

end;

constructor TExprParams.CreateEx(AOwner: TComponent; AFormula: string);
begin
  Create(AOwner); // calls main constructor above
  Self.Formula := AFormula;
end;

destructor TExprParams.Destroy;
begin
  if not VarIsEmpty(FExpressionEngine) then
    FreeDNetObject_Ex(FExpressionEngine);

  inherited Destroy;
end;

procedure TExprParams.SetParam(AParamID: Integer; AParamValue: Real);
begin
  if not VarIsEmpty(FExpressionEngine) then
    FExpressionEngine.SetParam(AParamID, AParamValue);
end;

function TExprParams.Execute: Real;
var
  CW: Word;
begin
  Result := 0;
  try
    DisableFPUExceptions(CW);
    if not VarIsEmpty(FExpressionEngine) then
      Result := FExpressionEngine.Evaluate;
  finally
    RestoreFPU(CW);
  end;
end;

procedure TExprParams.SetFormula(const Value: string);
begin
  FFormula := Value;
  if not VarIsEmpty(FExpressionEngine) then
    FExpressionEngine.SetFormula(Value);
end;

{$ENDREGION 'TExprParams'}

end.

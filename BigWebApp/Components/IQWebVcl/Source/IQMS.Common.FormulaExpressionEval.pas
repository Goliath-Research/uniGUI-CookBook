unit IQMS.Common.FormulaExpressionEval;

interface

uses
  Winapi.Windows,
  System.Classes,
  System.Variants,
  System.SysUtils,
  System.Generics.Collections;

type
  TExprParams = class(TComponent)
  private
    { Private declarations }
    FExpressionEngine: Variant;
    FFormula: String;
    procedure SetFormula(const Value: String);
  public
    { Public declarations }
    ParamID: Integer;
    ParamValue: Real;
    constructor Create(AOwner: TComponent);
    constructor CreateEx(AOwner: TComponent; AFormula: String);
    destructor Destroy; override;
    procedure SetParam(AParamID: Integer; AParamValue: Real);
    function Execute: Real;
  published
    { Published declarations }
    property Formula: String read FFormula write SetFormula;
  end;

/// <summary> Evaluate formula for correct brace pairs. </summary>
/// <returns>True, if formula is correct; false, if formula is incorrect.</returns>
function EvalBracePairs(const AFormula: String): Boolean;

/// <summary> List the ID values referenced in the formula. </summary>
function ListFormulaIDValues(const AFormula: String;
  var AList: TStringList): Boolean;

/// <summary> List the ID values referenced in the formula. </summary>
function ListFormulaIDValuesEx(const AFormula: String;
  var AList: TList<Int64>): Boolean;

implementation

uses
  IQMS.Common.DotNetCOMInterOp,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  IQMS.Common.Numbers,
  IQMS.Common.ResStrings,
  IQMS.Common.StringUtils,
  IQMS.Common.panelmsg;

const
  DOTNETDLL = 'IQMS.RTProcUtility';
  DOTNETCOMTYPE = 'IQMS.RTProcUtility.RTFormula';

function EvalBracePairs(const AFormula: String): Boolean;
var
  i1, i2: Integer;
begin
  i1 := IQMS.Common.StringUtils.Occurances('{', AFormula);
  i2 := IQMS.Common.StringUtils.Occurances('}', AFormula);
  Result := i1 = i2;
end;

function ListFormulaIDValues(const AFormula: String;
  var AList: TStringList): Boolean;
var
  i: Integer;
  AListInt: TList<Int64>;
begin
  Result := False;
  AListInt := TList<Int64>.Create;
  try
    if ListFormulaIDValuesEx(AFormula, {var} AListInt) then
      begin
        for i := 0 to AListInt.Count - 1 do
          AList.Add(IntToStr(AListInt.Items[i]));
        Result := AList.Count > 0;
      end;
  finally
    AListInt.Free;
  end;
end;

function ListFormulaIDValuesEx(const AFormula: String;
  var AList: TList<Int64>): Boolean;
var
  i, ACount: Integer;
  b: Boolean;
  AID: Real;
  tmp: String;
begin
  // Initialization
  Result := False;
  b := False;
  tmp := '';
  ACount := 0;

  // Validation
  if not Assigned(AList) then
    Exit;

  // Clear list
  AList.Clear;

  // Check brace pairs
  Result := EvalBracePairs(AFormula);
  if not Result then
    // IQMS.Common.ResStrings.cTXT0000490 = 'Missing expression.'
    raise Exception.Create(IQMS.Common.ResStrings.cTXT0000490);

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
          Inc(ACount);

          // We are done with this ID; add it to the list.
          Result := IQMS.Common.Numbers.IsStringValidFloat(tmp, AID);

          if not Result then
            // IQMS.Common.ResStrings.cTXT0000491 = 'Invalid parameter: %d';
            raise Exception.CreateFmt(IQMS.Common.ResStrings.cTXT0000491, [ACount]);

          if b then
            AList.Add(Trunc(AID));
          // Reset values
          b := False;
          tmp := '';
        end;
      // Concatenate temp string
      if b then
        tmp := tmp + AFormula[i];
    end;

  Result := AList.Count > 0;
end;

{$REGION 'TExprParams'}

{ TExprParams }

constructor TExprParams.Create(AOwner: TComponent);
var
  hMsg: TPanelMesg;
begin
  // Initialization
  hMsg := NIL;
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

constructor TExprParams.CreateEx(AOwner: TComponent; AFormula: String);
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

procedure TExprParams.SetFormula(const Value: String);
begin
  FFormula := Value;
  if not VarIsEmpty(FExpressionEngine) then
    FExpressionEngine.SetFormula(Value);
end;

{$ENDREGION 'TExprParams'}

end.

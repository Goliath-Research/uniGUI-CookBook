unit cc_params;

(* ******************************************************************************
  ***                    Credit Card Parameters                               ***
  *
  *  This unit contains the component used for storing and retrieving settings
  *  used when processing Credit Cards.
  *
  ***************************************************************************** *)

{ *** History ***

  07/06/2009
  Added param ChangeSettlement.
  07/16/2009
  Added param AutoAdjustSettlement (field, AUTOADJUST_SETTLEMENT);
}

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  System.Variants,
  IQMS.Common.Registry,
  IQMS.Common.RegFrm,
  Data.DB,
  cc_types,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule;

type
  { Forward declarations }
  TParamList = class;
  TParamDefs = class;
  TParamDef = class;

  { TCreditCardParams }
  TCreditCardParams = class(TComponent)
  private
    { Private declarations }
    FCVV2Visible: Boolean;
    FBankDetailID: Integer;
    FGatewayIndex: Integer;
    FWriteImmediate: Boolean;
    FSavedWriteImmediate: Boolean;
    FChangeSettlement: Boolean;
    FAutoAdjustSettlement: Boolean;
    FCreditCardAccountID: Int64;
    FEPlantID: Int64;
    FDescription: string;
    FCurrencyID: Real;
    FIsDefault: Boolean;
    FArchived: Boolean;
    FTaxExempt: Boolean;
    FChargeMethod: TGatewayChargeMethod;
    FFirewallDetect: Boolean;
    FTimeOut: Integer;
    FProcessingClass: TProcessingClass;
    FFirewallPort: Integer;
    FFirewallType: TFirewallType;
    FFirewallPassword: string;
    FFirewallHost: string;
    FTestAccount: Boolean;
    FFirewallUser: string;
    FProductionURL: string;
    FTestPort: Integer;
    FTestURL: string;
    FProductionPort: Integer;
    FGateway: TCreditCardGateway;
    FMerchantName: string;
    procedure LoadParameters;
    procedure UpdateSetting(const AFieldName, AValue: string);
    procedure SetBankDetailID(const Value: Integer);
    procedure SetCVV2Visible(const Value: Boolean);
    procedure SetGatewayIndex(const Value: Integer);
    procedure SetWriteImmediate(const Value: Boolean);
    procedure SetChangeSettlement(const Value: Boolean);
    procedure SetAutoAdjustSettlement(const Value: Boolean);
    procedure SetDescription(const Value: string);
    procedure SetEPlantID(const Value: Int64);
    procedure SetCurrencyID(const Value: Real);
    procedure SetDefault(const Value: Boolean);
    procedure SetChargeMethod(const Value: TGatewayChargeMethod);
    procedure SetFirewallDetect(const Value: Boolean);
    procedure SetFirewallHost(const Value: string);
    procedure SetFirewallPassword(const Value: string);
    procedure SetFirewallPort(const Value: Integer);
    procedure SetFirewallType(const Value: TFirewallType);
    procedure SetFirewallUser(const Value: string);
    procedure SetProcessingClass(const Value: TProcessingClass);
    procedure SetTaxExempt(const Value: Boolean);
    procedure SetTestAccount(const Value: Boolean);
    procedure SetTimeOut(const Value: Integer);
    procedure SetProductionPort(const Value: Integer);
    procedure SetProductionURL(const Value: string);
    procedure SetTestPort(const Value: Integer);
    procedure SetTestURL(const Value: string);
    procedure SetGateway(const Value: TCreditCardGateway);
  protected
    { Protected declarations }
    Params: TParamList;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ACreditCardAccountID: Int64);
      reintroduce;
    destructor Destroy; override;

    procedure Refresh;
    procedure WriteValues;
    procedure BeginUpdate;
    procedure EndUpdate;

    function ParamByName(ACode: string): TParamDef;
    function DecryptParam(ACode: string): string;
    function GatewayDescription: string;
    function AccountDescription: string;
    procedure AsNameValues(var AStrings: TStringList);
  published
    { Published declarations }
    property CreditCardAccountID: Int64 read FCreditCardAccountID;

    // Component properties
    property WriteImmediate: Boolean read FWriteImmediate
      write SetWriteImmediate;

    // Credit Card properties
    property Gateway: TCreditCardGateway read FGateway write SetGateway;
    property GatewayIndex: Integer read FGatewayIndex write SetGatewayIndex;
    property BankDetailID: Integer read FBankDetailID write SetBankDetailID;
    property CVV2Visible: Boolean read FCVV2Visible write SetCVV2Visible;
    property ChangeSettlement: Boolean read FChangeSettlement
      write SetChangeSettlement;
    property AutoAdjustSettlement: Boolean read FAutoAdjustSettlement
      write SetAutoAdjustSettlement;
    property Description: string read FDescription write SetDescription;
    property EPlantID: Int64 read FEPlantID write SetEPlantID;
    property CurrencyID: Real read FCurrencyID write SetCurrencyID;
    property IsDefault: Boolean read FIsDefault write SetDefault;
    property Archived: Boolean read FArchived;
    property ChargeMethod: TGatewayChargeMethod read FChargeMethod
      write SetChargeMethod;
    property ProcessingClass: TProcessingClass read FProcessingClass
      write SetProcessingClass;
    property TaxExempt: Boolean read FTaxExempt write SetTaxExempt;
    property TestAccount: Boolean read FTestAccount write SetTestAccount;
    property TimeOut: Integer read FTimeOut write SetTimeOut;
    property FirewallDetect: Boolean read FFirewallDetect
      write SetFirewallDetect;
    property FirewallHost: string read FFirewallHost write SetFirewallHost;
    property FirewallPort: Integer read FFirewallPort write SetFirewallPort;
    property FirewallUser: string read FFirewallUser write SetFirewallUser;
    property FirewallPassword: string read FFirewallPassword
      write SetFirewallPassword;
    property FirewallType: TFirewallType read FFirewallType
      write SetFirewallType;
    property ProductionURL: string read FProductionURL write SetProductionURL;
    property ProductionPort: Integer read FProductionPort
      write SetProductionPort;
    property TestURL: string read FTestURL write SetTestURL;
    property TestPort: Integer read FTestPort write SetTestPort;
    property MerchantName: string read FMerchantName;
  end;

  { TSettingsList }
  TSettingsList = class(TStringList);

  { TParamList }
  TParamList = class(TSettingsList)
  private
    { Private declarations }
    FParamDefs: TParamDefs;
    FWriteImmediate: Boolean;
    FID: Int64;
    procedure SetWriteImmediate(const Value: Boolean);
  public
    { Public declarations }
    constructor Create(ACreditCardAccountID: Int64);
    destructor Destroy; override;
    procedure Update;
    function Param(const Code: string): TParamDef;
    procedure WriteValues;
    procedure ClearObjects;
    procedure AsNameValues(var AStrings: TStringList);
  published
    { Published declarations }
    property WriteImmediate: Boolean read FWriteImmediate
      write SetWriteImmediate;
    property CreditCardSettingsID: Int64 read FID write FID;
  end;

  { TParamDefs }
  TParamDefs = class(TCollection) // TOwnedCollection
  private
    { Private declarations }
    FWriteImmediate: Boolean;
    FID: Real;
    function GetItems(index: Integer): TParamDef;
    procedure SetItems(index: Integer; const Value: TParamDef);
    procedure SetWriteImmediate(const Value: Boolean);
    function AddParamDef: TParamDef;
  public
    { Public declarations }
    constructor Create(ACreditCardAccountID: Real);
    function Add(const Code, Value: string): TParamDef;
    function Find(const Code: string): TParamDef;
    property Items[index: Integer]: TParamDef read GetItems
      write SetItems; default;
    function IndexOf(const Code: string): Integer;
  published
    { Published declarations }
    property WriteImmediate: Boolean read FWriteImmediate
      write SetWriteImmediate;
    property CreditCardSettingsID: Real read FID write FID;
  end;

  { TParamDef }
  TParamDef = class(TCollectionItem)
  private
    { Private declarations }
    FCode: string;
    FValue: string;
    FWriteImmediate: Boolean;
    FID: Real;
    function GetValue(var AValue: string): Boolean;
    function GetAsBoolean: Boolean;
    function GetAsDateTime: TDateTime;
    function GetAsFloat: Double;
    function GetAsInteger: Longint;
    function GetAsString: string;
    procedure SetAsBoolean(const AValue: Boolean);
    procedure SetAsDateTime(const AValue: TDateTime);
    procedure SetAsFloat(const AValue: Double);
    procedure SetAsInteger(const AValue: Longint);
    procedure SetAsString(const AValue: string);
    procedure SetValue(const AValue: string);
    function GetIsNull: Boolean;
  public
    { Public declarations }
    property AsBoolean: Boolean read GetAsBoolean write SetAsBoolean;
    property AsDateTime: TDateTime read GetAsDateTime write SetAsDateTime;
    property AsFloat: Double read GetAsFloat write SetAsFloat;
    property AsInteger: Longint read GetAsInteger write SetAsInteger;
    property AsString: string read GetAsString write SetAsString;
    property IsNull: Boolean read GetIsNull;
  published
    { Published declarations }
    property Code: string read FCode write FCode;
    property Value: string read FValue write FValue;
    property WriteImmediate: Boolean read FWriteImmediate
      write FWriteImmediate;
    property CreditCardSettingsID: Real read FID write FID;
  end;

function GetCreditCardAccountID(const ACurrencyID: Int64): Int64;
function GetCreditCardAccountIDEx(const ACurrencyID: Int64;
  AEplantID: Int64): Int64;

implementation

uses
  cc_encrypt,
  cc_rscstr,
  IQMS.Common.Boolean,
  IQMS.Common.Dates,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils;

function GetCreditCardAccountID(const ACurrencyID: Int64): Int64;
begin
  Result := SelectValueFmtAsInt64
    ('SELECT iqms.cc.get_credit_card_account(%d, %d) AS id'#13 +
    'FROM dual', [SecurityManager.EPlant_ID_AsInteger, ACurrencyID]);
end;

function GetCreditCardAccountIDEx(const ACurrencyID: Int64;
  AEplantID: Int64): Int64;
begin
  Result := SelectValueFmtAsInt64
    ('SELECT iqms.cc.get_credit_card_account(%d, %d) AS id'#13 +
    'FROM dual', [AEplantID, ACurrencyID]);
end;

{ TCreditCardParams }

constructor TCreditCardParams.Create(AOwner: TComponent;
  ACreditCardAccountID: Int64);
begin

  // Initial
  Params := nil;

  // Create object
  inherited Create(AOwner);

  FCreditCardAccountID := ACreditCardAccountID;

  // Create settings object
  Params := TParamList.Create(FCreditCardAccountID);

  // Load all parameters at once
  LoadParameters;
end;

destructor TCreditCardParams.Destroy;
begin
  if Assigned(Params) then
    begin
      Params.ClearObjects;
      FreeAndNil(Params);
    end;
  inherited Destroy;
end;

procedure TCreditCardParams.AsNameValues(var AStrings: TStringList);
begin
  if not Assigned(AStrings) then
    Exit;
  Params.AsNameValues(AStrings);
end;

procedure TCreditCardParams.BeginUpdate;
begin
  FSavedWriteImmediate := WriteImmediate;
  WriteImmediate := False;
end;

procedure TCreditCardParams.EndUpdate;
begin
  WriteValues;
  WriteImmediate := FSavedWriteImmediate;
end;

procedure TCreditCardParams.LoadParameters;
var
  i: Integer;
begin
  // Global settings (not gateway-specific)
  with TFDQuery.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add('SELECT description, gateway, bankinfo_dtl_id,');
      SQL.Add('       cvv2_visible, change_settlement, ');
      SQL.Add('       autoadjust_settlement, currency_id, eplant_id, ');
      SQL.Add('       is_default, archived, merchant_name');
      SQL.Add('  FROM credit_card_account');
      SQL.Add(Format('WHERE id = %d', [FCreditCardAccountID]));
      Open;
      // Update the property private variables
      FDescription := Trim(Fields[0].AsString);
      FGatewayIndex := Fields[1].AsInteger;
      FGateway := cc_types.SupportedGatewayByIndex(FGatewayIndex);
      FBankDetailID := Fields[2].AsLargeInt;
      FCVV2Visible := Trim(Fields[3].AsString) = 'Y';
      FChangeSettlement := Trim(Fields[4].AsString) = 'Y'; // 07/06/2009
      FAutoAdjustSettlement := Trim(Fields[5].AsString) = 'Y'; // 07/16/2009
      FCurrencyID := Fields[6].AsLargeInt;
      FEPlantID := Fields[7].AsLargeInt;
      FIsDefault := Trim(Fields[8].AsString) = 'Y';
      FArchived := Trim(Fields[9].AsString) = 'Y';
      FMerchantName := Trim(Fields[10].AsString);
    finally
      Free;
    end;

  Params.Update;
  i := ParamByName('PROCESSING_CLASS').AsInteger;

  // Note:  The TProcessingClass does not match the index returned by the
  // param, 'PROCESSING_CLASS'.  Possible integers are 0, 2, 3.
  FProcessingClass := TProcessingClass(0);
  if (i = PROCESSING_LEVEL_2) then
    FProcessingClass := pclLevel2
  else if (i = PROCESSING_LEVEL_3) then
    FProcessingClass := pclLevel3;

  i := ParamByName('TRANSACTION_TYPE').AsInteger;
  FChargeMethod := TGatewayChargeMethod(i);
  FTestAccount := ParamByName('TEST_ACCOUNT').AsBoolean;
  FTaxExempt := ParamByName('TAX_EXEMPT').AsBoolean;
  FTimeOut := ParamByName('TIME_OUT').AsInteger;

  FFirewallDetect := ParamByName('FIREWALL_DETECT').AsBoolean;
  i := ParamByName('FIREWALL_TYPE').AsInteger;
  FFirewallType := TFirewallType(i);
  FFirewallHost := Trim(ParamByName('FIREWALL_HOST').AsString);
  FFirewallPort := ParamByName('FIREWALL_PORT').AsInteger;
  FFirewallUser := Trim(DecryptParam('FIREWALL_USER'));
  FFirewallPassword := Trim(DecryptParam('FIREWALL_PASSWORD'));

  FProductionURL := Trim(ParamByName('PRODUCTION_URL').AsString);
  FTestPort := ParamByName('PRODUCTION_PORT').AsInteger;
  FTestURL := Trim(ParamByName('TEST_URL').AsString);
  FProductionPort := ParamByName('TEST_PORT').AsInteger;
end;

function TCreditCardParams.ParamByName(ACode: string): TParamDef;
begin
  Result := Params.Param(ACode);
end;

function TCreditCardParams.DecryptParam(ACode: string): string;
begin
  Result := cc_encrypt.CCKeyDecrypt(ParamByName(ACode).AsString);
end;

procedure TCreditCardParams.Refresh;
begin
  LoadParameters;
end;

procedure TCreditCardParams.UpdateSetting(const AFieldName, AValue: string);
var
  ASQL: string;
begin
  ASQL := Format('UPDATE credit_card_account SET %s = :%s WHERE id = %d',
    [LowerCase(AFieldName), UpperCase(AFieldName), FCreditCardAccountID]);

  ExecuteCommandParam(ASQL, [UpperCase(AFieldName)], [AValue]);
end;

procedure TCreditCardParams.SetBankDetailID(const Value: Integer);
begin
  FBankDetailID := Value;
  UpdateSetting('bankinfo_dtl_id', IntToStr(Value));
end;

procedure TCreditCardParams.SetCVV2Visible(const Value: Boolean);
begin
  FCVV2Visible := Value;
  UpdateSetting('cvv2_visible', IQMS.Common.Boolean.BoolToYN(Value));
end;

procedure TCreditCardParams.SetGateway(const Value: TCreditCardGateway);
begin
  FGateway := Value;
  FGatewayIndex := cc_types.IndexBySupportedGateway(Value);
end;

procedure TCreditCardParams.SetGatewayIndex(const Value: Integer);
begin
  FGatewayIndex := Value;
  FGateway := cc_types.SupportedGatewayByIndex(FGatewayIndex);
  UpdateSetting('gateway', IntToStr(Value));
end;

procedure TCreditCardParams.SetProcessingClass(const Value: TProcessingClass);
begin
  FProcessingClass := Value;
  UpdateSetting('processing_class', IntToStr(Ord(Value)));
end;

procedure TCreditCardParams.SetProductionPort(const Value: Integer);
begin
  FProductionPort := Value;
  UpdateSetting('production_port', IntToStr(Value));
end;

procedure TCreditCardParams.SetProductionURL(const Value: string);
begin
  FProductionURL := Value;
  UpdateSetting('production_url', Value);
end;

procedure TCreditCardParams.SetTaxExempt(const Value: Boolean);
begin
  FTaxExempt := Value;
  UpdateSetting('tax_exempt', IQMS.Common.Boolean.BoolToYN(Value));
end;

procedure TCreditCardParams.SetTestAccount(const Value: Boolean);
begin
  FTestAccount := Value;
  UpdateSetting('test_account', IQMS.Common.Boolean.BoolToYN(Value));
end;

procedure TCreditCardParams.SetTestPort(const Value: Integer);
begin
  FTestPort := Value;
  UpdateSetting('test_port', IntToStr(Value));
end;

procedure TCreditCardParams.SetTestURL(const Value: string);
begin
  FTestURL := Value;
  UpdateSetting('test_url', Value);
end;

procedure TCreditCardParams.SetTimeOut(const Value: Integer);
begin
  FTimeOut := Value;
  UpdateSetting('time_out', IntToStr(Value));
end;

procedure TCreditCardParams.SetChangeSettlement(const Value: Boolean);
begin
  FChangeSettlement := Value;
  UpdateSetting('change_settlement', IQMS.Common.Boolean.BoolToYN(Value));
end;

procedure TCreditCardParams.SetChargeMethod(const Value: TGatewayChargeMethod);
begin
  FChargeMethod := Value;
  UpdateSetting('transaction_type', IntToStr(Ord(Value)));
end;

procedure TCreditCardParams.SetAutoAdjustSettlement(const Value: Boolean);
begin
  FAutoAdjustSettlement := Value;
  UpdateSetting('autoadjust_settlement', IQMS.Common.Boolean.BoolToYN(Value));
end;

procedure TCreditCardParams.SetDescription(const Value: string);
begin
  FDescription := Value;
  UpdateSetting('description', Value);
end;

procedure TCreditCardParams.SetEPlantID(const Value: Int64);
begin
  FEPlantID := Value;
  UpdateSetting('eplant_id', IntToStr(Value));
end;

procedure TCreditCardParams.SetFirewallDetect(const Value: Boolean);
begin
  FFirewallDetect := Value;
  UpdateSetting('firewall_detect', IQMS.Common.Boolean.BoolToYN(Value));
end;

procedure TCreditCardParams.SetFirewallHost(const Value: string);
begin
  FFirewallHost := Value;
  UpdateSetting('firewall_host', Value);
end;

procedure TCreditCardParams.SetFirewallPassword(const Value: string);
begin
  FFirewallPassword := Value;
  UpdateSetting('firewall_password', cc_encrypt.CCKeyEncrypt(Value));
end;

procedure TCreditCardParams.SetFirewallPort(const Value: Integer);
begin
  FFirewallPort := Value;
  UpdateSetting('firewall_port', IntToStr(Value));
end;

procedure TCreditCardParams.SetFirewallType(const Value: TFirewallType);
begin
  FFirewallType := Value;
  UpdateSetting('firewall_type', IntToStr(Ord(Value)));
end;

procedure TCreditCardParams.SetFirewallUser(const Value: string);
begin
  FFirewallUser := Value;
  UpdateSetting('firewall_user', cc_encrypt.CCKeyEncrypt(Value));
end;

procedure TCreditCardParams.SetCurrencyID(const Value: Real);
begin
  FCurrencyID := Value;
  UpdateSetting('currency_id', FloatToStr(Value));
end;

procedure TCreditCardParams.SetDefault(const Value: Boolean);
begin
  FIsDefault := Value;
  if not Value then
    UpdateSetting('is_default', 'N')
  else
    ExecuteCommandFmt
      ('BEGIN iqms.cc.set_default_account(%d, %d); END;',
      [FCreditCardAccountID, FEPlantID]);
end;

procedure TCreditCardParams.SetWriteImmediate(const Value: Boolean);
begin
  FWriteImmediate := Value;
  Params.WriteImmediate := Value;
end;

procedure TCreditCardParams.WriteValues;
begin
  Params.WriteValues;
end;

function TCreditCardParams.AccountDescription: string;
begin
  Result := SelectValueFmtAsString
    ('SELECT description FROM credit_card_account WHERE id = %d',
    [FCreditCardAccountID]);
end;

function TCreditCardParams.GatewayDescription: string;
begin
  try
    Result := cc_types.CreditCardGatewayName[FGateway];
  except
    Result := cc_types.CreditCardGatewayName[cgwUnknown];
  end;
end;

{ TParamDefs }

constructor TParamDefs.Create(ACreditCardAccountID: Real);
begin
  inherited Create(TParamDef);
  FID := ACreditCardAccountID;
end;

function TParamDefs.Add(const Code, Value: string): TParamDef;
begin
  try
    BeginUpdate;
    Result := AddParamDef;
    Result.Code := Code;
    Result.Value := Value;
    Result.WriteImmediate := Self.WriteImmediate;
    Result.CreditCardSettingsID := Self.FID;
  finally
    EndUpdate;
  end;
end;

function TParamDefs.AddParamDef: TParamDef;
begin
  Result := TParamDef(inherited Add);
  Result.CreditCardSettingsID := Self.FID;
end;

function TParamDefs.Find(const Code: string): TParamDef;
var
  i: Integer;
begin
  i := IndexOf(Code);
  if i < 0 then
    Result := nil
  else
    Result := TParamDef(Items[i]);
end;

function TParamDefs.GetItems(index: Integer): TParamDef;
begin
  Result := TParamDef(inherited Items[index]);
end;

function TParamDefs.IndexOf(const Code: string): Integer;
var
  i: Integer;
begin
  Result := - 1;
  for i := 0 to Count - 1 do
    if TParamDef(Items[i]).Code = Code then
      begin
        Result := i;
        Break;
      end;
end;

procedure TParamDefs.SetItems(index: Integer; const Value: TParamDef);
begin
  inherited Items[index] := Value;
end;

procedure TParamDefs.SetWriteImmediate(const Value: Boolean);
var
  i: Integer;
begin
  FWriteImmediate := Value;
  for i := 0 to Count - 1 do
    Items[i].WriteImmediate := Value;
end;

{ TParamDef }

function TParamDef.GetValue(var AValue: string): Boolean;
begin
  if Self = nil then
    Exit(False);
  try
    AValue := Trim(Value);
    Result := True;
  except
    Result := False;
  end;
end;

function TParamDef.GetAsBoolean: Boolean;
var
  s: string;
begin
  s := GetAsString;
  Result := (Length(s) > 0) and System.SysUtils.CharInSet(s[1],
    ['T', 't', 'Y', 'y']);
end;

function TParamDef.GetAsDateTime: TDateTime;
var
  AValue: string;
begin
  AValue := GetAsString;
  IQMS.Common.Dates.IsStringValidDate(AValue, Result);
end;

function TParamDef.GetAsFloat: Double;
var
  AValue: string;
  R: Real;
begin
  AValue := GetAsString;
  Result := 0;
  if IQMS.Common.Numbers.IsStringValidFloat(AValue, R) then
    Result := R;
end;

function TParamDef.GetAsInteger: Longint;
var
  AValue: string;
begin
  Result := 0;
  AValue := GetAsString;
  IQMS.Common.Numbers.IsStringValidInteger(AValue, Result);
end;

function TParamDef.GetAsString: string;
begin
  if not GetValue(Result) then
    Result := '';
end;

function TParamDef.GetIsNull: Boolean;
begin
  Result := String.IsNullOrWhiteSpace(GetAsString);
end;

procedure TParamDef.SetAsBoolean(const AValue: Boolean);
begin
  SetAsString(IQMS.Common.Boolean.BoolToYN(AValue));
end;

procedure TParamDef.SetAsDateTime(const AValue: TDateTime);
begin
  SetAsString(FormatDateTime('ddddd tt', AValue));
end;

procedure TParamDef.SetAsFloat(const AValue: Double);
begin
  SetAsString(FloatToStr(AValue));
end;

procedure TParamDef.SetAsInteger(const AValue: Longint);
begin
  SetAsString(IntToStr(AValue));
end;

procedure TParamDef.SetAsString(const AValue: string);
begin

  if (Self = nil) then
    Exit;

  Value := Trim(AValue);
  if WriteImmediate then
    SetValue(AValue);
end;

procedure TParamDef.SetValue(const AValue: string);
begin
  try
    ExecuteCommandParam('BEGIN cc.update_param(:ID, :CODE, :VALUE); END;',
      ['ID;F', 'CODE', 'VALUE'], [FID, FCode, AValue]);
  except
    on E: Exception do
      // cc_rscstr.cTXT0000293 = 'Error updating setting code, %s:'
      raise Exception.CreateFmt(cc_rscstr.cTXT0000293 + #13#13'%s',
        [FCode, E.Message]);
  end;
end;

{ TParamList }

constructor TParamList.Create(ACreditCardAccountID: Int64);
begin
  FParamDefs := nil;
  inherited Create;
  FID := ACreditCardAccountID;
  FParamDefs := TParamDefs.Create(FID);
  FWriteImmediate := True;
  FParamDefs.WriteImmediate := FWriteImmediate;
end;

destructor TParamList.Destroy;
begin
  if Assigned(FParamDefs) then
    FreeAndNil(FParamDefs);
  inherited Destroy;
end;

function TParamList.Param(const Code: string): TParamDef;
var
  i: Integer;
begin
  i := IndexOf(Code);
  if i > - 1 then
    Result := TParamDef(GetObject(i))
  else
    Result := nil;
end;

procedure TParamList.AsNameValues(var AStrings: TStringList);
var
  i: Integer;
begin
  if not Assigned(AStrings) then
    Exit;

  for i := 0 to FParamDefs.Count - 1 do
    AStrings.Add(Format('%s=%s', [FParamDefs[i].Code, FParamDefs[i].Value]));
end;

procedure TParamList.ClearObjects;
var
  i: Integer;
begin
  for i := Count - 1 downto 0 do
    if Assigned(Objects[i]) then
      begin
        TObject(Objects[i]).Free;
        Objects[i] := nil;
      end;
  Clear;
end;

procedure TParamList.SetWriteImmediate(const Value: Boolean);
begin
  FWriteImmediate := Value;
  FParamDefs.WriteImmediate := Value;
end;

procedure TParamList.Update;
begin
  // Gateway-specific settings

  // If the account ID is zero, then exit early.  Do not raise
  // any errors.  The calling form will handle any validation.
  // We simply need to return a valid-yet-empty component.
  if (FID = 0) then
    Exit;

  // Ensure the params are created; this will add new parameters
  // that have been added by later development.
  ExecuteCommandFmt('BEGIN iqms.cc.check_params_created(%d); END;', [FID]);

  try
    BeginUpdate;
    Clear;
    with TFDQuery.Create(nil) do
      try
        Connection := UniMainModule.FDConnection1;
        SQL.Add('SELECT id, code, value, displayname');
        SQL.Add('FROM credit_card_account_dtl');
        SQL.Add(Format('WHERE credit_card_account_id = %d', [FID]));
        SQL.Add('ORDER BY id');
        Open;

        if (BOF and EOF) then
          // 'Credit Card Parameters could not be created.'
          // raise Exception.Create(cc_rscstr.cTXT0000292);
          // Raise error, but not exception because this is called
          // within a constructor
          IQMS.Common.Dialogs.IQError(cc_rscstr.cTXT0000292);

        while not EOF do
          begin
            AddObject(FieldByName('CODE').AsString,
              FParamDefs.Add(FieldByName('CODE').AsString,
              FieldByName('VALUE').AsString));
            Next;
          end;
      finally
        Free;
      end;
  finally
    EndUpdate;
  end;
end;

procedure TParamList.WriteValues;
var
  i: Integer;
begin
  // Writes all values back to the database
  for i := 0 to FParamDefs.Count - 1 do
    FParamDefs.Items[i].SetValue(FParamDefs.Items[i].Value);
end;

end.

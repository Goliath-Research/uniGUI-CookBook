unit IQMS.Common.Mcshare;

interface

uses
  Winapi.Windows,
  System.Classes,
  System.SysUtils,
  Data.DB,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox;

type
  TCurrencyCodeType = (mctChr3, mctDigit3);

const
  CurrencyCodeField: array [TCurrencyCodeType] of string = ('chr3', 'digit3');

const
   iq_MC_Quote_All_Tag    = 0;
   iq_MC_Quote_Qinvt_Tag  = 1;
   iq_MC_Quote_Arinvt_Tag = 2;
   iq_MC_Quote_Att_Tag    = 3;
   iq_MC_Quote_PL_Tag     = 4;

  function IsMultiCurrencyEnabled: Boolean;

  function GetEplantCurrencyID(ACurrencyID: Real; var AFilter: String): Real;
  function GetNativeCurrencyFilter(AEplantID: Real):String;

  function GetEplantNativeCurrencyID: Real;
  procedure AssignEPlantCurrency(ADataSet: TDataSet; AField: TField;
   ATable: String; AID: Real; ALookup: TUniDBLookupComboBox = NIL);

  { GetConversionCurrencyID() returns a CURRENCY.ID to convert a Source
    Currency to a Target Currency.

    Params:
      ASourceCurrencyID = CURRENCY.ID for the foreign currency you want to
                          convert.
      ATargetCurrencyCode = The CURRENCY.CURR_CODE of the target (native) currency
                            you want to convert to.  We don't need a
                            CURRENCY.ID; we just need the CURR_CODE for
                            comparison.
    Example:
     If CURRENCY.ID = 8 for CAD (Canadian Dollars), and you want to get the
     CURRENCY.ID to convert to USD (U.S. Dollars), you would call this:

       AID := GetConversionCurrencyID(8, 'USD');

     You can now use the value to obtain the spot rate.
  }
  function GetConversionCurrencyID(ASourceCurrencyID: Real;
    ATargetCurrencyCode: String = 'USD'): Real;

  // Return for system default values (accounts for EPlant filter)
  function GetDefaultCurrencyCode: String;
  function GetDefaultCurrencyID: Real;
  // Return values for given param
  function GetSpotRate(ACurrencyID: Real): Real;
  function GetCurrencyCode(ACurrencyID: Real): String;
  // Returns the currency ID for the code.
  function GetCurrencyIDForCode(ACode: String): Real; overload; // curr_code = native_code
  function GetCurrencyIDForCode(ACurrencyCode, ANativeCode: String): Real; overload;

  // Returns the ISO description for the currency code
  function GetISOCurrencyDescrip(const ACode: String): String;

  // Returns the ISO, three-character code for the given code.
  // Params:
  //  ACode = may be a three-character code, or a three-digit code.
  function GetISO3CharCurrencyCode(const ACode: String): String;

  /// <summary>Get a valid country code for a country name</summary>
  function CurrencyCodeFor(ACode: string;
    ACurrencyCodeType: TCurrencyCodeType = mctChr3): string;

implementation

uses
  IQMS.Common.DataLib,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.McRscstr;

function IsMultiCurrencyEnabled: Boolean;
begin
  Result := SelectValueAsString('select NVL(MULTICURRENCY,''N'') as MULTICURRENCY ' +
   'from iqsys where rownum < 2') = 'Y';
end;

function GetEplantNativeCurrencyID:Real;
var
  AEplantId:Real;
  AEPlantCurrCode:String;
begin
  Result := 0;
  AEplantId := 0;
  if SecurityManager.EPlantsExist then
    if SecurityManager.EPlant_ID <> 'NULL' then
      AEplantId := StrToFloat(SecurityManager.EPlant_ID);

  if AEplantId <> 0 then
  begin
    AEPlantCurrCode := SelectValueFmtAsString('select native_curr from eplant where id = %f', [AEplantId]);

    Result := SelectValueFmtAsFloat('select id from currency where LTrim(RTrim(curr_code)) = ''%s'' and native_curr = ''%s''',
                      [AEPlantCurrCode, AEPlantCurrCode]);
  end;


  if Result = 0 then
    Result := SelectValueAsFloat('select currency_id from iqsys where rownum < 2')
end;


function GetEplantCurrencyID(ACurrencyID: Real; var AFilter: String):Real;
var
  AEplantId:Real;
  AEPlantCurrCode:String;
  ACorpCurrCode:String;
begin
  AEplantId := 0;
  if SecurityManager.EPlantsExist then
    if SecurityManager.EPlant_ID <> 'NULL' then
      AEplantId := StrToFloat(SecurityManager.EPlant_ID);

  AEPlantCurrCode := SelectValueFmtAsString('select native_curr from eplant where id = %f', [AEplantId]);
  ACorpCurrCode   := SelectValueFmtAsString('select curr_code from currency where id = %f', [ACurrencyID]);

  if AEPlantCurrCode = '' then
    AEPlantCurrCode := ACorpCurrCode;


  if AEPlantCurrCode = ACorpCurrCode then
  begin
    Result := ACurrencyID;
    Exit;
  end;

  Result := SelectValueFmtAsFloat('select id from currency where LTrim(RTrim(curr_code)) = ''%s'' and native_curr = ''%s''',
                      [AEPlantCurrCode, AEPlantCurrCode]);
  AFilter := '';
  if Result = 0 then
    Result := ACurrencyID
  else
    AFilter := AEPlantCurrCode;
end;

function GetNativeCurrencyFilter(AEPlantID:Real):String;
var
  AEPlantFilterID:Real;
begin
  Result := '';
  if AEPlantID <> 0 then
    AEPlantFilterID := AEPlantID
  else
  begin
    AEPlantFilterID := 0;
    if SecurityManager.EPlantsExist then
      if SecurityManager.EPlant_ID <> 'NULL' then
        AEPlantFilterID := StrToFloat(SecurityManager.EPlant_ID);
  end;

  if AEPlantFilterID = 0 then
    Exit;

  Result := SelectValueFmtAsString('select native_curr from eplant where id = %f', [AEPlantFilterID]);
end;

procedure AssignEPlantCurrency(ADataSet: TDataSet; AField: TField;
 ATable: String; AID: Real; ALookup: TUniDBLookupComboBox = NIL);
var
  AVendorCustomer_Currency_id:Real;
  AVendorCustomer_Curr_code:String;
  AEplantId:Real;
  AIqSysCurrencyId:Real;
  AEplantNativeCurr, AIqsysNativeCurr:String;
  ANativeCurrCode:String;
  ACurrency_id:Real;
  ACurrencyCurrCode:Real;
begin
  if not (ADataSet.State in [dsEdit, dsInsert]) then ADataSet.Edit;
  if SelectValueAsString('select NVL(multicurrency, ''N'') from iqsys where rownum < 2') = 'N' then
  begin
    AVendorCustomer_Currency_id := SelectValueFmtAsFloat('select currency_id from %s where id = %f', [ATable, AID]);
    if AVendorCustomer_Currency_id  = 0 then
      AVendorCustomer_Currency_id  := GetEplantNativeCurrencyId;

    if AVendorCustomer_Currency_id <> 0
      then AField.AsFloat := AVendorCustomer_Currency_id;
    exit;
  end;
  AEplantId := 0;
  if SecurityManager.EPlantsExist then
    if SecurityManager.EPlant_ID <> 'NULL' then
      AEplantId := StrToFloat(SecurityManager.EPlant_ID);
  if AEplantId = 0 then
  begin
    AIqSysCurrencyId            := SelectValueAsFloat('select currency_id from iqsys where rownum < 2');
    ANativeCurrCode             := SelectValueFmtAsString('select curr_code from currency where id = %f', [AIqSysCurrencyId]);
    AVendorCustomer_Currency_id := SelectValueFmtAsFloat('select currency_id from %s where id = %f', [ATable, AID]);
    AVendorCustomer_Curr_code   := SelectValueFmtAsString('select curr_code from currency where id = %f', [AVendorCustomer_Currency_id]);
    ACurrency_id := SelectValueFmtAsFloat('select id from currency where LTrim(RTrim(curr_code)) = ''%s'' and native_curr = ''%s''',
                        [AVendorCustomer_Curr_code, ANativeCurrCode]);
    if ACurrency_id <> 0 then
      AField.AsFloat := ACurrency_id
    else
    begin
      ACurrency_id := SelectValueAsFloat('select currency_id from iqsys where rownum < 2');
      if ACurrency_id <> 0 then
        AField.AsFloat := ACurrency_id;
    end;
    Exit;
  end;
  AField.asFloat := GetEplantNativeCurrencyId;

  AIqSysCurrencyId  := SelectValueAsFloat('select currency_id from iqsys where rownum < 2');
  AEplantNativeCurr := SelectValueFmtAsString('select native_curr from eplant where id = %f', [AEplantId]);
  AIqsysNativeCurr  := SelectValueFmtAsString('select curr_code from currency where id = %f', [AIqSysCurrencyId]);

  if AEplantNativeCurr = '' then
    ANativeCurrCode := AIqsysNativeCurr
  else
    ANativeCurrCode := AEplantNativeCurr;

  if ANativeCurrCode = '' then exit;

  AVendorCustomer_Currency_id := SelectValueFmtAsFloat('select currency_id from %s where id = %f', [ATable, AID]);
  AVendorCustomer_Curr_code   := SelectValueFmtAsString('select curr_code from currency where id = %f', [AVendorCustomer_Currency_id]);
  ACurrency_id := SelectValueFmtAsFloat('select id from currency where LTrim(RTrim(curr_code)) = ''%s'' and native_curr = ''%s''',
                      [AVendorCustomer_Curr_code, ANativeCurrCode]);


  if ACurrency_id <> 0 then
    AField.AsFloat := ACurrency_id
  else if AVendorCustomer_Currency_id <> 0
    then AField.AsFloat := AVendorCustomer_Currency_id;

  if Assigned(ALookup) and (ALookup <> nil) then
    //ALookup.DisplayValue := SelectValueFmtAsString('select curr_code from currency where id = %f', [AField.AsFloat]);

end;

function GetConversionCurrencyID(ASourceCurrencyID: Real;
  ATargetCurrencyCode: String = 'USD'): Real;
var
  ACurCode, AFilter :String;
begin
  if ASourceCurrencyID = 0 then Exit;
  if (ATargetCurrencyCode = '') then ATargetCurrencyCode := 'USD';

  // the currency code of the source currency code
  ACurCode := SelectValueFmtAsString('select curr_code from currency where id = %.0f',
   [ASourceCurrencyID]);
  // the currency id of the source currency where the native currency
  // conversion is the base currency code (usually, USD).
  Result := SelectValueFmtAsFloat('select id from currency ' +
   'where native_curr = ''%s'' and curr_code = ''%s'' and rownum < 2',
   [ATargetCurrencyCode, ACurCode]);

  // If we did not find a currency id, then get the native currency id
  if Result = 0 then
     begin
       // the currency code of the system-wide currency
       ACurCode := GetDefaultCurrencyCode; // local function, see below
       // the currency id of the system-wide currency where the conversion
       // code is the base currency code (usually, USD).
       Result := SelectValueFmtAsFloat('select id from currency where native_curr = ''%s'' ' +
        'and curr_code = ''%s'' and rownum < 2',
        [ATargetCurrencyCode, ACurCode]);
     end;
end;

function GetDefaultCurrencyCode: String;
begin
  Result := SelectValueFmtAsString('select curr_code from currency where id = %.0f',
        [GetDefaultCurrencyID]);
end;

function GetDefaultCurrencyID: Real;
begin
  try
     Result := SelectValueAsFloat('select iqms.misc.GetNativeCurrencyId from dual');
  except
     Result := 0;
  end;
end;

function GetSpotRate(ACurrencyID: Real): Real;
begin
  Result := SelectValueFmtAsFloat('select spot_rate from currency where id = %.0f',
   [ACurrencyID]);
end;

function GetCurrencyCode(ACurrencyID: Real): String;
begin
  Result := SelectValueFmtAsString('select curr_code from currency where id = %.0f',
   [ACurrencyID]);
end;

function GetCurrencyIDForCode(ACurrencyCode, ANativeCode: String): Real; overload;
begin
  Result := SelectValueFmtAsFloat('select id from currency where curr_code = ''%s'' and native_curr = ''%s'' ',
   [ACurrencyCode, ANativeCode]);
end;

function GetCurrencyIDForCode(ACode: String): Real;
begin
  Result := GetCurrencyIDForCode(ACode,ACode);
  //Result := SelectValueFmtAsFloat('select id from currency where curr_code = ''%s'' and native_curr = curr_code',
  // [ACode]);
end;

function GetISOCurrencyDescrip(const ACode: String): String;
var
   i: Integer;
begin
  // Initial
  Result := '';
  i := 0;

  // Test to see if this is a 3-digit code.  If it is, then attempt to
  // get the description based on the 3-digit code.
  if System.SysUtils.TryStrToInt(Trim(ACode), i) then
     Result := SelectValueFmtAsString('select descrip ' +
       'from v_currency_codes where digit3 = ''%s'' ',
       [ACode])

  // If this is not an integer, then assume it is the 3-character code,
  // and try to get the description.
  else
     Result := SelectValueFmtAsString('select descrip ' +
       'from v_currency_codes where chr3 = ''%s'' ',
       [ACode]);
end;

function GetISO3CharCurrencyCode(const ACode: String): String;
var
   i: Integer;
begin
  // Initial
  Result := '';
  i := 0;

  // By default, return the passed code; we're only testing for a 3-digit
  // code below.
  Result := ACode;

  // Test to see if this is a 3-digit code.  If it is, then attempt to
  // get the 3-character code based on the 3-digit code.
  if System.SysUtils.TryStrToInt(ACode, i) then
     Result := SelectValueFmtAsString('select chr3 ' +
       'from v_currency_codes where digit3 = ''%s'' ',
       [ACode]);
end;

function CurrencyCodeFor(ACode: string;
  ACurrencyCodeType: TCurrencyCodeType = mctChr3): string;
var
   i: Integer;
   ADigit3, AChr3: string;
begin
  // Initial
  Result := ACode;
  i := 0;

  if Trim(ACode) = '' then
    Exit;

  // Test to see if this is a 3-digit code.  If it is, then attempt to
  // get the 3-character code based on the 3-digit code.
  if System.SysUtils.TryStrToInt(ACode, i) then
    begin
      ADigit3 := ACode;
      if ACurrencyCodeType =  mctDigit3 then
         Exit(ADigit3);
      AChr3 := SelectValueFmtAsString(
        'SELECT chr3 FROM v_currency_codes WHERE TRIM(digit3) = TRIM(''%s'') ',
        [ACode]);
      if ACurrencyCodeType =  mctChr3 then
        Exit(AChr3);
    end
  else
    begin
      AChr3 := ACode;
      if ACurrencyCodeType =  mctChr3 then
         Exit(AChr3);
      ADigit3 := SelectValueFmtAsString(
        'SELECT digit3 FROM v_currency_codes WHERE TRIM(UPPER(chr3)) = TRIM(UPPER(''%s'')) ',
        [AChr3]);
      if ACurrencyCodeType =  mctDigit3 then
        Exit(ADigit3);
    end;
end;

end.

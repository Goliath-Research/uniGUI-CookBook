unit cc_valid;
{ NOTE:  This unit can safely be called by any application.  It does not
  use the credit card components.
}

interface

uses
  Winapi.Windows,
  System.Classes,
  System.SysUtils,
  System.Math,
  System.DateUtils,
  IQMS.EPayment.ValidateIntf,
  cc_types;

{ * Wrappers - Validate a Credit Card *


  Purpose:  Uses simple validation to validate a credit card.


  Params:
  ACardNumber   = Pass the Credit Card number (with or without spaces is fine).
  AExpDate_MMYY = Pass they expiration date using the format, 'MMYY' (i.e., '0108')
  ACardType     = Pass a standard IQMS credit card type string value
  AErrorMsg     = A "var" param that returns the error message, if any
  ARaiseError   = If TRUE, an error message box will display the error;
  otherwise, you can display the error contained in AErrorMsg
  some other way or take a "silent" action on the function
  result.
}
function ValidateCreditCardA(ACardNumber, AExpDate_MMYY,
  ACardType: string; AIsToken: Boolean; var AErrorMsg: string;
  ARaiseError: Boolean = TRUE): Boolean;

{ Params:
  ACardNumber   = Pass the Credit Card number (with or without spaces is fine).
  AExpDate_MMYY = Pass they expiration date using the format, 'MMYY' (i.e., '0108')
  ACardType     = Pass one of the card types as declared in cc_types.pas (i.e., ccVisa).

  AErrorMsg     = A "var" param that returns the error message, if any
  ARaiseError   = If TRUE, an error message box will display the error;
  otherwise, you can display the error contained in AErrorMsg
  some other way or take a "silent" action on the function
  result.
}
function ValidateCreditCardB(ACardNumber, AExpDate_MMYY: string;
  ACardType: TCreditCardType; AIsToken: Boolean; var AErrorMsg: string;
  ARaiseError: Boolean = TRUE): Boolean;

// Returns a possible type, based on the credit card number
function PredictCreditCardType(const ACardNumber: string): TCreditCardType;
function PredictCreditCardTypeStr(const ACardNumber: string): string;
// Returns a credit card number with no spaces
function TrimCreditCardNumber(const ACardNumber: string): string;

// Expiration date
function GetValidMMYY(AValue: string): string;
function ParseMMYY(const AValue: string; var MMYY: string;
  var AMonth, AYear: Integer): Boolean;
procedure GetExpDateParts(const AValue: string; var AMonth, AYear: Integer);
function ValidateExpirationDate(const AMMYY: string; var AMonth: Integer;
  var AYear: Integer; var AModifiedMMYY: string): Boolean;

{ TCreditCardValidate }

type

  TCardValidationExceptionCode = (pInvalidExpirationDate, pInvalidCardType,
    pInvalidCardNumber, pNullCardNumber, pNullExpirationDate);

  ECardValidationException = class(Exception)
  public
    Code: TCardValidationExceptionCode;
  end;

  TCreditCardValidate = class(TInterfacedObject, IEPaymentValidate)
  private
    FCreditCardNumber: string;
    FCreditCardType: TCreditCardType;
    FExpDateMonth, FExpDateYear: Integer;
    CardValidationException: ECardValidationException;
    FIsToken: Boolean;
    procedure _PredictCardType(var ACardTypes: TCreditCardTypes);
    // returns possible vendors for this card
    function _HasPrefix(const S: string; const APfx: array of string)
      : Boolean;
    procedure SetCreditCardNumber(const Value: string);
    procedure SetExpDateYear(const Value: Integer);
    procedure SetExpDateMonth(const Value: Integer);
    procedure SetIsToken(const Value: Boolean);
    procedure SetCreditCardType(const Value: TCreditCardType);
  public
    // Validation
    function Validate: Boolean; // checks for the basic credit card format

    // Specific validation
    function ValidateCardType: Boolean;
    function ValidateNumberFormat: Boolean;
    function ValidateExpDate: Boolean;

    // Additional methods
    procedure SetExpirationDate(const AMonth, AYear: Integer);
    // quick set of the date
    procedure DoSetExpirationDate(const MMYY: string);
    function DefaultCardType: TCreditCardType;
    function GetLastError(var AMsg: string): Integer;
  published
    // Credit Card properties that must be supplied
    property CreditCardNumber: string read FCreditCardNumber
      write SetCreditCardNumber;
    property CreditCardType: TCreditCardType read FCreditCardType
      write SetCreditCardType;
    property ExpirationMonth: Integer read FExpDateMonth
      write SetExpDateMonth;
    property ExpirationYear: Integer read FExpDateYear write SetExpDateYear;
    property IsToken: Boolean read FIsToken write SetIsToken;
  end;

implementation

uses
  cc_rscstr,
  IQMS.Common.Dates,
  IQMS.Common.Dialogs,
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils;

function ValidateCreditCardA(ACardNumber, AExpDate_MMYY,
  ACardType: string; AIsToken: Boolean; var AErrorMsg: string;
  ARaiseError: Boolean): Boolean;
var
  AErrCardType,
    AErrCardNum,
    AErrExpDate: Boolean;
  ACreditCardValidate: IEPaymentValidate;
begin
  Result := FALSE;
  AErrorMsg := ''; // initialize
  ACreditCardValidate := TCreditCardValidate.Create;
  with TCreditCardValidate(ACreditCardValidate) do // cc_valid.pas
    begin
      // Apply basic card values that are used for validation
      CreditCardNumber := ACardNumber;
      IsToken := AIsToken;
      CreditCardType := cc_types.GetCardType(ACardType);
      // sets the expiration date based on mask
      DoSetExpirationDate(AExpDate_MMYY);
      Result := Validate;
      if not Result then
        begin
          if (GetLastError(AErrorMsg) = - 1) then
            AErrorMsg := cc_rscstr.cTXT0000020; // 'Invalid credit card.';
          if ARaiseError and (AErrorMsg > '') then
            IQError(AErrorMsg);
        end;
    end;
end;

function ValidateCreditCardB(ACardNumber, AExpDate_MMYY: string;
  ACardType: TCreditCardType; AIsToken: Boolean; var AErrorMsg: string;
  ARaiseError: Boolean): Boolean;
var
  AErrCardType,
    AErrCardNum,
    AErrExpDate: Boolean;
  ACreditCardValidate: IEPaymentValidate;
begin
  Result := FALSE;
  AErrorMsg := ''; // initialize

  ACreditCardValidate := TCreditCardValidate.Create;
  with TCreditCardValidate(ACreditCardValidate) do // cc_valid.pas
    begin
      // Apply basic card values that are used for validation
      CreditCardNumber := ACardNumber;
      IsToken := AIsToken;
      CreditCardType := ACardType;
      // NOTE: Card Types are declared in cc_types.pas
      DoSetExpirationDate(AExpDate_MMYY);
      // sets the expiration date based on mask

      Result := Validate;

      if not Result then
        begin
          if (GetLastError(AErrorMsg) = - 1) then
            AErrorMsg := cc_rscstr.cTXT0000020; // 'Invalid credit card.';
          if ARaiseError and (AErrorMsg > '') then
            IQError(AErrorMsg);
        end;
    end;
end;

function PredictCreditCardType(const ACardNumber: string): TCreditCardType;
var
  ACreditCardValidate: IEPaymentValidate;
begin
  Result := ccUnknown;
  ACreditCardValidate := TCreditCardValidate.Create;
  with TCreditCardValidate(ACreditCardValidate) do // cc_valid.pas
    begin
      CreditCardNumber := ACardNumber;
      Result := DefaultCardType;
    end;
end;

function PredictCreditCardTypeStr(const ACardNumber: string): string;
var
  o: TCreditCardType;
begin
  Result := '';
  o := PredictCreditCardType(ACardNumber);
  if (o <> TCreditCardType(0)) then
    Result := CardTypeName[o];
end;

function TrimCreditCardNumber(const ACardNumber: string): string;
var
  ACreditCardValidate: IEPaymentValidate;
begin
  Result := ''; // default
  ACreditCardValidate := TCreditCardValidate.Create;
  with TCreditCardValidate(ACreditCardValidate) do
    begin
      CreditCardNumber := ACardNumber;
      Result := CreditCardNumber; // removes extra characters
    end;
end;

{ TCreditCardValidate }

procedure TCreditCardValidate._PredictCardType(var ACardTypes
  : TCreditCardTypes);
var
  S: string;
  L: Integer;
begin
  // NOTE: If more than one card matches the pattern, be sure to list the
  // most common card type first.  This allows a "default" match to
  // be made if the developer calls this method directly to pre-populate
  // the credit card type field.
  S := CreditCardNumber;
  L := Length(S);

  // Visa
  if _HasPrefix(S, ['4']) and (L in [13, 16]) then
    ACardTypes := [ccVisa, ccDelta]

    // MasterCard
  else if _HasPrefix(S, ['51', '52', '53', '54', '55']) and (L = 16) then
    ACardTypes := [ccMasterCard, ccEuroCard]

    // Maestro
    // 5018, 5020, 5038, 5612, 5893, 6304, 6759, 6761, 6762, 6763, 0604, 6390
  else if _HasPrefix(S, ['5018', '5020', '5038', '5612', '5893', '6304', '6759',
    '6761', '6762', '6763', '0604', '6390']) and (L in [12 .. 19]) then
    ACardTypes := [ccMaestro]

    // American Express
  else if _HasPrefix(S, ['34', '37']) and (L = 15) then
    ACardTypes := [ccAmex]

    // Discover
    // 05/06/2014 http://en.wikipedia.org/wiki/Bank_card_number
    // 6011, 622126-622925, 644-649, 65
  else if _HasPrefix(S, ['6011', '622', '644', '645', '646', '647', '648',
    '649', '6541', '6556', '65']) and (L = 16) then
    ACardTypes := [ccDiscover]

    // BankCard is not longer valid
    // else if _HasPrefix(S, ['560', '561']) and (L = 16) then
    // ACardTypes := [ccBankCard]

    // Diners Club
  else if _HasPrefix(S, ['36', '38', '300', '301', '302', '303', '304', '305',
    '309', '36', '38', '39'])
    and (L = 14) then
    ACardTypes := [ccDinersClub, ccCartBlanche]

    // Enroute is not longer valid
    // else if _HasPrefix(S, ['2014', '2149']) and (L = 15) then
    // ACardTypes := [ccEnroute]

    // JCB
    // 3528-3589
  else if (_HasPrefix(S, ['35']) and (L = 16)) or
    (_HasPrefix(S, ['2131', '1800']) and (L = 15)) then
    ACardTypes := [ccJCB]

    // Unknown
  else
    ACardTypes := [];

  // Gateway Validation Test Cards.
  // These are valid for testing, even though they may not pass inspection.
  // 09/26/2008
  if (CompareText(S, '5000300020003003') = 0) then
    ACardTypes := [ccMasterCard];
  // 05/08/2014 FirstData
  if (CompareText(S, '6510000001111111') = 0) or
    (CompareText(S, '36185900055556') = 0) or
    (CompareText(S, '36185900066660') = 0) or
    (CompareText(S, '36185900077774') = 0) or
    (CompareText(S, '36185900099992') = 0) then
    ACardTypes := [ccDiscover];

end;

function TCreditCardValidate.DefaultCardType: TCreditCardType;
var
  ACardTypes: TCreditCardTypes;
begin
  if CreditCardNumber = '' then
    // raise Exception.Create(cc_rscstr.cTXT0000017 {'Credit Card number required.'});
    Exit;
  _PredictCardType(ACardTypes);
  if ccVisa in ACardTypes then
    Result := ccVisa
  else if ccMasterCard in ACardTypes then
    Result := ccMasterCard
  else if ccAmex in ACardTypes then
    Result := ccAmex
  else if ccDiscover in ACardTypes then
    Result := ccDiscover
  else if ccBankCard in ACardTypes then
    Result := ccBankCard
  else if ccDinersClub in ACardTypes then
    Result := ccDinersClub
  else if ccEnroute in ACardTypes then
    Result := ccEnroute
  else if ccJCB in ACardTypes then
    Result := ccJCB
  else
    Result := ccUnknown;
end;

function TCreditCardValidate.Validate: Boolean;
begin
  Result := FALSE;

  // Ensure that a card has been provided before continuing
  if CreditCardNumber = '' then
    begin
      // raise Exception.Create('Credit Card number required.');
      CardValidationException := ECardValidationException.Create
        (cc_rscstr.cTXT0000017 { 'Credit Card number required.' } );
      CardValidationException.Code := pNullCardNumber;
      Exit;
    end;

  if (FExpDateMonth = 0) or (FExpDateYear = 0) then
    begin
      CardValidationException := ECardValidationException.Create
        (cc_rscstr.cTXT0000019 { 'Expiration date required.' } );
      CardValidationException.Code := pNullExpirationDate;
      Exit;
    end;

  // Check the expiration date
  Result := ValidateExpDate;
  if not Result then
    begin
      CardValidationException := ECardValidationException.Create
        (cc_rscstr.cTXT0000028 { 'Invalid card expiration date.' } );
      CardValidationException.Code := pInvalidExpirationDate;
      Exit;
    end;

  if not FIsToken then
    begin
      Result := ValidateCardType;
      if not Result then
        begin
          // cc_rscstr.cTXT0000029 =
          // 'Invalid card type.  The card type does not match the credit card number.'
          CardValidationException := ECardValidationException.Create
            (cc_rscstr.cTXT0000029);
          CardValidationException.Code := pInvalidCardType;
          Exit;
        end;
    end;

  // Check the format/structure of the card number
  if not FIsToken then
    begin
      Result := ValidateNumberFormat;
      if not Result then
        begin
          CardValidationException := ECardValidationException.Create
            (cc_rscstr.cTXT0000030 { 'Invalid credit card number.' } );
          CardValidationException.Code := pInvalidCardNumber;
          Exit;
        end;
    end;

  if Result and Assigned(CardValidationException) then
    FreeAndNil(CardValidationException);

end;

function TCreditCardValidate._HasPrefix(const S: string;
  const APfx: array of string): Boolean;
var
  i, x: Integer;
begin
  for i := 0 to high(APfx) do
    begin
      x := Length(APfx[i]);
      Result := LeftStr(S, x) = APfx[i];
      if Result then
        Exit;
    end;
end;

function TCreditCardValidate.ValidateExpDate: Boolean;
var
  AYear, AMonth, ADay: Word;
begin
  Result := FALSE;
  if CreditCardNumber = '' then
    Exit;
  AMonth := MonthOf(Date);
  AYear := YearOf(Date);

  if FExpDateYear > AYear then
    Result := TRUE
  else if FExpDateYear < AYear then
    Result := FALSE
  else if FExpDateYear = AYear then
    Result := AMonth <= FExpDateMonth;
end;

function TCreditCardValidate.ValidateCardType: Boolean;
var
  AValidCardTypes: TCreditCardTypes;
begin
  Result := FALSE;
  if CreditCardNumber = '' then
    Exit;

  // The Card Type has been supplied; evaluate it:
  if (CreditCardType <> ccUnknown) then
    begin
      _PredictCardType(AValidCardTypes);
      Result := (FCreditCardType in AValidCardTypes);
    end
    // The Card Type not supplied; determine the default type:
  else
    begin
      // Populate with default card type
      CreditCardType := DefaultCardType;
      // If the Credit Card type still cannot be determined, then exit early
      Result := (CreditCardType <> ccUnknown);
    end;

end;

function TCreditCardValidate.ValidateNumberFormat: Boolean;
var
  i, AWt, ANum, AWtVal: Integer;
  S: string;
  AWeights: array of Integer;
begin
  // *** If the basic numbers are provided, check the account structure *** //
  // If a charge card has an even number(16 digit card number) of digits,
  // the first digit has a weight of 2, otherwise the digit has weight of 1.
  // In the next loop, the weights of the digits alternate 1,2,1,2.
  Result := FALSE;
  S := CreditCardNumber;
  if S = '' then
    Exit;
  AWt := iIIf(Odd(Length(S)), 1, 2); // iqnumber
  SetLength(AWeights, 0); // initialize array
  // Multiply each digit in the credit card by its "weight".
  for i := 1 to Length(S) do
    begin
      if not IsStringValidInteger(S[i], ANum) then
        CONTINUE;
      AWtVal := Trunc(ANum * AWt);
      // If any digit has a weighted value that is more than 9, Subtract 9.
      if AWtVal > 9 then
        AWtVal := AWtVal - 9;
      SetLength(AWeights, Length(AWeights) + 1);
      AWeights[high(AWeights)] := AWtVal;
      AWt := iIIf(AWt = 2, 1, 2); // alternate the value
    end;

  // Add together the weights of all the digits, modulo 10.
  // The result should be zero for a valid credit card.
  Result := (Trunc(SumInt(AWeights) mod 10)) = 0;

end;

procedure TCreditCardValidate.SetCreditCardNumber(const Value: string);
const
  cValidChar = ['0' .. '9'];
var
  i: Integer;
  S: string;
begin
  for i := 1 to Length(Value) do
    if Value[i] in cValidChar then
      S := S + Value[i];
  FCreditCardNumber := S;
end;

procedure TCreditCardValidate.SetCreditCardType(const Value: TCreditCardType);
begin
  FCreditCardType := Value;
end;

procedure TCreditCardValidate.SetExpirationDate(const AMonth, AYear: Integer);
begin
  ExpirationMonth := AMonth;
  ExpirationYear := AYear;
end;

procedure TCreditCardValidate.SetExpDateYear(const Value: Integer);
begin
  FExpDateYear := IQMS.Common.Dates.FullYear(Value);
end;

procedure TCreditCardValidate.SetIsToken(const Value: Boolean);
begin
  FIsToken := Value;
end;

procedure TCreditCardValidate.SetExpDateMonth(const Value: Integer);
begin
  FExpDateMonth := 0; // initial
  if not Value in [1 .. 12] then
    Exit;
  // raise Exception.CreateFmt('Invalid Expiration Month: %d (1 to 12).',[Value]);
  FExpDateMonth := Value;
end;

function TCreditCardValidate.GetLastError(var AMsg: string): Integer;
begin
  AMsg := '';
  Result := - 1;
  if Assigned(CardValidationException) then
    begin
      AMsg := CardValidationException.Message;
      Result := Ord(CardValidationException.Code);
    end;
end;

procedure TCreditCardValidate.DoSetExpirationDate(const MMYY: string);
var
  AMMYY: string;
  AMonth, AYear: Integer;
begin
  ParseMMYY(MMYY, AMMYY, AMonth, AYear); // cc_share
  ExpirationMonth := AMonth;
  ExpirationYear := AYear;
end;

function ParseMMYY(const AValue: string; var MMYY: string;
  var AMonth, AYear: Integer): Boolean;
var
  S: string;
begin
{$WARN UNSAFE_CAST OFF}
  Result := FALSE;
  MMYY := AValue;
  MMYY := StrTran(MMYY, '/', '');
  MMYY := StrTran(MMYY, '|', '');
  MMYY := StrTran(MMYY, '\', '');
  MMYY := StrTran(MMYY, '-', '');
  MMYY := StrTran(MMYY, FormatSettings.DateSeparator, '');
  if (Length(MMYY) = 4) then
    begin
      S := Copy(MMYY, 1, 2);
      if not IQMS.Common.Numbers.IsStringValidInteger(S, AMonth) then
        Exit;
      S := Copy(MMYY, 3, 4);
      if not IQMS.Common.Numbers.IsStringValidInteger(S, AYear) then
        Exit;
      MMYY := FormatFloat('00', AMonth) + FormatSettings.DateSeparator +
        FormatFloat('00', AYear);
      Result := TRUE;
    end
  else
    Result := FALSE;
{$WARN UNSAFE_CAST ON}
end;

function GetValidMMYY(AValue: string): string;
var
  AMonth, AYear: Integer;
begin
  if not ParseMMYY(AValue, Result, AMonth, AYear) then
    Result := AValue;
end;

procedure GetExpDateParts(const AValue: string; var AMonth, AYear: Integer);
var
  tmp: string;
begin
  ParseMMYY(AValue, tmp, AMonth, AYear);
end;

function ValidateExpirationDate(const AMMYY: string; var AMonth: Integer;
  var AYear: Integer; var AModifiedMMYY: string): Boolean;
var
  ACurMonth, ACurYear: Integer;
begin
  Result := FALSE;
  // Get the expiration date parts.  If we can't get the parts,
  // then something went wrong; raise the error.
  if not ParseMMYY(AMMYY, AModifiedMMYY, AMonth, AYear) then
    // 'Invalid expiration date.'
    raise Exception.Create(cc_rscstr.cTXT0000185);
  // Get values that will be used to help determine if the
  // card has expired.
  // 1.) Get the current month and year
  ACurMonth := System.DateUtils.MonthOf(Date);
  ACurYear := System.DateUtils.YearOf(Date);
  // 2.) Get the full, card expiration year
  AYear := IQMS.Common.Dates.FullYear(AYear); // IQMS.Common.Dates.pas
  // Now, evaluate date
  if AYear > ACurYear then
    Result := TRUE
  else if AYear < ACurYear then
    Result := FALSE
  else if AYear = ACurYear then
    Result := AMonth >= ACurMonth;
  if not Result then
    // 'Invalid expiration date.'
    raise Exception.Create(cc_rscstr.cTXT0000185);
end;

end.

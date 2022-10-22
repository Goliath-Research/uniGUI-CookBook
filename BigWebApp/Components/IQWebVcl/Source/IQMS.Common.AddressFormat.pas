unit IQMS.Common.AddressFormat;

{  *** Address Formatter ***

   This component formats an address.  After supplying the necessary
   address parts to the component properties, call Execute() to
   generate a string list address in the sequence and format appropriate
   to the target country.

   Example:

   uses
       AddressFormat;
   ...

   with TAddressFormatter.Create(NIL) do
   try
      ContactName := 'Byron Upchurch';
      ContactTitle := 'Developer';
      Company := 'IQMS';
      Address1 := '2231 Wisteria Ln';
      City := 'Paso Robles';
      StateRegionOrProvince := 'CA';
      PostalCode := '93446';
      Country := 'United States of America';
      Execute;
      Memo1.Text := Formatted.Text;
   finally
      Free;
   end;


}

interface

uses
  Winapi.Windows, Vcl.Forms, System.Classes, Vcl.Controls, System.Variants,
  System.SysUtils, MaskUtils;

type
  Binary = 0..1;
  String02 = String[2];
  String03 = String[3];

  { TAddressFormatter }
  TIQWebAddressFormatter = class(TComponent)
  private
    {Private declarations}
    FContactName: ShortString;
    FContactTitle: ShortString;
    FCompany: ShortString;
    FAddress1: ShortString;
    FAddress2: ShortString;
    FAddress3: ShortString;
    FCity: ShortString;
    FState: ShortString;
    FPostalCode: ShortString;
    FCountry: ShortString;
    FCountryCode: String02;
    FCountry3ChrCode: String03;
    FCountry3DigitCode: String03;
    FCountry3DigitCodeAsInteger: Integer;
    FAddressFormat: Binary;
    FLines: TStringList;
    FAllCaps: Boolean;
    FCountryExpected: Boolean;
    FIncludeCountry: Boolean;
    procedure UpdateCountryCodes;
    procedure SetCountry(const Value: ShortString);
    procedure SetCountry3DigitCode(const Value: String03);
    procedure SetCountryCode(const Value: String02);
  protected
    {Protected declarations}
  public
    {Public declarations}
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
    procedure Execute;
    function FormattedCityStatePostalCode: String;
    function FormattedPostalCode: String;
  published
    {Published declarations}
    property ContactName: ShortString read FContactName write FContactName;
    property ContactTitle: ShortString read FContactTitle write FContactTitle;
    property Company: ShortString read FCompany write FCompany;
    property Address1: ShortString read FAddress1 write FAddress1;
    property Address2: ShortString read FAddress2 write FAddress2;
    property Address3: ShortString read FAddress3 write FAddress3;
    property City: ShortString read FCity write FCity;
    property StateRegionOrProvince: ShortString read FState write FState;
    property PostalCode: ShortString read FPostalCode write FPostalCode;
    property Country: ShortString read FCountry write SetCountry;
    property CountryCode: String02 read FCountryCode write SetCountryCode;
    property CountryCode3Digit: String03 read FCountry3DigitCode write SetCountry3DigitCode;
    property AllCaps: Boolean read FAllCaps write FAllCaps;

    // Although a country code may be supplied, this determines whether the
    // country is included in the output.
    property IncludeCountry: Boolean read FIncludeCountry write FIncludeCountry;

    property Formatted: TStringList read FLines;
end;


  function GetFormattedCityStatePostalCode(
   const ACountryCode2Char: String02;
   const ACity, AState, APostalCode: String): String;

  function GetFormattedPostalCode(const ACountryCode2Char: String02;
   const APostalCode: String): String;


implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.StringUtils;

function GetFormattedCityStatePostalCode(
 const ACountryCode2Char: String02;
 const ACity, AState, APostalCode: String): String;
begin
  with TIQWebAddressFormatter.Create(NIL) do
  try
     CountryCode := ACountryCode2Char;
     City :=  ACity;
     StateRegionOrProvince := AState;
     PostalCode := APostalCode;
     Result := FormattedCityStatePostalCode;
  finally
     Free;
  end;
end;

function GetFormattedPostalCode(const ACountryCode2Char: String02;
 const APostalCode: String): String;
begin
  with TIQWebAddressFormatter.Create(NIL) do
  try
     CountryCode := ACountryCode2Char;
     PostalCode := APostalCode;
     Result := FormattedPostalCode;
  finally
     Free;
  end;
end;


{ TIQWebAddressFormatter }

constructor TIQWebAddressFormatter.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FLines := TStringList.Create;
  FAddressFormat := 0;
  FAllCaps := False;
  FCountryExpected := False;
  FIncludeCountry := True;
end;

destructor TIQWebAddressFormatter.Destroy;
begin
  if Assigned(FLines) then FreeAndNil(FLines);
  inherited Destroy;
end;

procedure TIQWebAddressFormatter.Execute;

  procedure _Eval(const AValue: String);
  begin
    if Trim(AValue) > '' then
       begin
         if FAllCaps then
            FLines.Add(UpperCase(Trim(AValue)))
         else
            FLines.Add(Trim(AValue));
       end;
  end;

begin
  FLines.Clear;

  if FCountryExpected and
     (FCountry = '') then
     raise Exception.Create('Invalid Country or Country Code.');

  { Examples:

    P.O. Boxes are treated this way:
     Name
     P.O. Box 12
     123  Bingo St
     Los Angeles, CA 90230

    Swiss Address:
     Skandifinanz Bank AG
     Münsterhof 13
     Postfach
     8022 Zürich
     Switzerland

   }

  _Eval(FContactName);
  _Eval(FContactTitle);
  _Eval(FCompany);
  _Eval(FAddress1);
  _Eval(FAddress2);
  _Eval(FAddress3);
  _Eval(FormattedCityStatePostalCode);
  if FIncludeCountry then _Eval(FCountry);

end;

procedure TIQWebAddressFormatter.UpdateCountryCodes;
var
   AData: Variant;
   ADefault: Boolean;
begin
   if not EnsureConnectionExists then
      Exit;

   AData := SelectValueArrayFmt(
    'select default_spelling, chr2, chr3, digit3 '#13 +
    'from v_country_codes '#13 +
    'where country = trim(upper(''%s''))',
    [FCountry]);

   if System.Variants.VarArrayDimCount(AData) > 0 then
      begin
        ADefault := AData[0] = 'Y';
        FCountryCode := AData[1];
        FCountry3ChrCode := AData[2];
        FCountry3DigitCode := AData[3];
        FCountry3DigitCodeAsInteger := 0; // initial
        System.SysUtils.TryStrToInt(FCountry3DigitCode, FCountry3DigitCodeAsInteger);
      end;
end;

function TIQWebAddressFormatter.FormattedCityStatePostalCode: String;
var
   APostalCode: String; // used for checking format
begin

  // Initialize
  Result := '';

  APostalCode := FormattedPostalCode;

  case FAddressFormat of
   0: // standard (USA)
    begin
      // Example:  Paso Robles, CA 93446
      if (Trim(FCity) > '') and (Trim(FState) > '') then
         Result := Trim(Format('%s, %s %s', [Trim(FCity),Trim(FState),Trim(APostalCode)]))
      else if (Trim(FCity) > '') and (Trim(FState) = '') then
         Result := Trim(Format('%s %s', [Trim(FCity),Trim(APostalCode)]))
      else if (Trim(FState) > '') and (Trim(FCity) = '') then
         Result := Trim(Format('%s %s', [Trim(FState),Trim(APostalCode)]))
      else Result := Trim(APostalCode);
    end;
   1: // international (non-USA)
    begin
      // Example: Postal Code City State
      // No commas, so this is simple to concatenate.
      Result := Trim(Format('%s %s %s', [Trim(APostalCode),Trim(FCity),Trim(FState)]));
      Result := StringReplace(Result, '  ' {double}, ' ' {single},
       [rfReplaceAll, rfIgnoreCase]);
    end;
  end;
end;

function TIQWebAddressFormatter.FormattedPostalCode: String;
var
   AAlphaNum: String;
begin
  // Get alpha-numeric characters only
  AAlphaNum := AlphaNumeric(FPostalCode);

  case FCountry3DigitCodeAsInteger of
   840: // US
     begin
       if Length(AAlphaNum) = 5 then
          Result := AAlphaNum
       else if Length(AAlphaNum) = 9 then
          Result := MaskUtils.FormatMaskText('00000-0000;0',AAlphaNum)
       else
          Result := FPostalCode;
     end;
   248: // ALAND ISLANDS
     begin
       Result := MaskUtils.FormatMaskText('00-00000;0',AAlphaNum);
       //AX-22100
     end;
  else
     Result := FPostalCode;
  end;
end;

procedure TIQWebAddressFormatter.SetCountry(const Value: ShortString);
const
  AFormat2Array: array[0..44] of SmallInt =
     (016, // American Samoa
      036, // Australia
      048, // Bahrain
      050, // Bangladesh
      060, // Bermuda
      096, // Brunei Darussalam
      116, // Cambodia
      124, // Canada
      184, // Cook Islands
      826, // Great Britain
      316, // Guam
      831, // Guernsey
      344, // Hong Kong
      356, // India
      360, // Indonesia
      372, // Ireland
      392, // Japan
      832, // Jersey
      400, // Jordan
      422, // Lebanon
      426, // Lesotho
      462, // Maldives
      470, // Malta
      580, // Mariana Islands
      584, // Marshall Islands
      583, // Micronesia
      496, // Mongolia
      524, // Nepal
      554, // New Zealand
      566, // Nigeria
      574, // Norfolk Island
      586, // Pakistan
      585, // Palau
      598, // Papua New Guinea
      630, // Puerto Rico
      682, // Saudi Arabia
      702, // Singapore
      710, // South Africa
      410, // Republic of Korea (South Korea)
      158, // Taiwan
      764, // Thailand
      840, // United States of America
      862, // Venezuela
      704, // Vietnam
      850); // Virgin Islands, U.S.

   function _EvalFormat2: Boolean;
   var
      i: Integer;
   begin
      Result := False;
      for i := Low(AFormat2Array) to High(AFormat2Array) do
       if FCountry3DigitCodeAsInteger = AFormat2Array[i] then
          begin
            Result := True;
            Break;
          end;
   end;

begin
  FCountry := Value;
  FCountryExpected := True;

  UpdateCountryCodes;

  // Set the address format
  if _EvalFormat2 then
     FAddressFormat := 0
  else
     FAddressFormat := 1;
end;

procedure TIQWebAddressFormatter.SetCountry3DigitCode(const Value: String03);
begin
  FCountry3DigitCode := Value;
  FCountryExpected := True;

  if EnsureConnectionExists then
     begin
       Country := SelectValueFmtAsString('select country ' +
         'from v_country_codes ' +
         'where digit3 = ''%s''', [Value]);
     end;
end;

procedure TIQWebAddressFormatter.SetCountryCode(const Value: String02);
begin
  FCountryCode := Value;
  FCountryExpected := True;

  if EnsureConnectionExists then
     begin
       Country := SelectValueFmtAsString('select country ' +
         'from v_country_codes ' +
         'where chr2 = ''%s''', [Value]);
     end;
end;

end.

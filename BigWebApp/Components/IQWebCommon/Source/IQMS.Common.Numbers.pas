unit IQMS.Common.Numbers;

interface

uses
  IQMS.Common.DataConst, Vcl.Graphics, System.Variants, System.Types, Data.FmtBcd;

function IQFormatFloat(Value:Extended; Digits: Integer):Real;

function iMin(a,b :Real):Integer;
function iMax(a,b :Real):Integer;
function fMin(a,b :Real):Real;
function fMax(a,b :Real):Real;


function iIIf( Cond:Boolean; a,b:Real):Integer;
function bcdIIF( Cond:Boolean; aTrue, aFalse: TBCD):TBCD;
function fIIf( Cond:Boolean; a,b:Real):Real;
function sIIf( Cond:Boolean; const a,b:string):string;
function cIIf( Cond:Boolean; a,b:TColor):TColor;
function bIIf( Cond:Boolean; aTrue, aFalse:Boolean):Boolean;
function  IIf( Cond:Boolean; aTrue, aFalse: Variant ): Variant;


function MoneyToStr ( AValue : Real ):string;
function LMoneyToStr( AValue : Real; Width:Integer ):string;
function FloatToStr2( AValue : Real ):string;

function SignOf( X: Extended): Integer;
function IQRoundEx( X: Extended; D: Integer = 0 ): Extended;
function Nearest(const AValue: Extended; const ADigit: Integer): Integer;
function RoundUp(const AValue: Extended; ADigit: Integer): Integer;
function RoundDown(const AValue: Extended; ADigit: Integer): Integer;

function DtoF( AValue: Double ):Real;
function StoF( S: string; ADefault: Real = 0 ): Real;
function IntToAnsiStr(X: Integer; Width: Integer = 0): AnsiString;
function FloatToAnsiStr(X: Extended; Width: Integer = 0; Decimals: Integer = 0): AnsiString; overload;
function FloatToAnsiStr(X: Double; Width: Integer = 0; Decimals: Integer = 0): AnsiString; overload;
function FloatToAnsiStr(X: Single; Width: Integer = 0; Decimals: Integer = 0): AnsiString; overload;

function ValueInList( AValue: Real; const AList: array of Real ): Boolean; overload;
function ValueInList( AValue: Integer; const AList: array of Integer ): Boolean; overload;
function ValueInList( AValue: Int64; const AList: array of Int64 ): Boolean; overload;


/// <summary>  Use strict numeric comparison to determine if a value is less
/// than a target value.
/// <summary>
/// <param name="AValue">Value to compare. Determine whether this value is
/// less than the target.
/// </param>
/// <param name="ATarget">Basis for the comparison.
/// </param>
function LessThan(AValue, ATarget: Real): Boolean;

/// <summary>  Use strict numeric comparison to determine if a value is less
/// than or equal to a target value.
/// <summary>
/// <param name="AValue">Value to compare. Determine whether this value is
/// less than or equal to the target.
/// </param>
/// <param name="ATarget">Basis for the comparison.
/// </param>
function LessThanOrEqualTo(AValue, ATarget: Real): Boolean;

/// <summary>  Use strict numeric comparison to determine if a value is greater
/// than a target value.
/// <summary>
/// <param name="AValue">Value to compare. Determine whether this value is
/// greater than the target.
/// </param>
/// <param name="ATarget">Basis for the comparison.
/// </param>
function GreaterThan(AValue, ATarget: Real): Boolean;

/// <summary>  Use strict numeric comparison to determine if a value is greater
/// than or equal to a target value.
/// <summary>
/// <param name="AValue">Value to compare. Determine whether this value is
/// greater than or equal to the target.
/// </param>
/// <param name="ATarget">Basis for the comparison.
/// </param>
function GreaterThanOrEqualTo(AValue, ATarget: Real): Boolean;

/// <summary> Use strict numeric comparison to determine if two values are
/// equal.
/// </summary>
function EqualsValue(AValue1, AValue2: Real): Boolean;

function IsBetween( AValue: Real; AStart, AEnd: Real ): Boolean;
function IsStringValidInteger( S: String; var Value: Integer): Boolean;
function IsStringValidInt64( S: String; var Value: Int64): Boolean;
function IsStringValidFloat( S: String; var Value: Real ): Boolean; overload;
function IsStringValidFloat( S: String; var Value: Double ): Boolean; overload;
function IsStringValidFloat( S: String; var Value: Extended ): Boolean; overload;


{IsNumeric()
   Returns True if the char value is a valid numeric; meaning, the character
   is part of a numeric string. It may include a negative sign, a decimal
   character or a thousands separator. Additional parameters allow you to
   control what is to be considered "valid."
   Usage examples:
     - Evaluate key strokes in an edit control.
     - Loop characters in a string to determine whether each Char may be used
     in a number. }
function IsNumeric(const C: Char;
                   const AllowNegative: Boolean = True;
                   const AllowBackSpace: Boolean = True): Boolean;

// converts a variant (i.e., OleStr) to a type
function VarToFloat(const AVariantIN: Variant): Double;
function NullIfZero(const AValue: Real): Variant;

// Returns the Tax Rate used.  Provide the total amount, including
// the tax, and provide the tax amount.  The tax percentage
// is returned.
function GetTaxRateApplied(const ATotalAmount, ATaxAmount: Real): Real;

// Hex
function HexToInt(S: String): LongWord;

function isInt ( n : Real ) : boolean;
function isFloat( n : Real ) : boolean;

function RoundToStr( AValue : Double; Decimal:Integer ):string;
function IQRound( AValue : Double; Decimal:Integer ):Real;



const
  NEGATIVE = '-';
  NUMERICS = ['0'..'9'];
  BACKSPACE = #8;
  EPSILON_PARAM: Double = 0;

implementation

uses
  System.SysUtils,
  System.Math,
  StrUtils,
  IQMS.Common.NLS;

{$REGION 'Internal methods'}

function TryStripThousandSeparator(const S: string; var AValue: string): Boolean;
const
  cValidChar = ['0' .. '9', '-' { Negative sign } ];
var
  i: Integer;
begin
  // Initialization
  Result := True;
  AValue := '';

  // Exit early if we have nothing to analyze
  if (Trim(S) = '') then
    Exit(False);

  // Get a floating point value that does not have the thousand separator
  for i := 1 to Length(S) do
  begin
    // Skip the thousands separator
    if (S[i] = FormatSettings.ThousandSeparator) then
      Continue;

    // Build a floating point value
    if (S[i] in cValidChar) or
      (S[i] = FormatSettings.DecimalSeparator) then
      AValue := AValue + S[i]
    else
      Exit(False);
  end;
end;

{$ENDREGION 'Internal methods'}

function IQFormatFloat(Value:Extended; Digits: Integer):Real;
begin
  result:= StrToFloat( FloatToStrF(Value, ffFixed, 18, Digits ) );
end;

function iMin(a,b :Real):Integer;
begin
  Result := Trunc(System.Math.Min(a, b));
end;

function iMax(a,b :Real):Integer;
begin
  Result := Trunc(System.Math.Max(a, b));
end;

function fMin(a,b :Real):Real;
begin
  Result := System.Math.Min(a, b);
end;

function fMax(a,b :Real):Real;
begin
  Result := System.Math.Max(a, b);
end;

function iIIf( Cond:Boolean; a,b:Real): Integer;
begin
  Result := IfThen(Cond, Trunc(a), Trunc(b));
end;

function bcdIIF( Cond:Boolean; aTrue, aFalse: TBCD):TBCD;
begin
  if Cond then
    Result := aTrue
  else
    Result := aFalse;
end;

function fIIf( Cond:Boolean; a,b:Real):Real;
begin
  Result := IfThen(Cond, a, b);
end;

function sIIf( Cond:Boolean; const a,b:string):string;
begin
  Result := IfThen(Cond, a, b);
end;

function cIIf( Cond:Boolean; a,b: TColor): TColor;
begin
  Result := IfThen(Cond, a, b);
end;

function bIIf( Cond:Boolean; aTrue, aFalse:Boolean):Boolean;
begin
  if Cond then
    Result := aTrue
  else
    Result := aFalse;
end;

function IIf( Cond: Boolean; aTrue, aFalse: Variant ): Variant;
begin
  if Cond then
    Result := aTrue
  else
    Result := aFalse;
end;

function MoneyToStr( AValue : Real ):string;
begin
  Result:= FloatToStr2( AValue );
end;

function LMoneyToStr( AValue : Real; Width:Integer ):string;
var
  cStr:String;
begin
  Result:= MoneyToStr( AValue );
  cStr := '%' + IntToStr(Width) + 's';
  Result := Format(cStr, [Result]);
end;

function FloatToStr2( AValue : Real ):string;
begin
  Result:= IQFloatToStrF( AValue, ffFixed, 12, 2 );  {IQNLS}
end;

{ Double-To-Float }
function DtoF(AValue: Double):Real;
begin
  Result := StrToFloat( FloatToStr( AValue ));
end;

function StoF( S: string; ADefault: Real = 0 ): Real;
var
  AValue: Real;
begin
  try
    // Result:= StrToFloat( S );
    if IsStringValidFloat(S, AValue) then
       Result:= AValue
    else
       Result:= ADefault;
  except
    Result:= ADefault;
  end
end;

function IntToAnsiStr(X: Integer; Width: Integer): AnsiString;
begin
  Str(X: Width, Result);
end;

function FloatToAnsiStr(X: Extended; Width, Decimals: Integer): AnsiString;
begin
  Str(X: Width: Decimals, Result);
end;

function FloatToAnsiStr(X: Double; Width, Decimals: Integer): AnsiString;
begin
  Str(X: Width: Decimals, Result);
end;

function FloatToAnsiStr(X: Single; Width, Decimals: Integer): AnsiString;
begin
  Str(X: Width: Decimals, Result);
end;

function ValueInList(AValue: Real; const AList: array of Real): Boolean;
var
  i: Integer;
begin
  for i := 0 to high(AList) do
  begin
    Result := EqualsValue(AValue, AList[i]);
    if Result then
      Exit;
  end;
  Result := False;
end;

function ValueInList(AValue: Integer; const AList: array of Integer): Boolean;
var
  i: Integer;
begin
  for i := 0 to high(AList) do
  begin
    Result := AValue = AList[i];
    if Result then
      Exit;
  end;
  Result := False;
end;

function ValueInList(AValue: Int64; const AList: array of Int64): Boolean;
var
  i: Integer;
begin
  for i := 0 to high(AList) do
  begin
    Result := AValue = AList[i];
    if Result then
      Exit;
  end;
  Result := False;
end;

function LessThan(AValue, ATarget: Real): Boolean;
begin
  Result :=
  (System.Math.CompareValue(AValue, ATarget, EPSILON_PARAM) =
  System.Types.LessThanValue);
end;

function LessThanOrEqualTo(AValue, ATarget: Real): Boolean;
begin
  Result :=
  (System.Math.CompareValue(AValue, ATarget, EPSILON_PARAM) =
  System.Types.LessThanValue) or
  (System.Math.CompareValue(AValue, ATarget, EPSILON_PARAM) =
  System.Types.EqualsValue);
end;

function GreaterThan(AValue, ATarget: Real): Boolean;
begin
  Result :=
  (System.Math.CompareValue(AValue, ATarget, EPSILON_PARAM) =
  System.Types.GreaterThanValue);
end;

function GreaterThanOrEqualTo(AValue, ATarget: Real): Boolean;
begin
  Result :=
  (System.Math.CompareValue(AValue, ATarget, EPSILON_PARAM) =
  System.Types.GreaterThanValue) or
  (System.Math.CompareValue(AValue, ATarget, EPSILON_PARAM) =
  System.Types.EqualsValue);
end;

function EqualsValue(AValue1, AValue2: Real): Boolean;
begin
  Result := (System.Math.CompareValue(AValue1, AValue2, EPSILON_PARAM) =
    System.Types.EqualsValue);
end;

function IsBetween( AValue: Real; AStart, AEnd: Real ): Boolean;
begin
  // This method is similar to the Math.InRange method, but is much more
  // reliable.

  // 09/08/2006 Must ensure value is converted to float, or miniscule values
  //            at the end of the decimal could return faulty results.
  AValue := DtoF(AValue);
  AStart := DtoF(AStart);
  AEnd   := DtoF(AEnd);

  Result :=
    GreaterThanOrEqualTo(AValue, AStart) and
    LessThanOrEqualTo(AValue, AEnd);

  // Result := ( AValue >= AStart ) and ( AValue <= AEnd );

end;

function IsStringValidInteger( S: String; var Value: Integer): Boolean;
var
  ATemp: string;
begin
  // Returns TRUE if the AStringIN value is a valid integer, and
  // AIntegerOUT will contain the value.  But FALSE is returned if
  // AStringIN is not a valid integer.  (08/19/2003)

  Value := 0; // intialize

  // exit early if we have nothing to analyze
  if (Trim(S) = '') then
    Exit(False);

  Result := TryStripThousandSeparator(S, ATemp) and
    TryStrToInt(ATemp, Value);
end;

function IsStringValidInt64( S: String; var Value: Int64): Boolean;
var
  ATemp: string;
begin
  // Returns TRUE if the AStringIN value is a valid integer, and
  // AIntegerOUT will contain the value.  But FALSE is returned if
  // AStringIN is not a valid integer.  (08/19/2003)

  Value := 0; // intialize

  // exit early if we have nothing to analyze
  if (Trim(S) = '') then
    Exit(False);

  Result := TryStripThousandSeparator(S, ATemp) and
    TryStrToInt64(ATemp, Value);
end;

function IsNumeric(const C: Char; const AllowNegative,
 AllowBackSpace: Boolean): Boolean;
begin
  // 07/09/2010 Added this function to determine if char is part of valid,
  // numeric key input.
  // See this unit, above, for constant declarations.
  Result := System.SysUtils.CharInSet(C, NUMERICS) or
            (C = FormatSettings.DecimalSeparator) or
            (C = FormatSettings.ThousandSeparator) or
            ((C = NEGATIVE) and AllowNegative) or
            ((C = BACKSPACE) and AllowBackSpace);
end;

function IsStringValidFloat( S: String; var Value: Real ): Boolean;
var
   LValue: Extended;
begin
  Value := 0;
  Result := IsStringValidFloat(S, LValue);
  if Result then
     Value := LValue;
end;

function IsStringValidFloat( S: String; var Value: Double ): Boolean;
var
   LValue: Extended;
begin
  Value := 0;
  Result := IsStringValidFloat(S, LValue);
  if Result then
     Value := LValue;
end;

function IsStringValidFloat(S: string; var Value: Extended): Boolean;
var
  ATemp: string;
begin
  // Initialization
  Value := 0; // intialize

  // Exit early if we have nothing to analyze
  if (Trim(S) = '') then
    Exit(False);

  Result := TryStripThousandSeparator(S, ATemp) and
    TryStrToFloat(ATemp, Value);
end;

{Returns -1, 0 or 1 according to the sign of the parameter}
function SignOf( X: Extended): Integer;
begin
  if X < 0 then
     Result:= -1
  else if X = 0 then
     Result:= 0
  else
     Result:= 1;
end;

{Correct Delphi Rounding problem}
function IQRoundEx( X: Extended; D: Integer = 0 ): Extended;
var
  N: Extended;
begin
  N:= Power(10, D);
  X:= X * n;
  Result:= (Int(X) + Int(Frac(X) * 2)) / N;
end;

function Nearest(const AValue: Extended; const ADigit: Integer): Integer;
var
   ATmp: Integer;
   sgn: Integer;
begin
  // we can work with either positive or negative values; remember the
  // sign to be applied later, below.
  sgn := Sign(AValue);

  // first, round down to the nearest digit
  ATmp := ((Trunc(Abs(AValue)) div ADigit) * ADigit);

  // get a remainder, if any
  if (ATmp > 0) and (Trunc(Abs(AValue)) <> ATmp) then
     ATmp := Trunc(Abs(AValue)) - ATmp;

  if (ATmp = 0) and (Trunc(Abs(AValue)) >= (ADigit div 2)) then
     Result := ADigit
  else if ATmp >= (ADigit / 2) then
     Result := RoundUp(Abs(AValue), ADigit)
  else
     Result := RoundDown(Abs(AValue), ADigit);

  // apply the sign
  Result := Result * sgn;
end;

function RoundUp(const AValue: Extended; ADigit: Integer): Integer;
var
   ATmp: Integer;
   sgn: Integer;
begin
  // we can work with either positive or negative values; remember the
  // sign to be applied later, below.
  sgn := Sign(AValue);

  // first, round down to the nearest 5
  ATmp := (Trunc(Abs(AValue)) div ADigit) * ADigit;
  // Evaluate:
  // 1.) if the original number equals the nearest ADigit, then just pass it "as is"
  if ATmp = Trunc(Abs(AValue)) then Result := Trunc(Abs(AValue))
  // 2.) otherwise add ADigit to the rounded value so that we "round up"
  else Result := ATmp + ADigit;

  Result := Result * sgn;
end;

function RoundDown(const AValue: Extended; ADigit: Integer): Integer;
var
   ATmp: Integer;
   sgn: Integer;
begin
  // we can work with either positive or negative values; remember the
  // sign to be applied later, below.
  sgn := Sign(AValue);

  // first, round down to the nearest 5
  ATmp := (Trunc(Abs(AValue)) div ADigit) * ADigit;
  // Evaluate:
  // 1.) if the original number equals the nearest ADigit, then just pass it "as is"
  if ATmp = Trunc(Abs(AValue)) then Result := Trunc(Abs(AValue))
  // 2.) otherwise add ADigit to the rounded value so that we "round up"
  else Result := ATmp;

  Result := Result * sgn;

end;

function VarToFloat(const AVariantIN: Variant): Double;
var
   S: String;
   AValue: Real;
begin
  Result := 0;
  if not VarIsFloat(AVariantIN) then Exit; // variants

  S := VarToStr(AVariantIN); // variants

  if IsStringValidFloat(S, AValue) then
     Result := AValue
  else Result := 0;
end;

function NullIfZero(const AValue: Real): Variant;
begin
  // Initial result
  Result := AValue;
  // If value is zero (0), then return NULL
  if System.Math.IsNan(AValue) or (AValue = 0) then
    Result := System.Variants.Null;
end;

{ ---------------------------------------------------------------------------- }
function HexToInt(S: String): LongWord;
var
  b: Byte;
  c: Char;
begin
  try
     Result := 0;
     s := UpperCase(s);
     for b := 1 to Length(s) do
     begin
       Result := Result * 16;
       c := S[b];
       case c of
         '0'..'9': Inc(Result, Ord(c) - Ord('0'));
         'A'..'F': Inc(Result, Ord(c) - Ord('A') + 10);
         else
           Result := 0;
       end;
     end;
  except on E:Exception do
    Result := 0; // suppress, and return 0
    //raise Exception.CreateFmt('Cannot convert hexidecimal to number.'#13#13'%s', [E.Message]);
  end;
end;

function GetTaxRateApplied(const ATotalAmount, ATaxAmount: Real): Real;
var
  AValue: Double;
begin
  Result := 0;
  // iqnumber
  if (ATotalAmount = 0) or (ATaxAmount = 0) then
    Exit;
  AValue := ((ATotalAmount - ATaxAmount) / ATaxAmount);
  if AValue > 0 then
    Result := 100 / AValue;
end;

function isInt(n : Real): boolean;
begin
  Result := n - Trunc(n) = 0
end;

function isFloat( n : Real ) : boolean;
begin
  Result := not isInt(n);
end;

function RoundToStr( AValue : Double; Decimal:Integer ):string;
begin
  Result := FloatToStr(IQRound(aValue, Decimal));
end;

function IQRound( AValue : Double; Decimal:Integer ):Real;
begin
  Result := RoundTo(aValue, Decimal * -1);
end;



end.

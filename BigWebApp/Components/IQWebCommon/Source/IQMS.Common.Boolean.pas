unit IQMS.Common.Boolean;

interface

uses
  System.SysUtils, System.Variants;

type
  TIQBoolean = class
  public
    // <summary> Convert Boolean to a character "Y" or "N". </summary>
    class function AsYN(const Value: Boolean): ShortString;
    // <summary> Convert Boolean to a text "True" or "False". </summary>
    class function AsTrueFalse(const Value: Boolean;
      const Localize: Boolean = False): ShortString;
    // <summary> Convert Boolean to a Byte 1 or 0. </summary>
    class function AsByte(const Value: Boolean): Byte;
    // <summary> Convert Boolean to a Integer 1 or 0. </summary>
    class function AsInteger(const Value: Boolean): Integer;
    // <summary> Convert Boolean to a text "Yes" or "No". </summary>
    class function AsYesNo(const Value: Boolean;
      const Localize: Boolean = False): ShortString;
    // <summary> Convert value to a Boolean. </summary>
    class function AsBoolean(const Value: Variant): Boolean;
  end;

  { Boolean to English }
function BoolToYesNo(ABool: Boolean): String; { Returns 'Yes' or 'No' }
function BoolToYN(ABool: Boolean): String; { Returns 'Y' or 'N' }

{ English to Boolean }
function YNToBool(AString: String): Boolean; { 'Y' or 'Yes' = TRUE, else FALSE }

{ If value is not null, zero or empty, returns TRUE }
// function GetBool(AValue: Real): Boolean; overload;
// function GetBool(AValue: Integer): Boolean; overload;
// function GetBool(AValue: Cardinal): Boolean; overload;
function GetBool(AValue: String): Boolean;
  deprecated 'Use TIQBoolean.AsBoolean() instead.';
// function GetBool(AValue: PChar): Boolean; overload;
// function GetBool(AValue: Char): Boolean; overload;

function iBool(ABoolean: Boolean): Integer; deprecated 'Use Integer() instead.';

implementation

uses
  IQMS.Common.ResStrings;

function BoolToYesNo(ABool: Boolean): String;
begin
  Result := string(TIQBoolean.AsYesNo(ABool, True));
end;

function BoolToYN(ABool: Boolean): string;
begin
  Result := string(TIQBoolean.AsYN(ABool));
end;

function YNToBool(AString: String): Boolean;
begin
  Result := TIQBoolean.AsBoolean(AString);
end;

{ function GetBool(AValue: Integer): Boolean; overload;
  begin
  Result := TIQBoolean.AsBoolean(AValue);
  //    if (AValue <> NULL) or (AValue > 0) then
  //       Result := TRUE
  //    else
  //       Result := FALSE;
  end; }

{ function GetBool(AValue: Cardinal): Boolean; overload;
  begin
  if (AValue <> NULL) or (AValue > 0) then
  Result := TRUE
  else
  Result := FALSE;
  end; }

{ function GetBool(AValue: Real): Boolean; overload;
  begin
  if (AValue <> NULL) or (AValue > 0) then
  Result := TRUE
  else
  Result := FALSE;
  end; }

function GetBool(AValue: String): Boolean;
begin
  Result := TIQBoolean.AsBoolean(AValue);
end;

{ function GetBool(AValue: PChar): Boolean; overload;
  begin
  if (AValue > '') then
  Result := TRUE
  else
  Result := FALSE;
  end; }

{ function GetBool(AValue: Char): Boolean; overload;
  begin
  Result := TIQBoolean.AsBoolean(AValue);
  //    if (AValue > '') then
  //       Result := TRUE
  //    else
  //       Result := FALSE;
  end; }

function iBool(ABoolean: Boolean): Integer;
begin
  Result := Integer(ABoolean);
end;

{ TIQBoolean }

class function TIQBoolean.AsBoolean(const Value: Variant): Boolean;
var
  S: string;
begin
  if System.Variants.VarIsType(Value, varBoolean) then
    Result := System.Variants.VarAsType(Value, varBoolean)
  else if System.Variants.VarIsType(Value, varString) or
    System.Variants.VarIsType(Value, varUString) then
    begin
      S := System.Variants.VarToStr(Value);
      if (CompareText(S, 'Y') = 0) or
        (CompareText(S, 'Yes') = 0) or
      // IQMS.Common.ResourceStrings.cTXT0000350 = 'Yes';
        (CompareText(S, IQMS.Common.ResStrings.cTXT0000350) = 0) or
        (CompareText(S, 'True') = 0) or
      // IQMS.Common.ResourceStrings.cTXT0000488 = 'True';
        (CompareText(S, IQMS.Common.ResStrings.cTXT0000488) = 0) or
        (CompareText(S, '1') = 0) then
        Result := True
      else
        Result := False;
    end
  else if System.Variants.VarIsType(Value, varInteger) or
    System.Variants.VarIsType(Value, varShortInt) or
    System.Variants.VarIsType(Value, varByte) or
    System.Variants.VarIsType(Value, varWord) then
    begin
      if System.Variants.VarAsType(Value, varInteger) = 1 then
        Result := True
      else
        Result := False;
    end
  else if System.Variants.VarIsType(Value, varLongWord) or
    System.Variants.VarIsType(Value, varInt64) or
    System.Variants.VarIsType(Value, varUInt64) then
    begin
      if System.Variants.VarAsType(Value, varInt64) = 1 then
        Result := True
      else
        Result := False;
    end
  else
    Result := False;
end;

class function TIQBoolean.AsByte(const Value: Boolean): Byte;
begin
  if Value then
    Result := 1
  else
    Result := 0;
end;

class function TIQBoolean.AsInteger(const Value: Boolean): Integer;
begin
  Result := Integer(Value);
end;

class function TIQBoolean.AsTrueFalse(const Value: Boolean;
  const Localize: Boolean): ShortString;
begin
  if Localize then
    begin
      // IQMS.Common.ResourceStrings.cTXT0000488 = 'True';
      // IQMS.Common.ResourceStrings.cTXT0000489 = 'False';
      if Value then
        Result := ShortString(IQMS.Common.ResStrings.cTXT0000488)
      else
        Result := ShortString(IQMS.Common.ResStrings.cTXT0000489);
    end
  else
    begin
      if Value then
        Result := 'True'
      else
        Result := 'False';
    end;
end;

class function TIQBoolean.AsYesNo(const Value: Boolean; const Localize: Boolean)
  : ShortString;
begin
  if Localize then
    begin
      // IQMS.Common.ResourceStrings.cTXT0000350 = 'Yes'
      // IQMS.Common.ResourceStrings.cTXT0000351 = 'No'
      if Value then
        Result := ShortString(IQMS.Common.ResStrings.cTXT0000350)
      else
        Result := ShortString(IQMS.Common.ResStrings.cTXT0000351);
    end
  else
    begin
      if Value then
        Result := 'Yes'
      else
        Result := 'No';
    end;
end;

class function TIQBoolean.AsYN(const Value: Boolean): ShortString;
begin
  if Value then
    Result := 'Y'
  else
    Result := 'N';
end;

end.

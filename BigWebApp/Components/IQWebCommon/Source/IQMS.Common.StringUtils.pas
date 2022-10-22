unit IQMS.Common.StringUtils;

interface

uses
  Windows, SysUtils, Classes, StrUtils, Character, Math, Variants,
  Clipbrd;

// new stuff
function Filter(const Input: string; const Keep: TFunc<Char, Boolean>): string;
function DigitFilter(C: Char): Boolean;


// old stuff
function AlphaNumeric(const S: string): string; //overload;
function AddToStrFmt(AFormat, AOriginal, AAddition: string ): string;
function AddToStringWithDelimiter(AOriginal, AAddition, ADelimiter: string): string;
function AppendPaddedString(const AOriginal: string; const AAdd: string; const AMaxLength: Integer): string;
function BlockWrapText(const S: string; const ALeftIndent, ALineWidth: Integer): string;
function BoolToYN(AValue: Boolean): string;
function BoolToNum(AValue: Boolean ): Real;
function BoolToStr(AValue: Boolean; AUseBoolStr: Boolean = True ): string;
function CaseOfStr(const S: String; const AValues: array of String): Integer;
function CharInArray(const C: AnsiChar; const AArray: array of AnsiChar): Boolean; overload;
function CharInArray(const C: WideChar; const AArray: array of WideChar): Boolean; overload;
function CharXOR(s: string): string;
function ConvertToAscii(const S: string): AnsiString;
procedure CopyStrToClipbrd(AValue: String);
procedure DeleteStringsBetweenKeyWords(AList: TStrings; AKeyword1, AKeyword2: string; var I: Integer);
function DefaultToString(const S, sDef : string):string;
function Empty(const S: string): boolean;
procedure EnsureIQMSPrefix( var AName: string );
function EscPercent(S: string): string;
function ExtractEmailsFromString(const Input: String; out Emails: TStringList; ADelimiter : char): boolean;
function ExtractQuoteStr(const S: string): string;
function PadR (const s:string; n:integer):string;
function PadL (const s:string; n:integer):string;
function FixComponentName(AName: string): string;
function FixStr(const S: string): string;
function FixStrA(const S: string): string;
function FixStrB(const S: string): string; // changes : to ::
function FixStrC(const S: string): string; // FixStr + changes & to ' || chr(38) || '
function FixStrMemo(ATextIn: String; AMaxSize: Integer = 0): String;
procedure FixStrMemoEx(var AText: String; AMaxSize: Integer = 0);
function FloatToStr0asNull(Value: Real; ANullString: string = ''): string;
procedure GetNameValuePair(const ALine: String; var AName, AValue: String);
function GetToken(Str, Del: string; AToken: Integer): string;
procedure InsertStringsBetweenKeyWords(AList: TStrings; AText, AKeyword1, AKeyword2: string);
function IQWrapText(const S: string; ALineWidth: Integer = 65): String;
function IsEmpty(Input: String): Boolean;
function IsPrintableChar(const C: Char): Boolean;
function LeftStr(const s: string; n: integer): string;
function LeftStrRaw(const s: string; n: integer): string;
function LinePosInList(AValue: string; AList: TStrings): Integer;
function LPadZero(S: string; N: Integer): string;
function NoZero(Input: Real; ADefault: Real = 1 ): Real;
function Numerics(const s: string): string;
function NumToken(Str, Delimeter: string):Integer;
function Occurances(const sFind:string; sSource:string):Integer;
procedure ParseFullName(const AFullName: string; var AFirst, AMiddle, ALast: string);
procedure ParseCityStateZip(const ALine: string; var ACity, AState, APostalCode: string);
function PasteStrFromClipbrd: String;
function PosOfWord(const AWord: string; const AInText: string; const AStartPos: Integer = 1; AIgnoreCase: Boolean = True): Integer;
function Repl(s: string; n: integer): string;
function RightStr(const s: string; n: integer): string;
function ProperCase(s:string):string;
function ReadFileIntoStr( AFileName: string ): AnsiString;
procedure RemoveEmptyStrings(var AList: TStringList);
function ReplaceWords(const AText, AOldPattern, ANewPattern: string; AReplaceFlags: TReplaceFlags): String;
function RPos(const SubStr, S : string):Integer;
procedure SaveStrToFile(const S: string; const FileName: string);
function Space(const n:integer):string;
function SplitStrToArray(const Input: string; Pattern: array of char): TArray<string>;
function StrBeforeDot(const S: string; ASep:String = '.' ): string;
function StrAfterDot(const S: string; ASep:String = '.'): string;
function StringListToStr(AList: TStringList; ADelimiter: string = ';'): string;
function StrToFloatSafe( S: string ): Double;
procedure StrToStringList(S: string; AList: TStringList);
procedure StrToStringListExA( AMsg: string; ASL: TStringList; ALength: Integer );
procedure StrToStringListExB(const S: String; const ADelim: array of Char; var AList: TStringList);
function StrInList(const S: string; const ANames: array of string): Boolean; overload;
function StrInList(const S: string; const ANames : TStringList): Boolean; overload;
function StrTran(const cSource, cFind, cReplace: string): string;
function StrTranFirstOnly(const cSource, cFind, cReplace: string): string;
/// <summary> This func finds the substr that is NOT a part of other string:
/// Ex: cFind = Division
/// DivisionName  - will skip this occurance of Division
/// Division;Name - will find Division and replace Division with cReplace
/// Valid separators are: chr(0)..chr(32), ~!@#$%^&*()-=+;"
/// </summary>
function StrTranStrict(const cSource, cFind, cReplace: string): string;
function RemoveWhiteSpace(const AText: string; const AReplace: Char): string;
function RTrim(const s:string):string;
function StrToStrFloat(const S: String): String;
procedure Tokenize(const AText: String; const ADelims: array of Char; var AList: TStringList);
procedure TokenizeStrict(const AText: String; const ADelims: array of Char; var AList: TStringList);
procedure TokenizeWhiteSpace(const AText: string; var AList: TStringList);
function WordExists(const AText, AWord: string; const AIgnoreCase: Boolean; var AStartPos, AEndPos: integer): Boolean;
procedure WriteStrToFile(AFileName: string; AValue: AnsiString );

function Nz(Input: Real; Output: Real): Real; overload;
function Nz(Input: Integer; Output: Integer): Integer; overload;
function Nz(Input: Cardinal; Output: Cardinal): Cardinal; overload;
// Check empty characer or string.
// Description:  If the string or character is null or empty, then the
//   Output will be returned as the function result.
function Nz(Input: PChar; Output: PChar): PChar; overload;
function Nz(Input: String; Output: String): String; overload;
function Nz(Input: Char; Output: Char): Char; overload;
function Nz(Input: Variant; Output: Variant): Variant; overload;
function TrimLeft( const s:string ):string;

implementation

const
  BLANK = ' ';


{$REGION 'character filtering method for strings'}

// method for remvoing specific characters from a string based on filters
function Filter(const Input: string; const Keep: TFunc<Char, Boolean>): string;
var
  c: Char;
  i: Integer;
begin
  SetLength(Result, Length(Input));
  i := 0;
  for c in Input do
    if Keep(c) then
    begin
      inc(i);
      Result[i] := c;
    end;
  SetLength(Result, i);
end;

// filter that only allows digits
function DigitFilter(C: Char): Boolean;
begin
  Result := C.IsDigit;
end;

function AlphaNumericFilter(C: Char): Boolean;
begin
  Result := C.IsLetterOrDigit;
end;

function NoZero(Input: Real; ADefault: Real = 1 ): Real;
begin
  if IsNAN(Input) or (Input = 0) then
     Result:= ADefault
  else
     Result:= Input;
end;

// returns only the numerc digits from a string
function Numerics(const S: String): String;
begin
  Result := Filter(s, DigitFilter);
end;
{$ENDREGION}

function AlphaNumeric(const S: string): string;
begin
  Result := Filter(s, AlphaNumericFilter);
end;

function AddToStrFmt(AFormat, AOriginal, AAddition: string ): string;
begin
  if Trim(AOriginal) = '' then
    Result := AAddition
  else
    Result := Format(AFormat, [AOriginal, AAddition]);
end;

function TrimLeft( const s:string ):string;
var
  i,n:integer;
begin
  i:= 1;
  n:= Length(s);
  while ( i <= n ) and ( s[i] = BLANK ) do Inc(i);

  Result := Copy( s, i, n);
end;

function AddToStringWithDelimiter(AOriginal, AAddition, ADelimiter: string): string;
begin
  if Trim(AOriginal) = '' then
     Result := AAddition
  else
     Result := Format('%s %s %s', [AOriginal, ADelimiter, AAddition]);
end;

function AppendPaddedString(const AOriginal: string; const AAdd: string;
  const AMaxLength: Integer): string;
var
   s: string;
   n: Integer;
begin
  n := Length(AAdd);
  if n >= AMaxLength then
    s := Copy(AAdd, 1, AMaxLength)
  else
    s := AAdd + Space( AMaxLength - n );
  Result := AOriginal + s;
end;

function BlockWrapText(const S: string; const ALeftIndent,
  ALineWidth: Integer): string;
var
  sl: TStringList;
  APadStr, AWrappedText: string;
  i: Integer;
begin
  // Initialization
  Result := S;
  // Get the wrapped text
  sl := TStringList.Create;
  try
    APadStr := System.StrUtils.DupeString(BLANK, ALeftIndent);
    AWrappedText := IQWrapText(S, ALineWidth);
    sl.Text := AWrappedText;
    if ALeftIndent > 0 then
      for i := 0 to sl.Count - 1 do
        sl.Strings[i] := APadStr + Trim(sl.Strings[i]);
    Result := System.SysUtils.TrimRight(sl.Text);
  finally
    FreeAndNil(sl);
  end;
end;

function BoolToYN(AValue: Boolean): string;
begin
  if AValue then
    Result := 'Y'
  else
    Result := 'N';
end;

function BoolToNum( AValue: Boolean ): Real;
begin
  if AValue then
    Result := 1
  else
    Result := 0;
end;

function BoolToStr( AValue: Boolean; AUseBoolStr: Boolean = True ): string;
begin
  Result:= System.SysUtils.BoolToStr(AValue, AUseBoolStr);
end;

function Occurances(const sFind:string; sSource:string):Integer;
var
  I:Integer;
begin
  Result := 0;
  I := PosEx(sFind, sSource);
  while I > 0 do
  begin
    Result := Result + 1;
    // sSource := Copy(sSource, i+Length(sFind), Length(sSource));
    I := PosEx(sFind, sSource, I + Length(sFind));
  end
end;

procedure ParseFullName(const AFullName: string; var AFirst, AMiddle, ALast: string);
var
   sl: TStringList;
   i, n, nCommaPos: Integer;
   AName, tmp: String;
begin
  // Initilize
  AFirst := '';
  AMiddle := '';
  ALast := '';
  AName := AFullName;

  // Is the last name first? Adjust the name, placing the last name last.
  nCommaPos := Pos(',', AFullName);
  if nCommaPos > 0 then
    AName := Trim(Copy(AFullName, nCommaPos + 1, Length(AFullName))) + ' ' +
      Copy(AFullName, 1, nCommaPos-1);

  try
     sl := TStringList.Create;
     TokenizeWhiteSpace(AName, sl);
     n := sl.Count;
     if n = 0 then
       Exit;

     case n of
       1: AFirst := AName;
       2: begin
            for i := 0 to sl.Count - 1 do
            begin
              tmp := Trim(sl.Strings[i]);
              case i of
                0: AFirst := tmp;
                1: ALast := tmp;
              end;
            end;
           end;
       3: begin
            for i := 0 to sl.Count - 1 do
            begin
              tmp := Trim(sl.Strings[i]);
              case i of
                0: AFirst := tmp;
                1: AMiddle := tmp;
                2: ALast := tmp;
              end;
            end;
          end;
       else
       begin
         AFirst := sl.Strings[0];
         ALast := sl.Strings[sl.Count - 1];
         for i := 1 to sl.Count - 2 do
         begin
           tmp := Trim(sl.Strings[i]);
           AMiddle := AMiddle + ' ' + tmp;
         end;
         AMiddle := Trim(AMiddle);
       end;
     end; // end case

  finally
     if Assigned(sl) then FreeAndNil(sl);
  end;
end;

procedure ParseCityStateZip(const ALine: string; var ACity, AState, APostalCode: string);
var
   nCommaPos, i: Integer;
   AModStr, s: String;
   sl: TStringList;
begin
  // Example ALine: 'Paso Robles, CA 93446'
  // Example ALine: 'Paso Robles, CA'


  // Initialize
  AModStr := ALine;

  // If we have a comma, then the city may be distinguished from the
  // rest of the line.  So, separate the city into its variable, and
  // reduce the remaining text to what remains. We do it this way to
  // ensure the city is separated first because it might contain
  // white space (e.g., 'Paso Robles'), and we separate by whitespace
  // in the next stage below.
  nCommaPos := Pos(',', AModStr);
  if nCommaPos > 0 then
  begin
    // fill the city var
    ACity := Copy(AModStr, 1, nCommaPos+1);
    ACity := Trim(StrTran(ACity, ',', ''));
    // get the rest of the text without the city
    AModStr := Trim(Copy(AModStr, nCommaPos+1, Length(AModStr)));
  end;

  // Now that we have removed the city, we can work on getting
  // the state and postal code, or whatever remains.
  try
    sl := TStringList.Create;

    // separate elements by white space
    TokenizeWhiteSpace(AModStr, sl);

    // If no comma was found, but there are 3 elements, then
    // attempt to parse all values
    if (nCommaPos = 0) and (sl.Count = 3) then
      for i := 0 to sl.Count - 1 do
      begin
        s := Trim(sl.Strings[i]);
        case i of
          0: ACity := s;
          1: AState := s;
          2: APostalCode := s;
        end; // end case
      end

     // otherwise, parse what remains after city is removed
     else
       for i := 0 to sl.Count - 1 do
       begin
         s := Trim(sl.Strings[i]);
         case i of
           0: AState := s;
           1: APostalCode := s;
         end; // end case
       end;
  finally
    sl.Free;
  end;
end;


function PadR(const s:string; n:integer):string;
var
  tmp: string;
begin
  tmp := LeftStr(s, n);

  if Length(tmp) < n then
     result := tmp + Space(n - Length(tmp))
  else
     result := tmp;
end;

function PadL (const s:string; n:integer):string;
var
  tmp: string;
begin
  tmp := RightStr(s, n);

  if Length(tmp) < n then
     result := Space(n - Length(tmp)) + tmp
  else
     result := tmp;
end;

function ProperCase(s:string):string;
const
  TERMINATORS_STRING =  [' ', #9, ',', '_'];
var
  Flag:Boolean;
  i   :Integer;
begin
  Flag := TRUE;

  for i := 1 to Length(s) do
    if CharInSet(s[i], TERMINATORS_STRING) then
      Flag := True
    else
      if Flag then
      begin
        if CharInSet(s[i], ['a'..'z']) then
          s[i] :=  AnsiUpperCase(s[i])[1]; // return string - we need a char
        Flag := False
      end
      else
        if CharInSet(s[i], ['A'..'Z']) then
          s[i] := AnsiLowerCase(s[i])[1];

  Result := s;
end;

function ReadFileIntoStr( AFileName: string ): AnsiString;
var
  Stream: TStream;
  Size  : Integer;
begin
  Stream:= TFileStream.Create( AFileName, fmOpenRead or fmShareDenyWrite);
  try
    Size:= Stream.Size - Stream.Position;
    SetString( Result, nil, Size);
    Stream.Read( Pointer(Result)^, Size);
  finally
    Stream.Free;
  end;
end;


procedure RemoveEmptyStrings(var AList: TStringList);
var
  i: Integer;
begin
  if Assigned(AList) then
    for i := AList.Count - 1 downto 0 do
      if IsEmpty(AList.Strings[i]) then
        AList.Delete(i);
end;

function ReplaceWords(const AText, AOldPattern, ANewPattern: string; AReplaceFlags: TReplaceFlags): String;
var
  AStartPos: Integer;
  AEndPos: Integer;
begin
  Result := AText;
  AStartPos := 1;
  repeat
    AStartPos := PosOfWord(AOldPattern, Result, AStartPos, rfIgnoreCase in AReplaceFlags);
    if AStartPos > - 1 then
    begin
      AEndPos := AStartPos + Length(AOldPattern);
      Result := Copy(Result, 1, AStartPos - 1) +
        ANewPattern +
        Copy(Result, AEndPos, Length(Result));
      if not (rfReplaceAll in AReplaceFlags) then
        Break;
    end;
  until (AStartPos = - 1);
end;



function StrToStrFloat(const S: String): String;
const
  VALID_CHAR = ['0'..'9'];
var
   i: Integer;
begin
  // Initialization (default result)
  Result := '';

  // Ensure we have text; if not, exit.
  if Trim(S) = '' then
     Exit;

  // Negative values.  If the negative sign is the first symbol,
  // then initialize the result with it.  We only check for it
  // once, because if it were to appear in the middle of the
  // string of numbers, it would be a problem.
  if LeftStr(S, 1) = '-' then
     Result := '-';

  // Evaluate each character, and construct a valid numeric string.
  // Include the system decimal separator, but always check
  // to ensure that it is not added twice.
  for i := 1 to Length(S) do
    if CharInSet(S[i], VALID_CHAR) or (S[i] = FormatSettings.DecimalSeparator) and
      (Pos(FormatSettings.DecimalSeparator, Result) = 0) then
      Result := Result + S[i];
end;


function StrBeforeDot(const S: string; ASep:String = '.'): string;
var
  I: Integer;
begin
  I := Pos(ASep, S);
  if I > 0 then
     Result := Copy(S, 1, I - 1)
  else
     Result := S;
end;

function FixComponentName(AName: string): string;
var
  ABad: array of string;
  I   : Integer;
begin
  Result := '';
  if AName = '' then
     EXIT;

  ABad := VarArrayOf([ '.', '`', '~', ',', '!', '@', '#', '%', '^', '&', '*', '(', ')', '+', '-', '=',
                      '/', '?', '>', '<', '|', '\', '"', '''', '$',':', ';', ']', '}', '[', '{', ' ' ]);

  for I := 0 to High(ABad) do
    while Pos(ABad[ I ], AName) > 0 do
       AName[ Pos(ABad[ I ], AName) ] := '_';

  Result := AName;
end;

function RTrim(const s:string):string;
var
  i:integer;
begin
  i := Length(s);
  while (i >= 1) and (s[i] = BLANK) do Dec(i);

  RTrim := Copy(s, 1, i);
end;

function CaseOfStr(const S: String; const AValues: array of String): Integer;
begin
  // initial
  Result := 0;

  // find index of string in value array
  while (Result < Length(AValues)) and (AValues[Result] <> S) do
    Inc(Result);

  // validate the index
  if (Result > High(AValues)) or (AValues[Result] <> S) then
    Result := -1;
end;

function CharInArray(const C: AnsiChar; const AArray: array of AnsiChar): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := Low(AArray) to High(AArray) do
    if AArray[i] = C then
    begin
      Result := True;
      Break;
    end;
end;

function CharInArray(const C: WideChar; const AArray: array of WideChar): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := Low(AArray) to High(AArray) do
    if AArray[i] = C then
    begin
      Result := True;
      Break;
    end;
end;

function CharXOR(s: string): string;
const
  BASE_XOR_STRING = '!@#$%^&*()';
var
  sXOR: string;
  i: Integer;
  X: Integer;
begin
  sXOR := Repl(BASE_XOR_STRING, Length(s) div Length(BASE_XOR_STRING) + 1);
  sXOR := Copy(sXOR, 1, Length(s));
  Result := s;
  SetLength(Result, Length(s));
  for i := 1 to Length(s) do
  begin
    X := Ord(result[i]) xor Ord(sXOR[i]);
    // avoid Chr(0) that flags end of string
    if X > 0 then
       Result[i] := Chr(X);
  end;
end;

function ConvertToAscii(const S: string): AnsiString;
  function _IsAscii(C: Char): Boolean;
  begin
    Result := Integer(C) <= $7F;
  end;
var
  i: Integer;
begin
  Result := '';
  if Trim(S) = '' then
    Exit;

  for i := 1 to Length(S) do
    if _IsAscii(s[i]) then
      Result := Result + AnsiString(S[i]);
end;

procedure CopyStrToClipbrd(AValue: String);
begin
  Clipboard.AsText := AValue;
end;

procedure GetNameValuePair(const ALine: String; var AName, AValue: String);
var
   i: Integer;
begin
  i := Pos('=', ALine);
  if i > 0 then
  begin
    AName := Copy(ALine, 1, i - 1);
    AValue := Copy(ALine, i + 1, Length(ALine));
  end
  else
  begin
    AName := ALine;
    AValue := ALine;
  end;
end;

function GetToken(Str, Del: string; AToken: Integer): string;
var
  I: Integer;
begin
  I := Pos(Del, Str);

  if AToken = 1 then  {stop}
  begin
    if I > 0 then
       Result := Copy(Str, 1, I - 1)
    else
       Result := Str;
  end
  else
    if I > 0 then
       Result := GetToken(Copy(Str, I+Length(Del), Length(Str)), Del, AToken - 1)
    else
       Result := '';
end;

function FixStr(const S: string): string;
begin
  Result := StrTran(S, #96, '''');
  Result := StrTran(Result, '''', '''''');
end;

function FixStrA(const S: string): string;
begin
  // Replace single quotation marks with an accent mark
  Result := StrTran(S, #39, #180);
end;

function FixStrB(const S: string): string;
begin
  // Replace : with ::
  Result := StrTran(S, ':', '::');
end;

function FixStrC(const S: string): string;
begin
  Result := StrTran(StrTran(S, '''', ''''''), '&', ''' || chr(38) || ''');
end;

function FixStrMemo( ATextIn: String; AMaxSize: Integer = 0 ): String;
begin
  // Ensures a string will not generate errors when added to DB through SQL
  // Single quotes
  ATextIn := StrTran( ATextIn, '''', '''''' );
  // If a combination of double quotes and colons exist (i.e., file name and path),
  // then ensure the double quotes are single quotes.
  if Occurances( ':', ATextIn ) > 0 then
    ATextIn := StrTran( ATextIn, #34, '''''' );  // double-quotes to single-quotes
  // Return and Line Feed characters
  ATextIn := StrTran( ATextIn, #$D#$A, #13 );
  ATextIn := StrTran( ATextIn, #$A#$A, #13 );
  // Trim text to save space
  ATextIn := Trim( ATextIn );
  // Set maximum size, if applicable
  if AMaxSize > 0 then
    ATextIn := LeftStr( ATextIn, AMaxSize );
  // Result
  Result  := ATextIn;
end;

procedure FixStrMemoEx( var AText: String; AMaxSize: Integer = 0 );
begin
  AText := FixStrMemo( AText, AMaxSize );
end;

function FloatToStr0asNull(Value: Real; ANullString: string = ''): string;
begin
  if Value = 0 then
    Result := ANullString
  else
    Result := FloatToStr(Value);
end;

procedure DeleteStringsBetweenKeyWords(AList: TStrings; AKeyword1, AKeyword2: string; var I: Integer);
var
  J, K: Integer;
begin
  {Delete between Keyword1 and Keyword2}
  I := LinePosInList(AKeyword1, AList);
  J := LinePosInList(AKeyword2, AList);
  if not ((I > 0) and (J > 0)) then
    raise Exception.CreateFmt('Unable to find keyword %s or %s in the list.', [ AKeyword1, AKeyword2 ]);

  AList.BeginUpdate;
  try
    for K := 1 to J-(I+1) do
      AList.Delete(I + 1);
  finally
    AList.EndUpdate;
  end;
end;

function DefaultToString(const S, sDef : string):string;
begin
  Result := IfThen(S.IsEmpty, sDef, S);
end;

function Empty(const S: string): boolean;
begin
  Result := S.Trim.IsEmpty;
end;

procedure EnsureIQMSPrefix( var AName: string );
begin
  if CompareText( Copy(AName,1,5), 'IQMS.' ) <> 0 then
     AName:= 'IQMS.' + AName;
end;

function EscPercent(S: string): string;
begin
  Result:= StringReplace(S, '%', '%%', [rfReplaceAll, rfIgnoreCase]);
end;

function ExtractEmailsFromString(const Input: String; out Emails: TStringList; ADelimiter : Char): Boolean;
var
  i : Integer;
  ABuffer : String;
  ATokens : TStringList;
begin
  ATokens := TStringList.Create;
  Emails := TStringList.Create;
  try
    ATokens.Delimiter := ADelimiter;
    ATokens.DelimitedText := Input;
    for I := 0 To ATokens.Count - 1 Do
    begin
      ABuffer := ATokens.Strings[I];
      if Length(ABuffer) < 5 then
        Continue;
      if (Pos('@',ABuffer) > 1) and
         (Pos('.',ABuffer) > 3) and
         (Pos('.',ABuffer) < Length(ABuffer)) then
      begin
        Emails.Add(ABuffer);
      end;
    end;
    Result := True;
  finally
    ATokens.Free;
  end;
end;

function ExtractQuoteStr(const S: String): String;
const
   QUOTE: Char = #39;
var
   i1, i2: Integer;
begin
  i1 := Pos(QUOTE, S);
  i2 := RPos(QUOTE, S);
  if (i1 > 0) and (i2 > 0) then
  begin
    Result := Copy(S, i1 + 1, i2 - 2);
  end
  else
    Result := S;
end;

function IQWrapText(const S: string; ALineWidth: Integer): String;
const
  // We add punctuation in case a space does not follow it
  // in the original text.  This way, if a break is needed,
  // it will be added after the punctuation.
  cBreakChars = [' ', '.', '?', '!', ',', ';', ':', '-', #9];
begin
  // 03/13/2014 Replace single quotation marks, with a accent character.
  // The Delphi XE WrapText() function contains a bug which will cause
  // wrapping to fail as soon as a single quote is encountered.  The bug
  // was fixed in Delphi XE5. (EIQ-2500)
  {$IF CompilerVersion = 22}  // Delphi XE
  Result := WrapText(S, #13, cBreakChars, ALineWidth);
  {$ELSE} // Delphi XE5/XE10
  Result := WrapText(StrTran(S, #39, #146), #13, cBreakChars, ALineWidth);
  {$ENDIF}
end;

function IsEmpty(Input: String): Boolean;
begin
  Result := (Input = #0) or (Input = '') or (Length(Input) = 0);
end;

procedure InsertStringsBetweenKeyWords(AList: TStrings; AText, AKeyword1, AKeyword2: string);
var
  I: Integer;
begin
  DeleteStringsBetweenKeyWords(AList, AKeyword1, AKeyword2, I);
  AList.BeginUpdate;
  try
    AList.Insert(I + 1, AText);
  finally
    AList.EndUpdate;
  end;
end;

function IsPrintableChar(const C: Char): boolean;
begin
  Result := (C > #31) and (C < #127);
//  case C of
//    #0 .. #31, #127 .. #159:
//      Result := False;
//  else
//    Result := True;
//  end;
end;

function LeftStr(const s: string; n: integer): string;
begin
  Result := System.StrUtils.LeftStr(s, n);
end;

function LeftStrRaw(const s: string; n: integer): string;
var
  AUTF8Str: UTF8String;
  AUTF8StrEncoded: UTF8String;
begin
  if (Length(s) = 0) or (n <= 0) then
    Exit('');
  AUTF8StrEncoded := UTF8Encode(s);
  if Length(AUTF8StrEncoded) > n then
    SetLength(AUTF8Str, n)
  else
    SetLength(AUTF8Str, Length(AUTF8StrEncoded));
  Move(AUTF8StrEncoded[1], AUTF8Str[1], Length(AUTF8Str));
  Result := AUTF8Str;
end;

function LinePosInList(AValue: string; AList: TStrings): Integer;
var
 i: Integer;
begin
  Result := -1;
  if Assigned(AList) then
    for i := 0 to AList.Count -1 do
      if Pos(AValue, AList[i]) > 0 then
      begin
         Result := i;
         Break;
      end;
end;

function LPadZero(S: string; N: Integer): string;
begin
  S := Trim(S);
  if Length(S) < N then
     Result := Repl('0', N - Length(S)) + S
  else
     Result := S;
end;

function NumToken(Str, Delimeter: string): Integer;
var
  AStr:String;
  APos:Integer;
begin
  AStr := Str;
  Result := 0;
  APos :=  Pos(Delimeter, AStr);
  while APos <> 0 do
  begin
    Inc(Result);
    AStr := Copy(AStr, APos + Length(Delimeter), Length(AStr));
    APos :=  Pos(Delimeter, AStr);
  end;
  if AStr <> '' then
    Inc(Result);
end;

function PasteStrFromClipbrd: String;
begin
  Result := '';
  if Clipboard.HasFormat(CF_TEXT) then
     Result := Clipboard.AsText;
end;

function PosOfWord(const AWord: string; const AInText: string;
  const AStartPos: Integer; AIgnoreCase: Boolean): Integer;
const
  C_EXCLUDE_CHAR = ['_'];
var
   s_find, s_text: String;
   i: Integer;

   function _IsWord(const p: Integer): Boolean;
   var
      i_before, i_after: Integer;
   begin
     i_before := p - 1;
     i_after := p + Length(s_find);
     Result := ((i_before <= 0) or
                 not IsCharAlphaNumeric(s_text[i_before]) and
                 not CharInSet(s_text[i_before], C_EXCLUDE_CHAR)) and
               ((i_after <= Length(s_text)+1) and
                 not IsCharAlphaNumeric(s_text[i_after]) and
                 not CharInSet(s_text[i_after], C_EXCLUDE_CHAR));
   end;

begin
  Result := -1;

  if AIgnoreCase then
     begin
       s_find := UpperCase(AWord);
       s_text := UpperCase(AInText);
     end
  else
     begin
       s_find := AWord;
       s_text := AInText;
     end;

  i := PosEx(s_find, s_text);
  while i > 0 do
  begin
    if _IsWord(i) then
       begin
         Result := i;
         Break;
       end;
    i := PosEx(s_find, s_text, i + Length(s_find));
  end
end;

function Repl(s: string; n: integer): string;
var
  i: integer;
begin
  Result := '';
  for i := 1 to n do
    Result := Result + s;
end;

function RightStr(const s: string; n: integer): string;
begin
  Result := System.StrUtils.RightStr(s, n);
end;

function RPos(const SubStr, S : string):Integer;
var
  TotalLen : Integer;
  SubStrLen: Integer;
  I        : Integer;
begin
  Result   := 0;
  TotalLen := Length(S);
  SubStrLen := Length(SubStr);

  if (TotalLen = 0) or (SubStrLen = 0) then
    Exit;

  for I := TotalLen - SubStrLen + 1 downto 1 do
    if Copy(S, I, SubStrLen) = SubStr then
    begin
      Result := I;
      Exit;
    end;
end;

procedure SaveStrToFile(const S: string; const FileName: string);
var
  sl: TStringList;
begin
  sl := TStringList.Create;
  try
    sl.Text := S;
    sl.SaveToFile(FileName);
  finally
    sl.Free;
  end;
end;

function Space(const n:integer):string;
begin
  Result := StringOfChar(BLANK, n);
end;

function SplitStrToArray(const Input: string; Pattern: array of char): TArray<string>;
var
  i: Integer;
  tmp: string;

  procedure _addChunk;
  var
    x: Integer;
  begin
    x := high(Result) + 1;
    SetLength(Result, x + 1);
    Result[x] := tmp;
    tmp := '';
  end;

begin
  SetLength(Result, 0);
  for i := 1 to Length(Input) do
  begin
    if CharInArray(Input[i], Pattern) then
      _addChunk
    else
      tmp := tmp + Input[i];
    if i = Length(Input) then
      _addChunk;
  end;
end;

function StrAfterDot(const S: string; ASep: String = '.'): string;
var
  I: Integer;
begin
  I := Pos(ASep, S);
  if I > 0 then
    Result := Copy(S, I + 1, Length(S))
  else
    Result := S;
end;

function StringListToStr(AList: TStringList; ADelimiter: string = ';'): string;
var
  I: Integer;
begin
  // Initialization
  Result := '';
  // Validation
  if not Assigned(AList) then
   Exit;
  // Return delimited string
  for I := 0 to AList.Count - 1 do
    if I = 0 then
       Result := AList[ I ]
    else
       Result := Result + ADelimiter + AList[ I ];
end;

function StrToFloatSafe(S: string): Double;
begin
  s := StringReplace(S, FormatSettings.ThousandSeparator, '', [rfReplaceAll]);
  if not TryStrToFloat(s, Result) then
     Result := 0;
end;

procedure StrToStringList(S: string; AList: TStringList);
begin
  AList.Clear;
  AList.Delimiter := ';';
  AList.StrictDelimiter := True;
  AList.DelimitedText := S;
end;

procedure StrToStringListExA( AMsg: string; ASL: TStringList; ALength: Integer);
var
  APos, I, J, AInitPos:Integer;
  ANoSpacesFound:Boolean;
  AStr:String;
  ASLTmp:TStringList;
begin
  if Alength < 1 then Exit;
  AMsg := StrTran(AMsg, #10, #13);
  AMsg := Trim(AMsg);
  //AStr := AMsg;
  //APos := Pos(#13, AStr);

  try
    ASLTmp:= TStringList.Create;
    ASLTmp.Text:= AMsg;

    for J := 0 to ASLTmp.Count - 1 do
    begin
      AStr := ASLTmp[J];
      if Length(AStr) > ALength then
      begin
        APos := 1;
        repeat
          ANoSpacesFound := True;
          AInitPos  := APos;
          for I := AInitPos + ALength downto APos do
          begin
            if Pos(AStr[I], ' ') <> 0 then
            begin
              ASL.Add(Trim(Copy(AStr, APos, I - AInitPos)));
              APos := I + 1;
              ANoSpacesFound := False;
              Break;
            end;
          end;
          if ANoSpacesFound then
          begin
            ASL.Add(Trim(Copy(AStr, AInitPos, ALength)));
            APos := AInitPos + ALength;
          end
        until Length(AStr) - APos + 1 <= ALength;
        ASL.Add(Trim(Copy(AStr, APos, ALength)));
      end
      else
        ASL.Add(Trim(AStr));
    end;
  finally
    ASLTmp.Free;
  end;
end;

procedure StrToStringListExB(const S: String; const ADelim: array of Char;
  var AList: TStringList);
var
   i: Integer;
   ATemp: String;
   c: Char;
begin
  if (AList = NIL) then Exit;
  ATemp := S;
  for i := Low(ADelim) to High(ADelim) do
  begin
   c := ADelim[i];
   ATemp := StrTran(ATemp, c, #13);
  end;
  AList.Text := ATemp;
end;


function StrInList(const S: string; const ANames: array of string): Boolean; overload;
var
  I: Integer;
begin
  for I := Low(ANames) to High(ANames) do
    if AnsiCompareText(S, ANames[I]) = 0 then
      Exit(True);
  Result := False;
end;

function StrInList(const S: string; const ANames : TStringList): Boolean; overload;
var
  SaveCase: Boolean;
begin
  SaveCase := ANames.CaseSensitive;
  try
    ANames.CaseSensitive := False;
    Result := ANames.IndexOf(S) > -1;
  finally
    ANames.CaseSensitive := SaveCase;
  end;
end;

function StrTran(const cSource, cFind, cReplace: string): string;
begin
  Result := StringReplace(cSource, cFind, cReplace, [rfReplaceAll]);
end;

function StrTranFirstOnly(const cSource, cFind, cReplace: string): string;
begin
  Result := StringReplace(cSource, cFind, cReplace, []);
end;

function StrTranStrict(const cSource, cFind, cReplace: string): string;
const
  cSEPARATORS = [chr(0) .. chr(32), '~', '!', '@', '#', '$', '%', '^', '&', '*',
    '(', ')', '-', '=', '+', ';', '"', '<', '>', '[', ']', '{', '}'];
var
  s: string;
  I: integer;
begin
  s := cSource;
  Result := '';

  repeat
    I := Pos(cFind, s);

    if I > 0 then
      begin
        { is this "isolated" token - check before and after cFind }
        if ((I = 1) or CharInSet(s[I - 1], cSEPARATORS))
          and
          ((I + Length(cFind) - 1 = Length(s)) or
          (CharInSet(s[I + Length(cFind)], cSEPARATORS))) then
          begin
            Result := Result + LeftStr(s, I - 1) + cReplace;
            s := Copy(s, I + Length(cFind), Length(cSource));
          end
        else
          begin
            Result := Result + LeftStr(s, I - 1) + cFind;
            s := Copy(s, I + Length(cFind), Length(cSource));
          end;
      end;

  until I = 0;
  Result := Result + s;
end;

function RemoveWhiteSpace(const AText: string;
  const AReplace: Char): string;
var
  i: integer;
  c: Char;
begin
  if aReplace = #0 then
    Result := Filter(aText,
                function (C: Char): Boolean
                begin
                  Result := not C.IsWhiteSpace;
                end)
  else
  begin
    SetLength(Result, Length(aText));
    i := 0;
    for c in aText do
    begin
      inc(i);
      if c.IsWhiteSpace then
        Result[i] := AReplace;
    end;
  end;
end;

procedure Tokenize(const AText: string; const ADelims: array of Char; var AList: TStringList);
var
  i: integer;
begin
  // incoming string list is required
  if not Assigned(AList) then
     Exit;

  TokenizeStrict(AText, ADelims, AList);

  // One final wrinkle...if the delimiters were contiguous, then some empty
  // strings were included. Delete the empty ones.
  for i := AList.Count downto 1 do
    if (Length(AList.Strings[i-1]) = 0) then
       AList.Delete(i-1);
end;

procedure TokenizeStrict(const AText: String; const ADelims: array of Char; var AList: TStringList);
{"Tokenize" a string (AText) using the array of delimiters.
 Since this is "strict" tokenization, some items may be empty.}
var
  nPos: Integer;
  lnStr: String;

  function _firstPos(const aString: string): integer;
  const
    max = MaxInt;
  var
    minPos: integer;
    i: integer;
    aPos: integer;
  begin
    minPos := max;

    // Look at the position of each delimiter in the string, and find the one
    // closest to the start of the string
    for i := 0 to high(ADelims) do
    begin
      aPos := pos(ADelims[i], aString);
      if (aPos <> 0) and (aPos < minPos) then
      begin
        minPos := aPos;
      end;
    end;

    // If we didn't hit a nonzero min, we have none of them - return 0, like pos
    if (minPos = max) then
      result := 0
    // If we _did_ hit a nonzero min, that's the one we want
    else
      result := minPos;
  end;


begin
  // incoming string list is required
  if not Assigned(AList) then
     Exit;

  // Clear the list
  AList.Clear;

  // Local copy of the string
  lnStr := AText;

  // Initialize the first position
  nPos := _firstPos(lnStr);

  // Now, step through, finding all substrings with any of these
  // delimiters
  while (nPos <> 0) do
  begin
    AList.Add(Copy(lnStr, 1, nPos-1));
    Delete(lnStr, 1, nPos);
    nPos := _firstPos(lnStr);
  end;

  // Add last string
  AList.Add(lnStr);
end;

procedure TokenizeWhiteSpace(const AText: String;
 var AList: TStringList);
begin
  // incoming string list is required
  if not Assigned(AList) then
     Exit;

  Tokenize(AText,[' ', #9, #13, #10], AList);
end;

function WordExists(const AText, AWord: string; const AIgnoreCase: Boolean; var AStartPos, AEndPos: integer): Boolean;
const
  SEPARATORS: set of char = [' ', '.', ',', '?', '!', ';', #13, #10,
    #09, '(', ')', '{', '}', '|', '<', '>'];
var
  ABefore, AAfter: Boolean;
  C: Char;
begin
  Result := False;
  AStartPos := 0;
  while (not Result) do
  begin
    inc(AStartPos);
    if AIgnoreCase then
      AStartPos := System.StrUtils.PosEx(LowerCase(AWord), LowerCase(AText), AStartPos)
    else
      AStartPos := System.StrUtils.PosEx(AWord, AText, AStartPos);

    if AStartPos = 0 then
      Exit;

    AEndPos := AStartPos + Length(AWord) - 1;

    C := AText[AStartPos - 1];

    if (AStartPos = 1) or (CharInSet(C, SEPARATORS) or C.IsPunctuation or C.IsWhiteSpace) then
      ABefore := True
    else
      ABefore := False;

    C := AText[AStartPos + 1];

    if (AEndPos = Length(AText)) or (CharInSet(C, SEPARATORS) or C.IsPunctuation or C.IsWhiteSpace) then
      AAfter := True
    else
      AAfter := False;

    Result := ABefore and AAfter;
  end;
end;

procedure WriteStrToFile(AFileName: string; AValue: AnsiString );
var
  Stream: TFileStream;
begin
  if not FileExists(AFileName) then
    Stream := TFileStream.Create(AFileName, fmCreate)
  else
    Stream := TFileStream.Create(AFileName, fmOpenReadWrite);
  try
    Stream.Seek(0, soFromEnd);
    Stream.WriteBuffer(Pointer(AValue)^, Length(AValue));
  finally
    Stream.Free;
  end;
end;


function Nz(Input: Real; Output: Real): Real;
begin
  if IsNan(Input) or (Input = 0)  then
    Result := Output
  else
    Result := Input;
end;

function Nz(Input: Integer; Output: Integer): Integer;
begin
  if IsNan(Input) or (Input = 0) then
    Result := Output
  else
    Result := Input;
end;

function Nz(Input: Cardinal; Output: Cardinal): Cardinal;
begin
  if IsNan(Input) then
    Result := Output
  else
    Result := Input;
end;

function Nz(Input: String; Output: String): String;
begin
  if IsEmpty(Input) then
    Result := Output
  else
    Result := Input;
end;

function Nz(Input: PChar; Output: PChar): PChar;
begin
  if (Input = #0) or (Input = '') or (Length(Input) = 0) then
    Result := Output
  else
    Result := Input;
end;

function Nz(Input: Char; Output: Char): Char;
begin
  if (Input = #0) or (Input = '') or (Length(Input) = 0) then
    Result := Output
  else
    Result := Input;
end;

function Nz(Input: Variant; Output: Variant): Variant; overload;
begin
//  if System.Variants.VarIsNull(Input) or System.Variants.VarIsEmpty(Input) then
//    Result := Output
//  else
//    Result := Input;
end;


end.
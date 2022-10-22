unit IQMS.WebVcl.FieldMap;

interface

uses
  Classes, Windows, SysUtils;

type
  TFieldMap = class;

  { TMapPart }
  TMapPart = (mpSource, mpTarget);


  { TFieldMap }
  TFieldMap = class(TComponent)
    FItems: TStringList;
    private
    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;

      procedure Add(const ATarget, ASource: string);
      procedure AddMap(const AFieldMap: TFieldMap);
      procedure GetSourceFields(var AList: TStringList;
        AsParams: Boolean = FALSE);
      procedure GetTargetFields(var AList: TStringList;
        AsParams: Boolean = FALSE);
      function GetFieldMapField(AIndex: Integer; AMapPart: TMapPart): string;
      procedure Clear;
      function Count: Integer;
      function Target(const AIndex: Integer): string;
      function Source(const AIndex: Integer): string;

      function CommaText(const AMapPart: TMapPart): string; overload;
      function CommaText: string; overload;
      procedure AddFromCommaText(const AFieldMapText: string);
      function IndexOfSource(const AValue: string): Integer;
      function IndexOfTarget(const AValue: string): Integer;
    published
      property Items: TStringList
        read FItems
        write FItems;
  end;

implementation


{ TFieldMap }

constructor TFieldMap.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FItems := TStringList.Create;
end;

destructor TFieldMap.Destroy;
begin
  if Assigned(FItems) then
    FreeAndNil(FItems);
  inherited Destroy;
end;

procedure TFieldMap.Add(const ATarget, ASource: string);
begin
  // Example:  TARGET_FIELD=SOURCE_FIELD
  FItems.Add(Format('%s=%s', [ATarget, ASource]));
end;

function TFieldMap.GetFieldMapField(AIndex: Integer;
  AMapPart: TMapPart): string;
var
  i: Integer;
  S: string;
begin

  Result := ''; // default result

  // Check for valid index
  if (FItems.Count = 0) or (AIndex < 0) or (AIndex > FItems.Count - 1) then
    Exit;

  // full line of text
  // Example:  TARGET_FIELD=SOURCE_FIELD
  S := FItems.Strings[AIndex];

  // Find the equal (=) sign
  i := Pos('=', S);

  // Return the single field for either part if there is no equal sign
  if i = 0 then
    Result := Trim(S)
    // Otherwise, get the part
  else
    case AMapPart of
      mpSource: // right side
        // Note:  Do not trim the source field name; it may contain a space.
        // This is OK, since it allows the import to work.  In the end,
        // the Oracle field name will not contain a space. (04/16/2010).
        // Result := Trim(Copy( S, i + 1, Length( S )));
        Result := Copy(S, i + 1, Length(S));
      mpTarget: // left side
        Result := Trim(Copy(S, 1, i - 1));
    end;
end;

procedure TFieldMap.GetSourceFields(var AList: TStringList; AsParams: Boolean);
var
  i: Integer;
  S: string;
begin
  if not Assigned(AList) then
    Exit;

  AList.Clear; // clear first

  // Cycle list and get fields
  for i := 0 to FItems.Count - 1 do
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

procedure TFieldMap.GetTargetFields(var AList: TStringList; AsParams: Boolean);
var
  i: Integer;
  S: string;
begin
  if not Assigned(AList) then
    Exit;

  AList.Clear; // clear first

  // Cycle list and get fields
  for i := 0 to FItems.Count - 1 do
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

function TFieldMap.IndexOfSource(const AValue: string): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to FItems.Count - 1 do
   if CompareText(AValue, GetFieldMapField(i, mpSource)) = 0 then
     begin
       Result := i;
       Break;
     end;
end;

function TFieldMap.IndexOfTarget(const AValue: string): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to FItems.Count - 1 do
   if CompareText(AValue, GetFieldMapField(i, mpTarget)) = 0 then
     begin
       Result := i;
       Break;
     end;
end;

function TFieldMap.CommaText: string;
begin
  Result := StringReplace(Trim(FItems.Text), #13, ',', [rfReplaceAll, rfIgnoreCase]);
end;

function TFieldMap.Count: Integer;
begin
  Result := FItems.Count;
end;

procedure TFieldMap.AddFromCommaText(const AFieldMapText: string);
begin
  FItems.Text := StringReplace(AFieldMapText, ',', #13, [rfReplaceAll, rfIgnoreCase]);
end;

procedure TFieldMap.AddMap(const AFieldMap: TFieldMap);
begin
  if not Assigned(AFieldMap) then
    Exit;

  FItems.AddStrings(AFieldMap.Items);
end;

function TFieldMap.Source(const AIndex: Integer): string;
begin
  if AIndex > -1 then
    Result := GetFieldMapField(AIndex, mpSource)
  else
    Result := '';
end;

function TFieldMap.Target(const AIndex: Integer): string;
begin
  if AIndex > -1 then
    Result := GetFieldMapField(AIndex, mpTarget)
  else
    Result := '';
end;

function TFieldMap.CommaText(const AMapPart: TMapPart): string;
const
  Delimiter = ',';
  QuoteChar = '"';
var
  S: string;
  P: PChar;
  i, ACount: Integer;

  function _Get(AIndex: Integer): string;
  begin
    Result := GetFieldMapField(AIndex, AMapPart);
  end;

begin
  ACount := Self.Count;
  if (ACount = 1) and (_Get(0) = '') then
    Result := QuoteChar + QuoteChar
  else
    begin
      Result := '';
      for i := 0 to ACount - 1 do
        begin
          S := _Get(i);
          P := PChar(S);
          while not (P^ in [#0 .. ' ', QuoteChar, Delimiter]) do
{$IFDEF MSWINDOWS}
            P := CharNext(P);
{$ELSE}
            Inc(P);
{$ENDIF}
          if (P^ <> #0) then
            S := AnsiQuotedStr(S, QuoteChar);
          Result := Result + S + Delimiter;
        end;
      System.Delete(Result, Length(Result), 1);
    end;
end;

procedure TFieldMap.Clear;
begin
  Self.Items.Clear;
end;


end.

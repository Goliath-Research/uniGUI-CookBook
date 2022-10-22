unit IQMS.Common.HTMLConverter;

interface

uses
  System.Classes, System.SysUtils;

type
  THtmlConverter = class
    private
     FHtmlText: string;
     function HasHtmlTags(const AList: TStringList): Boolean;
     procedure Append(const AValue: string);
     procedure AppendPara(const AValue: string);
    public
     function Convert(const AList: TStringList): string;
     procedure ConvertStringList(const AList: TStringList; var AHtml: TStringList);
    public
     class function AsHtmlString(const AList: TStringList): string;
     class procedure AsHtmlStringList(const AList: TStringList; var AHtml: TStringList);
  end;

implementation

uses
  System.StrUtils;

{ THtmlConverter }

class function THtmlConverter.AsHtmlString(const AList: TStringList): string;
begin
  with Self.Create do
  try
    Result := Convert(AList);
  finally
    Free;
  end;
end;

class procedure THtmlConverter.AsHtmlStringList(const AList: TStringList; var AHtml: TStringList);
begin
  with Self.Create do
  try
    ConvertStringList(AList, AHtml);
  finally
    Free;
  end;
end;

procedure THtmlConverter.Append(const AValue: string);
begin
  FHtmlText := FHtmlText + AValue;
end;

procedure THtmlConverter.AppendPara(const AValue: string);
begin
  Append(AValue + '<br>');
end;

function THtmlConverter.Convert(const AList: TStringList): string;
var
  i: Integer;
begin
  FHtmlText := '';
  if Assigned(AList) then
  begin
    // If HTML formatting has already been applied,
    // exit now.
    if HasHtmlTags(AList) then
    begin
      Exit(AList.Text);
    end;

    Append('<html>');
    Append('<body>');

    for i := 0 to AList.Count - 1 do
      AppendPara(AList.Strings[i]);

    Append('</body>');
    Append('</html>');
  end;

  Result := FHtmlText;
end;

procedure THtmlConverter.ConvertStringList(const AList: TStringList; var AHtml: TStringList);
var
  i: Integer;
begin
  AHtml.Clear;
  if Assigned(AList) and Assigned(AHtml) then
  begin
    // If HTML formatting has already been applied,
    // exit now.
    if HasHtmlTags(AList) then
      begin
        AHtml.AddStrings(AList);
        Exit;
      end;

    AHtml.Add('<html>');
    AHtml.Add('<body>');
    for i := 0 to AList.Count - 1 do
      AHtml.Add(AList.Strings[i] + '<br>');
    AHtml.Add('</body>');
    AHtml.Add('</html>');
  end;
end;

function THtmlConverter.HasHtmlTags(const AList: TStringList): Boolean;
var
  i: Integer;
  AStartTagFound, AEndTagFound: Boolean;
begin
  AStartTagFound := False;
  AEndTagFound := False;

  // Find the start tag
  for i := 0 to AList.Count - 1 do
  begin
    if not String.IsNullOrWhiteSpace(AList.Strings[i]) and
      not AStartTagFound and
      AList.Strings[i].Contains('<html') then
      begin
        AStartTagFound := True;
        Break;
      end;
  end;

  // Find the end tag
  for i := AList.Count - 1 downto 0 do
  begin
    if not String.IsNullOrWhiteSpace(AList.Strings[i]) and
      not AEndTagFound and
      AList.Strings[i].Contains('</html>') then
      begin
        AEndTagFound := True;
        Break;
      end;
  end;

  Result := AStartTagFound and AEndTagFound;
end;

end.

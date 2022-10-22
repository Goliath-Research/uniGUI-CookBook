unit IQMS.WebVcl.OptionDialog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Variants, math;

type
  TSelectedIndex = 1 .. 250;
  TSelectedIndexes = set of TSelectedIndex;

  TIQWebOptionDialog = class(TComponent)
  private
    { Private declarations }
    FTitle, FPrompt, FRegKey, FSelectedIndexesStr: String;
    FItems: TStringList;
    FSelectedArray: array of Integer;
    procedure _SaveSelected;
    procedure _LoadSelected;
    procedure SetItems(const Value: TStringList);
    procedure SetSelectedIndexesStr(const Value: String);
  protected
    { Protected declarations }
    procedure Loaded; override;
    procedure ParseSelected(ASelectedStr: String);
  public
    { Public declarations }
    SelectedIndexes: TSelectedIndexes;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: Boolean;
    function HintText: String;
    function SelectedIndexesStrEx(ADelimiter: String): String;
    function SelectedCount: Integer;
  published
    { Published declarations }
    property Items: TStringList read FItems write SetItems;
    property PromptMsg: String read FPrompt write FPrompt;
    property SaveToRegKey: String read FRegKey write FRegKey;
    property SelectedIndexesStr: String read FSelectedIndexesStr
      write SetSelectedIndexesStr;
    property Title: String read FTitle write FTitle;
  end;

implementation

{ TIQWebOptionDialog }

uses
  IQMS.Common.Numbers,
  IQMS.WebVcl.OptionDialogForm,
  IQMS.Common.StringUtils,
  IQMS.Common.Registry;

constructor TIQWebOptionDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FPrompt := '';
  FRegKey := '';
  FTitle := 'Options';
  FRegKey := Self.Name;
  FItems := TStringList.Create;
  FSelectedArray := VarArrayCreate([0, 0], varInteger);
end;

procedure TIQWebOptionDialog.Loaded;
begin
  inherited Loaded;
  if (not (csDesigning in ComponentState)) then
    _LoadSelected;
end;

destructor TIQWebOptionDialog.Destroy;
begin
  if Assigned(FItems) then
    FreeAndNil(FItems);
  inherited Destroy;
end;

function TIQWebOptionDialog.Execute: Boolean;
var
  i, c: Integer;
  S: String;
begin
  Result := False;
  with TFrmIQOptionDialog.Create(Self) do
    begin
      Caption := FTitle;
      Prompt := FPrompt;
      lstOptions.Items.Text := FItems.Text;

      for i := 0 to lstOptions.Items.Count - 1 do
        lstOptions.Checked[i] := (i in SelectedIndexes);

      Result := ShowModal = mrOk;
      // Update the new "selected indexes" value
      if Result then
        begin
          SelectedIndexes := [];
          FSelectedIndexesStr := '';
          c := 0;
          for i := 0 to lstOptions.Items.Count - 1 do
            if lstOptions.Checked[i] then
              begin
                SetLength(FSelectedArray, c + 1);
                FSelectedArray[c] := i;
                Inc(c);
                Include(SelectedIndexes, i);
                FSelectedIndexesStr := sIIf(FSelectedIndexesStr = '',
                  IntToStr(i), FSelectedIndexesStr + ',' + IntToStr(i));
              end;
          _SaveSelected;
        end;
    end;

end;

procedure TIQWebOptionDialog.SetItems(const Value: TStringList);
begin
  if FItems.Text <> Value.Text then
    try
      FItems.BeginUpdate;
      FItems.Text := Trim(Value.Text);
    finally
      FItems.EndUpdate;
    end;
end;

function TIQWebOptionDialog.SelectedCount: Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to FItems.Count - 1 do
    if (i in SelectedIndexes) then
      Inc(Result);
end;

function TIQWebOptionDialog.HintText: String;
var
  i: Integer;
  S: String;
  AHint: TStringList;
begin
  try
    AHint := TStringList.Create;

    for i := 0 to FItems.Count - 1 do
      if (i in SelectedIndexes) then
        AHint.Add('  ' + FItems.Strings[i]);

    if AHint.Count > 0 then
      begin
        AHint.Insert(0, FTitle + ':');
        Result := Trim(AHint.Text);
      end
    else
      Result := FTitle;

  finally
    if Assigned(AHint) then
      FreeAndNil(AHint);
  end;
end;

procedure TIQWebOptionDialog._LoadSelected;
var
//  i, x, n, m, c: Integer;
  APath, AForm, ASavedStr, S: String;
  // A: array of Integer;
begin
  // Get string list from Registry
  if (FRegKey = '') then
    Exit;
  if (Owner <> NIL) and (Owner is TForm) then
    AForm := TForm(Owner).Name;
  APath := StrTran(Format('\Software\IQMS\IQWin32\%s\%s\', [Application.Name,
    AForm]), '\\', '\');
  ASavedStr := LoadStrFromCurrentUserRegistry(APath, FRegKey); // IQMS.Common.Registry
  ParseSelected(ASavedStr);
  { FSelectedIndexesStr := '';
    SetLength(FSelectedArray,0);
    x := NumToken(ASavedStr, ','); //iqstring
    m := FItems.Count-1;
    if x = 0 then Exit;
    c := 0;
    for i := 1 to x do
    begin
    S := GetToken(ASavedStr,',',i);
    if not IsStringValidInteger(S, n) then CONTINUE;
    if InRange(n,0,m) then
    begin
    SetLength(FSelectedArray, c+1);
    FSelectedArray[c] := n;
    Inc(c);
    Include(SelectedIndexes, n );
    FSelectedIndexesStr := sIIf(FSelectedIndexesStr='',IntToStr(n), FSelectedIndexesStr + ',' + IntToStr(n));
    end;
    end; }
end;

procedure TIQWebOptionDialog._SaveSelected;
var
  i: Integer;
  APath, AForm, S: String;
begin
  if (FRegKey = '') then
    Exit;
  if (Owner <> NIL) and (Owner is TForm) then
    AForm := TForm(Owner).Name;
  APath := StrTran(Format('\Software\IQMS\IQWin32\%s\%s\', [Application.Name,
    AForm]), '\\', '\');
  SaveStrToCurrentUserRegistry(APath, FRegKey, FSelectedIndexesStr); // IQMS.Common.Registry
end;

procedure TIQWebOptionDialog.SetSelectedIndexesStr(const Value: String);
begin
  FSelectedIndexesStr := Value;
  if (not (csDesigning in ComponentState)) then
    ParseSelected(Value);
end;

procedure TIQWebOptionDialog.ParseSelected(ASelectedStr: String);
var
  i, x, n, m, c: Integer;
  APath, AForm, S: String;
begin
  FSelectedIndexesStr := '';
  SetLength(FSelectedArray, 0);
  x := NumToken(ASelectedStr, ','); // iqstring
  m := FItems.Count - 1;
  if x = 0 then
    Exit;
  c := 0;
  for i := 1 to x do
    begin
      S := GetToken(ASelectedStr, ',', i);
      if not IsStringValidInteger(S, n) then
        CONTINUE;
      if InRange(n, 0, m) then
        begin
          SetLength(FSelectedArray, c + 1);
          FSelectedArray[c] := n;
          Inc(c);
          Include(SelectedIndexes, n);
          FSelectedIndexesStr := sIIf(FSelectedIndexesStr = '', IntToStr(n),
            FSelectedIndexesStr + ',' + IntToStr(n));
        end;
    end;
end;

function TIQWebOptionDialog.SelectedIndexesStrEx(ADelimiter: String): String;
begin
  Result := StringReplace(FSelectedIndexesStr, ',', ADelimiter,
    [rfReplaceAll, rfIgnoreCase]);
end;

end.

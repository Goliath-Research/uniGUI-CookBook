unit IQMS.WebVcl.ResultsList;

interface
uses
  System.SysUtils,
  System.Variants,
  System.Classes,
  Data.DB;

{$REGION 'TResultsList type'}
type
  { Forwards }
  TResultListItem = class;

  { TResultsList }
  TResultsList = class(TCollection)
  private
    { Private declarations }
    function GetItems(Index: Integer): TResultListItem;
    procedure SetItems(Index: Integer; const Value: TResultListItem);
    function AddItem: TResultListItem;
  public
    { Public declarations }
    constructor Create;
    function Add: TResultListItem;
    function AddRecord(ADataSet: TDataSet): TResultListItem;
    function IndexOf(const AFieldName: string): Integer;
    function FindItem(const AFieldName: string): TResultListItem;
    function GetValue(const AFieldName: string): Variant;
    property Items[Index: Integer]: TResultListItem read GetItems
      write SetItems; default;
  end;

  { TResultListItem }
  TResultListItem = class(TCollectionItem)
  private
    { Private declarations }
    FFieldName: string;
    FValue: Variant;
  public
    { Public declarations }
    constructor Create(Collection: TCollection); override;
  published
    { Published declarations }
    property FieldName: string read FFieldName write FFieldName;
    property Value: Variant read FValue write FValue;
  end;

{$ENDREGION 'TResultsList type'}


implementation

uses
  IQMS.WebVcl.ResourceStrings;

{$REGION 'TResultsList'}

{ TResultListItem }

constructor TResultListItem.Create(Collection: TCollection);
begin
  inherited Create(TResultsList(Collection));
  FFieldName := '';
  FValue := Unassigned;
end;

{ TResultsList }

constructor TResultsList.Create;
begin
  inherited Create(TResultListItem);
end;

function TResultsList.Add: TResultListItem;
begin
  Result := AddItem;
end;

function TResultsList.AddItem: TResultListItem;
begin
  Result := TResultListItem(inherited Add);
end;

function TResultsList.AddRecord(ADataSet: TDataSet): TResultListItem;
var
  i: Integer;
begin
  if Assigned(ADataSet) then
    for i := 0 to ADataSet.FieldCount - 1 do
      with Add do
        begin
          FieldName := ADataSet.Fields[i].FieldName;
          if ADataSet.Fields[i].IsNull then
            case ADataSet.Fields[i].DataType of
              ftUnknown:
                raise Exception.Create
                  (IQMS.WebVcl.ResourceStrings.cTXT0000105 { 'Unknown or undetermined data type. Please contact IQMS.' } );
              ftSmallint, ftInteger, ftLargeInt,
                ftWord, ftFloat, ftCurrency,
                ftBCD, ftBytes,
                ftVarBytes:
                Value := 0;
              ftDate,
                ftDateTime:
                Value := Date;
              ftTime:
                Value := Now;
              ftString,
                ftMemo,
                ftFmtMemo:
                Value := '';
              ftBoolean:
                Value := FALSE;
            end
          else
            Value := ADataSet.Fields[i].Value;
        end;
end;

function TResultsList.GetItems(Index: Integer): TResultListItem;
begin
  Result := TResultListItem(inherited Items[Index]);
end;

function TResultsList.GetValue(const AFieldName: string): Variant;
var
  AItem: TResultListItem;
begin
  Result := Unassigned;
  AItem := FindItem(AFieldName);
  if Assigned(AItem) then
    Result := AItem.Value;
end;

procedure TResultsList.SetItems(Index: Integer; const Value: TResultListItem);
begin
  inherited Items[Index] := Value;
end;

function TResultsList.FindItem(const AFieldName: string): TResultListItem;
var
  i: Integer;
begin
  i := IndexOf(AFieldName);
  if i < 0 then
    Result := nil
  else
    Result := TResultListItem(Items[i]);
end;

function TResultsList.IndexOf(const AFieldName: string): Integer;
var
  i: Integer;
begin
  Result := - 1;
  for i := 0 to Count - 1 do
    if CompareText(TResultListItem(Items[i]).FieldName, AFieldName) = 0 then
      begin
        Result := i;
        Break;
      end;
end;

{$ENDREGION 'TResultsList'}

end.

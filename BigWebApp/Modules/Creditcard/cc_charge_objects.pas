unit cc_charge_objects;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  iqcc_utils,
  cc_level3;

type
  { Forwards }
  TChargeSourceItems = class;
  TChargeSourceItem = class;

  { TMultipleChargeItems }
  TMultipleChargeItems = class(TComponent)
  private
    { Private declarations }
    FSource: TChargePostingSource;
    FItems: TChargeSourceItems;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ASource: TChargePostingSource);
      reintroduce;
    destructor Destroy; override;
    function Count: Integer;
  published
    { Published declarations }
    property Source: TChargePostingSource read FSource write FSource;
    property Items: TChargeSourceItems read FItems write FItems;
  end;

  { TChargeSourceItems }
  TChargeSourceItems = class(TCollection)
  private
    { Private declarations }
    function GetItems(Index: Integer): TChargeSourceItem;
    procedure SetItems(Index: Integer;
      const Value: TChargeSourceItem);
    function AddItem: TChargeSourceItem;
  public
    { Public declarations }
    constructor Create;
    function Add: TChargeSourceItem;
    function IndexOf(const AID: Real): Integer;
    function FindItem(const AID: Real): TChargeSourceItem;
    property Items[index: Integer]: TChargeSourceItem read GetItems
      write SetItems; default;
  end;

  { TChargeSourceItem }
  TChargeSourceItem = class(TCollectionItem)
  private
    { Private declarations }
    FSourceID: Int64;
    FTotalAmount: Real;
    FChargeTax: Real;
    FSource: TChargePostingSource;
    FFreight: Real;
    FPreviousTax: Real;
    FPreviousAmount: Real;
    FSourceDisplay: string;
    FTransactionID: Real;
    FResponseTransactionNumber: string;
    FChargeAmount: Real;
    FTotalTax: Real;
    FLevel3Items: TLevel3Items;
  public
    { Public declarations }
    // Data: Pointer;
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
  published
    { Published declarations }
    property Source: TChargePostingSource read FSource write FSource;
    property SourceID: Int64 read FSourceID write FSourceID;
    property SourceDisplay: string read FSourceDisplay write FSourceDisplay;

    property TotalAmount: Real read FTotalAmount write FTotalAmount;
    property PreviousAmount: Real read FPreviousAmount write FPreviousAmount;
    property ChargeAmount: Real read FChargeAmount write FChargeAmount;

    property TotalTax: Real read FTotalTax write FTotalTax;
    property PreviousTax: Real read FPreviousTax write FPreviousTax;
    property ChargeTax: Real read FChargeTax write FChargeTax;

    property Freight: Real read FFreight write FFreight;

    property TransactionID: Real read FTransactionID write FTransactionID;
    property ResponseTransactionNumber: string read FResponseTransactionNumber
      write FResponseTransactionNumber;

    property Level3Items: TLevel3Items read FLevel3Items write FLevel3Items;
  end;

implementation

uses
  IQMS.Common.DataLib;

{ TMultipleChargeItems }

constructor TMultipleChargeItems.Create(AOwner: TComponent;
  ASource: TChargePostingSource);
begin
  inherited Create(AOwner);
  Source := ASource;
  FItems := TChargeSourceItems.Create;
end;

destructor TMultipleChargeItems.Destroy;
begin
  if Assigned(FItems) then
    FreeAndNil(FItems);
  inherited Destroy;
end;

function TMultipleChargeItems.Count: Integer;
begin
  Result := FItems.Count;
end;

{ TChargeSourceItems }

constructor TChargeSourceItems.Create;
begin
  inherited Create(TChargeSourceItem);
end;

function TChargeSourceItems.Add: TChargeSourceItem;
begin
  Result := AddItem;
end;

function TChargeSourceItems.AddItem: TChargeSourceItem;
begin
  Result := TChargeSourceItem(inherited Add);
end;

function TChargeSourceItems.GetItems(Index: Integer): TChargeSourceItem;
begin
  Result := TChargeSourceItem(inherited Items[index]);
end;

procedure TChargeSourceItems.SetItems(Index: Integer;
  const Value: TChargeSourceItem);
begin
  inherited Items[index] := Value;
end;

function TChargeSourceItems.FindItem(const AID: Real): TChargeSourceItem;
var
  i: Integer;
begin
  i := IndexOf(AID);
  if i < 0 then
    Result := nil
  else
    Result := TChargeSourceItem(Items[i]);
end;

function TChargeSourceItems.IndexOf(const AID: Real): Integer;
var
  i: Integer;
begin
  Result := - 1;
  for i := 0 to Count - 1 do
    if (TChargeSourceItem(Items[i]).ID = AID) then
    begin
      Result := i;
      Break;
    end;
end;

{ TChargeSourceItem }

constructor TChargeSourceItem.Create(Collection: TCollection);
begin
  inherited Create(TChargeSourceItems(Collection));
  FTransactionID := 0;
  // FLevel3Options := TLevel3Options.Create(Self);
  FLevel3Items := TLevel3Items.Create;
end;

destructor TChargeSourceItem.Destroy;
begin
  if Assigned(FLevel3Items) then
    FreeAndNil(FLevel3Items);
  inherited Destroy;
end;

end.

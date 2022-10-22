unit crm_quote_share;

interface

uses
  System.SysUtils,
  System.Classes,
  Generics.Collections;

(* Examples:
  * Objective:  Get a list of EPlant ID values
  *   var
  *     i: Integer;
  *     AList: TList<System.Int64>; // Generics.Collections
  *   begin
  *     AList := TList<System.Int64>.Create;
  *     try
  *       // Get a list of EPLANT.ID values
  *       FQuoteDetailList.GetEPlantList(AList);
  *       for i := 0 to AList.Count - 1 do
  *         // do something with AList[i]
  *         ...
  *     finally
  *       FreeAndNil(AList);
  *     end;
  *   end;
  *
  * Objective:  Filter the list by EPlant, and then loop the list.
  *
  *   var
  *     i: Integer;
  *     AList: TList<System.Int64>; // Generics.Collections
  *   begin
  *     AList := TList<System.Int64>.Create;
  *     try
  *       // Get a list of Quote Detail items filtered by EPLANT.ID
  *       FQuoteDetailList.GetDetailItemsByEPlantID(1, AList);
  *       for i := 0 to AList.Count - 1 do
  *         // do something with AList[i]
  *         ...
  *     finally
  *       FreeAndNil(AList);
  *     end;
  *   end;
*)

type
  { Forwards }
  TQuoteDetailListItem = class;

  { TQuoteDetailListItem }
  TQuoteDetailList = class(TCollection)
  strict private
    { Private declarations }
    function GetItems(index: Integer): TQuoteDetailListItem;
    procedure SetItems(index: Integer;
      const Value: TQuoteDetailListItem);
  public
    { Public declarations }
    constructor Create;
    function AddItem(AID, AEplantID: System.Int64; ASource: string;
      ASourceID: System.Int64): TQuoteDetailListItem;
    function Add: TQuoteDetailListItem;
    property Items[index: Integer]: TQuoteDetailListItem read GetItems
      write SetItems; default;
    /// <summary> Populate a list with quote detail items for the provided
    /// EPlant ID.  If EPlant ID is zero (0), then all items will be
    /// added to the list.
    /// </summary>
    procedure GetDetailItemsByEPlantID(const AEplantID: System.Int64;
      var AList: TList<System.Int64>);
    /// <summary> Populate a distinct list with the EPLANT_ID values used.
    /// </summary>
    procedure GetEPlantList(var AList: TList<System.Int64>);
  end;

  TQuoteDetailListItem = class(TCollectionItem)
  strict private
    { Private declarations }
    FSource: string;
    FID: System.Int64;
    FSourceID: System.Int64;
    FEPLANT_ID: System.Int64;
  public
    { Public declarations }
    constructor Create(Collection: TCollection); override;
  published
    { Published declarations }
    property ID: System.Int64 read FID write FID;
    property EPLANT_ID: System.Int64 read FEPLANT_ID write FEPLANT_ID;
    property Source: string read FSource write FSource;
    property SourceID: System.Int64 read FSourceID write FSourceID;
  end;

implementation

{$REGION 'TQuoteDetailList'}

{ TQuoteDetailList }

constructor TQuoteDetailList.Create;
begin
  inherited Create(TQuoteDetailListItem);
end;

function TQuoteDetailList.AddItem(AID, AEplantID: System.Int64; ASource: string;
  ASourceID: System.Int64): TQuoteDetailListItem;
begin
  with Add do
    begin
      ID := AID;
      EPLANT_ID := AEplantID;
      Source := ASource;
      SourceID := ASourceID;
    end;
end;

function TQuoteDetailList.Add: TQuoteDetailListItem;
begin
  Result := TQuoteDetailListItem(inherited Add);
end;

procedure TQuoteDetailList.GetDetailItemsByEPlantID(const AEplantID: System.Int64;
  var AList: TList<System.Int64>);
var
  i: Integer;
begin
  if Assigned(AList) then
    for i := 0 to Count - 1 do
      if (AEplantID > 0) and (AEplantID = Items[i].EPLANT_ID) then
        AList.Add(Items[i].ID)
      else if (AEplantID = 0) then
        AList.Add(Items[i].ID);
end;

procedure TQuoteDetailList.GetEPlantList(var AList: TList<System.Int64>);
var
  i: Integer;
begin
  if Assigned(AList) then
    for i := 0 to Count - 1 do
      begin
        if AList.IndexOf(Items[i].EPLANT_ID) = -1 then
          AList.Add(Items[i].EPLANT_ID);
      end;
end;

function TQuoteDetailList.GetItems(index: Integer): TQuoteDetailListItem;
begin
  Result := TQuoteDetailListItem(inherited Items[index]);
end;

procedure TQuoteDetailList.SetItems(index: Integer;
  const Value: TQuoteDetailListItem);
begin
  inherited Items[index] := Value;
end;

{ TQuoteDetailListItem }

constructor TQuoteDetailListItem.Create(Collection: TCollection);
begin
  inherited Create(TQuoteDetailList(Collection));
end;

{$ENDREGION 'TQuoteDetailList'}

end.

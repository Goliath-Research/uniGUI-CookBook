unit IQCore.ListItem;

interface

uses
  Classes,
  DB,
  Spring.Collections,
  IQCore.Interfaces,
  IQCore.Obj;

type

  TIQListItem = class(TInterfacedObject, IIQListItem)
  private
    FID       : integer;
    FText     : string;
    FSeq      : integer;
    FParentID : integer;
    FParent   : IIQPickList;

    function  GetID       : integer;
    function  GetText     : string;
    function  GetSeq      : integer;
    function  GetParentID : integer;
    function  GetParent   : IIQPickList;
    procedure SetID       (val : integer);
    procedure SetText     (val : string);
    procedure SetSeq      (val : integer);
    procedure SetParentID (val : integer);
    procedure SetParent   (val : IIQPickList);

    procedure Save(aDataSet : TDataSet);
  public
    class function  GetListItems(aPickListID : integer) : IList<IIQListItem>;
    class procedure DelListItem(aListItemID : integer);
  end;

implementation

uses
  SysUtils,
  MainModule;

{ TIQListItem }

class procedure TIQListItem.DelListItem(aListItemID: integer);
var
  DataSetWasActive : boolean;
begin
  with UniMainModule.UserIQModel.ListItemDS do
  begin
    DataSetWasActive := Active;
    Active := true;
    try
      if Locate('ID', aListItemID, []) then
      begin
        Delete;
        Refresh;
      end;
    finally
      Active := DataSetWasActive;
    end;
  end;
end;

function TIQListItem.GetID: integer;
begin
  Result := FID;
end;

class function TIQListItem.GetListItems(aPickListID: integer): IList<IIQListItem>;
var
  item  : IIQListItem;
  items : IList<IIQListItem>;
  DataSetFiltered  : boolean;
  DataSetFilter    : string;
  DataSetWasActive : boolean;
begin
  items := TCollections.CreateList<IIQListItem>;

  //// Load all items for that PickListID
  with UniMainModule.UserIQModel do
  begin
    DataSetWasActive := ListItemDS.Active;
    DataSetFiltered  := ListItemDS.Filtered;
    DataSetFilter    := ListItemDS.Filter;
    try
      ListItemDS.Filtered := false;
      ListItemDS.Filter   := Format('PickList_ID = %d', [aPickListID]);
      ListItemDS.Filtered := true;

      ListItemDS.Open;
      try
        while not ListItemDS.Eof do
        begin
          item := TIQListItem.Create;

          item.ID       := ListItemDS.FieldByName('ID'  ).AsInteger;
          item.Text     := ListItemDS.FieldByName('Text').AsString;
          item.Seq      := ListItemDS.FieldByName('Seq' ).AsInteger;
          item.ParentID := aPickListID;

          items.Add(item);

          ListItemDS.Next;
        end;
      finally
        ListItemDS.Close;
      end;
    finally
      ListItemDS.Filter   := DataSetFilter;
      ListItemDS.Filtered := DataSetFiltered;
      ListItemDS.Active   := DataSetWasActive;
    end;
  end;

  Result := items;
end;

function TIQListItem.GetParent: IIQPickList;
begin
  Result := FParent;
end;

function TIQListItem.GetParentID: integer;
begin
  if (FParentID = 0) and (FParent <> nil) then
    FParentID := FParent.ID;

  Result := FParentID;
end;

function TIQListItem.GetSeq: integer;
begin
  Result := FSeq;
end;

function TIQListItem.GetText: string;
begin
  Result := FText;
end;

procedure TIQListItem.Save(aDataSet: TDataSet);
var
  DataSetWasActive : boolean;
begin
  if aDataSet = nil then
    aDataSet := UniMainModule.UserIQModel.ListItemDS;

  DataSetWasActive := aDataSet.Active;
  aDataSet.Active := true;
  try
    if not (aDataSet.State in [TDataSetState.dsEdit, TDataSetState.dsInsert]) then
      if FID = 0 then
        aDataSet.Append
      else
        aDataSet.Edit;

    aDataSet.FieldByName('Text'       ).AsString  := FText;
    aDataSet.FieldByName('PickList_ID').AsInteger := FParentID;

    aDataSet.Post;

    if FID = 0 then
    begin
      UniMainModule.UserIQModel.DataServices.RefreshRecord(aDataSet);
      FID := aDataSet.FieldByName('ID').AsInteger;
    end;
  finally
    aDataSet.Active := DataSetWasActive;
  end;
end;

procedure TIQListItem.SetID(val: integer);
begin
  FID := val;
end;

procedure TIQListItem.SetParent(val: IIQPickList);
begin
  FParent := val;
end;

procedure TIQListItem.SetParentID(val: integer);
begin
  FParentID := val;
end;

procedure TIQListItem.SetSeq(val: integer);
begin
  FSeq := val;
end;

procedure TIQListItem.SetText(val: string);
begin
  FText := val;
end;

end.

unit IQCore.PickList.Item;

interface

uses
  Classes,
  DB,
  Spring.Collections,
  IQCore.Interfaces,
  IQCore.Obj;

type

  TIQListItem = class(TIQObj, IIQPickListItem)
  private
    FText     : string;
    FSeq      : integer;
    FParentID : integer;
    FParent   : IIQPickList;

    function  GetText     : string;
    function  GetSeq      : integer;
    function  GetParentID : integer;
    function  GetParent   : IIQPickList;
    procedure SetText     (val : string);
    procedure SetSeq      (val : integer);
    procedure SetParentID (val : integer);
    procedure SetParent   (val : IIQPickList);
  protected
    procedure Save(aDataSet : TDataSet; aProc : TAssignFieldValuesProc = nil); override;
  public
    class function  GetListItems(aPickListID : integer) : IList<IIQPickListItem>;
    class procedure DelListItem (aListItemID : integer);
    class procedure UpdListItem (aListItemID : integer; aText : string; aSeq : integer);
  end;

implementation

uses
  SysUtils,
  IQWeb.Server.DataServices,
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

class function TIQListItem.GetListItems(aPickListID: integer): IList<IIQPickListItem>;
var
  item  : IIQPickListItem;
  items : IList<IIQPickListItem>;
begin
  items := TCollections.CreateList<IIQPickListItem>;

  with UniMainModule.UserIQModel do
  begin
    DataServices.SetParamValue(PickListItems, 'PickList_ID', aPickListID);

    PickListItems.Open;
    try
      while not PickListItems.Eof do
      begin
        item := TIQListItem.Create;

        item.ID       := PickListItems.FieldByName('ID'  ).AsInteger;
        item.Text     := PickListItems.FieldByName('Text').AsString;
        item.Seq      := PickListItems.FieldByName('Seq' ).AsInteger;
        item.ParentID := aPickListID;

        items.Add(item);

        PickListItems.Next;
      end;
    finally
      PickListItems.Close;
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

procedure TIQListItem.Save(aDataSet: TDataSet; aProc : TAssignFieldValuesProc = nil);
var
  DataSetWasActive : boolean;
begin
  if aDataSet = nil then
    aDataSet := UniMainModule.UserIQModel.ListItemDS;

  DataSetWasActive := aDataSet.Active;
  aDataSet.Active := true;
  try
    inherited Save
    (
      aDataSet,
      procedure
      begin
        aDataSet.FieldByName('Text'       ).AsString  := FText;
        aDataSet.FieldByName('Seq'        ).AsInteger := FSeq;
        aDataSet.FieldByName('PickList_ID').AsInteger := FParentID;
      end
    );
  finally
    aDataSet.Active := DataSetWasActive;
  end;
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

class procedure TIQListItem.UpdListItem(aListItemID: integer; aText: string;
  aSeq: integer);
var
  DataSet : TDataSet;
  DataSetWasActive : boolean;
begin
  DataSet := UniMainModule.UserIQModel.ListItemDS;

  DataSetWasActive := DataSet.Active;
  DataSet.Active := true;
  try
    if not DataSet.Locate('ID', aListItemID, []) then
      Exit;

    if not (DataSet.State in [TDataSetState.dsEdit, TDataSetState.dsInsert]) then
      DataSet.Edit;

    DataSet.FieldByName('Text').AsString  := aText;
    DataSet.FieldByName('Seq' ).AsInteger := aSeq;

    DataSet.Post;
  finally
    DataSet.Active := DataSetWasActive;
  end;
end;

end.

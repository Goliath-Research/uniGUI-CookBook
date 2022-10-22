unit D4W.DataControllerList;

interface

uses
  DB, Actions, Classes, ActnList, SysUtils, Generics.Collections;

type
  TWidgetList = TList<TComponent>;

  TD4WDataControllerLink = class(TCollectionItem)
  strict private
    FDataSource:     TDataSource;
    FToolbarActions: TActionList;
    FWidgets:        TWidgetList;
    function GetPrimaryLink: TD4WDataControllerLink;
    function GetIsPrimaryLink: Boolean;
    procedure SetDataSource(const Value: TDataSource);
    procedure SetIsPrimaryLink(const Value: Boolean);
    procedure SetPrimaryLink(const Value: TD4WDataControllerLink);
    procedure SetToolbarActions(const Value: TActionList);
    procedure WidgetOnNotify(Sender: TObject; const Item: TComponent; Action: TCollectionNotification);
  private
  protected
    procedure SetupFreeNotification(const Value: TComponent);
    procedure Notification(AComponent: TComponent; Operation: TOperation); dynamic;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;

    function FindDataSource(ADataSet: TDataSet): TDataSource;
  published
    property DataSource: TDataSource     read FDataSource      write SetDataSource;
    property IsPrimaryLink: Boolean      read GetIsPrimaryLink write SetIsPrimaryLink;
    property ToolbarActions: TActionList read FToolbarActions  write SetToolbarActions;
    property Widgets: TWidgetList        read FWidgets;
  end;

  TD4WDataControllerLinks = class(TOwnedCollection)
  strict private
    function GetItem(Index: Integer): TD4WDataControllerLink;
    procedure SetItem(Index: Integer; const Value: TD4WDataControllerLink);
  protected
  public
    procedure Notification(AComponent: TComponent; Operation: TOperation); dynamic;
    function Add : TD4WDataControllerLink;
    property Items[Index: Integer]: TD4WDataControllerLink read GetItem write SetItem;
  end;

  TD4WDataControllerLinkList = class(TComponent)
  strict private
    FMenuActions: TActionList;
    FDataControllerLinks: TD4WDataControllerLinks;
    FPrimaryLink: TD4WDataControllerLink;
    procedure SetContollerLinks(const Value: TD4WDataControllerLinks);
    procedure SetMenuActions(const Value: TActionList);
    procedure SetPrimaryLink(const Value: TD4WDataControllerLink);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function FindDataSource(ADataSet: TDataSet): TDataSource;

    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  published
    property DataControllerLinks: TD4WDataControllerLinks read FDataControllerLinks write SetContollerLinks;
    property MenuActions: TActionList read FMenuActions write SetMenuActions;
    property PrimaryLink: TD4WDataControllerLink read FPrimaryLink write SetPrimaryLink;
  end;

implementation

{ TD4WFunctionalDataGroup }

constructor TD4WDataControllerLink.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FWidgets := TWidgetList.Create;
  FWidgets.OnNotify := WidgetOnNotify;
end;

destructor TD4WDataControllerLink.Destroy;
begin
  FWidgets.Free;
  inherited;
end;

function TD4WDataControllerLink.FindDataSource(ADataSet: TDataSet): TDataSource;
begin
  Result := (Collection.Owner as TD4WDataControllerLinkList).FindDataSource(ADataSet)
end;

function TD4WDataControllerLink.GetIsPrimaryLink: Boolean;
begin
  Result := Self = GetPrimaryLink;
end;

function TD4WDataControllerLink.GetPrimaryLink: TD4WDataControllerLink;
var
  p: TPersistent;
begin
  Result := nil;
  p := GetOwner;
  if P is TD4WDataControllerLinks then
  begin
    p := TD4WDataControllerLinks(p).Owner;
    if p is TD4WDataControllerLinkList then
      Result := TD4WDataControllerLinkList(p).PrimaryLink;
  end;
end;

procedure TD4WDataControllerLink.Notification(AComponent: TComponent;
  Operation: TOperation);
  procedure CheckWidgets;
  var
    i: integer;
  begin
    for i := 0 to Widgets.Count - 1 do
    if AComponent = Widgets[i] then
    begin
      Widgets.Delete(i);
      Break;
    end;
  end;
begin
  if (Operation = TOperation.opRemove) then
  begin
    if AComponent = FDataSource then
      FDataSource := nil
    else if AComponent = FToolbarActions then
      FToolbarActions := nil
    else
      CheckWidgets;
  end;
end;

procedure TD4WDataControllerLink.SetDataSource(const Value: TDataSource);
begin
  if FDataSource <> Value then
  begin
    FDataSource := Value;
    SetupFreeNotification(FDataSource);
  end;
end;

procedure TD4WDataControllerLink.SetIsPrimaryLink(const Value: Boolean);
begin
  if GetIsPrimaryLink <> Value then
  begin
    if Value then
      SetPrimaryLink(Self)
    else
      raise Exception.Create( 'Cannot set to false directly. One link must always be set as primary.' +
                              #13#10 + 'Select a different Link to make that primary.');
  end;
end;

procedure TD4WDataControllerLink.SetPrimaryLink(const Value: TD4WDataControllerLink);
var
  p: TPersistent;
begin
  p := GetOwner;
  if P is TD4WDataControllerLinks then
  begin
    p := TD4WDataControllerLinks(p).Owner;
    if p is TD4WDataControllerLinkList then
      TD4WDataControllerLinkList(p).PrimaryLink := Value;
  end;
end;

procedure TD4WDataControllerLink.SetToolbarActions(const Value: TActionList);
begin
  if FToolbarActions <> Value then
  begin
    FToolbarActions := Value;
    SetupFreeNotification(Value);
  end;
end;

procedure TD4WDataControllerLink.SetupFreeNotification(const Value: TComponent);
var
  p: TPersistent;
begin
  if Assigned(Value) then
  begin
    p := GetOwner;
    if Assigned(p) and (p is TCollection) then
    begin
      p := TCollection(p).Owner;
      if p is TComponent then
        Value.FreeNotification(TComponent(p));
    end;
  end;
end;

procedure TD4WDataControllerLink.WidgetOnNotify(Sender: TObject;
  const Item: TComponent; Action: TCollectionNotification);
begin
  if Action = TCollectionNotification.cnAdded then
  begin
    SetupFreeNotification(Item);
  end;
end;

{ TD4WFunctionalDataGroups }

function TD4WDataControllerLinks.Add: TD4WDataControllerLink;
begin
  Result := TD4WDataControllerLink(inherited Add);
end;

function TD4WDataControllerLinks.GetItem(Index: Integer): TD4WDataControllerLink;
begin
  Result := TD4WDataControllerLink(inherited Items[Index]);
end;

procedure TD4WDataControllerLinks.Notification(AComponent: TComponent;
  Operation: TOperation);
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    Items[i].Notification(AComponent, Operation);
end;

//procedure TD4WDataControllerLinks.Notify(Item: TCollectionItem;
//  Action: TCollectionNotification);
//begin
//  inherited;
//
////  case Action of
////    cnAdded:
////    cnDeleting:
////  end;
//end;

procedure TD4WDataControllerLinks.SetItem(Index: Integer;
  const Value: TD4WDataControllerLink);
begin
  inherited SetItem(Index, Value);
end;


{ TD4WControllerLinkList }

constructor TD4WDataControllerLinkList.Create(AOwner: TComponent);
begin
  inherited;
  FDataControllerLinks := TD4WDataControllerLinks.Create(Self, TD4WDataControllerLink);
end;

destructor TD4WDataControllerLinkList.Destroy;
begin
  FDataControllerLinks.Free;
  FDataControllerLinks := nil;
  inherited;
end;

function TD4WDataControllerLinkList.FindDataSource(
  ADataSet: TDataSet): TDataSource;
var
  I: Integer;
begin
  for I := 0 to FDataControllerLinks.Count - 1 do
  begin
    Result := FDataControllerLinks.Items[I].DataSource;
    if Assigned(Result) and (Result.DataSet = ADataSet) then
      Exit;
  end;

  if Assigned(Owner) then
  begin
    for I := 0 to Owner.ComponentCount - 1 do
    begin
      TComponent(Result) := Owner.Components[I];
      if (Result is TDataSource) and (TDataSource(Result).DataSet = ADataSet) then
        Exit;
    end;
  end;

  Result := nil;
end;

procedure TD4WDataControllerLinkList.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if (AComponent <> self) and Assigned(FDataControllerLinks) then
    FDataControllerLinks.Notification(AComponent, Operation);
  if (Operation = TOperation.opRemove) and (AComponent = FMenuActions) then
    FMenuActions := nil;
end;

procedure TD4WDataControllerLinkList.SetContollerLinks(
  const Value: TD4WDataControllerLinks);
begin
  FDataControllerLinks.Assign(Value);
end;

procedure TD4WDataControllerLinkList.SetMenuActions(const Value: TActionList);
begin
  if Value <> FMenuActions then
  begin
    FMenuActions := Value;
    if Assigned(FMenuActions) then
      FMenuActions.FreeNotification(Self);
  end;
end;

procedure TD4WDataControllerLinkList.SetPrimaryLink(
  const Value: TD4WDataControllerLink);
begin
  if FPrimaryLink <> Value then
    FPrimaryLink := Value;
end;

end.

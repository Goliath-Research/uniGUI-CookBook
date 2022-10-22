unit IQMS.WebComponents.DataControllerList;

interface

uses
  DB, Actions, Classes, ActnList, SysUtils, Generics.Collections;

type
  TWidgetList = TList<TComponent>;

  TIQDataControllerLink = class(TCollectionItem)
  strict private
    FDataSource:     TDataSource;
    FToolbarActions: TActionList;
    FWidgets:        TWidgetList;
    function GetPrimaryLink: TIQDataControllerLink;
    function GetIsPrimaryLink: Boolean;
    procedure SetDataSource(const Value: TDataSource);
    procedure SetIsPrimaryLink(const Value: Boolean);
    procedure SetPrimaryLink(const Value: TIQDataControllerLink);
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

  TIQDataControllerLinks = class(TOwnedCollection)
  strict private
    function GetItem(Index: Integer): TIQDataControllerLink;
    procedure SetItem(Index: Integer; const Value: TIQDataControllerLink);
  protected
  public
    procedure Notification(AComponent: TComponent; Operation: TOperation); dynamic;
    function Add : TIQDataControllerLink;
    property Items[Index: Integer]: TIQDataControllerLink read GetItem write SetItem;
  end;

  TIQDataControllerLinkList = class(TComponent)
  strict private
    FMenuActions: TActionList;
    FDataControllerLinks: TIQDataControllerLinks;
    FPrimaryLink: TIQDataControllerLink;
    procedure SetContollerLinks(const Value: TIQDataControllerLinks);
    procedure SetMenuActions(const Value: TActionList);
    procedure SetPrimaryLink(const Value: TIQDataControllerLink);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function FindDataSource(ADataSet: TDataSet): TDataSource;

    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  published
    property DataControllerLinks: TIQDataControllerLinks read FDataControllerLinks write SetContollerLinks;
    property MenuActions: TActionList read FMenuActions write SetMenuActions;
    property PrimaryLink: TIQDataControllerLink read FPrimaryLink write SetPrimaryLink;
  end;

implementation

{ TIQFunctionalDataGroup }

constructor TIQDataControllerLink.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FWidgets := TWidgetList.Create;
  FWidgets.OnNotify := WidgetOnNotify;
end;

destructor TIQDataControllerLink.Destroy;
begin
  FWidgets.Free;
  inherited;
end;

function TIQDataControllerLink.FindDataSource(ADataSet: TDataSet): TDataSource;
begin
  Result := (Collection.Owner as TIQDataControllerLinkList).FindDataSource(ADataSet)
end;

function TIQDataControllerLink.GetIsPrimaryLink: Boolean;
begin
  Result := Self = GetPrimaryLink;
end;

function TIQDataControllerLink.GetPrimaryLink: TIQDataControllerLink;
var
  p: TPersistent;
begin
  Result := nil;
  p := GetOwner;
  if P is TIQDataControllerLinks then
  begin
    p := TIQDataControllerLinks(p).Owner;
    if p is TIQDataControllerLinkList then
      Result := TIQDataControllerLinkList(p).PrimaryLink;
  end;
end;

procedure TIQDataControllerLink.Notification(AComponent: TComponent;
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

procedure TIQDataControllerLink.SetDataSource(const Value: TDataSource);
begin
  if FDataSource <> Value then
  begin
    FDataSource := Value;
    SetupFreeNotification(FDataSource);
  end;
end;

procedure TIQDataControllerLink.SetIsPrimaryLink(const Value: Boolean);
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

procedure TIQDataControllerLink.SetPrimaryLink(const Value: TIQDataControllerLink);
var
  p: TPersistent;
begin
  p := GetOwner;
  if P is TIQDataControllerLinks then
  begin
    p := TIQDataControllerLinks(p).Owner;
    if p is TIQDataControllerLinkList then
      TIQDataControllerLinkList(p).PrimaryLink := Value;
  end;
end;

procedure TIQDataControllerLink.SetToolbarActions(const Value: TActionList);
begin
  if FToolbarActions <> Value then
  begin
    FToolbarActions := Value;
    SetupFreeNotification(Value);
  end;
end;

procedure TIQDataControllerLink.SetupFreeNotification(const Value: TComponent);
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

procedure TIQDataControllerLink.WidgetOnNotify(Sender: TObject;
  const Item: TComponent; Action: TCollectionNotification);
begin
  if Action = TCollectionNotification.cnAdded then
  begin
    SetupFreeNotification(Item);
  end;
end;

{ TIQFunctionalDataGroups }

function TIQDataControllerLinks.Add: TIQDataControllerLink;
begin
  Result := TIQDataControllerLink(inherited Add);
end;

function TIQDataControllerLinks.GetItem(Index: Integer): TIQDataControllerLink;
begin
  Result := TIQDataControllerLink(inherited Items[Index]);
end;

procedure TIQDataControllerLinks.Notification(AComponent: TComponent;
  Operation: TOperation);
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    Items[i].Notification(AComponent, Operation);
end;

//procedure TIQDataControllerLinks.Notify(Item: TCollectionItem;
//  Action: TCollectionNotification);
//begin
//  inherited;
//
////  case Action of
////    cnAdded:
////    cnDeleting:
////  end;
//end;

procedure TIQDataControllerLinks.SetItem(Index: Integer;
  const Value: TIQDataControllerLink);
begin
  inherited SetItem(Index, Value);
end;


{ TIQControllerLinkList }

constructor TIQDataControllerLinkList.Create(AOwner: TComponent);
begin
  inherited;
  FDataControllerLinks := TIQDataControllerLinks.Create(Self, TIQDataControllerLink);
end;

destructor TIQDataControllerLinkList.Destroy;
begin
  FDataControllerLinks.Free;
  FDataControllerLinks := nil;
  inherited;
end;

function TIQDataControllerLinkList.FindDataSource(
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

procedure TIQDataControllerLinkList.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if (AComponent <> self) and Assigned(FDataControllerLinks) then
    FDataControllerLinks.Notification(AComponent, Operation);
  if (Operation = TOperation.opRemove) and (AComponent = FMenuActions) then
    FMenuActions := nil;
end;

procedure TIQDataControllerLinkList.SetContollerLinks(
  const Value: TIQDataControllerLinks);
begin
  FDataControllerLinks.Assign(Value);
end;



procedure TIQDataControllerLinkList.SetMenuActions(const Value: TActionList);
begin
  if Value <> FMenuActions then
  begin
    FMenuActions := Value;
    if Assigned(FMenuActions) then
      FMenuActions.FreeNotification(Self);
  end;
end;

procedure TIQDataControllerLinkList.SetPrimaryLink(
  const Value: TIQDataControllerLink);
begin
  if FPrimaryLink <> Value then
    FPrimaryLink := Value;
end;

end.

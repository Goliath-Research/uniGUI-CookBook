unit D4WModuleFrame;

interface

uses
  Classes, Controls, uniGUIFrame, D4W.DataControllerList,
  D4W.HyperGrid;

const
  PrimaryGridName = 'PrimaryGrid';

type
  TD4WModuleFrame = class(TUniFrame)
  private
    { private declarations }
    FController: TD4WDataControllerLinkList;
    FGrids: TList;
    FGridCount: Integer;
    FEnabledArray : array of Boolean;
    FModuleCategory: string;
    FModuleName: string;
    procedure SetController(const Value: TD4WDataControllerLinkList);
    procedure AdjustLinks;
    procedure AdjustGrid(const AGrid: TD4WHyperGrid);
    function GetGrids(Index: Integer): TD4WHyperGrid;
    procedure SetGrids(Index: Integer; const Value: TD4WHyperGrid);
    function GetGridCount: Integer;
    procedure SetGridCount(const Value: Integer);
    procedure DesignEnd(Sender: TObject);
    procedure DesignStart(Sender: TObject);
    procedure SetModuleCategory(const Value: string);
    procedure SetModuleName(const Value: string);
  protected
   { protected declarations }
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure LoadCompleted; override;
  public
   { public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure AddGrid(const AGrid: TComponent);
    procedure EnableAll;
    procedure RestoreEnabled;

    property Grids[Index: Integer]: TD4WHyperGrid read GetGrids write SetGrids;
    property GridCount: Integer read GetGridCount write SetGridCount;
  published
    { published declarations }

    property Controller: TD4WDataControllerLinkList read FController write SetController;
    property ModuleCategory: string read FModuleCategory write SetModuleCategory;
    property ModuleName: string read FModuleName write SetModuleName;
  end;

implementation

{ TD4WModuleFrame }

procedure TD4WModuleFrame.AddGrid(const AGrid: TComponent);
begin
  FGrids.Add(AGrid);
  AdjustGrid(AGrid as TD4WHyperGrid);
end;

procedure TD4WModuleFrame.AdjustGrid(const AGrid: TD4WHyperGrid);
begin
  AGrid.OnDesignStart := DesignStart;
  AGrid.OnDesignEnd := DesignEnd;
  AGrid.Controller:= Self.Controller;
end;

procedure TD4WModuleFrame.AdjustLinks;
var
  I: Integer;
begin
  for I := 0 to GridCount - 1 do
    Grids[I].Controller := Self.Controller;
end;

constructor TD4WModuleFrame.Create(AOwner: TComponent);
begin
  inherited;
  FGrids := TList.Create;

end;

destructor TD4WModuleFrame.Destroy;
begin
  FGrids.Free;
  inherited;
end;

function TD4WModuleFrame.GetGridCount: Integer;
begin
  Result := FGrids.Count;
end;

function TD4WModuleFrame.GetGrids(Index: Integer): TD4WHyperGrid;
begin
  Result := TD4WHyperGrid(FGrids[Index]);
end;

procedure TD4WModuleFrame.LoadCompleted;
begin
  inherited;
  AdjustLinks;
end;

procedure TD4WModuleFrame.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if Operation = opRemove then
  begin
    if AComponent = Controller then
      Controller := nil;
  end;

  if Operation = opInsert then
  begin
    if (AComponent is TD4WHyperGrid) and (AComponent.Owner = Self) then
    begin
      AddGrid(AComponent);
    end;
  end;

end;

procedure TD4WModuleFrame.SetController(
  const Value: TD4WDataControllerLinkList);
begin
  FController := Value;
end;

procedure TD4WModuleFrame.SetGridCount(const Value: Integer);
begin
  FGridCount := Value;
end;

procedure TD4WModuleFrame.SetGrids(Index: Integer;
  const Value: TD4WHyperGrid);
begin
  FGrids[Index] := Value;
end;

procedure TD4WModuleFrame.SetModuleCategory(const Value: string);
begin
  FModuleCategory := Value;
end;

procedure TD4WModuleFrame.SetModuleName(const Value: string);
begin
  FModuleName := Value;
end;

procedure TD4WModuleFrame.EnableAll;
var
  I : Integer;
begin
  SetLength(FEnabledArray, GridCount);
  for I := 0 to GridCount - 1 do
  begin
    FEnabledArray[I] := Grids[I].Enabled;
    Grids[I].Enabled := True;
  end;
end;

procedure TD4WModuleFrame.RestoreEnabled;
var
  I : Integer;
begin
  for I := 0 to GridCount - 1 do
    Grids[I].Enabled := FEnabledArray[I];
end;

procedure TD4WModuleFrame.DesignEnd(Sender: TObject);
begin
  EnableAll;
end;

procedure TD4WModuleFrame.DesignStart(Sender: TObject);
var
  I : Integer;
begin
  for I := 0 to GridCount - 1 do
    if Grids[I] <> Sender then
      Grids[I].Enabled := False;
end;

initialization
  RegisterClass(TD4WModuleFrame);

finalization

end.

unit IQUniModuleFrame;

interface

uses
  Classes, Controls, uniGUIFrame, IQMS.WebComponents.DataControllerList,
  IQUniGrid;

const
  PrimaryGridName = 'PrimaryGrid';

type
  TIQUniModuleFrame = class(TUniFrame)
  private
    { private declarations }
    FController: TIQDataControllerLinkList;
    FGrids: TList;
    FGridCount: Integer;
    FEnabledArray : array of Boolean;
    FModuleCategory: string;
    FModuleName: string;
    procedure SetController(const Value: TIQDataControllerLinkList);
    procedure AdjustLinks;
    procedure AdjustGrid(const AGrid: TIQUniGridControl);
    function GetGrids(Index: Integer): TIQUniGridControl;
    procedure SetGrids(Index: Integer; const Value: TIQUniGridControl);
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

    property Grids[Index: Integer]: TIQUniGridControl read GetGrids write SetGrids;
    property GridCount: Integer read GetGridCount;
  published
    { published declarations }

    property Controller: TIQDataControllerLinkList read FController write SetController;
    property ModuleCategory: string read FModuleCategory write SetModuleCategory;
    property ModuleName: string read FModuleName write SetModuleName;
  end;

implementation

{ TIQUniModuleFrame }

procedure TIQUniModuleFrame.AddGrid(const AGrid: TComponent);
begin
  FGrids.Add(AGrid);
  AdjustGrid(AGrid as TIQUniGridControl);
end;

procedure TIQUniModuleFrame.AdjustGrid(const AGrid: TIQUniGridControl);
begin
  AGrid.OnDesignStart := DesignStart;
  AGrid.OnDesignEnd := DesignEnd;
  AGrid.Controller:= Self.Controller;
end;

procedure TIQUniModuleFrame.AdjustLinks;
var
  I: Integer;
begin
  for I := 0 to GridCount - 1 do
    Grids[I].Controller := Self.Controller;
end;

constructor TIQUniModuleFrame.Create(AOwner: TComponent);
begin
  inherited;
  FGrids := TList.Create;

end;

destructor TIQUniModuleFrame.Destroy;
begin
  FGrids.Free;
  inherited;
end;

function TIQUniModuleFrame.GetGridCount: Integer;
begin
  Result := FGrids.Count;
end;

function TIQUniModuleFrame.GetGrids(Index: Integer): TIQUniGridControl;
begin
  Result := TIQUniGridControl(FGrids[Index]);
end;

procedure TIQUniModuleFrame.LoadCompleted;
begin
  inherited;
  AdjustLinks;
end;

procedure TIQUniModuleFrame.Notification(AComponent: TComponent;
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
    if (AComponent is TIQUniGridControl) and (AComponent.Owner = Self) then
    begin
      AddGrid(AComponent);
    end;
  end;

end;

procedure TIQUniModuleFrame.SetController(
  const Value: TIQDataControllerLinkList);
begin
  FController := Value;
end;

procedure TIQUniModuleFrame.SetGridCount(const Value: Integer);
begin
  FGridCount := Value;
end;

procedure TIQUniModuleFrame.SetGrids(Index: Integer;
  const Value: TIQUniGridControl);
begin
  FGrids[Index] := Value;
end;

procedure TIQUniModuleFrame.SetModuleCategory(const Value: string);
begin
  FModuleCategory := Value;
end;

procedure TIQUniModuleFrame.SetModuleName(const Value: string);
begin
  FModuleName := Value;
end;

procedure TIQUniModuleFrame.EnableAll;
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

procedure TIQUniModuleFrame.RestoreEnabled;
var
  I : Integer;
begin
  for I := 0 to GridCount - 1 do
    Grids[I].Enabled := FEnabledArray[I];
end;

procedure TIQUniModuleFrame.DesignEnd(Sender: TObject);
begin
  EnableAll;
end;

procedure TIQUniModuleFrame.DesignStart(Sender: TObject);
var
  I : Integer;
begin
  for I := 0 to GridCount - 1 do
    if Grids[I] <> Sender then
      Grids[I].Enabled := False;
end;

initialization
  RegisterClass(TIQUniModuleFrame);

finalization

end.

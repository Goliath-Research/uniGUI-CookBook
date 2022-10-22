{ hidden form - all the components are transfered to caller form }
unit ict_diagram;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,

  ict_objects,
  IQMS.Common.JumpConstants,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniScrollBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniTrackBar;

type
  TFrmICTDiagram = class(TUniForm)
    pnlCarrier: TUniPanel;
    sboxCarrier: TUniScrollBox;
    pnlTop: TUniPanel;
    TrackBar: TUniTrackBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure TrackBarKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FList: TList;
    procedure AssignScrollBoxRanges(AMaxRange: Boolean);
    procedure AddNode(AParent: TICT_Location_Base;
      ALocationType: TICT_LocationType; AEPlant_ID: Real = 0;
      ADivision_ID: Real = 0);
    procedure AddEPlants(AParent: TICT_Location_Base);
    procedure AddDivisions(AParent: TICT_Location_Base);
    procedure AddCorporate;
    procedure AssignXY_ToGeneralNodes(AICT_Location: TICT_Location_Base);
    function GetLowestYPointAbove(AICT_Location: TICT_Location_Base): Integer;
    procedure GetSubNodesOf(AICT_Location: TICT_Location_Base; ATmpList: TList;
      AOnlyGeneralNodes: Boolean);
    procedure DrawPipeToParentOf(AICT_Location: TICT_Location_General);
    procedure AssignXY_ToDivisions(ATmpList: TList);
    procedure ClearDiagram;
    function GetSelectedLocationIndex: Integer;
    procedure IQNotify(var Msg: TMessage); message iq_Notify;
    function GetSelectedLocation: TICT_Location_Base;
    procedure TrackBarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ScaleDisplay;
    function GetDisabledLocationIndex: Integer;
  public
    { Public declarations }

    procedure BuildDiagram;
    procedure AfterBuildDiagram;
    property SelectedLocationIndex: Integer read GetSelectedLocationIndex;
    property SelectedLocation: TICT_Location_Base read GetSelectedLocation;
    procedure DisableLocation(AIndex: Integer);
    property DisabledLocationIndex: Integer read GetDisabledLocationIndex;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.NLS;

const
  cnst1ST_NODE_MARGIN = 9;
  cnstSPACE_BETWEEN_NODES = 25;
  cnstSPACE_BETWEEN_PARENT_NODES = 35;
  cnstGENERAL_NODES = TRUE;

procedure TFrmICTDiagram.UniFormCreate(Sender: TObject);
var
  AFactor: Integer;
begin
  FList := TList.Create;
  TrackBar.Position := 10;
  if IQRegIntegerScalarRead(Parent, 'ScaleFactor', AFactor) then
    TrackBar.Position := AFactor;
  { Use Typecast to surface MouseUp }
  TUniForm(TrackBar).OnMouseUp := TrackBarMouseUp;

  BuildDiagram;
  // PostMessage( Handle, iq_Notify, 1, 0);    {call BuildDiagram}
end;

procedure TFrmICTDiagram.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  { reassign parents so when child form is gone - all the components are gone too }
  IQRegIntegerScalarWrite(Parent, 'ScaleFactor', TrackBar.Position);
  sboxCarrier.Parent := self;
  Action := caFree;
end;

procedure TFrmICTDiagram.FormDestroy(Sender: TObject);
begin
  FList.Free;
end;

procedure TFrmICTDiagram.AssignScrollBoxRanges(AMaxRange: Boolean);
var
  I, MaxX, MaxY: Integer;
begin
  MaxX := 0;
  MaxY := 0;

  if AMaxRange then
    for I := 0 to FList.Count - 1 do
      with TICT_Location_Base(FList[I]) do
      begin
        if Top + Height > MaxY then
          MaxY := Top + Height;

        if Left + Width > MaxX then
          MaxX := Left + Width;
      end;

  sboxCarrier.HorzScrollBar.Range := MaxX;
  sboxCarrier.VertScrollBar.Range := MaxY;
end;

procedure TFrmICTDiagram.AddCorporate;
begin
  AddNode(nil, ltCorporate);
end;

procedure TFrmICTDiagram.AddEPlants(AParent: TICT_Location_Base);
begin
  with TFDQuery.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add('select id from eplant where nvl(inactive, ''N'') <> ''Y'' order by id');
      Open;
      while not Eof do
      begin
        AddNode(AParent, ltEPlant, FieldByName('id').asFloat);
        Next;
      end;
    finally
      Free;
    end;
end;

procedure TFrmICTDiagram.AddDivisions(AParent: TICT_Location_Base);
begin
  with TFDQuery.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add(IQFormat
        ('select division_id from ship_to where arcusto_id = %f and NVL(eplant_id,0) = NVL(%f,0) and division_id is not NULL order by id',
        [AParent.FArcusto_ID, AParent.FEPlant_ID]));
      Open;
      while not Eof do
      begin
        AddNode(AParent, ltDivision, AParent.FEPlant_ID,
          FieldByName('division_id').asFloat);
        Next;
      end;
    finally
      Free;
    end;
end;

procedure TFrmICTDiagram.AddNode(AParent: TICT_Location_Base;
  ALocationType: TICT_LocationType; AEPlant_ID: Real = 0;
  ADivision_ID: Real = 0);
var
  I: Integer;
begin
  case ALocationType of
    ltCorporate:
      begin
        { add corporate main object }
        I := FList.Add(TICT_Location_Corporate.Create(sboxCarrier, AParent));
        { add any ship-to divisions w/o eplants }
        AddDivisions(TICT_Location_Base(FList[I]));
        { add eplants }
        AddEPlants(TICT_Location_Base(FList[I]));
      end;

    ltEPlant:
      begin
        { add eplant object }
        I := FList.Add(TICT_Location_EPlant.Create(sboxCarrier, AParent,
          AEPlant_ID));
        { add all related divisions }
        AddDivisions(TICT_Location_Base(FList[I]));
      end;

    ltDivision:
      begin
        { add division }
        I := FList.Add(TICT_Location_Division.Create(sboxCarrier, AParent,
          AEPlant_ID, ADivision_ID));
      end;
  end;
end;

function TFrmICTDiagram.GetLowestYPointAbove(AICT_Location
  : TICT_Location_Base): Integer;
var
  I: Integer;
begin
  { Find an object above AICT_Location in the hierarchical tree }
  Result := 0;
  for I := 0 to FList.Count - 1 do
    with TICT_Location_Base(FList[I]) do
      if FList[I] = AICT_Location then
        EXIT
      else if Top + Height > Result then
        Result := Top + Height;
end;

procedure TFrmICTDiagram.AssignXY_ToGeneralNodes(AICT_Location
  : TICT_Location_Base);
var
  ATmpList: TList;
  Y, X, I: Integer;
begin
  ATmpList := TList.Create;
  try
    Y := GetLowestYPointAbove(AICT_Location);
    if Y = 0 then
      Y := cnst1ST_NODE_MARGIN { this is the 1st node }
    else
      Y := Y + cnstSPACE_BETWEEN_NODES;

    if Assigned(AICT_Location.ICT_Parent) then
      X := AICT_Location.ICT_Parent.Left + AICT_Location.ICT_Parent.Width div 2
        + cnstSPACE_BETWEEN_PARENT_NODES
    else
      X := cnst1ST_NODE_MARGIN;

    { Assign Parent/General objects such as Corporate and Eplant coordinates }
    AICT_Location.SetBounds(X, Y, AICT_Location.WidthEx,
      AICT_Location.HeightEx);

    DrawPipeToParentOf(AICT_Location as TICT_Location_General);

    { SubNodes of divisions }
    GetSubNodesOf(AICT_Location, ATmpList, not cnstGENERAL_NODES);
    AssignXY_ToDivisions(ATmpList);

    { General (non division specific) SubNodes }
    GetSubNodesOf(AICT_Location, ATmpList, cnstGENERAL_NODES);
    for I := 0 to ATmpList.Count - 1 do
      AssignXY_ToGeneralNodes(TICT_Location_Base(ATmpList[I])); { Recursion }

  finally
    ATmpList.Free;
  end;
end;

procedure TFrmICTDiagram.GetSubNodesOf(AICT_Location: TICT_Location_Base;
  ATmpList: TList; AOnlyGeneralNodes: Boolean);
var
  I: Integer;
begin
  { Add to a temp list all the items with the the same parent }
  ATmpList.Clear;
  for I := 0 to FList.Count - 1 do
    with TICT_Location_Base(FList[I]) do
      if (ICT_Parent = AICT_Location) then
        if (AOnlyGeneralNodes and (TICT_Location_Base(FList[I])
          is TICT_Location_General)) or
          (not AOnlyGeneralNodes and (TICT_Location_Base(FList[I])
          is TICT_Location_Division)) then
          ATmpList.Add(FList[I]);
end;

procedure TFrmICTDiagram.DrawPipeToParentOf(AICT_Location
  : TICT_Location_General);
const
  PIPE_WIDTH = 4;
  HALF_PIPE_WIDTH = PIPE_WIDTH div 2;
var
  AParent: TICT_Location_General;
begin
  AParent := AICT_Location.ICT_Parent as TICT_Location_General;
  if not Assigned(AParent) then
    EXIT;

  { draw the the following line:
    |
    |
    ---- }
  { Vertical portion }
  with AParent.DownPipe do
    SetBounds(AParent.LeftEx + AParent.WidthEx div 2 - HALF_PIPE_WIDTH, { left }
      AParent.TopEx + AParent.HeightEx - 1, { top }
      PIPE_WIDTH, { width }
      AICT_Location.TopEx + AICT_Location.HeightEx div 2 + HALF_PIPE_WIDTH -
      (AParent.TopEx + AParent.HeightEx) + 1); { height }

  { Horizontal portion }
  with AICT_Location.LeftPipe do
    SetBounds(AParent.DownPipe.Left + PIPE_WIDTH - 1,
      AICT_Location.TopEx + AICT_Location.HeightEx div 2 - HALF_PIPE_WIDTH,
      AICT_Location.LeftEx - (AParent.DownPipe.Left + PIPE_WIDTH) + 2,
      PIPE_WIDTH);
end;

procedure TFrmICTDiagram.AssignXY_ToDivisions(ATmpList: TList);
var
  AParent: TICT_Location_General;
  I: Integer;
  X: Integer;
  Y: Integer;
  AWidth: Integer;
begin
  { Divisions are drawn to the right of the parent item }
  if ATmpList.Count = 0 then
    EXIT;

  { Get parent of the first item. This parent is the same for all the items in the ATmpList }
  AParent := TICT_Location_Base(ATmpList[0])
    .ICT_Parent as TICT_Location_General;

  X := AParent.LeftEx + AParent.WidthEx;
  for I := 0 to ATmpList.Count - 1 do
  begin
    { prepare drawing of a division }
    X := X + cnstSPACE_BETWEEN_NODES;
    Y := AParent.TopEx;
    AWidth := TICT_Location_Base(ATmpList[I]).WidthEx;

    { Right Pipe from the parent }
    AParent.RightPipe.Left := AParent.LeftEx + AParent.WidthEx;
    AParent.RightPipe.Top := AParent.TopEx + AParent.HeightEx div 2 - 2;
    AParent.RightPipe.Width := X - (AParent.LeftEx + AParent.WidthEx);
    AParent.RightPipe.SendToBack;

    { Position Division node object }
    with TICT_Location_Base(ATmpList[I]) do
      SetBounds(X, Y, WidthEx, HeightEx);

    X := X + AWidth;
  end;
end;

procedure TFrmICTDiagram.ClearDiagram;
var
  I: Integer;
begin
  for I := FList.Count - 1 downto 0 do
    TICT_Location_Base(FList[I]).Free;
  FList.Clear;
end;

procedure TFrmICTDiagram.BuildDiagram;
begin
  ClearDiagram;

  AssignScrollBoxRanges(FALSE);

  { Add objects start with Corporate }
  sboxCarrier.Visible := FALSE;
  try
    AddCorporate;

    { Assign coordinates to General (non division specific) nodes such as Corporate and Eplant. This will recursevly assign all subnodes XYs }
    if FList.Count > 0 then
      AssignXY_ToGeneralNodes(TICT_Location_Base(FList[0]));
  finally
    sboxCarrier.Visible := TRUE;
  end;

  AssignScrollBoxRanges(TRUE);

  AfterBuildDiagram; { ChangeScale }
end;

function TFrmICTDiagram.GetSelectedLocationIndex: Integer;
var
  I: Integer;
begin
  for I := 0 to FList.Count - 1 do
    if TICT_Location_Base(FList[I]).Down then
    begin
      Result := I;
      EXIT;
    end;
  Result := -1;
end;

function TFrmICTDiagram.GetDisabledLocationIndex: Integer;
var
  I: Integer;
begin
  for I := 0 to FList.Count - 1 do
    if not TICT_Location_Base(FList[I]).Enabled then
    begin
      Result := I;
      EXIT;
    end;
  Result := -1;
end;

procedure TFrmICTDiagram.IQNotify(var Msg: TMessage);
var
  I: Integer;
begin
  case Msg.WParam of
    0:
      for I := 0 to FList.Count - 1 do
        with TICT_Location_Base(FList[I]) do
          EmphasizeAppearanceOf(Down);
    1:
      BuildDiagram;
    2:
      ScaleDisplay;
  end;
end;

procedure TFrmICTDiagram.DisableLocation(AIndex: Integer);
var
  I: Integer;
begin
  IQAssert(AIndex <= FList.Count - 1,
    Format('Invalid location index %d is specified.', [AIndex]));

  for I := 0 to FList.Count - 1 do
    with TICT_Location_Base(FList[I]) do
    begin
      Enabled := TRUE;

      if I = AIndex then
      begin
        Down := FALSE;
        Enabled := FALSE;
      end;
    end;
end;

function TFrmICTDiagram.GetSelectedLocation: TICT_Location_Base;
begin
  if SelectedLocationIndex > -1 then
    Result := TICT_Location_Base(FList[SelectedLocationIndex])
  else
    Result := NIL;
end;

procedure TFrmICTDiagram.TrackBarKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_LEFT, VK_RIGHT, VK_NEXT, VK_PRIOR, VK_UP, VK_DOWN] then
  begin
    Key := 0;
    TrackBarMouseUp(NIL, mbLeft, [], 0, 0);
  end;
end;

procedure TFrmICTDiagram.TrackBarMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  I: Integer;
  J: Integer;
begin
  I := SelectedLocationIndex;
  J := DisabledLocationIndex;

  BuildDiagram;

  if (I > -1) and (I <= FList.Count - 1) then
    with TICT_Location_Base(FList[I]) do
    begin
      Down := TRUE;
      EmphasizeAppearanceOf(Down);
    end;

  if (J > -1) and (J <= FList.Count - 1) then
    with TICT_Location_Base(FList[J]) do
      DisableLocation(J);
end;

procedure TFrmICTDiagram.AfterBuildDiagram;
begin
  ScaleDisplay;
end;

procedure TFrmICTDiagram.ScaleDisplay;
var
  I: Integer;
begin
  sboxCarrier.Visible := FALSE;
  try
    { Use ChangeScale to adjust. Typecast ScrollBox to TForm in order to surface ChangeScale }
    TFrmICTDiagram(sboxCarrier).ChangeScale(TrackBar.Position, TrackBar.Max);

    { Adjust picture and text }
    for I := 0 to FList.Count - 1 do
      with TICT_Location_Base(FList[I]) do
        AdjustGlyphSize(TrackBar.Position / TrackBar.Max);
  finally
    sboxCarrier.Visible := TRUE;
  end;
end;

end.

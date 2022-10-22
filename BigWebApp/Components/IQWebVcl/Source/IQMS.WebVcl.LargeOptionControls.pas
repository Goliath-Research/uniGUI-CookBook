unit IQMS.WebVcl.LargeOptionControls;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.ActnList,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniCommonClasses;

type
  { TIQWebLargeOptionControl }
  TIQWebLargeOptionControl = class(TUniFormControl)
  strict private
  type
    THoverState = (hsNormal = 1, hsHover = 2, hsPushed = 3);
  strict private
  const
    CHECK_BOX_SIZE = 48;
    DEFAULT_PADDING = 8;
    CHECK_LINE_PADDING = 12;
    DEFAULT_CHECK_CHAR = 'X';
  strict private
    { Private declarations }
    FCaption: TCaption;
    FHoverState: THoverState;
    FMouseHover: Boolean;
    procedure SetCaption(const Value: TCaption);
    procedure UpdateMetrics;
    procedure DetermineState;
    procedure InitFont;
    function IsKeyDown(const VK: Integer): Boolean;
  strict protected
    { Protected declarations }
    FChecked: Boolean;
    FCheckRect, FTextRect: TRect;
    procedure SetChecked(Value: Boolean); virtual;
    procedure MouseMove(Shift: TShiftState; X: Integer; Y: Integer); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X: Integer;
      Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X: Integer;
      Y: Integer); override;
    procedure WndProc(var Message: TMessage); override;
    procedure Click; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  published
    { Published declarations }
    property ParentColor;
    property ParentFont;
    property Color;
    property Visible;
    property Enabled;
    property TabStop default true;
    property TabOrder;
    property OnDblClick;
    property OnEnter;
    property OnExit;
    property OnKeyUp;
    property OnKeyPress;
    property OnKeyDown;
    property OnMouseActivate;
    property OnMouseLeave;
    property OnMouseEnter;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseDown;
    property OnClick;
    property Font;
    property Caption: TCaption read FCaption write SetCaption;
    property Checked: Boolean read FChecked write SetChecked default false;
  end;

  { TIQWebLargeCheckBox }
  TIQWebLargeCheckBox = class(TIQWebLargeOptionControl)
  strict protected
    { Protected declarations }
    procedure Paint; override;
  end;

  { TIQWebLargeRadioButton }
  TIQWebLargeRadioButton = class(TIQWebLargeOptionControl)
  strict protected
    { Protected declarations }
    procedure Paint; override;
    procedure SetChecked(Value: Boolean); override;
  end;

implementation

uses
//  touchscrn,
//  iqscreen,
  Math;

{$REGION 'TIQWebLargeOptionControl'}

{ TIQWebLargeOptionControl }

constructor TIQWebLargeOptionControl.Create(AOwner: TComponent);
begin
  inherited;
  TabStop := true;
  FMouseHover := false;
  FChecked := false;
  FHoverState := hsNormal;
  Width := 100;
  Height := CHECK_BOX_SIZE;
  InitFont;
end;

procedure TIQWebLargeOptionControl.WndProc(var Message: TMessage);
begin
  inherited;
  case Message.Msg of
    CM_MOUSELEAVE:
      begin
        FMouseHover := false;
        DetermineState;
      end;
    WM_SIZE:
      begin
        UpdateMetrics;
        Invalidate;
      end;
    WM_SETFOCUS, WM_KILLFOCUS:
      Invalidate;
  end;
end;

procedure TIQWebLargeOptionControl.InitFont;
var
  AFontName: string;
  AFontSize: Integer;
begin
//  AFontName := touchscrn.TouchscreenFontName( { var } AFontSize);
//  Font.Name := AFontName;
//  Font.Size := AFontSize;
//  Font.Style := [fsBold];
end;

procedure TIQWebLargeOptionControl.Click;
begin
  if Enabled then
    SetChecked(not FChecked);
  inherited Changed;
  inherited Click;
  if Enabled then
    SetFocus;
end;

procedure TIQWebLargeOptionControl.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    DetermineState;
end;

procedure TIQWebLargeOptionControl.KeyUp(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    begin
      Click;
      DetermineState;
    end;
end;

procedure TIQWebLargeOptionControl.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  DetermineState;
end;

procedure TIQWebLargeOptionControl.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FMouseHover := true;
  DetermineState;
end;

procedure TIQWebLargeOptionControl.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X,
  Y: Integer);
begin
  inherited;
  DetermineState;
end;

procedure TIQWebLargeOptionControl.SetCaption(const Value: TCaption);
var
  ATextWidth: Integer;
begin
  if not SameStr(Value, Caption) then
  begin
    FCaption := Value;
//      ATextWidth := iqscreen.GetTextWidthPixels(Value, Font);
    Width := Max(Width, Height {CHECK_BOX_SIZE} + ATextWidth + (DEFAULT_PADDING * 2));
    Invalidate;
  end;
end;

procedure TIQWebLargeOptionControl.SetChecked(Value: Boolean);
begin
  if FChecked <> Value then
    begin
      FChecked := Value;
      Invalidate;
    end;
end;

procedure TIQWebLargeOptionControl.UpdateMetrics;
var
  Size: TSize;
begin
  FCheckRect := Rect(0,
    (ClientHeight - Height {CHECK_BOX_SIZE}) div 2,
    Height {CHECK_BOX_SIZE},
    (ClientHeight + Height {CHECK_BOX_SIZE}) div 2);
  FTextRect := Rect(Height {CHECK_BOX_SIZE} + DEFAULT_PADDING,
    0,
    ClientWidth,
    ClientHeight);
end;

procedure TIQWebLargeOptionControl.DetermineState;
var
  OldState: THoverState;
begin
  inherited;
  OldState := FHoverState;
  FHoverState := hsNormal;
  if FMouseHover then
    FHoverState := hsHover;
  if (csLButtonDown in ControlState) or (IsKeyDown(VK_SPACE) and Focused) then
    FHoverState := hsPushed;
end;

function TIQWebLargeOptionControl.IsKeyDown(const VK: Integer): Boolean;
begin
  Result := Winapi.Windows.GetKeyState(VK) and $8000 <> 0;
end;

{$ENDREGION 'TIQWebLargeOptionControl'}

{$REGION 'TIQWebLargeCheckBox'}

{ TIQWebLargeCheckBox }

procedure TIQWebLargeCheckBox.Paint;
const
  IsChecked: array [Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or
    DFCS_CHECKED);
var
  AExtent: TSize;
  AFrameRect: TRect;
begin
  inherited;

  // Basic control painting (nothing special here)
//  Canvas.Brush.Color := Self.Color;
//  Canvas.FillRect(ClientRect);

  // Draw the control
  if Enabled then
    begin
//      DrawFrameControl(Canvas.Handle,
//        FCheckRect,
//        DFC_BUTTON,
//        IsChecked[Checked]);
    end
  else
    begin
//      DrawFrameControl(Canvas.Handle,
//        FCheckRect,
//        DFC_BUTTON,
//        DFCS_INACTIVE or IsChecked[Checked]);
    end;

  // Draw the caption text
//  Canvas.TextFlags := TRANSPARENT;
//  Canvas.Brush.Style := bsClear;
//  Canvas.Font.Assign(Font);
//  DrawText(Canvas.Handle,
//    PChar(Caption),
//    length(Caption),
//    FTextRect,
//    DT_SINGLELINE or DT_VCENTER or DT_LEFT);

  // Focus rectangle (external)
//  if Focused then
//    begin
//      AExtent := Canvas.TextExtent(Caption);
//      AFrameRect := Rect(FTextRect.Left,
//        (ClientHeight - AExtent.cy) div 2,
//        FTextRect.Left + AExtent.cx,
//        (ClientHeight + AExtent.cy) div 2);
//      Canvas.DrawFocusRect(AFrameRect);
//    end;
end;

{$ENDREGION 'TIQWebLargeCheckBox'}

{$REGION 'TIQWebLargeRadioButton'}

{ TIQWebLargeRadioButton }

procedure TIQWebLargeRadioButton.Paint;
const
  IsChecked: array [Boolean] of Integer = (DFCS_BUTTONRADIO, DFCS_BUTTONRADIO or
    DFCS_CHECKED);
var
  AExtent: TSize;
  AFrameRect: TRect;
  i, j, X, Y, y2: Integer;
begin
  inherited;

  // Basic control painting (nothing special here)
//  Canvas.Brush.Color := Self.Color;
//  Canvas.FillRect(ClientRect);

  // Draw the control
  if Enabled then
  begin
//    DrawFrameControl(Canvas.Handle,
//      FCheckRect,
//      DFC_BUTTON,
//      IsChecked[Checked]);
  end
  else
  begin
//    DrawFrameControl(Canvas.Handle,
//      FCheckRect,
//      DFC_BUTTON,
//      DFCS_BUTTONRADIO or DFCS_INACTIVE or IsChecked[Checked]);
  end;

  // Draw the caption text
//  Canvas.TextFlags := TRANSPARENT;
//  Canvas.Brush.Style := bsClear;
//  Canvas.Font.Assign(Font);
//  DrawText(Canvas.Handle,
//    PChar(Caption),
//    length(Caption),
//    FTextRect,
//    DT_SINGLELINE or DT_VCENTER or DT_LEFT);

  // Focus rectangle (external)
  if Focused then
    begin
//      AExtent := Canvas.TextExtent(Caption);
//      AFrameRect := Rect(FTextRect.Left,
//        (ClientHeight - AExtent.cy) div 2,
//        FTextRect.Left + AExtent.cx,
//        (ClientHeight + AExtent.cy) div 2);
//      Canvas.DrawFocusRect(AFrameRect);
    end;
end;

procedure TIQWebLargeRadioButton.SetChecked(Value: Boolean);

  procedure TurnSiblingsOff;
  var
    I: Integer;
    Sibling: TControl;
  begin
    if Parent <> nil then
      with Parent do
        for I := 0 to ControlCount - 1 do
        begin
          Sibling := Controls[I];
          if (Sibling <> Self) and (Sibling is TIQWebLargeRadioButton) then
            with TIQWebLargeRadioButton(Sibling) do
            begin
              if Assigned(Action) and
                 (Action is TCustomAction) and
                 TCustomAction(Action).AutoCheck then
                TCustomAction(Action).Checked := False;
              SetChecked(False);
            end;
        end;
  end;

begin
  if FChecked <> Value then
  begin
    FChecked := Value;
    Invalidate;
    if Value then
    begin
      TurnSiblingsOff;
      inherited Changed;
    end;
  end;
end;

{$ENDREGION 'TIQWebLargeRadioButton'}

end.

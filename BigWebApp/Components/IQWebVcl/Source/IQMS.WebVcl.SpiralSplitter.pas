unit IQMS.WebVcl.SpiralSplitter;

interface

uses
  Windows, Messages, SysUtils, Buttons, Classes, Graphics, Controls, Forms,
  ExtCtrls, Dialogs;

type
  TCornerStyle = (csRight, csLeft, csTop, csBottom);
  TCornerPlacement = (plBottomRight, plTopLeft);
  TCustomPageCorner = class(TGraphicControl)
  private
    FUsingImageCursor: boolean;
    MemBitmap: TBitmap;
    FNextColor: TColor;
    FUnderColor: TColor;
    FLineColor: TColor;
    FStyle: TCornerStyle;
    FPlacement: TCornerPlacement;
    FStretch: Boolean;
    FOnImageClick: TNotifyEvent;
    FImageCursor: TCursor;
    FStoreCursor: TCursor;
    FOnMouseExit: TNotifyEvent;
    FOnMouseEnter: TNotifyEvent;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    function GetTransparent: boolean;
    procedure SetLineColor(Value: TColor);
    procedure SetNextColor(Value: TColor);
    procedure SetUnderColor(Value: TColor);
    procedure SetPlacement(Value: TCornerPlacement);
    procedure SetStretch(Value: boolean);
    procedure SetStyle(Value: TCornerStyle);
    procedure SetTransparent(Value: boolean);
  protected
    function PointInImage(Pnt: TPoint): boolean;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer);override;
    procedure ImageClick; dynamic;
  public
    constructor Create(AOwner: TComponent);override;
    destructor Destroy;override;
    procedure Paint;override;
    property Color default clWindow;
    property ColorNextPage: TColor read FNextColor write SetNextColor default clGray;
    property ColorUnderPage: TColor read FUnderColor write SetUnderColor default clSilver;
    property ColorLines: TColor read FLineColor write setLineColor default clBlack;
    property ImageCursor: TCursor read FImageCursor write FImageCursor;
    property PageTurnDirection: TCornerStyle read FStyle write SetStyle default csRight;
    property Placement: TCornerPlacement read FPlacement write SetPlacement default plBottomRight;
    property Transparent: Boolean read GetTransparent write SetTransparent default FALSE;
    property Stretch: Boolean read FStretch write SetStretch default FALSE;
    property ParentColor default FALSE;
    property Height default 20;
    property Width default 20;
    property OnImageClick: TNotifyEvent read FOnImageClick write FOnImageClick;
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseExit: TNotifyEvent read FOnMouseExit write FOnMouseExit;
  end;

  TPageCorner = class(TCustomPageCorner)
  published
    property Anchors;
    property Constraints;
    property DragKind;
    property Align;
    property Color;
    property ColorLines;
    property ColorNextPage;
    property ColorUnderPage;
    property Cursor;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Height;
    property Hint;
    property ImageCursor;
    property PageTurnDirection;
    property ParentShowHint;
    property ParentColor;
    property Placement;
    property ShowHint;
    property Stretch;
    property Tag;
    property Visible;
    property Width;

    property OnEndDock;
    property OnStartDock;
    property OnContextPopup;
    property OnImageClick;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    Property OnDragOver;
    property OnEndDrag;
    property OnMouseEnter;
    property OnMouseExit;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;

  TCustomSpiralSplitter = class;

  TSpiralEdgeBorder = (ebLeft, ebTop, ebRight, ebBottom);
  TSpiralEdgeBorders = set of TSpiralEdgeBorder;

  TSpaceBorder = (bsSingle, bsNone, bsLowered, bsRaised);
  TBinderWellWidth = 0..31;

  TSpaceProperties = class(TPersistent)
  private
    FControl: TCustomSpiralSplitter;
    FEdgeBorders: TSpiralEdgeBorders;
    FSpaceBorder: TSpaceBorder;
    FColor: TColor;
    FTransparent: Boolean;
    FVisible: Boolean;
    FWidth: TBinderWellWidth;
    FBorderWidth: TBinderWellWidth;
    procedure SetBorderStyle(Value: TSpaceBorder);
    procedure SetBorderWidth(Value: TBinderWellWidth);
    procedure SetColor(Value: TColor);
    procedure SetEdgeBorders(Value: TSpiralEdgeBorders);
    procedure SetTransparent(Value: Boolean);
    procedure SetVisible(Value: Boolean);
    procedure SetWidth(Value: TBinderWellWidth);
  protected
    procedure UpDate;
  public
    constructor Create(AOwner: TCustomSpiralSplitter); dynamic;
    destructor Destroy; override;
  published
    property BorderStyle: TSpaceBorder read FSpaceBorder write SetBorderStyle default bsLowered;
    property BorderWidth: TBinderWellWidth read FBorderWidth write SetBorderWidth default 1;
    property Color: TColor read FColor write SetColor default clSilver;
    property EdgeBorders: TSpiralEdgeBorders read FEdgeBorders write SetEdgeBorders;
    property Transparent: Boolean read FTransparent write SetTransparent default FALSE;
    property Visible: Boolean read FVisible write SetVisible default TRUE;
    property Width: TBinderWellWidth read FWidth write SetWidth default 20;
  end;

  TSpiralBinderLayout = (blVertical, blHorizontal);

  TCustomSpiralSplitter = class(TPanel)
  private
    FSpaceProperties: TSpaceProperties;
    FNumRings: byte;
    FClosedGlyph: TBitmap;
    FRightOpenGlyph: TBitmap;
    FLeftOpenGlyph: TBitmap;
    FTopOpenGlyph: TBitmap;
    FBottomOpenGlyph: TBitmap;
    FClosedGlyphH: TBitmap;
    FOpened: Boolean;
    FLayout: TSpiralBinderLayout;
  protected
    procedure SpacePropertiesChanged; dynamic;
    function GetPalette: HPALETTE; override;
    procedure Paint; override;
    procedure SetOpened(Value: Boolean);
    procedure SetNumRings(Value: byte);
    procedure SetTransparent(value: boolean);
    function GetTransparent: Boolean;
    procedure SetLayout(Value: TSpiralBinderLayout);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Opened: Boolean Read FOpened write SetOpened;
    property Layout: TSpiralBinderLayout read FLayout write SetLayout default blVertical;
    property NumRings: byte read FNumRings write SetNumRings default 3;
    property Transparent: Boolean read GetTransParent write SetTransparent default FALSE;
    property SpaceBetween: TSpaceProperties read FSpaceProperties write FSpaceProperties;
    property Width default 50;
    property Height default 150;
  published
    property Enabled;
  end;

  TSpiralSplitter = class(TCustomSpiralSplitter)
  published
    property Anchors;
    property Constraints;
    property Align;
    property Cursor;
    property Height;
    property Hint;
    property Layout;
    property NumRings;
    property Opened;
    property ParentShowHint;
    property ShowHint;
    property SpaceBetween;
    property Tag;
    property Transparent;
    property Visible;
    property Width;

    property OnEndDock;
    property OnStartDock;
    property OnContextPopup;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    Property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;

implementation

//uses
//  vcl_share;

procedure DrawLiftedCorner( ACanvas: TCanvas;
                            T,L,W,H, B: integer;
                            clLine, clNext, clUnder: TColor;
                            InversePlacement: Boolean);
var
  TopCorner, BottomCorner, SideCorner: TPoint;
  TempColor: TColor;
  AX, AY: integer;
   procedure PrepareCorners;
   begin  
     if InversePlacement then
     begin
       if B > 1 then
       begin
         TopCorner.X := w;
         BottomCorner.X := 0;
         BottomCorner.Y := H div 2;
         SideCorner.X := W div 2;
         if B = 2 then
         begin
           TopCorner.Y := 0;
           SideCorner.y := H;
         end
         else
         begin
           TopCorner.Y := H;
           SideCorner.y := 0;
         end;
       end
       else
       begin
         TopCorner.Y := H;
         BottomCorner.Y := 0;
         BottomCorner.X := W div 2;
         SideCorner.Y := H div 2;
         if B = 0 then
         begin
           TopCorner.X := W;
           SideCorner.X := 0;
         end
         else
         begin
           TopCorner.X := 0;
           SideCorner.X := W;
         end;
       end;
     end
     else
     begin
       if B = 3 then TopCorner.Y := H
       else TopCorner.Y := 0;
       if B = 0 then TopCorner.X := W
       else TopCorner.X := 0;
       IF (B = 2)OR(B = 3) then
       begin
         BottomCorner.Y := H div 2;
         BottomCorner.X := W;
       end
       else
       begin
         BottomCorner.Y := H;
         BottomCorner.X := W div 2;
       end;
       IF (B = 2)OR(B = 3) then
       begin
         if B = 2 then SideCorner.Y := H
         else SideCorner.Y := 0;
         SideCorner.X := W div 2;
       end
       else
       begin
         SideCorner.Y := H div 2;
         if B = 0 then SideCorner.X := 0
         else SideCorner.X := W;
       end;
     end;

     SideCorner.X := SideCorner.X + L;
     SideCorner.Y := SideCorner.Y + T;
     BottomCorner.X := BottomCorner.X + L;
     BottomCorner.Y := BottomCorner.Y + T;
     TopCorner.X := TopCorner.X + L;
     TopCorner.Y := TopCorner.Y + T;
   end;
   procedure DrawTheArc;
   begin
     With ACanvas do
     if InversePlacement then
       case B of
         0: begin
             Arc(  (BottomCorner.X - W)-1, (SideCorner.Y - H) -1,
                   (BottomCorner.X)+1, (SideCorner.Y)+1,
                   SideCorner.X, SideCorner.Y,BottomCorner.X, BottomCorner.Y);
             end;
         1: begin
             Arc(  (BottomCorner.X)-1, (SideCorner.Y - H)-1,
                   (BottomCorner.X + W)+1, (SideCorner.Y)+1,
                   BottomCorner.X, BottomCorner.Y,SideCorner.X, SideCorner.Y);
             end;
         2: begin
             Arc(  (SideCorner.X - W)-1, (BottomCorner.Y)-1,
                   (SideCorner.X)+1, (BottomCorner.Y + H)+1,
                   SideCorner.X, SideCorner.Y,BottomCorner.X, BottomCorner.Y);
             end;
        else begin
             Arc(  (SideCorner.X - W)-1, (BottomCorner.Y - H)-1,
                   (SideCorner.X)+1, (BottomCorner.Y)+1,
                   BottomCorner.X, BottomCorner.Y,SideCorner.X, SideCorner.Y);
             end;
       end
     else
       case B of
         0: begin
             Arc(  (BottomCorner.X - W)-1, (SideCorner.Y) -1,
                   (BottomCorner.X)+1, (SideCorner.Y + H)+1,
                   BottomCorner.X, BottomCorner.Y, SideCorner.X, SideCorner.Y);
             end;
         1: begin
             Arc(  (BottomCorner.X)-1, (SideCorner.Y)-1,
                   (BottomCorner.X + W)+1, (SideCorner.Y + H)+1,
                   SideCorner.X, SideCorner.Y,BottomCorner.X, BottomCorner.Y);
             end;
         2: begin
             Arc(  (SideCorner.X)-1, (BottomCorner.Y)-1,
                   (SideCorner.X + W)+1, (BottomCorner.Y + H)+1,
                   BottomCorner.X, BottomCorner.Y,SideCorner.X, SideCorner.Y);
             end;
        else begin
             Arc(  (SideCorner.X)-1, (BottomCorner.Y - H)-1,
                   (SideCorner.X + W)+1, (BottomCorner.Y)+1,
                   SideCorner.X, SideCorner.Y,BottomCorner.X, BottomCorner.Y);
             end;
       end;
   end;
begin
  PrepareCorners;
  with ACanvas do
  begin
    // draw lines
    Pen.Mode := pmCopy;
    Pen.Style := psSolid;
    Pen.Color := clUnder;
    Pen.Width := 1;
    MoveTo(TopCorner.X,TopCorner.Y);
    if B > 1 then
    begin
      LineTo(BottomCorner.X,TopCorner.Y);
      LineTo(BottomCorner.X,BottomCorner.Y);
    end
    else
    begin
      LineTo(TopCorner.X,BottomCorner.Y);
      LineTo(BottomCorner.X,BottomCorner.Y);
    end;
    Pen.Width := 1;
    Pen.Color := clLine;
    MoveTo(TopCorner.X,TopCorner.Y);
    LineTo(SideCorner.X,SideCorner.Y);
    MoveTo(TopCorner.X,TopCorner.Y);
    LineTo(BottomCorner.X,BottomCorner.Y);

    DrawTheArc;

    // fill arc
    if B > 1 then
    begin
      AX := SideCorner.X;
      AY := BottomCorner.Y;
    end
    else
    begin
      AX := BottomCorner.X;
      AY := SideCorner.Y;
    end;

    TempColor := Pixels[ AX, AY ];
    Brush.Color := clUnder;
    FloodFill(AX, AY, TempColor, fsSurface);
    //  fill next area
    if InversePlacement then
    begin
      Ax := BottomCorner.X + 2;
      Ay := BottomCorner.Y + 2;
    end
    else
    begin
      Ax := BottomCorner.X - 2;
      Ay := BottomCorner.Y - 2;
    end;
    case B of
      0: Ax := BottomCorner.X + (W div 4);
      1: Ax := BottomCorner.X - (W div 4);
      2: Ay := BottomCorner.Y - (H div 4);
     else Ay := BottomCorner.Y + (H div 4);
    end;
    TempColor := Pixels[ AX, AY ];
    Brush.Color := clNext;
    FloodFill(AX, AY, TempColor, fsSurface);

  end;
end;

constructor TCustomPageCorner.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FUsingImageCursor := FALSE;
  ControlStyle := ControlStyle + [csOpaque];
  MemBitmap := TBitmap.Create;
  SetBounds(0,0,20,20);
  FPlacement := plBottomRight;
  ParentColor := FALSE;
  Color := clWindow;
  FLineColor := clBlack;
  FNextColor := clGray;
  FUnderColor := clSilver;
  FStretch := FALSE;
  FStyle := csRight;
end;

destructor TCustomPageCorner.Destroy;
begin
  MemBitmap.Free;
  inherited Destroy;
end;

procedure TCustomPageCorner.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseUp(Button,Shift,X,Y);
  if PointInImage(Point(x,Y)) then
    ImageClick;
end;

procedure TCustomPageCorner.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  if PointInImage(Point(x,Y)) then
  begin
    if NOT FUsingImageCursor then
    begin
      FStoreCursor := Cursor;
      Cursor := FImageCursor;
      FUsingImageCursor := TRUE;
    end;
  end
  else
  begin
    if FUsingImageCursor then
      Cursor := FStoreCursor;
    FUsingImageCursor := FALSE;
  end;
end;

procedure TCustomPageCorner.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  if FUsingImageCursor then
    Cursor := FStoreCursor;
  FUsingImageCursor := FALSE;
  if Assigned(FOnMouseExit) then
    FOnMouseExit(Self);
end;

function TCustomPageCorner.PointInImage(Pnt: TPoint): boolean;
var
  ww: integer;
begin
  result := FALSE;
  if FStretch then result := TRUE
  else
  begin
    if Width < height then ww := Width
    else ww := Height + 1;
    if Placement = plTopLeft then
    begin
      case PageTurnDirection of    //
        csLeft,
         csTop : if (Pnt.X < ww)and (Pnt.Y < ww) then
                    result := TRUE;
        csRight: if (Pnt.X > (Width - ww))and (Pnt.Y < ww) then
                    result := TRUE;
        else      if (Pnt.X < ww)and (Pnt.Y > (Height - ww)) then
                    result := TRUE;
      end;    // case
    end
    else
    begin
      case PageTurnDirection of    //
        csRight,
        csBottom: if (Pnt.X > (Width - ww))and (Pnt.Y > (Height - ww)) then
                     result := TRUE;
        csLeft: if (Pnt.X < ww)and (Pnt.Y > (Height - ww)) then
                     result := TRUE;
        else     if (Pnt.X > (Width - ww))and (Pnt.Y < ww) then
                     result := TRUE;
      end;    // case
    end;
  end;
end;
procedure TCustomPageCorner.ImageClick;
begin
  if Assigned(FOnImageClick) then FOnImageClick(Self);
end;

procedure TCustomPageCorner.SetLineColor(Value: TColor);
begin
  if Value <> FLineColor then
  begin
    FLineColor := Value;
    Invalidate;
  end;
end;
procedure TCustomPageCorner.SetNextColor(Value: TColor);
begin
  if Value <> FNextColor then
  begin
    FNextColor := Value;
    Invalidate;
  end;
end;
procedure TCustomPageCorner.SetUnderColor(Value: TColor);
begin
  if Value <> FUnderColor then
  begin
    FUnderColor := Value;
    Invalidate;
  end;
end;
procedure TCustomPageCorner.SetStyle(Value: TCornerStyle);
begin
  if Value <> FStyle then
  begin
    FStyle := Value;
    Invalidate;
  end;
end;
procedure TCustomPageCorner.SetPlacement(Value: TCornerPlacement);
begin
  if Value <> FPlacement then
  begin
    FPlacement := Value;
    Invalidate;
  end;
end;
procedure TCustomPageCorner.SetStretch(Value: Boolean);
begin
  if Value <> FStretch then
  begin
    FStretch := Value;
    Invalidate;
  end;
end;
procedure TCustomPageCorner.SetTransparent(value: boolean);
begin
  if Transparent <> Value then
    begin
    if Value then
      ControlStyle := ControlStyle - [csOpaque] else
      ControlStyle := ControlStyle + [csOpaque];
    Invalidate;
    end;
end;
function TCustomPageCorner.GetTransparent: Boolean;
begin
  Result := not (csOpaque in ControlStyle);
end;

procedure TCustomPageCorner.Paint;
var
  B: Byte;
  L, T, W, H: integer;
begin
  MemBitmap.Assign(nil);
  case FStyle of
    csRight: B := 0;
    csLeft: B := 1;
    csTop: B := 2;
    else B := 3;
  end;
  if NOT Transparent then
  begin
    MemBitmap.Canvas.Brush.Color := Color;
    MemBitmap.Canvas.FillRect(ClientRect);
  end;
  L := 0;
  T := 0;
  W := Width;
  H := Height;
  if NOT FStretch then
  begin
    if W < H then H := W
    else W := H;
    if FPlacement = plBottomRight then
    case B of
      1: T := Height - W;
      2: L := Width - W;
     else begin
          L := Width - W;
          T := Height - W;
          end
    end
    else
    case B of
      0: L := Width - W;
      3: T := Height - W;
    end;
  end;
  MemBitmap.Width := Width;
  MemBitmap.Height := Height;
    DrawLiftedCorner( MemBitmap.Canvas,T,L,W,H, B,
                      FLineColor,FNextColor,FUnderColor,
                      (FPlacement = plTopLeft));
  if csDesigning in ComponentState then With Canvas do
  begin
    Pen.Mode := pmCopy;
    Pen.Style := psDash;
    Pen.Color := clBlack;
    Pen.Width := 1;
    MoveTo(0,0);
    LineTo(0,Height-1);
    LineTo(Width-1,Height-1);
    LineTo(Width-1,0);
    LineTo(0,0);
  end;
  Canvas.Draw(0, 0, MemBitmap);
end;

{ TSpaceProperties }

constructor TSpaceProperties.Create(AOwner: TCustomSpiralSplitter);
begin
  inherited Create;
  FControl := AOwner;
  FSpaceBorder := bsLowered;
  FColor := clSilver;
  FEdgeBorders := [ebLeft, ebRight];
  FVisible := TRUE;
  FTransparent := FALSE;
  FWidth := 20;
  FBorderWidth := 1;
end;

destructor TSpaceProperties.Destroy;
begin
  FControl := nil;
  inherited Destroy;
end;

procedure TSpaceProperties.UpDate;
begin
  FControl.SpacePropertiesChanged;
end;

procedure TSpaceProperties.SetEdgeBorders(Value: TSpiralEdgeBorders);
begin
  if Value <> FEdgeBorders then
    begin
    FEdgeBorders := Value;
    if Visible then UpDate;
    end;
end;

procedure TSpaceProperties.SetBorderStyle(Value: TSpaceBorder);
begin
  if Value <> FSpaceBorder then
    begin
    FSpaceBorder := Value;
    if Visible then UpDate;
    end;
end;

procedure TSpaceProperties.SetColor(Value: TColor);
begin
  if Value <> FColor then
    begin
    FColor := Value;
    if Visible AND NOT(FTransparent) then UpDate;
    end;
end;

procedure TSpaceProperties.SetTransparent(Value: Boolean);
begin
  if Value <> FTransparent then
    begin
    FTransparent := Value;
    if Visible then UpDate;
    end;
end;
procedure TSpaceProperties.SetVisible(Value: Boolean);
begin
  if Value <> FVisible then
    begin
    FVisible := Value;
    UpDate;
    end;
end;
procedure TSpaceProperties.SetWidth(Value: TBinderWellWidth);
begin
  if Value <> FWidth then
    begin
    FWidth := Value;
    if Visible then UpDate;
    end;
end;
procedure TSpaceProperties.SetBorderWidth(Value: TBinderWellWidth);
begin
  if Value <> FBorderWidth then
    begin
    FBorderWidth := Value;
    if Visible then UpDate;
    end;
end;

{ TCustomSpiralSplitter }

constructor TCustomSpiralSplitter.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  SetBounds(0,0,50,150);
  FSpaceProperties := TSpaceProperties.Create(Self);
  ControlStyle := [csCaptureMouse, csClickEvents, csDoubleClicks];
  FClosedGlyph := TBitmap.Create;
  FRightOpenGlyph := TBitmap.Create;
  FLeftOpenGlyph := TBitmap.Create;
  FTopOpenGlyph := TBitmap.Create;
  FBottomOpenGlyph := TBitmap.Create;
  FClosedGlyphH := TBitmap.Create;
  FClosedGlyph.Handle := LoadBitmap(HInstance, '79RNGCL'); // Ring Closed
  FRightOpenGlyph.Handle := LoadBitmap(HInstance, '79RNGRO'); // Ring Right Open
  FLeftOpenGlyph.Handle := LoadBitmap(HInstance, '79RNGLO'); // Ring Left Open
  FTopOpenGlyph.Handle := LoadBitmap(HInstance, '79RNGTO'); // Ring Top Opened
  FBottomOpenGlyph.Handle := LoadBitmap(HInstance, '79RNGBO'); // Ring Bottom Opened
  FClosedGlyphH.Handle := LoadBitmap(HInstance, '79VRNGCL'); // Vertical Ring Closed
  FLayout := blVertical;
  FNumRings := 3;
  ParentFont := TRUE;
end;

destructor TCustomSpiralSplitter.Destroy;
begin
  FSpaceProperties.Free;
  FClosedGlyph.Free;
  FRightOpenGlyph.Free;
  FLeftOpenGlyph.Free;
  FTopOpenGlyph.Free;
  FBottomOpenGlyph.Free;
  FClosedGlyphH.Free;
  inherited Destroy;
end;

procedure TCustomSpiralSplitter.SpacePropertiesChanged;
begin
  Invalidate;
end;

procedure TCustomSpiralSplitter.Paint;
var
  CenterH, CenterV, i, xx, yy: integer;
  Rect: TRect;
  Color1,Color2: TColor;
   procedure DoLine(C: TColor; X1, Y1, X2, Y2: Integer);
   begin
      with Canvas do
        begin
        Pen.Color := C;
        MoveTo(X1, Y1);
        LineTo(X2, Y2);
        end;
   end;
   procedure DrawRingV(Y: integer);
   begin
     with Canvas do
       begin
       Brush.Style := bsSolid;
       Brush.Color := clBlack;
       Ellipse(xx, Y, xx+10, Y+10);
       Ellipse(xx+39, Y, xx+49, Y+10);
       if FOpened then
          begin
          Brush.Color := clGray;
          Ellipse(xx+1, Y+1, xx+8, Y+8);
          Ellipse(xx+40, Y+1, xx+47, Y+8);
          Draw(xx+6,Y,FLeftOpenGlyph);
          Draw(xx+30,Y,FRightOpenGlyph);
          end
         else Draw(xx+2,Y+2,FClosedGlyph);
       end;
   end;
   procedure DrawRingH(X: integer);
   begin
     with Canvas do
       begin
       Brush.Style := bsSolid;
       Brush.Color := clBlack;
       Ellipse(X, yy, X+10, yy+10);
       Ellipse(X, yy+39, X+10, yy+49);
       if FOpened then
          begin
          Brush.Color := clGray;
          Ellipse(X+1, yy+1, X+8, yy+8);
          Ellipse(X+1, yy+40, X+8, yy+47);
          Draw(X,yy+6,FTopOpenGlyph);
          Draw(X,yy+30,FBottomOpenGlyph);
          end
         else Draw(X+2,yy+2,FClosedGlyphH);
       end;
   end;
begin

  // 09/13/2006 Prevents blinking
  if (FLayout = blVertical) and (Height < 16) then Exit;

  CenterV := TRUNC(Width /2);
  CenterH := TRUNC(Height /2);

  with Canvas do
    begin
    if not Transparent then
      begin
      Brush.Color := Self.Color;
      Brush.Style := bsSolid;
      FillRect(ClientRect);
      end;

    if FSpaceProperties.Visible then
      begin
      if FLayout = blVertical then
      begin
        Rect.Left := CenterV - TRUNC(FSpaceProperties.Width /2);
        Rect.Bottom := Height;
        Rect.Right := Rect.Left + FSpaceProperties.Width;
        Rect.Top := 0;
      end
      else
      begin
        Rect.Left := 0;
        Rect.Top := CenterH - TRUNC(FSpaceProperties.Width /2);
        Rect.Right := Width;
        Rect.Bottom := Rect.Top + FSpaceProperties.Width;
      end;
      if NOT(FSpaceProperties.Transparent) then
        begin
        Brush.Color:= FSpaceProperties.Color;
        FillRect(Rect);
        end;
      if FSpaceProperties.BorderStyle <> bsNone then
        begin
        Pen.Style := psSolid;
        Pen.Width := 1;
        case FSpaceProperties.BorderStyle of
          bsSingle : begin
                      Color1 := clBlack;
                      Color2 := clBlack;
                      end;
          bsRaised : begin
                      Color1 := clBtnHighlight;
                      Color2 := clBtnShadow;
                      end;
          else        begin // bsLowered
                      Color1 := clBtnShadow;
                      Color2 := clBtnHighlight;
                      end;
          end;
        For i := 0 to (FSpaceProperties.BorderWidth - 1) do
          begin
          if ebTop in FSpaceProperties.EdgeBorders then
            DoLine(Color1, Rect.Left, Rect.Top + i, Rect.Right, Rect.Top + i);
          if ebBottom in FSpaceProperties.EdgeBorders then
            DoLine(Color2, Rect.Left, Rect.Bottom - (1 + i), Rect.Right, Rect.Bottom - (1 + i));
          if ebLeft in FSpaceProperties.EdgeBorders then
            DoLine(Color1, Rect.Left+i, Rect.Top, Rect.Left+i, Rect.Bottom);
          if ebRight in FSpaceProperties.EdgeBorders then
            DoLine(Color2, Rect.Right - (1 + i), Rect.Top, Rect.Right - (1 + i), Rect.Bottom);
          if FSpaceProperties.BorderStyle = bsSingle then Break;
          end;
        end;
      end;

    Pen.Color := clBlack;
    end;
  if FLayout = blVertical then
  begin
    if Width < 50 then Width := 50;
    if Height < 16 then Height := 16;
    xx := CenterV - 24;
    yy := Height div (FNumRings+1);
    if Height >= 30 then
       for i := 1 to FNumRings do DrawRingV((yy * i) - 4);
  end
  else
  begin
    if Width < 16 then Width := 16;
    if Height < 50 then Height := 50;
    xx := Width div (FNumRings+1);
    yy := CenterH - 24;
    if Width >= 30 then
       for i := 1 to FNumRings do DrawRingH((xx * i) - 4);
  end;
end;

function TCustomSpiralSplitter.GetPalette: HPALETTE;
begin
  if FOpened then Result := FLeftOpenGlyph.Palette
   else result := FClosedGlyph.Palette;
end;

procedure TCustomSpiralSplitter.SetOpened(Value: Boolean);
begin
  if FOpened <> Value then
    begin
    FOpened := Value;
    Invalidate;
    end;
end;

procedure TCustomSpiralSplitter.SetNumRings(Value: Byte);
begin
  if FNumRings <> Value then
    begin
    FNumRings := Value;
    Invalidate;
    end;
end;

procedure TCustomSpiralSplitter.SetTransparent(value: boolean);
begin
  if Transparent <> Value then
    begin
    if Value then
      ControlStyle := ControlStyle - [csOpaque] else
      ControlStyle := ControlStyle + [csOpaque];
    Invalidate;
    end;
end;

function TCustomSpiralSplitter.GetTransparent: Boolean;
begin
  Result := not (csOpaque in ControlStyle);
end;
procedure TCustomSpiralSplitter.SetLayout(Value: TSpiralBinderLayout);
begin
  if Value <> FLayout then
  begin
    FLayout := Value;
    Invalidate;
  end;
end;

procedure TCustomPageCorner.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self); 
end;

end.

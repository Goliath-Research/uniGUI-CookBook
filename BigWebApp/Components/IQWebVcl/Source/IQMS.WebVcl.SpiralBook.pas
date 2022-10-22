unit IQMS.WebVcl.SpiralBook;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IQMS.WebVcl.SpiralSplitter, ExtCtrls, ComCtrls, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPageControl;

resourcestring
  cPageCornerHint = 'Next page';

type
  TSpiralProperties = class(TPersistent)
  private
    FHint: string;
    FBorderStyle: TSpaceBorder;
    FBorderWidth: TBinderWellWidth;
    FColor: TColor;
    FWidth: TBinderWellWidth;
    FNumRings: Byte;
    FOpened: boolean;
    FOnChange: TNotifyEvent;
    procedure SetBorderStyle(Value: TSpaceBorder);
    procedure SetBorderWidth(Value: TBinderWellWidth);
    procedure SetColor(Value: TColor);
    procedure SetHint(Value: string);
    procedure SetNumRings(Value: Byte);
    procedure SetWidth(Value: TBinderWellWidth);
    procedure SetOpened(Value: boolean);
  protected
    procedure Change;
  published
    property BorderStyle: TSpaceBorder read FBorderStyle write SetBorderStyle;
    property BorderWidth: TBinderWellWidth read FBorderWidth write SetBorderWidth;
    property Color: TColor read FColor write SetColor;
    property Hint: string read FHint write SetHint;
    property NumRings: Byte read FNumRings write SetNumRings;
    property Opened: boolean read FOpened write SetOpened;
    property Width: TBinderWellWidth read FWidth write SetWidth;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

  TCornerProperties = class(TPersistent)
  private
    FHint: string;
    FColorUnderPage: TColor;
    FColorNExtPage: TColor;
    FCursor: TCursor;
    FWidth: integer;
    FOnChange: TNotifyEvent;
    FIgnoreTabVisibleCheck: Boolean;
    procedure SetColorNextPage(Value: TColor);
    procedure SetColorUnderPage(Value: TColor);
    procedure SetCursor(Value: TCursor);
    procedure SetHint(Value: string);
    procedure SetWidth(Value: integer);
  protected
    procedure Change;
  published
    property ColorNextPage: TColor read FColorNextPage write SetColorNextPage;
    property ColorUnderPage: TColor read FColorUnderPage write SetColorUnderPage;
    property Cursor: TCursor read FCursor write SetCursor;
    property IgnoreTabVisibleCheck: Boolean read FIgnoreTabVisibleCheck write FIgnoreTabVisibleCheck;
    property Hint: string read FHint write SetHint;
    property Width: integer read FWidth write SetWidth;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

  TIQWebSpiralBook = class(TUniPageControl)
  private
    FCornerProperties: TCornerProperties;
    FSpiralProperties: TSpiralProperties;
    FCorner: TPageCorner;
    FBinder: TSpiralSplitter;
    FLayout: TCornerStyle;
    procedure CornerClick(Sender: TObject);
    procedure CornerPropsChanged(Sender: TObject);
    function GetShowPageLift: boolean;
    procedure SetCornerWidth;
    procedure SetLayout(Value: TCornerStyle);
    procedure SetShowPageLift(Value: boolean);
    procedure SpiralPropsChanged(Sender: TObject);
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Corner: TCornerProperties read FCornerProperties write FCornerProperties;
    property Layout: TCornerStyle read FLayout write SetLayout default csTop;
    property ShowPageLift: boolean read GetShowPageLift write SetShowPageLift;
    property Spiral: TSpiralProperties read FSpiralProperties write FSpiralProperties;
  end;

implementation

procedure TSpiralProperties.SetBorderStyle(Value: TSpaceBorder);
begin
  if Value <> FBorderStyle then
  begin
    FBorderStyle := Value;
    Change;
  end;
end;

procedure TSpiralProperties.SetBorderWidth(Value: TBinderWellWidth);
begin
  if Value <> FBorderWidth then
  begin
    FBorderWidth := Value;
    Change;
  end;
end;

procedure TSpiralProperties.SetColor(Value: TColor);
begin
  if Value <> FColor then
  begin
    FColor := Value;
    Change;
  end;
end;

procedure TSpiralProperties.SetHint(Value: string);
begin
  if Value <> FHint then
  begin
    FHint := Value;
    Change;
  end;
end;

procedure TSpiralProperties.SetNumRings(Value: Byte);
begin
  if Value <> FNumRings then
  begin
    FNumRings := Value;
    Change;
  end;
end;

procedure TSpiralProperties.SetWidth(Value: TBinderWellWidth);
begin
  if Value <> FWidth then
  begin
    FWidth := Value;
    Change;
  end;
end;

procedure TSpiralProperties.SetOpened(Value: boolean);
begin
  if Value <> FOpened then
  begin
    FOpened := Value;
    Change;
  end;
end;

procedure TSpiralProperties.Change;
begin
  if assigned(FOnChange) then FOnChange(Self);
end;

procedure TCornerProperties.SetCursor(Value: TCursor);
begin
  if Value <> FCursor then
  begin
    FCursor := Value;
    Change;
  end;
end;

procedure TCornerProperties.SetColorUnderPage(Value: TColor);
begin
  if Value <> FColorUnderPage then
  begin
    FColorUnderPage := Value;
    Change;
  end;
end;

procedure TCornerProperties.SetColorNextPage(Value: TColor);
begin
  if Value <> FColorNextPage then
  begin
    FColorNextPage := Value;
    Change;
  end;
end;

procedure TCornerProperties.SetHint(Value: string);
begin
  if Value <> FHint then
  begin
    FHint := Value;
    Change;
  end;
end;

procedure TCornerProperties.SetWidth(Value: integer);
begin
  if Value <> FWidth then
  begin
    FWidth := Value;
    Change;
  end;
end;

procedure TCornerProperties.Change;
begin
  if assigned(FOnChange) then FOnChange(Self);
end;

{  TIQWebSpiralBook }

constructor TIQWebSpiralBook.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FSpiralProperties := TSpiralProperties.Create;
  FCornerProperties := TCornerProperties.Create;
  FCorner := TPageCorner.Create(Self);
  FCorner.Parent := Self;
  FCorner.Align := alRight;
  FCorner.ParentColor := TRUE;
  FCorner.ColorUnderPage := clWindow;
  FCorner.ColorNextPage := clAppWorkSpace;
  FCorner.Hint := 'Next page';
  FCorner.ImageCursor := crUpArrow;
  FCorner.OnImageClick := CornerClick;
  FBinder := TSpiralSplitter.Create(Self);
  FBinder.Parent := Self;
  FBinder.Align := alLeft;
  FBinder.Transparent := FALSE;
  FSpiralProperties.BorderStyle := FBinder.SpaceBetween.BorderStyle;
  FSpiralProperties.BorderWidth := FBinder.SpaceBetween.BorderWidth;
  FSpiralProperties.Color := FBinder.SpaceBetween.Color;
  FSpiralProperties.Hint := FBinder.Hint;
  FSpiralProperties.NumRings := FBinder.NumRings;
  FSpiralProperties.Width := FBinder.SpaceBetween.Width;
  FSpiralProperties.Opened := FBinder.Opened;
  FSpiralProperties.OnChange := SpiralPropsChanged;

  FCornerProperties.Cursor := FCorner.ImageCursor;
  FCornerProperties.ColorUnderPage := FCorner.ColorUnderPage;
  FCornerProperties.ColorNExtPage := FCorner.ColorNExtPage;
  FCornerProperties.Hint := FCorner.Hint;
  FCornerProperties.Width := FCorner.Width;
  FCornerProperties.OnChange := CornerPropsChanged;
  SetLayout(csTop);
end;

procedure TIQWebSpiralBook.CornerPropsChanged;
begin
  FCorner.ImageCursor := FCornerProperties.Cursor;
  FCorner.ColorUnderPage := FCornerProperties.ColorUnderPage;
  FCorner.ColorNExtPage := FCornerProperties.ColorNExtPage;
  FCorner.Hint := FCornerProperties.Hint;
  if FCornerProperties.Width <> FCorner.Width then SetCornerWidth;
end;

procedure TIQWebSpiralBook.SetCornerWidth;
begin
  if FLayout in [csRight, csLeft] then
    FCorner.Width := FCornerProperties.Width
  else FCorner.Height := FCornerProperties.Width;
end;

procedure TIQWebSpiralBook.SpiralPropsChanged(Sender: TObject);
begin
  FBinder.SpaceBetween.BorderStyle := FSpiralProperties.BorderStyle;
  FBinder.SpaceBetween.BorderWidth := FSpiralProperties.BorderWidth;
  FBinder.SpaceBetween.Color := FSpiralProperties.Color;
  FBinder.Hint := FSpiralProperties.Hint;
  FBinder.NumRings := FSpiralProperties.NumRings;
  FBinder.SpaceBetween.Width := FSpiralProperties.Width;
  FBinder.Opened := FSpiralProperties.Opened;
end;

function TIQWebSpiralBook.GetShowPageLift: boolean;
begin
  result := FCorner.Visible;
end;

procedure TIQWebSpiralBook.SetShowPageLift(Value: boolean);
begin
  FCorner.Visible := Value;
  if Value then FCorner.Parent := Self
  else FCorner.Parent := nil;
end;

procedure TIQWebSpiralBook.SetLayout(Value: TCornerStyle);
begin
  if Value <> FLayout then
  begin
    FLayout := Value;
    case FLayout of
      csRight:
         begin
            FCorner.Align := alRight;
            FCorner.Placement := plBottomRight;
            FBinder.Align := alLeft;
            FCorner.PageTurnDirection := csRight;
            FBinder.SpaceBetween.EdgeBorders := [ebLeft, ebRight];
            FBinder.Layout := blVertical;
            FBinder.Width := 50;
         end;
      csLeft :
         begin
            FCorner.Align := alLeft;
            FCorner.Placement := plBottomRight;
            FCorner.PageTurnDirection := csLeft;
            FBinder.Align := alRight;
            FBinder.SpaceBetween.EdgeBorders := [ebLeft, ebRight];
            FBinder.Layout := blVertical;
            FBinder.Width := 50;
         end;
      csTop  :
         begin
            FCorner.Align := alBottom;
            FCorner.PageTurnDirection := csBottom;
            FBinder.Align := alTop;
            FBinder.Layout := blHorizontal;
            FBinder.SpaceBetween.EdgeBorders := [ebTop, ebBottom];
            FBinder.Height := 50;
         end;
      else
         begin
            FCorner.Align := alTop;
            FCorner.PageTurnDirection := csTop;
            FBinder.Align := alBottom;
            FBinder.Layout := blHorizontal;
            FBinder.SpaceBetween.EdgeBorders := [ebTop, ebBottom];
            FBinder.Height := 50;
         end;
    end;
    SetCornerWidth;
    if HandleAllocated then
      InvalidateRect(Handle, Nil, TRUE);
  end;
end;

destructor TIQWebSpiralBook.Destroy;
begin
  FSpiralProperties.Free;
  FCornerProperties.Free;
  FBinder.Free;
  FCorner.Free;
  inherited Destroy;
end;

procedure TIQWebSpiralBook.CornerClick(Sender: TObject);
begin
  SelectNextPage(TRUE, not FCornerProperties.IgnoreTabVisibleCheck );
end;

end.

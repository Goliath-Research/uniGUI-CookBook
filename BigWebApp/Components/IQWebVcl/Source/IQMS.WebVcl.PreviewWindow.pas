unit IQMS.WebVcl.PreviewWindow;

{ Creates a simple preview style window, much like the print preview in
  Microsoft Word.  You will need to add the TMemo, TRichEdit or other
  control that actually shows the data.  If you are adding this control
  programmatically, add display controls to ClientPanel. For example:

    PreviewWindow:= TPreviewWindow.Create(Self);
    with PreviewWindow do
    begin
      Parent := PnlMain;
      Align := alClient;
      // Add display control
      Memo1.Parent := PreviewWindow.ClientPanel;
      Memo1.Align := alClient;
    end;

}


interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms, UniPanel,
  Dialogs,
  ExtCtrls,
  Menus;

type
  TIQWebPreviewWindow = class(TUniPanel)
  private
    FCreating: Boolean;
    FShadow, FPage: TUniPanel;
    FPageBorderWidth, FInnerPageBorderWidth: Integer;
    FPageBufferWidth: Integer;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure DoPaint;
    procedure SetPageBufferWidth(const Value: Integer);
    procedure SetPageBorderWidth(const Value: Integer);
    function GetPageBorderWidth: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure RefreshDisplay;
  published
    // The gray field around the page
    property PageBufferWidth: Integer read FPageBufferWidth write SetPageBufferWidth;
    // The internal border for the page
    property PageBorderWidth: Integer read GetPageBorderWidth write SetPageBorderWidth;

    property Align;
    property Alignment;
    property Anchors;
    property AutoSize;
    property BevelInner;
    property BevelOuter;
    property BevelWidth;
    property BorderStyle;
    property Constraints;
    property DragCursor;
    property DragMode;
    property Enabled;
//    property FullRepaint;
//    property Locked;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnCanResize;
    property OnClick;
    property OnConstrainedResize;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGetSiteInfo;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
    property OnStartDock;
    property OnStartDrag;

end;

implementation

uses
  IQMS.Common.Graphics,
  uniGUIBaseClasses,
  uniGUIClasses;

{ TPreviewWindow }

constructor TIQWebPreviewWindow.Create(AOwner: TComponent);
const
  // default values
  cBrdW = 6; // page border
  cBfW = 9; // page buffer
  cDefW = 160; // default width
  cDefH = 180; // default height
begin

  FCreating := TRUE;

  inherited Create(AOwner);

  ControlStyle := [csCaptureMouse, csClickEvents, csDoubleClicks,
    csOpaque, csReplicatable];
  if (csDesigning in ComponentState) then
    ControlStyle := ControlStyle + [csAcceptsControls];

  DragKind := dkDrag;

  Width := cDefW;
  Height := cDefH;
  BevelOuter := bvNone;
  //Color := clBtnFace;

  PageBorderWidth := cBrdW;
  PageBufferWidth := cBfW;
  StyleElements := [];

  FShadow := TUniPanel.Create(Self);
  with FShadow do
  begin
    Parent := Self;
    Name := 'FShadow';
    Left := FPageBufferWidth + 3;
    Top := FPageBufferWidth + 3;
    Height := cDefH - ((FPageBufferWidth * 2) + 1);
    Width := cDefW - ((FPageBufferWidth * 2) + 1);
    Anchors := [akLeft, akTop, akRight, akBottom];
    Brush.Color := clGray; // clSilver;
//    Pen.Color := clSilver; // 13816530 {clSilver, but lighter};
  end;

  FPage := TUniPanel.Create(Self);
  with FPage do
  begin
    Parent := Self;
    Name := 'FPage';
    Left := FPageBufferWidth;
    Top := FPageBufferWidth;
    Height := cDefH - ((FPageBufferWidth * 2) + 1);
    Width := cDefW - ((FPageBufferWidth * 2) + 1);
    Anchors := [akLeft, akTop, akRight, akBottom];
//    Pen.Color := clHighlight; // clNavy;
//    Pen.Width := 1;
  end;

  FCreating := FALSE;
   
   
end;

destructor TIQWebPreviewWindow.Destroy;
begin
  if Assigned(FPage) then FreeAndNil(FPage);
  if Assigned(FShadow) then FreeAndNil(FShadow);
  inherited Destroy;
end;

procedure TIQWebPreviewWindow.DoPaint;
var
  AHeight, AWidth: Integer;
begin

  if FCreating or (csLoading in Self.ComponentState) or
   (csDestroying in Self.ComponentState) or
   (csFreeNotification in Self.ComponentState) then Exit;

  AHeight := Self.ClientHeight;
  AWidth := Self.ClientWidth;

  if FPageBufferWidth < 1 then FPageBufferWidth := 1;
  if FPageBorderWidth < 1 then FPageBorderWidth := 1;

  with FShadow do
  begin
    Left := FPageBufferWidth + 3;
    Top := FPageBufferWidth + 3;
    Height := AHeight - ((FPageBufferWidth * 2) + 1);
    Width := AWidth - ((FPageBufferWidth * 2) + 1);
    Anchors := [akLeft, akTop, akRight, akBottom];
    SendToBack;
  end;

  with FPage do
  begin
    Left := FPageBufferWidth;
    Top := FPageBufferWidth;
    Height := AHeight - ((FPageBufferWidth * 2) + 1);
    Width := AWidth - ((FPageBufferWidth * 2) + 1);
    Anchors := [akLeft, akTop, akRight, akBottom];
  end;

end;

procedure TIQWebPreviewWindow.SetPageBufferWidth(const Value: Integer);
begin
  // Sets the field width around the page
  if Value < 1 then FPageBufferWidth := 1
  else FPageBufferWidth := Value;
  DoPaint;
end;

function TIQWebPreviewWindow.GetPageBorderWidth: Integer;
begin
   // Returns the width of the area inside the page
   // This is equal to a TPanel BorderWidth property,
   // except that we pad the number
   if FPageBorderWidth < 8 then FPageBorderWidth := 9;
   Result := FPageBorderWidth - 8;
end;

procedure TIQWebPreviewWindow.SetPageBorderWidth(const Value: Integer);
begin
   // Set the width of the area inside the page.
   // We pad the number intentionally
  if Value < 1 then FPageBorderWidth := 9
  else FPageBorderWidth := Value + 8;
//  TUniPanel(Self).BorderWidth := FPageBorderWidth;
  DoPaint;
end;

procedure TIQWebPreviewWindow.RefreshDisplay;
begin
  DoPaint;
  Invalidate;
end;

procedure TIQWebPreviewWindow.WMPaint(var Message: TWMPaint);
begin
  DoPaint;
  inherited;
end;

end.

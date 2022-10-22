unit IQMS.WebVcl.VerticalCaptionBar;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  Menus,
  StdCtrls,
  ExtCtrls,
  uniGUIBaseClasses, uniGUIClasses, UniCanvas,
  uniMainMenu;

type
  { TVerticalCaptionOrientation }
  TVerticalCaptionOrientation = (vcoBottom, vcoCenter, vcoTop);

  { TVerticalCaptionBar }
  TIQWebVerticalCaptionBar = class(TUniControl)
    pbxBackground: TUniCanvas;
  private
    { Private declarations }
    FCaption: string;
    FOrientation: TVerticalCaptionOrientation;
    FOnDblClick: TNotifyEvent;
    FOnClick: TNotifyEvent;
    FPopupMenu: TUniPopupMenu;
    procedure CMFontChanged(var message: TMessage); message CM_FONTCHANGED;
    procedure SetCaption(const Value: string);
    procedure SetOrientation(const Value: TVerticalCaptionOrientation);
    procedure DoPaint(Sender: TObject);
    procedure DoInternalResize(Sender: TUniControl; OldWidth, OldHeight: Integer);
    procedure DoInternalOnClick(Sender: TObject);
    procedure DoInternalOnDblClick(Sender: TObject);
    procedure DoInternalOnMouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
    procedure Loaded;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Update;
  published
    { Published declarations }
    property Align;
    property Caption: string read FCaption write SetCaption;
    property Font;
    property Orientation: TVerticalCaptionOrientation read FOrientation write SetOrientation;
    property PopupMenu: TUniPopupMenu read FPopupMenu write FPopupMenu;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
  end;

implementation

uses
  IQMS.Common.Screen;

{ TVerticalCaptionBar }

constructor TIQWebVerticalCaptionBar.Create(AOwner: TComponent);
const
  cWidth: integer = 30;
  cHeight: integer = 200;
begin
  inherited Create(AOwner);
  ControlStyle := [csCaptureMouse, csClickEvents, csDoubleClicks, csMenuEvents];

  Width := cWidth;
  Height := cHeight;
  Self.Font.Name := IQMS.Common.Screen.SystemFontName;
  Self.Font.Size := 14;
  Self.Font.Style := [fsBold];
  FOrientation := vcoCenter;

  pbxBackground := TUniCanvas.Create(Self);
  with pbxBackground do
    begin
      Parent := Self;
      Left := 0;
      Top := 0;
      Align := alClient;
      OnResize := Self.DoInternalResize;
      OnClick := DoInternalOnClick;
      OnDblClick := DoInternalOnDblClick;
      OnMouseDown:=DoInternalOnMouseDown;
    end;
end;

destructor TIQWebVerticalCaptionBar.Destroy;
begin
  if Assigned(pbxBackground) then
    FreeAndNil(pbxBackground);
  inherited Destroy;
end;

procedure TIQWebVerticalCaptionBar.Loaded;
begin
  inherited;

  Update;
end;

procedure TIQWebVerticalCaptionBar.CMFontChanged(var message: TMessage);
begin
  Update;
end;

procedure TIQWebVerticalCaptionBar.DoInternalOnClick(Sender: TObject);
begin
  if Assigned(FOnClick) then
    FOnClick(Sender);
end;

procedure TIQWebVerticalCaptionBar.DoInternalOnDblClick(Sender: TObject);
begin
  if Assigned(FOnDblClick) then
    FOnDblClick(Sender);
end;

procedure TIQWebVerticalCaptionBar.DoInternalOnMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if Button=mbRight then
 begin
  if Assigned(FPopupMenu) then
    begin
      FPopupMenu.Popup(x,y,Sender);
    end;
 end;

end;

procedure TIQWebVerticalCaptionBar.DoInternalResize(Sender: TUniControl; OldWidth, OldHeight: Integer);
begin
  Update;
end;

procedure TIQWebVerticalCaptionBar.DoPaint(Sender: TObject);
begin
  Update;
end;

procedure TIQWebVerticalCaptionBar.SetCaption(const Value: string);
begin
  FCaption := Value;
  Update;
end;

procedure TIQWebVerticalCaptionBar.SetOrientation(
  const Value: TVerticalCaptionOrientation);
begin
  FOrientation := Value;
  Update;
end;

procedure TIQWebVerticalCaptionBar.Update;
var
  oBitmap: TBitmap;
  ALeft, ATextWidth, ATextHeight: integer;
begin
  if Assigned(pbxBackground) then
    with pbxBackground do
      begin
        Brush.Color := Self.Color;
//        FillRect(ClientRect);
        Font.Orientation := 900;
        Font.Name := Self.Font.Name;
        Font.Size := Self.Font.Size;
        Font.Style := Self.Font.Style;
        Font.Color := Self.Font.Color;
        ATextWidth := IQMS.Common.Screen.GetTextWidthPixels(FCaption, Self.Font);
        ATextHeight := IQMS.Common.Screen.GetTextHeightPixels(FCaption, Self.Font);
        ALeft := (ClientRect.Right div 2) - (ATextHeight div 2) - 1;
//        case FOrientation of
//          vcoBottom:
//            TextRect(ClientRect, ALeft, ClientRect.Bottom - 1, FCaption);
//          vcoCenter:
//            TextRect(ClientRect, ALeft,
//              (ClientRect.Bottom div 2) + (ATextWidth div 2), FCaption);
//          vcoTop:
//            TextRect(ClientRect, ALeft, ClientRect.Top + ATextWidth + 2,
//              FCaption);
//        end;
      end;
end;

end.

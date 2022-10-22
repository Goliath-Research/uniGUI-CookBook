unit IQMS.WebVcl.HotLabel;

interface

uses
  Windows, Messages, SysUtils, Classes, Forms, StdCtrls, ShellAPI, Menus, Clipbrd,
  Vcl.Controls, Graphics,
  uniLabel;

type
  TIQWebHotLabel = class(TUniCustomLabel)

  private
    FOrigFontColor, FActiveColor: TColor;
    Menu: TPopupMenu;
    MenuItem: TMenuItem;
    FColorActive: Boolean;

    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;

    procedure OnMenuClick(Sender: TObject);
    function CheckComponentState: Boolean;

  protected

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;

  published

    property ActiveColor: TColor read FActiveColor write FActiveColor default clPurple;
    property ColorActive: Boolean read FColorActive write FColorActive default FALSE;

    property Align;
    property Alignment;
    property Anchors;
    property AutoSize;
    property BiDiMode;
    property Caption;
    property Constraints;
    property Enabled;
    property Font;
    property ParentBiDiMode;
//    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property TextConversion;
    property ShowHint;
    property Transparent;
    property Visible;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
//    property OnDragDrop;
//    property OnDragOver;
//    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseEnter;
    property OnMouseLeave;
//    property OnStartDrag;


end;

implementation

uses
    IQMS.WebVcl.ResourceStrings;

constructor TIQWebHotLabel.Create( AOwner : TComponent );
begin
   inherited Create(AOwner);

   Cursor := crHandPoint;

   FActiveColor := clPurple;
   Transparent := True;
   StyleElements := StyleElements - [seFont];
   with Font do
   begin
      Color := clHotlight;
      Style := Style - [fsUnderline];
   end;
   
   Menu := TPopupMenu.Create(Self);
   MenuItem := TMenuItem.Create(Menu);
   with MenuItem do
   begin
      Caption := IQMS.WebVcl.ResourceStrings.cTXT0000340; // 'Copy'
      OnClick := OnMenuClick;
   end;
   Menu.Items.Add(MenuItem);
   PopupMenu := Menu;
end;

destructor TIQWebHotLabel.Destroy;
begin
   Menu.Free;
   inherited;
end;

{---------------------------------------------------------------------------}

{procedure TIQWebHotLabel.Click;
begin
   if Trim(Caption) <> '' then
      ShellExecute(GetDesktopWindow(), 'open', PChar(Caption), nil, nil, SW_SHOWNORMAL);
end;}

procedure TIQWebHotLabel.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if (Button = mbLeft) and FColorActive then
      begin
        FOrigFontColor := Font.Color;
        Font.Color := FActiveColor;
      end;

   inherited;
   
end;

procedure TIQWebHotLabel.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if (Button = mbLeft) and FColorActive then
      Font.Color := FOrigFontColor;

   inherited;
end;

procedure TIQWebHotLabel.OnMenuClick;
begin
   Clipboard.AsText := Caption;
end;

procedure TIQWebHotLabel.CMMouseEnter(var Message: TMessage);
begin
  if not CheckComponentState then Exit;
  Font.Style := Font.Style + [fsUnderLine];
end;

procedure TIQWebHotLabel.CMMouseLeave(var Message: TMessage);
begin
  if not CheckComponentState then Exit;
  Font.Style := Font.Style - [fsUnderLine];
end;

function TIQWebHotLabel.CheckComponentState: Boolean;
begin
  // Returns FALSE if the component should not continue processing
  Result := not ((csLoading in ComponentState) or
                 (csDestroying in ComponentState) or
                 (csFixups in ComponentState) or
                 (csDesigning in ComponentState));
end;

end.

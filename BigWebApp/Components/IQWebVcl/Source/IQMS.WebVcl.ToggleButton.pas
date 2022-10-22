unit IQMS.WebVcl.ToggleButton;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, uniGUIBaseClasses,
  uniGUIClasses, uniButton,uniGUITypes,Graphics,Windows;

type
  { TToggleButtonStyle }
  TToggleButtonStyle = (tbsDefault, tbsBlue, tbsGreen, tbsGreenAndRed);

type
  TIQWebToggleButton = class(TUniButton)
  private const
    // Blue
    c_color_blue_dark: TColor = 5188111; // 6698255
    c_color_blue_light: TColor = 15640439; // 12618815
    c_color_blue_text: TColor = clWhite;
    // Gray
    c_color_gray_dark: TColor = clGray;
    c_color_gray_light: TColor = clSilver; // 15724527;
    c_color_gray_text: TColor = clBlack; // clGrayText;
    // Green
    c_color_green_dark: TColor = 356408;
    c_color_green_light: TColor = 52823;
    c_color_green_text: TColor = clWhite;
    // Red
    c_color_red_dark: TColor = 6541;
    c_color_red_light: TColor = 6784753;
    c_color_red_text: TColor = clWhite;
  private
    FOnButtonClick: TNotifyEvent;
    FChecked: Boolean;
    FStyle: TToggleButtonStyle;
    FTextOn: string;
    FTextOff: string;
    procedure SetChecked(const Value: Boolean);
    procedure SetTextOff(const Value: string);
    procedure SetTextOn(const Value: string);
    procedure SetStyle(const Value: TToggleButtonStyle);
    { Private declarations }
  protected
    procedure LoadCompleted; override;
    procedure RenderCompleted; override;
    procedure JSEventHandler(AEventName: string; AParams: TUniStrings); override;
    procedure Click; override;
    procedure SetStyleCss;
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { Public declarations }
  published
    property OnClick: TNotifyEvent read FOnButtonClick write FOnButtonClick;
    property Checked: Boolean read FChecked write SetChecked;
    property Style: TToggleButtonStyle read FStyle write SetStyle;
    property TextOn: string read FTextOn write SetTextOn;
    property TextOff: string read FTextOff write SetTextOff;


    { Inherited Properties }
    property Action;
    property Align;
    property Anchors;
    property Constraints;
    property Cursor;
    property Enabled;
    property Font;
    property Height;
    property Hint;
    property HelpContext;
    property Left;
    property ParentFont;
    property ParentShowHint;
    property ShowHint;
    property Top;
    property Visible;
    property Width;

    { Inherited Methods }
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('UniGui special', [TIQWebToggleButton]);
end;

{ TIQWebToggleButton }

function TColorToHex( Color : TColor ): string;
begin
  Result :=
    { red value }
    IntToHex( GetRValue( Color ), 2 ) +
    { green value }
    IntToHex( GetGValue( Color ), 2 ) +
    { blue value }
    IntToHex( GetBValue( Color ), 2 );
end;

procedure TIQWebToggleButton.Click;
begin
  inherited;
  if Enabled then
    begin
      SetChecked(not FChecked);
      SetFocus;
      if Assigned(FOnButtonClick) then
        FOnButtonClick(Self);
    end;
end;

constructor TIQWebToggleButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  ControlStyle := [csCaptureMouse, csClickEvents, csDoubleClicks];

  // Touchscreen size
  Width := 65;
  Height := 40;
  FStyle := tbsDefault;
  // TODO:  Add to resource strings
  FTextOn := 'On';
  FTextOff := 'Off';
//  Font.Name := iqscreen.SystemFontName;
  Font.Style := [fsBold];
  Font.Size := 10;
  FChecked:=False;
  Text:=FTextOff;
end;

destructor TIQWebToggleButton.Destroy;
begin
  inherited Destroy;
end;

procedure TIQWebToggleButton.JSEventHandler(AEventName: string;
  AParams: TUniStrings);
begin
  inherited;
  if AEventName = 'toggleHandler' then
  begin
    FChecked := AParams['state'].AsBoolean;
      if Assigned(FOnButtonClick) then
        FOnButtonClick(Self);

    if FChecked then
     Caption := FTextOn
    else
     Caption := FTextOff;

   SetStyleCss;
  end;
end;

procedure TIQWebToggleButton.LoadCompleted;
begin
  inherited;
  JSConfig('enableToggle',[True]);
  JSConfig('toggleHandler', [JSFunction('button ,state', 'ajaxRequest('+JSName+',"toggleHandler",{"state": state})')]);
  if FChecked then
    JSConfig('pressed',[True]);
end;

procedure TIQWebToggleButton.RenderCompleted;
begin
  inherited;
  SetStyleCss;
end;

procedure TIQWebToggleButton.SetChecked(const Value: Boolean);
begin
 if FChecked<>Value then
   begin
    FChecked := Value;
    if not IsLoading then
      JSCall('toggle',[Value, True]);

    if FChecked then
     Caption := FTextOn
    else
     Caption := FTextOff;
   end;

   SetStyleCss;
end;

procedure TIQWebToggleButton.SetStyle(const Value: TToggleButtonStyle);
begin
  FStyle := Value;
end;

procedure TIQWebToggleButton.SetStyleCss;
begin
   if not IsLoading then
     begin
       if FChecked then
        begin
          case Style of
               tbsDefault, tbsBlue:
              begin
                JSAssign('getEl().dom.style.background', ['linear-gradient(#'+TColorToHex(c_color_blue_dark)+', #'+TColorToHex(c_color_blue_light)+')']);
              end;
            tbsGreen, tbsGreenAndRed:
              begin
                JSAssign('getEl().dom.style.background', ['linear-gradient(#'+TColorToHex(c_color_green_dark)+', #'+TColorToHex(c_color_green_light)+')']);
              end;
          end;
        end
       else
        begin
          case Style of
               tbsDefault, tbsBlue, tbsGreen:
              begin
                JSAssign('getEl().dom.style.background', ['linear-gradient(#'+TColorToHex(c_color_gray_light)+', #'+TColorToHex(c_color_gray_dark)+')']);
              end;
            tbsGreenAndRed:
              begin
                JSAssign('getEl().dom.style.background', ['linear-gradient(#'+TColorToHex(c_color_red_light)+', #'+TColorToHex(c_color_red_dark)+')']);
              end;
          end;
        end;
     end;
end;

procedure TIQWebToggleButton.SetTextOff(const Value: string);
begin
  FTextOff := Value;
end;

procedure TIQWebToggleButton.SetTextOn(const Value: string);
begin
  FTextOn := Value;
end;

end.


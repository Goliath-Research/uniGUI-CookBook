unit IQMS.WebVcl.MessageBar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Menus, StdCtrls, ExtCtrls, Buttons, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm;

type
  { TMessageBarStyle }
  TMessageBarStyle = (awsDefault, awsWhite, awsRed, awsOrange, awsYellow,
    awsGreen, awsBlue, awsPurple);

  { TIQWebMessageBar }
  TIQWebMessageBar = class(TUniFormControl)
    FlashTimer: TTimer;
    pbxBackground: TPaintbox;
    lblCaptionText: TLabel;
    imgPicture: TImage;
    sbtnCloseButton: TSpeedButton;
    procedure DoInternalResize(Sender: TObject);
    procedure DoInternalImageChange(Sender: TObject);
    procedure DoInternalOnClick(Sender: TObject);
    procedure DoInternalOnDblClick(Sender: TObject);
    procedure DoCloseButtonClick(Sender: TObject);
    procedure DoOnTimer(Sender: TObject);
    private
      { Private declarations }
      FStyle: TMessageBarStyle;
      FFlat: Boolean;
      FFlashing: Boolean;
      FFlashBinary: Byte;
      FFlashCount: Integer;
      FFlashesCounted: Integer;
      FOnDblClick: TNotifyEvent;
      FOnClick: TNotifyEvent;
      FAutoSize: Boolean;
      FCloseBtnVisible: Boolean;
      FHint: string;
      FShowHint: Boolean;
      function GetCaption: string;
      procedure SetCaption(const Value: string);
      procedure DoPaint(Sender: TObject);
      procedure DoBackgroundPaint;
      procedure DrawFrame(const ABorderDark, ABorderLight: TColor);
      function GetPicture: TPicture;
      procedure SetControlPositions;
      procedure SetStyle(const Value: TMessageBarStyle);
      procedure DrawWhite;
      procedure DrawRed;
      procedure DrawOrange;
      procedure DrawYellow;
      procedure DrawGreen;
      procedure DrawBlue;
      procedure DrawPurple;
      function GetFont: TFont;
      procedure SetFlat(const Value: Boolean);
      procedure SetFlashing(const Value: Boolean);
      procedure DrawAsColor(AGradientLight, AGradientDark, ABorderLight,
        ABorderDark: TColor);
      procedure SetPopupMenu(const Value: TPopupMenu);
      procedure SetAutoSize(const Value: Boolean);
      procedure SetCloseBtnVisible(const Value: Boolean);
      procedure SetPicture(const Value: TPicture);
      procedure SetFont(const Value: TFont);
      procedure SetHint(const Value: string);
      procedure SetShowHint(const Value: Boolean);
      function GetPopupMenu: TPopupMenu;
    protected
      { Private methods }
      procedure Loaded; override;
    public
      { Public declarations }
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure Flash; overload;
      procedure Flash(const ACount: Integer); overload;
      procedure StopFlashing;
    published
      { Published declarations }
      property Align;
      property Anchors;
      property AutoSize: Boolean read FAutoSize write SetAutoSize;
      property Caption: string read GetCaption write SetCaption;
      property CloseBtnVisible: Boolean read FCloseBtnVisible
        write SetCloseBtnVisible;
      property Picture: TPicture read GetPicture write SetPicture;
      property Style: TMessageBarStyle read FStyle write SetStyle;
      property Font: TFont read GetFont write SetFont;
      property Flat: Boolean read FFlat write SetFlat;
      property Flashing: Boolean read FFlashing write SetFlashing;
      property FlashCount: Integer read FFlashCount write FFlashCount;
      property Hint: string read FHint write SetHint;
      property ShowHint: Boolean read FShowHint write SetShowHint;
      property Visible;
      property PopupMenu: TPopupMenu read GetPopupMenu write SetPopupMenu;
      property OnClick: TNotifyEvent read FOnClick write FOnClick;
      property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;

  end;

implementation

uses
//  iqgraphics,
//  iqscreen,
  Math;

{ TIQWebMessageBar }

constructor TIQWebMessageBar.Create(AOwner: TComponent);
const
  cHeight = 21;
  cWidth = 372;
var
  AParent: TIQWebMessageBar;
begin
  inherited Create(AOwner);

  ControlStyle := [csCaptureMouse, csClickEvents, csDoubleClicks, csOpaque,
    csReplicatable, csDesignInteractive];
  FAutoSize := False;
  FFlashBinary := 0;
  FFlashCount := 10;
  FFlashesCounted := 0;
  FStyle := TMessageBarStyle(0);
  FFlat := False;
  FCloseBtnVisible := False;
  AParent := Self;

  // Panel related
  Align := alTop;
  Width := cWidth;
  Height := cHeight; // allows for a clean 2 lines
  ParentColor := True;
  ParentBackground := False; // essential for XP rendering

//  pbxBackground := TPaintbox.Create(Self);
//  with pbxBackground do
//    begin
//      Parent := AParent;
//      Left := 0;
//      Top := 0;
//      Align := alClient;
//      OnPaint := Self.DoPaint;
//      OnResize := Self.DoInternalResize;
//      OnClick := DoInternalOnClick;
//      OnDblClick := DoInternalOnDblClick;
//    end;
//
//  lblCaptionText := TLabel.Create(Self);
//  with lblCaptionText do
//    begin
//      Parent := AParent;
//      Height := 13;
//      AutoSize := True;
//      Anchors := [akLeft, akTop, akRight, akBottom];
//      Left := 24;
//      Top := 3;
//      Width := cWidth - 40;
//      Caption := '';
//      // Layout := tlCenter;
//      Font.Name := iqscreen.SystemFontName;
//      Transparent := True;
//      WordWrap := True;
//      OnClick := DoInternalOnClick;
//      OnDblClick := DoInternalOnDblClick;
//    end;
//
//  imgPicture := TImage.Create(Self);
//  with imgPicture do
//    begin
//      Parent := AParent;
//      Left := 3;
//      Top := 3;
//      Width := 16;
//      Height := 16;
//      AutoSize := True;
//      Anchors := [akTop, akRight];
//      Picture.Bitmap := nil;
//      Transparent := True;
//      Picture.OnChange := DoInternalImageChange;
//    end;
//
//  sbtnCloseButton := TSpeedButton.Create(Self);
//  with sbtnCloseButton do
//    begin
//      Parent := AParent;
//      Left := cWidth - 18;
//      Top := 3;
//      Width := 16;
//      Height := 16;
//      Anchors := [akTop, akRight];
//      Flat := True;
//      Tag := 1999;
//      Font.Charset := SYMBOL_CHARSET;
//      Font.Color := clWindowText;
//      Font.Name := 'Symbol';
//      Font.Style := [];
//      Layout := blGlyphBottom;
//      ParentFont := False;
//      Caption := #180;
//      Hint := 'Close';
//      ShowHint := True;
//      OnClick := DoCloseButtonClick;
//      Visible := False;
//    end;
//
//  FlashTimer := TTimer.Create(Self);
//  with FlashTimer do
//    begin
//      Enabled := False;
//      Interval := 500;
//      OnTimer := DoOnTimer;
//    end;

end;

destructor TIQWebMessageBar.Destroy;
begin
  if Assigned(pbxBackground) then
    FreeAndNil(pbxBackground);
  if Assigned(lblCaptionText) then
    FreeAndNil(lblCaptionText);
  if Assigned(imgPicture) then
    FreeAndNil(imgPicture);
  if Assigned(sbtnCloseButton) then
    FreeAndNil(sbtnCloseButton);
  if Assigned(FlashTimer) then
    FreeAndNil(FlashTimer);

  inherited Destroy;
end;

procedure TIQWebMessageBar.Loaded;
begin
  inherited;
  SetControlPositions;
end;

procedure TIQWebMessageBar.DoInternalResize(Sender: TObject);
begin
  SetControlPositions;
end;

procedure TIQWebMessageBar.DoInternalImageChange(Sender: TObject);
begin
  imgPicture.Picture.Bitmap.Transparent := True;
  imgPicture.Invalidate;
  SetControlPositions;
end;

procedure TIQWebMessageBar.DoInternalOnClick(Sender: TObject);
begin
  if not (csDesigning in ComponentState) and
    not (csDestroying in ComponentState) and not (csLoading in ComponentState) and
    Assigned(FOnClick) then
    begin
      StopFlashing;
      FOnClick(Sender);
    end;
end;

procedure TIQWebMessageBar.DoInternalOnDblClick(Sender: TObject);
begin
  if not (csDesigning in ComponentState) and
    not (csDestroying in ComponentState) and not (csLoading in ComponentState) and
    Assigned(FOnDblClick) then
    FOnDblClick(Sender);
end;

function TIQWebMessageBar.GetCaption: string;
begin
  Result := lblCaptionText.Caption;
end;

procedure TIQWebMessageBar.SetCaption(const Value: string);
begin
  lblCaptionText.Caption := Value;
  SetControlPositions;
end;

function TIQWebMessageBar.GetFont: TFont;
begin
  Result := lblCaptionText.Font;
end;

procedure TIQWebMessageBar.SetFont(const Value: TFont);
begin
  lblCaptionText.Font.Assign(Value);
end;

procedure TIQWebMessageBar.SetHint(const Value: string);
begin
  FHint := Value;
  lblCaptionText.Hint := Value;
end;

procedure TIQWebMessageBar.SetAutoSize(const Value: Boolean);
begin
  FAutoSize := Value;
  SetControlPositions;
  Invalidate;
end;

procedure TIQWebMessageBar.SetCloseBtnVisible(const Value: Boolean);
begin
  FCloseBtnVisible := Value;
  SetControlPositions;
end;

function TIQWebMessageBar.GetPicture: TPicture;
begin
  Result := imgPicture.Picture;
end;

procedure TIQWebMessageBar.SetPicture(const Value: TPicture);
begin
  imgPicture.Picture.Assign(Value);
  imgPicture.Visible := Assigned(imgPicture.Picture.Bitmap) and
    (imgPicture.Picture.Width > 0);
  Invalidate;
end;

procedure TIQWebMessageBar.SetShowHint(const Value: Boolean);
begin
  FShowHint := Value;
  lblCaptionText.ShowHint := Value;
end;

procedure TIQWebMessageBar.SetStyle(const Value: TMessageBarStyle);
begin
  FStyle := Value;
  Invalidate;
end;

procedure TIQWebMessageBar.StopFlashing;
begin
  if not (csDesigning in ComponentState) and
    not (csDestroying in ComponentState) and not (csLoading in ComponentState)
    and FFlashing or FlashTimer.Enabled then
    begin
      Flashing := False;
      FlashTimer.Enabled := False;
      FFlashCount := 0;
      Invalidate;
    end;
end;

procedure TIQWebMessageBar.SetControlPositions;
const
  cBuffer: Integer = 5;
var
  ATextHeight, AImageHeight, AHeight: Integer;
begin
  if not Assigned(lblCaptionText) or not Assigned(imgPicture) then
    Exit;
  ATextHeight := 13;
//  if lblCaptionText.Caption > '' then
//    ATextHeight := iqscreen.GetTextHeightPixels(lblCaptionText.Font,
//      lblCaptionText.Caption, TForm(Self.Owner));
  ATextHeight := Max(ATextHeight, 13);
  AImageHeight := imgPicture.Picture.Height;
  AHeight := Max(AImageHeight, ATextHeight);

  imgPicture.Top := cBuffer;
  imgPicture.Visible := Assigned(imgPicture.Picture.Bitmap) and
    (imgPicture.Picture.Width > 0);

  if imgPicture.Visible then
    begin
      imgPicture.Left := cBuffer;
      lblCaptionText.Left := imgPicture.Left + imgPicture.Width + cBuffer + 2;
    end
  else
    begin
      imgPicture.Left := - 500;
      lblCaptionText.Left := cBuffer + 2;
    end;
  lblCaptionText.Top := cBuffer;

  if FAutoSize then
    begin
      lblCaptionText.AutoSize := True;
      lblCaptionText.Caption := lblCaptionText.Caption;
      lblCaptionText.AutoSize := True;
      lblCaptionText.Height := lblCaptionText.Height + 1;
      lblCaptionText.AutoSize := True;
      lblCaptionText.Update;
      lblCaptionText.AutoSize := False;
      Self.Height := Max(AHeight, lblCaptionText.Height) + (cBuffer * 2);
    end
  else
    Self.Height := AHeight + (cBuffer * 2);

  sbtnCloseButton.Visible := FCloseBtnVisible;

  if sbtnCloseButton.Visible then
    begin
      sbtnCloseButton.Caption := #180;
      lblCaptionText.Width := Self.ClientWidth - lblCaptionText.Left -
        sbtnCloseButton.Width - cBuffer - 4;
    end
  else
    begin
      sbtnCloseButton.Caption := '';
      lblCaptionText.Width := Self.ClientWidth - lblCaptionText.Left -
        cBuffer - 2;
    end;
  lblCaptionText.Height := Self.ClientHeight - lblCaptionText.Top - cBuffer;

  sbtnCloseButton.Top := 2;
  sbtnCloseButton.Left := Self.ClientWidth - sbtnCloseButton.Width - 3;

end;

procedure TIQWebMessageBar.SetFlashing(const Value: Boolean);
begin
  FFlashesCounted := 0;
  FFlashing := Value;
  if not (csDesigning in ComponentState) then
    FlashTimer.Enabled := FFlashing;
end;

procedure TIQWebMessageBar.SetFlat(const Value: Boolean);
begin
  FFlat := Value;
  Invalidate;
end;

function TIQWebMessageBar.GetPopupMenu: TPopupMenu;
begin
  Result := lblCaptionText.PopupMenu;
end;

procedure TIQWebMessageBar.SetPopupMenu(const Value: TPopupMenu);
begin
  lblCaptionText.PopupMenu := Value;
end;

procedure TIQWebMessageBar.DoPaint(Sender: TObject);
begin
  DoBackgroundPaint;
end;

procedure TIQWebMessageBar.DoBackgroundPaint;
begin
  case FStyle of
    awsDefault:
      DrawOrange;
    awsWhite:
      DrawWhite;
    awsRed:
      DrawRed;
    awsOrange:
      DrawOrange;
    awsYellow:
      DrawYellow;
    awsGreen:
      DrawGreen;
    awsBlue:
      DrawBlue;
    awsPurple:
      DrawPurple;
  end;
end;

procedure TIQWebMessageBar.DoCloseButtonClick(Sender: TObject);
begin
  if not (csDesigning in ComponentState) and
    not (csDestroying in ComponentState) and not (csLoading in ComponentState)
    and Showing then
    begin
      StopFlashing;
      Self.Visible := False;
    end;
end;

procedure TIQWebMessageBar.DrawWhite;
const
  clWhiteGradientDark: TColor = 16316664;
begin
  DrawAsColor(clWhite, clWhiteGradientDark, clWhite, clGray);
end;

procedure TIQWebMessageBar.DrawRed;
const
  clRedGradientLight: TColor = 9934847;
  clRedGradientDark: TColor = 2631935;
  clRedBorderLight: TColor = 14803455;
  clRedBorderDark: TColor = 111;
begin
  DrawAsColor(clRedGradientLight, clRedGradientDark, clRedBorderLight,
    clRedBorderDark);
end;

procedure TIQWebMessageBar.DrawOrange;
const
  clOrangeGradientLight: TColor = 9358847;
  clOrangeGradientDark: TColor = 1414911;
  clOrangeBorderLight: TColor = 12312831;
  clOrangeBorderDark: TColor = 32486;
begin
  DrawAsColor(clOrangeGradientLight, clOrangeGradientDark, clOrangeBorderLight,
    clOrangeBorderDark);
end;

procedure TIQWebMessageBar.DrawYellow;
const
  clYellowGradientLight: TColor = 15400959; // 14286847; // 13697023;
  clYellowGradientDark: TColor = 7471103; // 4915199; // clYellow; //7395583;
  clYellowBorderLight: TColor = 15069170; // 15925247; // 16515071; // 15400959;
  clYellowBorderDark: TColor = 10864595; // 3166304;
  // clYellowGradientLight: TColor = 13697023;
  // clYellowGradientDark: TColor = 7395583;
  // clYellowBorderLight: TColor = 15400959;
  // clYellowBorderDark: TColor = 3166304;
begin
  DrawAsColor(clYellowGradientLight, clYellowGradientDark, clYellowBorderLight,
    clYellowBorderDark);
end;

procedure TIQWebMessageBar.DrawGreen;
const
  clGreenGradientLight: TColor = 9830293;
  clGreenGradientDark: TColor = 57088;
  clGreenBorderLight: TColor = 15138790;
  clGreenBorderDark: TColor = 21760;
begin
  DrawAsColor(clGreenGradientLight, clGreenGradientDark, clGreenBorderLight,
    clGreenBorderDark);
end;

procedure TIQWebMessageBar.DrawBlue;
const
  clBlueGradientLight: TColor = 16772317;
  clBlueGradientDark: TColor = 16760721;
  clBlueBorderLight: TColor = 16116448;
  clBlueBorderDark: TColor = 13075796;
begin
  DrawAsColor(clBlueGradientLight, clBlueGradientDark, clBlueBorderLight,
    clBlueBorderDark);
end;

procedure TIQWebMessageBar.DrawPurple;
const
  clPurpleGradientLight: TColor = 16762594;
  clPurpleGradientDark: TColor = 16722837;
  clPurpleBorderLight: TColor = 16771828;
  clPurpleBorderDark: TColor = 16711808;
begin
  DrawAsColor(clPurpleGradientLight, clPurpleGradientDark, clPurpleBorderLight,
    clPurpleBorderDark);
end;

procedure TIQWebMessageBar.DrawAsColor(AGradientLight, AGradientDark,
  ABorderLight, ABorderDark: TColor);
var
  ALightnessLevel: Byte;
begin
  // Get the lightness level for flashing a gradient
  case FStyle of
    awsDefault, awsOrange, awsPurple:
      ALightnessLevel := 40;
    awsBlue:
      ALightnessLevel := 20;
  else
    ALightnessLevel := 250;
  end;

  if not Flat then
    begin
//      if not (csDesigning in ComponentState) and
//        FFlashing and (FFlashBinary = 1) then
//        begin
//          AGradientLight := iqgraphics.LightenColor(AGradientLight,
//            ALightnessLevel);
//          AGradientDark := iqgraphics.LightenColor(AGradientDark,
//            ALightnessLevel);
//        end;
//
//      Self.Color := AGradientLight;
//
//      iqgraphics.DrawGradient(pbxBackground.Canvas, ClientRect,
//        [AGradientLight, AGradientDark]);
    end
  else
    begin
      Self.Color := AGradientLight;
      if not (csDesigning in ComponentState) and FFlashing and
        (FFlashBinary = 1) then
        begin
          pbxBackground.Canvas.Brush.Color := AGradientDark;
          pbxBackground.Canvas.FillRect(pbxBackground.ClientRect);
        end
      else
        begin
          pbxBackground.Canvas.Brush.Color := Self.Color;
          pbxBackground.Canvas.FillRect(pbxBackground.ClientRect);
        end
    end;

  DrawFrame(ABorderLight, ABorderDark);

end;

procedure TIQWebMessageBar.DrawFrame(const ABorderDark, ABorderLight: TColor);
const
  clBuffer: Integer = - 1;
var
  ARect: TRect;
begin
  with pbxBackground do
    begin
      ARect := ClientRect;
      Canvas.Pen.Color := ABorderDark;
      Canvas.Brush.Style := bsClear;
      Canvas.Rectangle(ARect);

      InflateRect(ARect, clBuffer, clBuffer);
      Canvas.Pen.Color := ABorderLight;
      Canvas.Brush.Style := bsClear;
      Canvas.Rectangle(ARect);
    end;
end;

procedure TIQWebMessageBar.DoOnTimer(Sender: TObject);
begin
  if not (csDesigning in ComponentState) and
    not (csDestroying in ComponentState) and not (csLoading in ComponentState) and
    Showing then
    begin
      Invalidate;

      if (FFlashCount > 0) and (FFlashesCounted >= FFlashCount) then
        begin
          FFlashing := False;
          FFlashesCounted := 0;
          FFlashBinary := 0;
        end
      else
        begin
          if FFlashBinary = 0 then
            begin
              FFlashBinary := 1;
              Inc(FFlashesCounted);
            end
          else
            FFlashBinary := 0;
        end;
      FlashTimer.Enabled := FFlashing;
    end;
end;

procedure TIQWebMessageBar.Flash(const ACount: Integer);
begin
  if not (csDesigning in ComponentState) and
    not (csDestroying in ComponentState) and not (csLoading in ComponentState)
    and not FFlashing or not FlashTimer.Enabled then
    begin
      FFlashCount := ACount;
      Flash;
    end;
end;

procedure TIQWebMessageBar.Flash;
begin
  if not (csDesigning in ComponentState) and
    not (csDestroying in ComponentState) and not (csLoading in ComponentState)
    and not FFlashing or not FlashTimer.Enabled then
    Flashing := True;
end;

end.

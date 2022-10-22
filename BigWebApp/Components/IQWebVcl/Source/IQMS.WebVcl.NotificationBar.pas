unit IQMS.WebVcl.NotificationBar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Menus, StdCtrls, ExtCtrls, Buttons,UniGUIFont,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniCommonClasses;

type
  { Forwards }
  TIQWebNotificationControl = class;

  { TIQWebNotificationBar }
  TIQWebNotificationBar = class(TComponent)
  private
    FNotification: TIQWebNotificationControl;
    FPopupMenu: TPopupMenu;
    FHint: string;
    FCloseBtnVisible: Boolean;
    FMessageText: string;
    FOnDblClick: TNotifyEvent;
    FShowHint: Boolean;
    FOnClick: TNotifyEvent;
    FParentControl: TWinControl;
    FPicture: TPicture;
    FFadeLabel: Boolean;
    function GetFont: TFont;
    function GetPicture: TPicture;
    procedure SetFont(const Value: TFont);
    procedure SetPicture(const Value: TPicture);
    procedure SetMessageText(const Value: string);
    function GetShowing: Boolean;
    procedure SetFadeLabel(const Value: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Execute;
    procedure Hide;
    property Showing: Boolean read GetShowing;
  published
    property ParentControl: TWinControl read FParentControl
      write FParentControl;
    property MessageText: string read FMessageText write SetMessageText;
    property CloseBtnVisible: Boolean read FCloseBtnVisible
      write FCloseBtnVisible;
    property Picture: TPicture read FPicture write SetPicture;
    property Font: TFont read GetFont write SetFont;
    property FadeLabel: Boolean read FFadeLabel write SetFadeLabel default True;
    property PopupMenu: TPopupMenu read FPopupMenu write FPopupMenu;
    // property OnClick: TNotifyEvent read FOnClick write FOnClick;
    // property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
  end;

  { TIQWebNotificationControl }
  TIQWebNotificationControl = class(TUniFormControl)
    pbxBackground: TPaintbox;
    lblMessageText: TLabel;
    imgPicture: TImage;
    sbtnCloseButton: TSpeedButton;
    procedure DoBackgroundPaint;
    procedure SetControlPositions;
    procedure DoPaint(Sender: TObject);
    procedure DoInternalResize(Sender: TObject);
    procedure DoInternalImageChange(Sender: TObject);
    procedure DoInternalOnClick(Sender: TObject);
    procedure DoInternalOnDblClick(Sender: TObject);
    procedure DoCloseButtonClick(Sender: TObject);
  private
    { Private declarations }
    FOnDblClick: TNotifyEvent;
    FOnClick: TNotifyEvent;
    FCloseBtnVisible: Boolean;
    FHint: string;
    FShowHint: Boolean;
    FExecuting: Boolean;
    FShowing: Boolean;
    FDisableUpdates: Boolean;
    FFadeLabel: Boolean;
    function GetMessageText: string;
    function GetFont: TFont;
    function GetPicture: TPicture;
    function GetPopupMenu: TPopupMenu;
    procedure SetMessageText(const Value: string);
    procedure SetCloseBtnVisible(const Value: Boolean);
    procedure SetFont(const Value: TFont);
    procedure SetPicture(const Value: TPicture);
    procedure SetPopupMenu(const Value: TPopupMenu);
    procedure SetFinalPosition;
    procedure SetStartPosition;
    procedure SetLabelSizeAndPosition(var ARect: TRect);
    procedure FadeLabelIn;
  protected
    { Private methods }
    procedure Loaded; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Execute;
    procedure Hide;
    procedure BeginUpdate;
    procedure EndUpdate;
    property Showing: Boolean read FShowing;
  published
    { Published declarations }
    property Align;
    property Anchors;
    property MessageText: string read GetMessageText write SetMessageText;
    property CloseBtnVisible: Boolean read FCloseBtnVisible
      write SetCloseBtnVisible;
    property Picture: TPicture read GetPicture write SetPicture;
    property Font: TFont read GetFont write SetFont;
    property FadeLabel: Boolean read FFadeLabel write FFadeLabel default True;
    property Visible;
    property PopupMenu: TPopupMenu read GetPopupMenu write SetPopupMenu;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
  end;

implementation

uses
  IQMS.Common.Controls,
//  iqgraphics,
//  iqnumber,
//  iqscreen,
  Math;

{$REGION 'TIQWebNotificationBar'}


const
  // Sizing
  cTopBarHeight: Integer = 8;
  cMargin: Integer = 5;
  // Colors
  clYellowGradientLight: TColor = 15400959;
  clYellowGradientDark: TColor = 7471103;
  clYellowBorderLight: TColor = 15069170;
  clYellowBorderDark: TColor = 10864595;

  clOrangeGradientLight: TColor = 9358847;
  clOrangeGradientDark: TColor = 1414911;
  clOrangeBorderLight: TColor = 12312831;
  clOrangeBorderDark: TColor = 32486;

  { TIQWebNotificationBar }

constructor TIQWebNotificationBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFadeLabel := True;
  FNotification := TIQWebNotificationControl.Create(Self);
  FPicture := TPicture.Create;
end;

destructor TIQWebNotificationBar.Destroy;
begin
  if Assigned(FPicture) then
    FPicture.Free;
  inherited Destroy;
end;

procedure TIQWebNotificationBar.Execute;
begin
  if not(csDesigning in ComponentState) and
    not(csDestroying in ComponentState) and not(csLoading in ComponentState) and
    Assigned(FNotification) and Assigned(FParentControl) then
  begin
    FNotification.BeginUpdate;
    FNotification.Parent := Self.FParentControl;
    FNotification.FadeLabel := Self.FadeLabel;
    FNotification.MessageText := Self.FMessageText;
    FNotification.CloseBtnVisible := Self.FCloseBtnVisible;
    FNotification.Hint := Self.FHint;
    FNotification.Picture := Self.Picture;
    FNotification.ShowHint := Self.FShowHint;
    FNotification.PopupMenu := Self.FPopupMenu;
    FNotification.OnClick := Self.FOnClick;
    FNotification.OnDblClick := Self.FOnDblClick;
    FNotification.EndUpdate;
    FNotification.Execute;
  end;
end;

procedure TIQWebNotificationBar.Hide;
begin
  if not(csDesigning in ComponentState) and
    not(csDestroying in ComponentState) and not(csLoading in ComponentState) and
    Assigned(FNotification) and Assigned(FParentControl) then
    FNotification.Hide;
end;

function TIQWebNotificationBar.GetFont: TFont;
begin
  if Assigned(FNotification) then
    Result := FNotification.Font;
end;

procedure TIQWebNotificationBar.SetMessageText(const Value: string);
begin
  FMessageText := Value;
  FNotification.MessageText := Value;
end;

procedure TIQWebNotificationBar.SetFadeLabel(const Value: Boolean);
begin
  FFadeLabel := Value;
end;

procedure TIQWebNotificationBar.SetFont(const Value: TFont);
begin
  if Assigned(FNotification) then
    FNotification.Font := Value;
end;

function TIQWebNotificationBar.GetPicture: TPicture;
begin
  if Assigned(FPicture) then
    Result := FPicture;
end;

function TIQWebNotificationBar.GetShowing: Boolean;
begin
  Result := Assigned(FNotification) and FNotification.Showing;
end;

procedure TIQWebNotificationBar.SetPicture(const Value: TPicture);
begin
  if Assigned(FPicture) then
  begin
    FPicture.Bitmap.Assign(Value.Bitmap);
  end;
end;

{$ENDREGION 'TIQWebNotificationBar'}

{$REGION 'TIQWebNotificationControl'}

{ TIQWebNotificationControl }

constructor TIQWebNotificationControl.Create(AOwner: TComponent);
const
  cHeight = 80;
  cWidth = 372;
var
  AParent: TIQWebNotificationControl;
begin
  FExecuting := False;
  FDisableUpdates := False;
  FFadeLabel := True;

  inherited Create(AOwner);

  ControlStyle := [csCaptureMouse, {csClickEvents, csDoubleClicks,} csOpaque,
    csReplicatable, csDesignInteractive];

  FCloseBtnVisible := False;
  AParent := Self;

  // Panel related
  Align := alNone;
  Width := cWidth;
  Height := cHeight; // allows for a clean 2 lines
  ParentColor := True;
  ParentBackground := False; // essential for XP rendering

  if not(csDesigning in ComponentState) then
    Self.Visible := False;

  pbxBackground := TPaintbox.Create(Self);
//  with pbxBackground do
//  begin
//    Parent := AParent;
//    Left := 0;
//    Top := 0;
//    Align := alClient;
//    OnPaint := Self.DoPaint;
//    OnResize := Self.DoInternalResize;
//    OnClick := DoInternalOnClick;
//    OnDblClick := DoInternalOnDblClick;
//  end;
//
  lblMessageText := TLabel.Create(Self);
//  with lblMessageText do
//  begin
//    Parent := AParent;
//    Height := 13;
//    AutoSize := False;
//    Anchors := [akLeft, akTop, akRight, akBottom];
//    Left := 24;
//    Top := 3;
//    Width := cWidth - 40;
//    Caption := '';
//    // Layout := tlCenter;
//    Font.Name := iqscreen.SystemFontName;
//    Transparent := True;
//    WordWrap := True;
//    OnClick := DoInternalOnClick;
//    OnDblClick := DoInternalOnDblClick;
//  end;
//
  imgPicture := TImage.Create(Self);
//  with imgPicture do
//  begin
//    Parent := AParent;
//    Left := 3;
//    Top := 3;
//    Width := 16;
//    Height := 16;
//    AutoSize := True;
//    Anchors := [akTop, akLeft];
//    Picture.Bitmap := nil;
//    Transparent := True;
//    Picture.OnChange := DoInternalImageChange;
//    DoubleBuffered := True; // eliminates flicker
//  end;
//
  sbtnCloseButton := TSpeedButton.Create(Self);
//  with sbtnCloseButton do
//  begin
//    Parent := AParent;
//    Left := cWidth - 18;
//    Top := 3;
//    Width := 16;
//    Height := 16;
//    Anchors := [akTop, akRight];
//    Flat := True;
//    Tag := 1999;
//    Font.Charset := SYMBOL_CHARSET;
//    Font.Color := clWindowText;
//    Font.Name := 'Symbol';
//    Font.Style := [];
//    Layout := blGlyphBottom;
//    ParentFont := False;
//    Caption := #180;
//    Hint := 'Close';
//    ShowHint := True;
//    OnClick := DoCloseButtonClick;
//    Visible := False;
//  end;
end;

destructor TIQWebNotificationControl.Destroy;
begin
  if Assigned(pbxBackground) then
    FreeAndNil(pbxBackground);
  if Assigned(lblMessageText) then
    FreeAndNil(lblMessageText);
  if Assigned(imgPicture) then
    FreeAndNil(imgPicture);
  if Assigned(sbtnCloseButton) then
    FreeAndNil(sbtnCloseButton);

  inherited Destroy;
end;

procedure TIQWebNotificationControl.Loaded;
begin
  inherited;

  if not(csDesigning in ComponentState) then
    Self.Visible := False;

  SetControlPositions;
end;

procedure TIQWebNotificationControl.DoBackgroundPaint;
//const
//  clBuffer = 8;
//var
//  iX, iY: Integer;
//  ARect: TRect;
begin
//  iqgraphics.DrawGradient(pbxBackground.Canvas, pbxBackground.ClientRect,
//    [clYellowGradientLight, clYellowGradientDark]);
//  with pbxBackground do
//  begin
//    ARect := ClientRect;
//    Canvas.Pen.Color := clYellowBorderDark;
//    Canvas.Brush.Style := bsClear;
//    Canvas.Rectangle(ARect);
//
//    InflateRect(ARect, clBuffer, clBuffer);
//    Canvas.Pen.Color := clYellowBorderLight;
//    Canvas.Brush.Style := bsClear;
//    Canvas.Rectangle(ARect);
//  end;
//
//  ARect.Bottom := 8;
//  iqgraphics.DrawGradient(pbxBackground.Canvas, ARect,
//    [clOrangeGradientLight, clOrangeGradientDark]);
end;

procedure TIQWebNotificationControl.DoCloseButtonClick(Sender: TObject);
begin
  if not(csDesigning in ComponentState) and
    not(csDestroying in ComponentState) and
    not(csLoading in ComponentState) then
  begin
    SetStartPosition;
  end;
end;

procedure TIQWebNotificationControl.DoInternalImageChange(Sender: TObject);
begin
  imgPicture.Picture.Bitmap.Transparent := True;
  imgPicture.Invalidate;
  SetControlPositions;
end;

procedure TIQWebNotificationControl.DoInternalOnClick(Sender: TObject);
begin
  if not(csDesigning in ComponentState) and
    not(csDestroying in ComponentState) and not(csLoading in ComponentState) and
    Assigned(FOnClick) then
  begin
    FOnClick(Sender);
  end;
end;

procedure TIQWebNotificationControl.DoInternalOnDblClick(Sender: TObject);
begin
  if not(csDesigning in ComponentState) and
    not(csDestroying in ComponentState) and not(csLoading in ComponentState) and
    Assigned(FOnDblClick) then
    FOnDblClick(Sender);
end;

procedure TIQWebNotificationControl.DoInternalResize(Sender: TObject);
begin
  if not FExecuting and not FDisableUpdates then
  begin
    SetControlPositions;
    SetFinalPosition;
  end;
end;

procedure TIQWebNotificationControl.DoPaint(Sender: TObject);
begin
  DoBackgroundPaint;
end;

procedure TIQWebNotificationControl.BeginUpdate;
begin
  FDisableUpdates := True;
end;

procedure TIQWebNotificationControl.EndUpdate;
begin
  FDisableUpdates := False;
end;

procedure TIQWebNotificationControl.Execute;
const
  cBuffer: Integer = 1;
var
  i, ATarget: Integer;
begin
//  if not FExecuting and not FShowing then
//  try
//    FExecuting := True;
//    FShowing := False;
//    // Reset positions
//    SetControlPositions;
//    SetStartPosition;
//    // Hide the label temporarily
//    lblMessageText.Visible := False;
//{$IF CompilerVersion >= 26}  // Delphi XE5
//    lblMessageText.Font.Color := clWhite;
//{$ENDIF}
//    // Slide the panel into view
//    Self.Visible := True;
//    ATarget := Self.Parent.ClientHeight - Self.Height - cBuffer;
//    i := Self.Top;
//    repeat
//      // 05/23/2014 Do not call Application.ProcessMessages in this loop.
//      // It will cause an AV if the parent form is destroyed before
//      // the loop is done.
//      if not (csDestroying in ComponentState) then
//       begin
//          Self.Top := i;
//          Self.Invalidate;
//          Dec(i, 1);
//          if not (csDestroying in ComponentState)  and (i < ATarget + 15) then
//            Sleep(10);
//       end;
//    until (i <= ATarget) or (csDestroying in ComponentState) ;
//    // Fade the label in
//    if not (csDestroying in ComponentState)  then
//      FadeLabelIn;
//  finally
//    FExecuting := False;
//    FShowing := True;
//  end;
end;

procedure TIQWebNotificationControl.SetStartPosition;
const
  cBuffer: Integer = 1;
begin
  if not(csDesigning in ComponentState) and
    not(csLoading in ComponentState) then
  begin
    Self.Visible := False;
    Self.Left := cBuffer;
    if Self.Parent <> nil then
      begin
        Self.Width := Self.Parent.ClientWidth - (cBuffer * 2);
        Self.Top := Self.Parent.ClientHeight + cBuffer;
      end;
  end;
end;

procedure TIQWebNotificationControl.SetControlPositions;
var
  ATextHeight, AImageHeight, AHeight: Integer;
  ALabelRect: TRect;
begin
//  if FDisableUpdates or not Assigned(lblMessageText) or
//    not Assigned(imgPicture) or
//    (Parent = nil) then
//    Exit;
//
//  // Set the width of the bar
//  Self.Width := Self.Parent.ClientWidth;
//
//  // Image and caption initial position
//  AImageHeight := imgPicture.Picture.Height;
//  imgPicture.Top := cMargin;
//  imgPicture.Left := cMargin;
//  imgPicture.Visible := Assigned(imgPicture.Picture.Bitmap) and
//    (imgPicture.Picture.Width > 0);
//
//  // Close button
//  sbtnCloseButton.Visible := FCloseBtnVisible;
//  sbtnCloseButton.Top := cMargin + cTopBarHeight;
//  sbtnCloseButton.Left := Self.ClientWidth - sbtnCloseButton.Width - 3;
//  sbtnCloseButton.Caption := IfThen(sbtnCloseButton.Visible, #180, '');
//
//  // Final height
//  try
//    lblMessageText.Anchors := [akLeft, akTop];
//    // Caption text size
//    SetLabelSizeAndPosition(ALabelRect);
//    Self.Height := Max(AImageHeight, ALabelRect.Bottom) + cTopBarHeight +
//      (cMargin * 2);
//  finally
//    lblMessageText.Anchors := [akLeft, akTop, akRight, akBottom];
//  end;
//
//  // Set anchors so that if the parent form is resized, the bar
//  // will not be hidden
//  Anchors := [akLeft, akRight, akBottom];

end;

procedure TIQWebNotificationControl.SetLabelSizeAndPosition(var ARect: TRect);
var
  AText: string;
begin
//  // Top
//  lblMessageText.Top := cTopBarHeight + cMargin;
//  // Left
//  lblMessageText.Left := iqnumber.iIIf(imgPicture.Visible,
//    imgPicture.Left + imgPicture.Width + cMargin + 2, cMargin + 2);
//  // Width
//  lblMessageText.Width := iqnumber.iIIf(sbtnCloseButton.Visible,
//    Self.ClientWidth - lblMessageText.Left - sbtnCloseButton.Width - cMargin -
//    4, Self.ClientWidth - lblMessageText.Left - cMargin - 2);
//
//  // Populate TRect
//  ARect.Left := 0;
//  ARect.Right := lblMessageText.Width;
//  ARect.Top := 0;
//  ARect.Bottom := 0;
//  // Populate var param
//  AText := lblMessageText.Caption;
//  // Get the TRect of wrapped text
//  lblMessageText.Canvas.TextRect( { var } ARect, { var } AText,
//    [tfCalcRect, tfWordBreak]);
//
//  // Apply label height
//  lblMessageText.Height := ARect.Bottom;
end;

procedure TIQWebNotificationControl.SetFinalPosition;
begin
  Self.Top := Self.Parent.ClientHeight - Self.Height - 1;
end;

procedure TIQWebNotificationControl.FadeLabelIn;
//const
//  c_rate: Integer = 80;
begin
//  if not (csDestroying in ComponentState)  then
//    begin
//      if not lblMessageText.Visible and FFadeLabel then
//      begin
//{$IF CompilerVersion >= 26}  // Delphi XE5
//        // In order to do a "fade", the calling method must first
//        // set the label font color to white.  This is only done,
//        // if the message text has changed in order to prevent
//        // blinking.
//        // Set the label visible
//        lblMessageText.Visible := True;
//        // Fade the label in.  This is reasonably fast and does not
//        // call Application.ProcessMessages.  These lines replace
//        // the call to iqgraphics.FadeLabel(), which was too slow a
//        // fade and there was opportunity to cause an AV situation.
//       if (lblMessageText.Font.Color = clWhite) then
//         begin
//           // Silver
//           lblMessageText.Font.Color := clSilver;
//           lblMessageText.Update;
//           Sleep(c_rate);
//           // Gray
//           lblMessageText.Font.Color := clGray;
//           lblMessageText.Update;
//           Sleep(c_rate);
//           // Black (Window Text)
//           lblMessageText.Font.Color := clWindowText;
//           lblMessageText.Update;
//         end;
//
//{$ELSE}
//        lblMessageText.Visible := True;
//{$IFEND}
//      end
//      else
//        lblMessageText.Visible := True;
//    end;
end;

procedure TIQWebNotificationControl.Hide;
begin
  SetStartPosition;
  FShowing := False;
end;

function TIQWebNotificationControl.GetMessageText: string;
begin
  Result := lblMessageText.Caption;
end;

procedure TIQWebNotificationControl.SetMessageText(const Value: string);
//var
//  AChanged: Boolean;
begin
//  AChanged := CompareText(Value, lblMessageText.Caption) <> 0;
//  lblMessageText.Caption := Value;
//  if AChanged and Showing then
//  begin
//    lblMessageText.Visible := False;
//    SetControlPositions;
//{$IF CompilerVersion >= 26}  // Delphi XE5
//    lblMessageText.Font.Color := clWhite;
//{$ENDIF}
//    FadeLabelIn;
//  end;
end;

function TIQWebNotificationControl.GetFont: TFont;
begin
//  Result := lblMessageText.Font;
end;

procedure TIQWebNotificationControl.SetFont(const Value: TFont);
begin
//  lblMessageText.Font.Assign(Value);
end;

function TIQWebNotificationControl.GetPicture: TPicture;
begin
  Result := nil;
//  Result := imgPicture.Picture;
end;

procedure TIQWebNotificationControl.SetPicture(const Value: TPicture);
begin
//  imgPicture.Picture.Assign(Value);
//  imgPicture.Visible := Assigned(imgPicture.Picture.Bitmap) and
//    (imgPicture.Picture.Width > 0);
  Invalidate;
end;

function TIQWebNotificationControl.GetPopupMenu: TPopupMenu;
begin
  Result := lblMessageText.PopupMenu;
end;

procedure TIQWebNotificationControl.SetPopupMenu(const Value: TPopupMenu);
begin
  lblMessageText.PopupMenu := Value;
end;

procedure TIQWebNotificationControl.SetCloseBtnVisible(const Value: Boolean);
begin
  FCloseBtnVisible := Value;
end;

{$ENDREGION 'TIQWebNotificationControl'}

end.

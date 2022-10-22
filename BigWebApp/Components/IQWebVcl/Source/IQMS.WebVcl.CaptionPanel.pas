unit IQMS.WebVcl.CaptionPanel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, StdCtrls, ExtCtrls,UniPanel,UniCanvas,UniLabel,UniImage;

type
  { TLayoutStyle }
  TLayoutStyle = (lsBasic, lsWindows2000, lsWindowsXP, lsCaramel, lsBlue,
    lsWizard);

  { TPictureLayout }
  TPictureLayout = (plImageLeft, plImageRight);

  { TIQWebCaptionPanel }
  TIQWebCaptionPanel = class(TUniPanel)
    pbxBackground: TUniCanvas;
    lblCaptionText: TUniLabel;
    imgPicture: TUniImage;
    lblPromptText: TUniLabel;
    procedure DoInternalResize(Sender: TUniControl; OldW, OldH:integer);
  private
    { Private methods }
    FCreating: Boolean;
    FText: string;
    FCaption: string;
    FPictureLayout: TPictureLayout;
    FLayoutStyle: TLayoutStyle;
    procedure SetCaption(const Value: string);
    function GetPicture: TPicture;
    procedure SetPicture(const Value: TPicture);
    procedure SetText(const Value: string);
    procedure DoPaint(Sender: TObject);
    procedure DoPaintFont;
    procedure DoBackgroundPaint;
    procedure SetPictureLayout(const Value: TPictureLayout);
    procedure SetLayoutStyle(const Value: TLayoutStyle);
    procedure DrawCaramel;
    procedure DrawBlue;
    procedure DrawWindowsXP;
    procedure DrawWindows2000;
    procedure DrawDefault;
    procedure DrawFrame(const ABorderDark, ABorderLight: TColor);
    procedure SetControlPositions;
    procedure DrawWizard;
    procedure DrawBottomLine(const AColor: TColor);
  protected
    { Private methods }
    procedure Loaded; override;
  public
    { Private methods }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Private methods }
    property Caption: string read FCaption write SetCaption;
    property Text: string read FText write SetText;
    property Picture: TPicture read GetPicture write SetPicture;
    property PictureLayout: TPictureLayout read FPictureLayout
      write SetPictureLayout;
    property LayoutStyle: TLayoutStyle read FLayoutStyle write SetLayoutStyle;
    property Align;
    property Anchors;
    property AutoSize;
    property Constraints;
    property DragCursor;
    property Enabled;
    property PopupMenu;
    property Visible;
    property OnCanResize;
    property OnClick;
    property OnConstrainedResize;
    property OnContextPopup;
    property OnDblClick;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
  end;

implementation

uses
  IQMS.Common.Graphics,
  IQMS.Common.SysInfo;

{ TIQWebCaptionPanel }

const
  // Basic
  clGradientLightGray: TColor = 16250871;
  // Caramel
  clCaramelGradientLight: TColor = 15069170;
  clCaramelGradientDark: TColor = 13623784;
  // clCaramelFontColor: TColor = 6583436;
  clCaramelBorderLight: TColor = 16777215;
  clCaramelBorderDark: TColor = 6583436;
  // Blue
  clBlueGradientLight: TColor = 16709100;
  clBlueGradientDark: TColor = 16442059;
  // clBlueFontColor: TColor = 15506750;
  clBlueBorderLight: TColor = 16777215;
  clBlueBorderDark: TColor = 14790538;

  { TIQWebCaptionPanel }

constructor TIQWebCaptionPanel.Create(AOwner: TComponent);
const
  cHeight = 60;
  cWidth = 372;
var
  AParent: TIQWebCaptionPanel;
begin
  try
    FCreating := True;
    inherited Create(AOwner);

    ControlStyle := [csCaptureMouse, csClickEvents, csDoubleClicks, csOpaque,
      csReplicatable, csDesignInteractive];
    AParent := Self;
    FCaption := 'Caption Text';
    FText := 'Message Text';
    FPictureLayout := plImageRight; // default
    FLayoutStyle := lsBasic;

    // Panel related
    Width := cWidth;
    Height := cHeight; // allows for a clean 2 lines
    BevelInner := bvNone;
    BevelOuter := bvNone;
    ParentColor := True;
    ParentBackground := False; // essential for XP rendering
//    FullRepaint := True;

    pbxBackground := TUniCanvas.Create(Self);
    with pbxBackground do
      begin
        Parent := AParent;
        Left := 0;
        Top := 0;
        Align := alClient;
//        OnPaint := Self.DoPaint;
        OnResize := Self.DoInternalResize;
      end;

    lblCaptionText := TUniLabel.Create(Self);
    with lblCaptionText do
      begin
        Parent := AParent;
        Height := 13;
        Anchors := [akLeft, akTop, akRight];
        Left := 8;
        Top := 8;
        Width := cWidth - 25;
        Caption := FCaption;
        Font.Style := [fsBold];
        ParentFont := False;
        Transparent := True;
      end;

    lblPromptText := TUniLabel.Create(Self);
    with lblPromptText do
      begin
        Parent := AParent;
        Top := 23;
        Left := 8;
        Width := cWidth - 25;
        Anchors := [akLeft, akTop, akRight, akBottom];
        Caption := FText;
        ParentFont := False;
        Transparent := True;
//        WordWrap := True;
      end;

    imgPicture := TUniImage.Create(Self);
    with imgPicture do
      begin
        Parent := AParent;
        Left := cWidth - 16;
        Top := 0;
        Width := 16;
        Height := 16;
        Anchors := [akTop, akRight];
        Transparent := True;
      end;

  finally
    FCreating := False;
  end;
end;

destructor TIQWebCaptionPanel.Destroy;
begin
  if Assigned(pbxBackground) then
    FreeAndNil(pbxBackground);
  if Assigned(lblCaptionText) then
    FreeAndNil(lblCaptionText);
  if Assigned(lblPromptText) then
    FreeAndNil(lblPromptText);
  if Assigned(imgPicture) then
    FreeAndNil(imgPicture);

  inherited Destroy;
end;

procedure TIQWebCaptionPanel.Loaded;
begin
  inherited;

  SetControlPositions;
end;

procedure TIQWebCaptionPanel.DoInternalResize(Sender: TUniControl; OldW, OldH:integer);
begin
  SetControlPositions;
end;

procedure TIQWebCaptionPanel.SetCaption(const Value: string);
begin
  FCaption := Value;
  lblCaptionText.Caption := Value;
  SetControlPositions;
end;

procedure TIQWebCaptionPanel.SetControlPositions;
const
  cBuffer: Integer = 8;
var
  AImageWidth: Integer;
  ATextTop, ATextLeft: Integer;
begin
  lblCaptionText.Font.Name := IQMS.Common.SysInfo.SystemFontName;
  lblPromptText.Font.Name := lblCaptionText.Font.Name;

  AImageWidth := imgPicture.Picture.Width + cBuffer;
  case FPictureLayout of
    plImageLeft:
      begin
        // Image
        Self.imgPicture.Top := cBuffer;
        Self.imgPicture.Left := cBuffer;
        // Caption text
        lblCaptionText.Top := cBuffer;
        lblCaptionText.Left := AImageWidth + cBuffer;
        lblCaptionText.Width := Self.ClientWidth - AImageWidth - (cBuffer * 2);
        // Compensate for layout
        case FLayoutStyle of
          lsWizard:
            begin
              ATextTop := lblCaptionText.Top + lblCaptionText.Height + 8;
              ATextLeft := AImageWidth + (cBuffer * 3);
            end
        else
          begin
            ATextTop := lblCaptionText.Top + lblCaptionText.Height + 2;
            ATextLeft := AImageWidth + cBuffer;
          end;
        end;

        // Message text
        lblPromptText.Top := ATextTop;
        lblPromptText.Left := ATextLeft; // AImageWidth + cBuffer;
        lblPromptText.Width := Self.ClientWidth - ATextLeft - cBuffer;
        lblPromptText.Height := Self.ClientHeight -
          (lblCaptionText.Top + lblCaptionText.Height - cBuffer);
      end;
    plImageRight:
      begin
        // Image
        Self.imgPicture.Top := cBuffer;
        Self.imgPicture.Left := Self.ClientWidth - Self.imgPicture.Width - 4;
        // Caption text
        lblCaptionText.Top := cBuffer;
        lblCaptionText.Left := cBuffer;
        lblCaptionText.Width := Self.ClientWidth - AImageWidth - (cBuffer * 2);
        // Compensate for layout
        case FLayoutStyle of
          lsWizard:
            begin
              ATextTop := lblCaptionText.Top + lblCaptionText.Height + 8;
              ATextLeft := cBuffer * 3;
            end
        else
          begin
            ATextTop := lblCaptionText.Top + lblCaptionText.Height + 2;
            ATextLeft := cBuffer;
          end;
        end;

        // Message text
        lblPromptText.Top := ATextTop;
        lblPromptText.Left := ATextLeft;
        lblPromptText.Width := Self.ClientWidth - AImageWidth - ATextLeft
          - cBuffer;
        lblPromptText.Height := Self.ClientHeight -
          (lblCaptionText.Top + lblCaptionText.Height - cBuffer);
      end;
  end;

  Invalidate;
end;

procedure TIQWebCaptionPanel.SetPicture(const Value: TPicture);
begin
  imgPicture.Picture.Assign(Value);
  imgPicture.Visible := Assigned(imgPicture.Picture.Bitmap) and
    (imgPicture.Picture.Width > 0);
  Invalidate;
end;

function TIQWebCaptionPanel.GetPicture: TPicture;
begin
  Result := Self.imgPicture.Picture;
end;

procedure TIQWebCaptionPanel.SetText(const Value: string);
begin
  FText := Value;
  lblPromptText.Caption := Value;
  SetControlPositions;
end;

procedure TIQWebCaptionPanel.SetPictureLayout(const Value: TPictureLayout);
begin
  FPictureLayout := Value;
  SetControlPositions;
end;

procedure TIQWebCaptionPanel.SetLayoutStyle(const Value: TLayoutStyle);
begin
  FLayoutStyle := Value;
  SetControlPositions;
end;

procedure TIQWebCaptionPanel.DoPaint(Sender: TObject);
begin
  DoBackgroundPaint;
  DoPaintFont;
end;

procedure TIQWebCaptionPanel.DoPaintFont;
var
  AFontColor: TColor;
begin
  case FLayoutStyle of
    lsWindowsXP, lsWizard:
      begin
        AFontColor := clBlack;
      end;
    lsWindows2000:
      begin
        AFontColor := clWhite;
      end;
    lsCaramel:
      begin
        AFontColor := clBlack;
      end;
    lsBlue:
      begin
        AFontColor := clBlack;
      end;
  else
    begin
      AFontColor := clBlack;
    end;
  end; // end case

  lblCaptionText.Font.Color := AFontColor;
  lblPromptText.Font.Color := AFontColor;
end;

procedure TIQWebCaptionPanel.DoBackgroundPaint;
begin
  if FLayoutStyle = lsWindowsXP then
    DrawWindowsXP
  else if FLayoutStyle = lsWindows2000 then
    DrawWindows2000
  else if FLayoutStyle = lsCaramel then
    DrawCaramel
  else if FLayoutStyle = lsBlue then
    DrawBlue
  else if FLayoutStyle = lsWizard then
    DrawWizard
  else
    DrawDefault;
end;

procedure TIQWebCaptionPanel.DrawDefault;
var
  iX: Integer;
  iY: Integer;
begin
  // BtnFace background
  Self.Color := clBtnFace;
  iX := ClientWidth div 2;
  iY := ClientHeight div 2;
  pbxBackground.Brush.Color := clBtnFace;
  pbxBackground.FloodFill(iX, iY);
end;

procedure TIQWebCaptionPanel.DrawWindows2000;
var
  iX: Integer;
  iY: Integer;
begin
  // BtnShadow background
  Self.Color := clBtnShadow;
  iX := ClientWidth div 2;
  iY := ClientHeight div 2;
  pbxBackground.Brush.Color := clBtnShadow;
  pbxBackground.FloodFill(iX, iY);
end;

procedure TIQWebCaptionPanel.DrawWindowsXP;
begin
  Self.Color := clWhite;
  DrawGradient(pbxBackground, ClientRect,
    [clWhite, clGradientLightGray]);
  DrawFrame(clWhite, clGray);
end;

procedure TIQWebCaptionPanel.DrawCaramel;
begin
  Self.Color := clCaramelGradientLight;

  DrawGradient(pbxBackground, ClientRect,
    [clCaramelGradientLight, clCaramelGradientDark]);
  DrawFrame(clCaramelBorderLight, clCaramelBorderDark);
end;

procedure TIQWebCaptionPanel.DrawBlue;
begin
  Self.Color := clBlueGradientLight;

  DrawGradient(pbxBackground, ClientRect,
    [clBlueGradientLight, clBlueGradientDark]);
  DrawFrame(clBlueBorderLight, clBlueBorderDark);
end;

procedure TIQWebCaptionPanel.DrawWizard;
begin
  Self.Color := clWhite;
  DrawBottomLine(clBtnShadow);
end;

procedure TIQWebCaptionPanel.DrawFrame(const ABorderDark, ABorderLight: TColor);
const
  clBuffer: Integer = - 1;
var
  ARect: TRect;
begin
  with pbxBackground do
    begin
      ARect := ClientRect;
      pbxBackground.Pen.Color := ABorderDark;
//      pbxBackground.Brush.Style := bsClear;
      pbxBackground.Rectangle(ARect.Left,arect.Top, ARect.Left+ARect.Width,arect.Top+arect.Height);

      InflateRect(ARect, clBuffer, clBuffer);
      pbxBackground.Pen.Color := ABorderLight;
//      pbxBackground.Brush.Style := bsClear;
      pbxBackground.Rectangle(ARect.Left,arect.Top, ARect.Left+ARect.Width,arect.Top+arect.Height);
    end;
end;

procedure TIQWebCaptionPanel.DrawBottomLine(const AColor: TColor);
var
  ARect: TRect;
begin
  with pbxBackground do
    begin
      ARect := ClientRect;
      pbxBackground.Pen.Color := AColor;
      pbxBackground.Pen.Width := 1;
      pbxBackground.MoveTo(ARect.Left, ARect.Bottom - 1);
      pbxBackground.LineTo(ARect.Right, ARect.Bottom - 1);
    end;
end;

end.

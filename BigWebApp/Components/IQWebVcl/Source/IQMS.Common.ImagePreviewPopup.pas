unit IQMS.Common.ImagePreviewPopup;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Imaging.pngimage,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,UniImage,
  uniGUIApplication, Vcl.ExtCtrls, uniGUIBaseClasses, uniPanel;

type
  TObjCoord = record
    Align: TAlign;
    Top: Integer;
    Left: Integer;
    Height: Integer;
    Width: Integer;
  end;

  { TFrmImagePreviewPopup }
  TFrmImagePreviewPopup = class(TUniForm)
    imgClose: TUniImage;
    Image1: TUniImage;
    shpBorder: TUniPanel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DoClose(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    FSavedObjCoord: TObjCoord;
    FSavedObjAlign: TAlign;
    FSavedOnClickEvent: TNotifyEvent;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure PlaceCloseBtn;
    procedure SetImage(AImage: TUniImage);
  public
    { Public declarations }
    class procedure DoShow(const AOwner: TComponent; const AImage: TUniImage);
    property Image: TUniImage write SetImage;
  end;

procedure ShowImagePreviewPopup(const AImage: TUniImage);


implementation

{$R *.dfm}


uses
  IQMS.Common.Controls;

procedure ShowImagePreviewPopup(const AImage: TUniImage);
var
  FrmImagePreviewPopup: TFrmImagePreviewPopup;
begin
  if not Assigned(AImage) then
    Exit;

  FrmImagePreviewPopup:= TFrmImagePreviewPopup.Create(uniGUIApplication.UniApplication);
  FrmImagePreviewPopup.Image:=AImage;
  FrmImagePreviewPopup.Show;
end;
class procedure TFrmImagePreviewPopup.DoShow(const AOwner: TComponent;
  const AImage: TUniImage);
var
  FrmImagePreviewPopup: TFrmImagePreviewPopup;
begin
  FrmImagePreviewPopup:= TFrmImagePreviewPopup.Create(uniGUIApplication.UniApplication);
  FrmImagePreviewPopup.Image:=AImage;
  FrmImagePreviewPopup.Show;
end;

procedure TFrmImagePreviewPopup.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.ExStyle := WS_EX_TRANSPARENT;
end;

procedure TFrmImagePreviewPopup.FormKeyPress(Sender: TObject; var Key: Char);
begin
  Close;
end;

procedure TFrmImagePreviewPopup.DoClose(Sender: TObject);
begin
  Close;
end;

procedure TFrmImagePreviewPopup.FormResize(Sender: TObject);
begin
  PlaceCloseBtn;
end;

procedure TFrmImagePreviewPopup.PlaceCloseBtn;
begin
  imgClose.Top := 1;
  imgClose.Left := ClientWidth - imgClose.Width - 1;
  imgClose.Visible := True;
  imgClose.BringToFront;
  imgClose.Invalidate;
end;

procedure TFrmImagePreviewPopup.SetImage(AImage: TUniImage);
const
  c_buffer: Integer = 20;
var
  AScreenWidth, AScreenHeight, AWidth, AHeight: Integer;
begin

  GetDefaultDesktopSize(AScreenWidth, AScreenHeight);

  Image1.Picture.Assign(AImage.Picture);
  Image1.AutoSize := True;

  if (Image1.Width >= AScreenWidth) or
    (Image1.Height >= AScreenHeight) then
    begin
      Image1.Stretch := True;
      Image1.Proportional := True;
      Image1.Width := AScreenWidth - c_buffer;
      Image1.Height := AScreenHeight - c_buffer;
    end;

  shpBorder.Top := imgClose.Height div 2;
  shpBorder.Left := imgClose.Width div 2;
  shpBorder.Width := Image1.Width + (c_buffer * 2);
  shpBorder.Height := Image1.Height + (c_buffer * 2);

  Image1.Top := shpBorder.Top + c_buffer;
  Image1.Left := shpBorder.Left + c_buffer;

  Self.Height := shpBorder.Top + shpBorder.Height + c_buffer;
  Self.Width := shpBorder.Left + shpBorder.Width + c_buffer;

  PlaceCloseBtn;

  Brush.Style := bsClear;
  BorderStyle := bsNone;
end;

end.

unit ict_images;

interface

uses
  System.Classes,
  Vcl.Controls,
  Buttons,
  Graphics,
  System.ImageList,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniImageList;

type
  TDM_ICT_IMAGES = class(TDataModule)
    imglstLargeImages: TUniImageList;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AssignImage(const ASpeedButton: TUniSpeedButton;
      const AImageIndex: Integer); overload;
    procedure AssignImage(const ABitMap: TBitMap;
      const AImageIndex: Integer); overload;
  end;

const
  imageICT_Corporate: Integer = 0;
  imageICT_EPlant: Integer = 1;
  imageICT_Division: Integer = 2;

//var
//  DM_ICT_IMAGES: TDM_ICT_IMAGES;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  IQMS.Common.Graphics;

procedure TDM_ICT_IMAGES.AssignImage(const ASpeedButton: TUniSpeedButton;
  const AImageIndex: Integer);
begin
  IQMS.Common.Graphics.LoadButtonImageFromImageList(ASpeedButton, imglstLargeImages,
   AImageIndex);
end;

procedure TDM_ICT_IMAGES.AssignImage(const ABitMap: TBitMap;
  const AImageIndex: Integer);
begin
  if Assigned(ABitMap) then
    imglstLargeImages.GetBitmap(AImageIndex, ABitMap);
end;

end.

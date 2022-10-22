unit DM_CRMIMG;

interface

uses
  System.Classes,
  Vcl.Controls,
  Vcl.Buttons,
  System.ImageList,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniImageList,
  uniImage;

type
  TCRMIMG_DM = class(TDataModule)
    ACTIVITY_TYPE_IMAGES: TUniImageList;
    Standard16X16: TUniImageList;
    Activity32x32: TUniImageList;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AssignStandardImage(const ASpeedButton: TUniSpeedButton;
      const AImageIndex: Integer); overload;
    procedure AssignStandardImage(const ABitButton: TUniBitBtn;
      const AImageIndex: Integer); overload;

    procedure AssignActivityImage(const AImage: TUniImage;
      const AImageIndex: Integer); overload;

  end;

const
  imageNewCall16x16: Integer = 0;
  imageNewTask16x16: Integer = 1;
  imageNewMeeting16x16: Integer = 2;
  imageNewSupportIssue16x16: Integer = 3;
  imageNewNote16x16: Integer = 4;
  imageAssignedTo16x16: Integer = 5;
  imagePrincipal16x16: Integer = 6;
  imageExpand16x16: Integer = 7;
  imageCollapse16x16: Integer = 8;
  imageSymbolRefresh16x16: Integer = 9;
  imageSymbolExpandList16x16: Integer = 10;

  imageCall32x32: Integer = 0;
  imageTask32x32: Integer = 1;
  imageMeeting32x32: Integer = 2;
  imageSupport32x32: Integer = 3;
  imageNote32x32: Integer = 4;

var
  CRMIMG_DM: TCRMIMG_DM;

implementation

{$R *.dfm}


uses
  IQMS.Common.Graphics;

{ TCRMIMG_DM }

procedure TCRMIMG_DM.AssignStandardImage(const ASpeedButton: TUniSpeedButton;
  const AImageIndex: Integer);
begin
  IQMS.Common.Graphics.LoadButtonImageFromImageList(ASpeedButton, Standard16X16,
    AImageIndex);
end;

procedure TCRMIMG_DM.AssignStandardImage(const ABitButton: TUniBitBtn;
  const AImageIndex: Integer);
begin
  IQMS.Common.Graphics.LoadButtonImageFromImageList(ABitButton, Standard16X16,
    AImageIndex);
end;

procedure TCRMIMG_DM.AssignActivityImage(const AImage: TUniImage;
  const AImageIndex: Integer);
begin
  IQMS.Common.Graphics.LoadBitmapFromImageList(Activity32x32, AImageIndex, AImage);
end;

end.

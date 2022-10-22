unit PsTkConfirmDelete;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  jpeg,
  IQMS.WebVcl.SecurityRegister,
  System.ImageList,
  uniGUIBaseClasses,
  uniImageList,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniTimer,
  uniLabel, uniImage;

type
  TFrmPsTkConfirmDelete = class(TUniForm)
    PnlMain: TUniPanel;
    PnlLeft: TUniPanel;
    imgWarning: TUniImage;
    PnlRTF: TUniPanel;
    Bevel1: TUniPanel;
    Panel1: TUniPanel;
    PnlModalButtons: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    Label1: TUniLabel;
    Timer1: TUniTimer;
    ImageList1: TUniImageList;
    Bevel2: TUniPanel;
    Label2: TUniLabel;
    SecurityRegister1: TIQWebSecurityRegister;
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FImageIndex: Integer;
  public
    { Public declarations }
    class function ConfirmDelete( AOwner: TComponent ): Boolean;
  end;

var
  FrmPsTkConfirmDelete: TFrmPsTkConfirmDelete;

implementation

{$R *.dfm}

uses
  IQMS.Common.RegFrm;
//  IQSecIns;

class function TFrmPsTkConfirmDelete.ConfirmDelete(AOwner: TComponent): Boolean;
begin
  with self.Create( AOwner ) do
  try
    Result:= ShowModal = mrOK;
  finally
    Release;
  end;
end;

procedure TFrmPsTkConfirmDelete.Timer1Timer(Sender: TObject);
var
  ABitMap: TBitmap;
begin
  if FImageIndex = 0 then FImageIndex:= 1 else FImageIndex:= 0;

  ABitMap:= TBitmap.Create;
  try
    ImageList1.GetBitmap( FImageIndex, ABitmap );
    imgWarning.Picture.Assign( ABitmap );
    imgWarning.Update;
  finally
    ABitMap.Free;
  end;
end;

procedure TFrmPsTkConfirmDelete.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self]);
//  EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmPsTkConfirmDelete.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  IQRegFormWrite( self, [ self ]);
end;

end.

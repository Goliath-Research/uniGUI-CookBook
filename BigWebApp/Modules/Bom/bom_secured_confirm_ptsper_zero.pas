unit bom_secured_confirm_ptsper_zero;

interface

uses
  Winapi.Windows,
  IQMS.Common.SecuredConfirm,
  MainModule,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Graphics,
  Vcl.Controls,
  System.Classes, uniLabel, uniImage, uniButton,
  Vcl.Forms, uniGUIBaseClasses, uniGUIClasses, uniPanel;

type
  TFrmBOMSecuredConfirmPtsPerZero = class(TFrmSecuredConfirm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrmBOMSecuredConfirmPtsPerZero.FormCreate(Sender: TObject);
begin
  inherited;
  btnCancel.Visible:= FALSE;
end;

end.

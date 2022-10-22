unit dispo_sec_conf_zero_material;

interface

uses
  Winapi.Windows,
  IQMS.Common.SecuredConfirm,
  MainModule,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Graphics,
  Vcl.Controls,
  System.Classes, uniLabel, uniImage, uniButton, Vcl.Forms, uniGUIBaseClasses,
  uniGUIClasses, uniPanel;

type
  TFrmDispoSecConfZeroMaterial = class(TFrmSecuredConfirm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TFrmDispoSecConfZeroMaterial.FormCreate(Sender: TObject);
begin
  inherited;
  btnCancel.Visible:= FALSE;
end;

end.

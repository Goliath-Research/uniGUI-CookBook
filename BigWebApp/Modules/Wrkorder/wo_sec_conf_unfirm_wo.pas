unit wo_sec_conf_unfirm_wo;

interface

uses
  IQMS.Common.SecuredConfirm, IQMS.WebVcl.SecurityRegister, uniLabel,
  Vcl.Graphics, uniImage, uniButton, System.Classes, Vcl.Controls, Vcl.Forms,
  uniGUIBaseClasses, uniGUIClasses, uniPanel;

type
  TFrmSecuredConfirmUnfirmWO = class(TFrmSecuredConfirm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TFrmSecuredConfirmUnfirmWO.FormCreate(Sender: TObject);
begin
  inherited;
  btnCancel.Visible:= FALSE;
end;

end.

unit ps_sec_conf_kitting;

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
  TFrmPS_SecConfirmKitting = class(TFrmSecuredConfirm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrmPS_SecConfirmKitting.FormCreate(Sender: TObject);
begin
  inherited;
  btnCancel.Visible:= FALSE;
end;

end.

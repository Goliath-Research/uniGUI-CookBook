unit secure_confirm_close_po;

interface

uses
  Winapi.Windows,
  //secured_confirm,
  MainModule,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Graphics,
  Vcl.Controls,
  System.Classes, IQMS.Common.SecuredConfirm, uniLabel, uniImage, uniButton,
  Vcl.Forms, uniGUIBaseClasses, uniGUIClasses, uniPanel;

type
  TFrmSecuredConfirmClosePO = class(TFrmSecuredConfirm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TFrmSecuredConfirmClosePO.FormCreate(Sender: TObject);
begin
  inherited;
  btnCancel.Visible:= FALSE;
end;

end.

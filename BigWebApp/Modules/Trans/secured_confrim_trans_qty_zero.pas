unit secured_confrim_trans_qty_zero;

interface

uses
  Winapi.Windows,
  //secured_confirm,
  MainModule, IQMS.Common.SecuredConfirm, IQMS.WebVcl.SecurityRegister,
  uniLabel, Vcl.Graphics, uniImage, uniButton, System.Classes, Vcl.Controls,
  Vcl.Forms, uniGUIBaseClasses, uniGUIClasses, uniPanel;

type
  TFrmSecuredConfirmTransQtyZero = class(TFrmSecuredConfirm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TFrmSecuredConfirmTransQtyZero.FormCreate(Sender: TObject);
begin
  inherited;
  btnCancel.Visible:= FALSE;
end;

end.

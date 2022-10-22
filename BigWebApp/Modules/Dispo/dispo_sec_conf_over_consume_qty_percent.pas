unit dispo_sec_conf_over_consume_qty_percent;

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
  TFrmDispoSecuredConfirmOverConsumeQtyPercent = class(TFrmSecuredConfirm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrmDispoSecuredConfirmOverConsumeQtyPercent.FormCreate(Sender: TObject);
begin
  inherited;
  btnCancel.Visible:= FALSE;
end;

end.

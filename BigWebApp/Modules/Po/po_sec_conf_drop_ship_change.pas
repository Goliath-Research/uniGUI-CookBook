unit po_sec_conf_drop_ship_change;

interface

uses
  Winapi.Windows,
  pngimage,
  MainModule,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Controls,
  System.Classes, IQMS.Common.SecuredConfirm, uniLabel, uniImage, uniButton,
  Vcl.Forms, uniGUIBaseClasses, uniGUIClasses, uniPanel;

type
  TFrmPOSecConfDropShipChange = class(TFrmSecuredConfirm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TFrmPOSecConfDropShipChange.FormCreate(Sender: TObject);
begin
  inherited;
  btnCancel.Visible:= FALSE;
end;

end.

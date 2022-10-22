unit secured_confirn_restore_pktkt;

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
  TFrmSecuredConfirmRestorePkTkt = class(TFrmSecuredConfirm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

end.

unit inv_secured_confirm_add_mps;

interface

uses
  //secured_confirm,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Graphics,
  Vcl.Controls,
  System.Classes, IQMS.Common.SecuredConfirm, uniLabel, uniImage, uniButton,
  Vcl.Forms, uniGUIBaseClasses, uniGUIClasses, uniPanel;

type
  TFrmSecuredConfirmAddMPS = class(TFrmSecuredConfirm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.

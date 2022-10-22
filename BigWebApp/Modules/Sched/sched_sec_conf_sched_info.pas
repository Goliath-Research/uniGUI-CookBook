unit sched_sec_conf_sched_info;

interface

uses
  //secured_confirm,
  IQMS.Common.SecuredConfirm, IQMS.WebVcl.SecurityRegister,
  uniLabel, Vcl.Graphics, uniImage, uniButton, System.Classes, Vcl.Controls,
  Vcl.Forms, uniGUIBaseClasses, uniGUIClasses, uniPanel;

type
  TFrmSecuredConfirmSchedInfo = class(TFrmSecuredConfirm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.

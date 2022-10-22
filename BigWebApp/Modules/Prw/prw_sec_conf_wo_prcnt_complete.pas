unit prw_sec_conf_wo_prcnt_complete;

interface

uses
  Winapi.Windows,
  IQMS.Common.SecuredConfirm,
  pngimage,
  MainModule, IQMS.WebVcl.SecurityRegister, uniLabel, uniImage, uniButton,
  System.Classes, Vcl.Controls, Vcl.Forms, uniGUIBaseClasses, uniGUIClasses,
  uniPanel;

type
  TFrmPRWConfSecWOPrcntComplete = class(TFrmSecuredConfirm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.

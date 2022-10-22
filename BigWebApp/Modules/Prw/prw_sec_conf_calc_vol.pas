unit prw_sec_conf_calc_vol;

interface

uses
  Winapi.Windows,
  IQMS.Common.SecuredConfirm, IQMS.WebVcl.SecurityRegister, uniLabel,
  Vcl.Graphics, uniImage, uniButton, System.Classes, Vcl.Controls, Vcl.Forms,
  uniGUIBaseClasses, uniGUIClasses, uniPanel,
  MainModule;

type
  TFrmPRWSecConfCalcVolume = class(TFrmSecuredConfirm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.

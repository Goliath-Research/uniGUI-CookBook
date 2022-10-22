unit WC_6373;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  inv_trans_alert_params;

procedure Test1;
begin
  if TFrmInvTransAlertParams.DoShowModal then
    Showmessage('TRUE') else
    Showmessage('FALSE');
end;

initialization

  TTestRepo.RegisterTest('WC-6373', 'Inv', 'inv_trans_alert_params', 'DoShowModal', Test1, 1);

end.

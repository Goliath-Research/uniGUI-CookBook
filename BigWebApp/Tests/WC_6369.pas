unit WC_6369;

interface

implementation

uses
  TestReg,
  uniGUIDialogs,
  inv_trans_alert;

procedure Test1;
begin
  TFrmInvTransAlert.DoShow;
end;

initialization

TTestRepo.RegisterTest('WC-6369', 'Inv', 'inv_trans_alert', 'DoShow', Test1);

end.

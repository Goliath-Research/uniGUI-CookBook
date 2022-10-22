unit WC_7217;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  sys_ccmerchant_paypal;

procedure Test1;
var
  frm: TFrmIQSysMerchantPayPal;
begin
  frm:= TFrmIQSysMerchantPayPal.Create(uniGUIApplication.uniApplication);
  frm.ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-7217', 'Iqsys', 'sys_ccmerchant_paypal', 'Create', Test1, 1);

end.

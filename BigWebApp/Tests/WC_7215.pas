unit WC_7215;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  sys_ccmerchant_moneris;

procedure Test1;
var
  frm: TFrmIQSysMerchantMoneris;
begin
  frm:= TFrmIQSysMerchantMoneris.Create(uniGUIApplication.uniApplication);
  frm.CreditCardAccountID := 123456;
  frm.CurrCode := 'USD';
  frm.ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-7215', 'Iqsys', 'sys_ccmerchant_moneris', 'Create', Test1, 1);

end.

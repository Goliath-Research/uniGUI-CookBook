unit WC_7210;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  sys_ccmerchant_base;

procedure Test1;
var
  frm: TFrmIQSysMerchantBase;
begin
  frm:= TFrmIQSysMerchantBase.Create(uniGUIApplication.uniApplication);
  frm.CreditCardAccountID := 123456;
  frm.ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-7210', 'Iqsys', 'sys_ccmerchant_base', 'Create', Test1, 1);

end.

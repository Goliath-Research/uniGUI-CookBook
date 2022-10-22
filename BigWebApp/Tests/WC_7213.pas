unit WC_7213;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  sys_ccmerchant_merchantaccountsca;

procedure Test1;
var
  frm: TFrmIQSysMerchantMerchantAccountsCa;
begin
  frm:= TFrmIQSysMerchantMerchantAccountsCa.Create(uniGUIApplication.uniApplication);
  frm.ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-7213', 'Iqsys', 'sys_ccmerchant_merchantaccountsca', 'Create', Test1, 1);

end.

unit WC_7209;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  sys_ccmerchant_authnet;

procedure Test1;
var
  frm: TFrmIQSysMerchantAuthNet;
begin
  frm:= TFrmIQSysMerchantAuthNet.Create(uniGUIApplication.uniApplication);
  frm.ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-7209', 'Iqsys', 'sys_ccmerchant_authnet', 'Create', Test1, 1);

end.

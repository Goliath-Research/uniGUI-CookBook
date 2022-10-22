unit WC_7218;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  sys_ccmerchant_sterling;

procedure Test1;
var
  frm: TFrmIQSysMerchantSterling;
begin
  frm:= TFrmIQSysMerchantSterling.Create(uniGUIApplication.uniApplication);
  frm.ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-7218', 'Iqsys', 'sys_ccmerchant_sterling', 'Create', Test1, 1);

end.

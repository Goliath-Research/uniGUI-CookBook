unit WC_7208;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  sys_ccmerchant_3dsi;

procedure Test1;
var
  frm: TFrmIQSysMerchant3DSI;
begin
  frm:= TFrmIQSysMerchant3DSI.Create(uniGUIApplication.uniApplication);
//  frm.CreditCardAccountID := 123456;
  frm.ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-7208', 'Iqsys', 'sys_ccmerchant_3dsi', 'Create', Test1, 1);

end.

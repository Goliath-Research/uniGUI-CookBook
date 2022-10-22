unit WC_7211;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  sys_ccmerchant_elavon;

procedure Test1;
var
  frm: TFrmIQSysMerchantElavon;
begin
  frm:= TFrmIQSysMerchantElavon.Create(uniGUIApplication.uniApplication);
  frm.ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-7211', 'Iqsys', 'sys_ccmerchant_elavon', 'Create', Test1, 1);

end.

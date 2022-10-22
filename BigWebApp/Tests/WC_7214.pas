unit WC_7214;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  sys_ccmerchant_mes;

procedure Test1;
var
  frm: TFrmIQSysMerchantMES;
begin
  frm:= TFrmIQSysMerchantMES.Create(uniGUIApplication.uniApplication);
  frm.ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-7214', 'Iqsys', 'sys_ccmerchant_mes', 'Create', Test1, 1);

end.

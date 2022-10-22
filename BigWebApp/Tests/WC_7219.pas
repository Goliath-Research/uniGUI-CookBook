unit WC_7219;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  sys_ccmerchant_tsys;

procedure Test1;
var
  frm: TFrmIQSysMerchantTSYS;
begin
  frm:= TFrmIQSysMerchantTSYS.Create(uniGUIApplication.uniApplication);
  frm.ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-7219', 'Iqsys', 'sys_ccmerchant_tsys', 'Create', Test1, 1);

end.

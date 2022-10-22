unit WC_7216;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  sys_ccmerchant_payflo;

procedure Test1;
var
  frm: TFrmIQSysMerchantPayFlo;
begin
  frm:= TFrmIQSysMerchantPayFlo.Create(uniGUIApplication.uniApplication);
  frm.ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-7216', 'Iqsys', 'sys_ccmerchant_payflo', 'Create', Test1, 1);

end.

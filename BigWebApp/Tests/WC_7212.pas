unit WC_7212;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  sys_ccmerchant_firstdata;

procedure Test1;
var
  frm: TFrmIQSysMerchantFirstData;
begin
  frm:= TFrmIQSysMerchantFirstData.Create(uniGUIApplication.uniApplication);
  frm.ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-7212', 'Iqsys', 'sys_ccmerchant_firstdata', 'Create', Test1, 1);

end.

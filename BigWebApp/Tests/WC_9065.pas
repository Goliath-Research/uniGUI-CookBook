unit WC_9065;

interface

implementation


uses
  TestReg,
  SysUtils,
  uniGUIDialogs,uniGUIApplication,
  IQMS.Common.ExtFileBas;

procedure Test1;
begin
  TFrmExtFileBas.Create(UniApplication).ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-9065', 'WebIQ', 'IQWebVcl', 'ExtFileBas', Test1);

end.

unit WC_7784;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  pm_class;

procedure TestTFrmPMClass;
begin
  DoPMClassList;
end;

initialization

  TTestRepo.RegisterTest('WC-7784', 'PM', 'pm_class', 'DoPMClassList', TestTFrmPMClass);

end.

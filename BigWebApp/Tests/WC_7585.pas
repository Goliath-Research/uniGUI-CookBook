unit WC_7585;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  VmiConsWarning;

procedure Test1;
var
 Form: TFrmVMIConsWarning;
begin
  Form := TFrmVMIConsWarning.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-7585', 'Packslip', 'VmiConsWarning', 'create', Test1);
end.

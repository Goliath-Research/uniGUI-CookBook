unit WC_7655;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  PRDedUpd;

procedure TestDoUpdateDefaultDeductions;
begin
  DoUpdateDefaultDeductions(1);
end;

initialization

  TTestRepo.RegisterTest('WC-7655', 'Payroll', 'PRDedUpd', 'DoUpdateDefaultDeductions', TestDoUpdateDefaultDeductions);

end.

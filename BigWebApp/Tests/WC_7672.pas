unit WC_7672;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  PR_empNa;

procedure Test;
begin
   TForm1.Create(UniGUIApplication.UniApplication).ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-7672', 'Payroll', 'PR_empNa', 'ShowModal', Test);

end.

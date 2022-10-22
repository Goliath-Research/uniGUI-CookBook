unit WC_7673;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  pr_main;

procedure Test;
begin
   TForm2.Create(UniGUIApplication.UniApplication).ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-7673', 'Payroll', 'pr_main', 'ShowModal', Test);

end.

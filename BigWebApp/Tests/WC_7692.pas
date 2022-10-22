unit WC_7692;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  PRWages;

procedure Test1;
begin
  DoMassWagesUpdate(nil);
end;

initialization

  TTestRepo.RegisterTest('WC-7692', 'Payroll', 'PRWages', 'DoMassWagesUpdate', Test1, 1);

end.

unit WC_7665;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  PRReimb;

procedure Test1;
begin
  DoPayTypesReimb;
end;

initialization

  TTestRepo.RegisterTest('WC-7665', 'Payroll', 'PRReimb', 'DoPayTypesReimb', Test1);

end.

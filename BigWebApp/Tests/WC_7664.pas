unit WC_7664;

interface

implementation

uses
  TestReg,
  PRRL1;

procedure Test1;
begin
  DoPRRL();
end;

initialization

  TTestRepo.RegisterTest('WC_7664', 'Payroll', 'PRRL1', 'DoPRRL', Test1);

end.

unit WC_7667;

interface

implementation

uses
  TestReg,
  PRT4;

procedure Test1;
begin
  DoPRT4();
end;

initialization

  TTestRepo.RegisterTest('WC_7667', 'Payroll', 'PRT4', 'DoPRT4', Test1);

end.

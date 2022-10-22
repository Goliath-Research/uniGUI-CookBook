unit WC_7465;

interface

implementation

uses
  TestReg,
  OECOMM;

procedure Test1;
begin
  DoOECommissionSplit;
end;

initialization

  TTestRepo.RegisterTest('WC-7465', 'Oe', 'OECOMM', 'DoOECommissionSplit', Test1, 1);
end.

unit WC_5177;

interface

implementation

uses
  TestReg,
  uniGUIDialogs,
  StatisticalAllocation;

procedure Test1;
begin
  DoStatAllocSetup(12);
end;

initialization

TTestRepo.RegisterTest('WC-5177', 'Ap', 'StatisticalAllocation', 'DoStatAllocSetup', Test1, 1);

end.

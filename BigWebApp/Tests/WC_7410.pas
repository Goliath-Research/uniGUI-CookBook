unit WC_7410;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  MCChargeTot;

procedure Test1;
begin
  DoMCChargeTotals(46,100,12,8);
end;

initialization

  TTestRepo.RegisterTest('WC-7410', 'Multicur', 'MCChargeTot', 'DoMCChargeTotals', Test1);
end.

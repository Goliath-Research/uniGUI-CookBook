unit WC_6166;

interface

implementation

uses
  TestReg,
  System.Variants,
  Glperiod;

procedure Test1;
begin
  DoPeriods;
end;

procedure Test2;
begin
  DoPeriodsFromIqSys;
end;

initialization

  TTestRepo.RegisterTest('WC-6166', 'Gl', 'FrmDefPeriods', 'DoPeriods', Test1, 1);
  TTestRepo.RegisterTest('WC-6166', 'Gl', 'FrmDefPeriods', 'DoPeriodsFromIqSys', Test2, 2);
end.

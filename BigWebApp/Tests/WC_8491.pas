unit WC_8491;

interface

implementation

uses
  TestReg,
  System.Variants,
  SchdRunsBestChk;

procedure Test1;
begin
  CheckWorkCenterInRunsTheBest(122929, 3582);
end;

initialization

  TTestRepo.RegisterTest('WC-8491', 'Sched', 'FrmSchedWorkCenterRunsBestException', 'CheckWorkCenterInRunsTheBest', Test1);
end.

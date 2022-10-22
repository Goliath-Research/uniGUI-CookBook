unit WC_8973;

interface

implementation

uses
  TestReg,
  System.Variants,
  wc_dup;

procedure Test1;
begin
  WorkCenterHasDuplicatePM;
end;

initialization

  TTestRepo.RegisterTest('WC-8973', 'Workcntr', 'FrmWCDupPm', 'WorkCenterHasDuplicatePM', Test1);
end.

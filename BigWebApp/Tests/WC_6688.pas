unit WC_6688;

interface

implementation

uses
  TestReg,
  System.Variants,
  ExpUsers;

procedure Test1;
begin
  DoExpReportUsers;
end;

initialization

  TTestRepo.RegisterTest('WC-6688', 'Iqexp', 'FrmExpenseReportUsers', 'DoExpReportUsers', Test1);
end.

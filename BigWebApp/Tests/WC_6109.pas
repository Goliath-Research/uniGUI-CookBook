unit WC_6109;

interface

implementation

uses
  TestReg,
  System.Variants,
  Fin_Rpt;

procedure Test1;
begin
  DoFinancialReport;
end;

initialization

  TTestRepo.RegisterTest('WC-6109', 'Fin_Rpt', 'FrmFinancialReport', 'DoFinancialReport', Test1);
end.

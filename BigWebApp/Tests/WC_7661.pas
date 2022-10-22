unit WC_7661;

interface

implementation

uses
  TestReg,
  System.Variants,
  PRPrintC;

procedure Test1;
begin
  PrintPRChecks('tests', 12432,  'testReport', 'testReportDD');
end;

initialization

  TTestRepo.RegisterTest('WC-7661', 'Prod', 'FrmPRPrintCh', 'PrintPRChecks', Test1);
end.

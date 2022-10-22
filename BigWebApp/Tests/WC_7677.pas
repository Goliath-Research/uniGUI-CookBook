unit WC_7677;

interface

implementation

uses
  TestReg,
  System.Variants,
  PrDelPr;

procedure TestDoDeletePayrollPriors;
begin
  DoDeletePayrollPriors;
end;

initialization

  TTestRepo.RegisterTest('WC-7677', 'Payroll', 'PrDelPr', 'DoDeletePayrollPriors', TestDoDeletePayrollPriors);
end.

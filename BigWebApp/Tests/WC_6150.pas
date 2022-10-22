unit WC_6150;

interface

implementation

uses
  TestReg,
  System.Variants,
  BudjetConf;

procedure Test1;
var
  Akind : string;
begin
  Akind := 'Test';
  DoConfirmBudgetRecalc(Akind);
end;

initialization

  TTestRepo.RegisterTest('WC-6150', 'Gl', 'FrmBudgetConfirm', 'DoConfirmBudgetRecalc', Test1);
end.

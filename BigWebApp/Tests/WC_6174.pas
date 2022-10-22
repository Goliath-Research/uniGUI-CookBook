unit WC_6174;

interface

implementation

uses
  TestReg,
  System.Variants,
  glbudinf;

procedure Test1;
begin
  ShowBudgetInfo(192, 59, 59);
end;

initialization

  TTestRepo.RegisterTest('WC-6174', 'Gl', 'FrmBudgInfo', 'ShowBudgetInfo', Test1);
end.

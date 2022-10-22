unit WC_6160;

interface

implementation

uses
  TestReg,
  System.Variants,
  GLReval;

procedure Test1;
begin
  DoAccuntRevaluation;
end;

initialization

  TTestRepo.RegisterTest('WC-6160', 'Gl', 'FrmAcctReval', 'DoAccuntRevaluation', Test1);
end.

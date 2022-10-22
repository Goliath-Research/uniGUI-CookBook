unit WC_6162;

interface

implementation

uses
  TestReg,
  System.Variants,
  GLTrialB;

procedure Test1;
begin
  DoTrialBalance;
end;

initialization

  TTestRepo.RegisterTest('WC-6162', 'Gl', 'FrmTrialBalance', 'DoTrialBalance', Test1);
end.

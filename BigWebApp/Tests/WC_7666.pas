unit WC_7666;

interface

implementation

uses
  TestReg,
  System.Variants,
  PRSelPay;

procedure Test1;
begin
  PRSelectPayGroups;
end;

initialization

  TTestRepo.RegisterTest('WC-7666', 'Prod', 'FrmPRPrintCh', 'PRSelectPayGroups', Test1);
end.

unit WC_6107;

interface

implementation

uses
  TestReg,
  System.Variants,
  ACCT_PK,
  uniGUIApplication;

procedure Test1;
begin
  TAcctTreeViewPk.Create(UniApplication).Show;
end;

initialization

  TTestRepo.RegisterTest('WC-6107', 'Fin_Rpt', 'ACCT_PK', 'Create', Test1);
end.

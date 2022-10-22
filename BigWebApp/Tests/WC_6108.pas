unit WC_6108;

interface

implementation

uses
  TestReg,
  System.Variants,
  Acct_TV;

procedure Test1;
begin
  DoCreate(True);
end;

initialization

  TTestRepo.RegisterTest('WC-6108', 'Fin_Rpt', 'Acct_TV', 'DoCreate', Test1);
end.

unit WC_6139;

interface

implementation

uses
  TestReg,
  System.Variants,
  AcctMask;

procedure Test1;
begin
  DoAcctMask;
end;

initialization

  TTestRepo.RegisterTest('WC-6139', 'Gl', 'FrmAcctMask', 'DoAcctMask', Test1);
end.

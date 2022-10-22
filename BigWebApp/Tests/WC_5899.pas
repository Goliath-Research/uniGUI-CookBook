unit WC_5899;

interface

implementation

uses
  TestReg,
  System.Variants,
  Custord;

procedure Test1;
begin
  DoCustOrd(nil);
end;

initialization

  TTestRepo.RegisterTest('WC-5899', 'Custstat ', 'FrmCustOrders', 'DoCustOrd', Test1);
end.

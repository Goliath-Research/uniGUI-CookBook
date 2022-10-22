unit WC_7428;

interface

implementation

uses
  TestReg,
  System.Variants,
  BillTo;

procedure Test1;
begin
  DoBillTo(56324);
end;

initialization

  TTestRepo.RegisterTest('WC-7428', 'Oe', 'FrmBillTo', 'DoBillTo', Test1);
end.

unit WC_5172;

interface

implementation

uses
  TestReg,
  System.Variants,
  Apvoid;

procedure Test1;
begin
  DoVoidApInvoice(56432, 34564);
end;

initialization

  TTestRepo.RegisterTest('WC-5172', 'Ap', 'FrmVoidApInvoice', 'DoVoidApInvoice', Test1);
end.

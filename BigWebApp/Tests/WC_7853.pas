unit WC_7853;

interface

implementation

uses
  TestReg,
  po_expected_receipts_add ;

procedure Test1;
var
   Cargo: TER_Cargo;
begin
  Cargo := TER_Cargo.create;
  TFrmPOExpectedReceiptsAdd.DoShowModal( Cargo );
end;

initialization

  TTestRepo.RegisterTest('WC-7853', 'PO', 'po_expected_receipts_add', 'DoShowModal', Test1);
end.

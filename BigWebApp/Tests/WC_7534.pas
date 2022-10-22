unit WC_7534;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  EditBTo,
  EditBill;

procedure Test1;
begin
  DoEditBillToShipTo(TFrmEditBillto,  53234);
end;

initialization

  TTestRepo.RegisterTest('WC-7534', 'Packslip', 'FrmEditBillto', 'Create', Test1);
end.

unit WC_7535;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  EditBill;

procedure Test1;
var
  ArcustoID : Real;
begin
  ArcustoID := 153;
  DoEditBillToShipTo(TFrmEditBillToCustom, ArcustoID);
end;

initialization

  TTestRepo.RegisterTest('WC_7535', 'Packslip', 'EditBill', 'DoEditBillToShipTo', Test1);

end.

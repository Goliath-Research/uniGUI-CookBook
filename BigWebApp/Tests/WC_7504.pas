unit WC_7504;

interface

implementation

uses
  TestReg,
  System.Variants,
  oe_quick_ship_locs,
  oe_misc;

procedure Test1;
var
 params : TOEQuickShipLocsCargo;
begin
    params.Orders_id := 5436;
    params.Arinvt_id := 34521;
    params.Oe_UOM    := 'Tests';
  TFrmOEQuickShipLocations.DoShowModal(params);
end;

initialization

  TTestRepo.RegisterTest('WC-7504', 'Ap', 'FrmOEQuickShipLocations', 'DoShowModal', Test1);
end.

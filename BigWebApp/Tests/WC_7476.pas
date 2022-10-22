unit WC_7476;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  ShipAdj;

procedure Test1;
begin
  DoManualShipmentAjustment(5463);
end;

initialization

  TTestRepo.RegisterTest('WC-7476', 'OE', 'ShipAdj', 'DoManualShipmentAjustment', Test1);
end.

unit WC_7478;

interface

implementation

uses
  TestReg,
  System.Variants,
  ShipTo;

procedure Test1;
begin
  DoShipTo(63524);
end;

initialization

  TTestRepo.RegisterTest('WC-7478', 'Oe', 'ShipTo', 'DoShipTo', Test1);
end.

unit WC_7525;

interface

implementation

uses
  TestReg,
  BolPkShip,
  System.Classes;

procedure Test1;
var
  Shipments: TStringList;
  Bol_ID, Picked_By_Arcusto_ID,FilterDivision_ID: Real;
begin
  Shipments := TStringList.Create;
  Bol_ID := 137;
  Picked_By_Arcusto_ID := 0;
  FilterDivision_ID := 0;
  DoBolPickShip(Shipments, Bol_ID, Picked_By_Arcusto_ID,FilterDivision_ID );
end;

initialization

  TTestRepo.RegisterTest('WC-7525', 'Packslip', 'BolPkShip', 'DoBolPickShip', Test1);

end.

unit WC_7447;

interface

implementation

uses
  TestReg,
  OERelAct;

procedure Test1;
var
  OrddetailID:Real;
begin
  OrddetailID := 530;
  DoShowReleasesActivity( OrddetailID );
end;

initialization

  TTestRepo.RegisterTest('WC-7447', 'OE', 'OERelAct', 'DoShowReleasesActivity', Test1);
end.

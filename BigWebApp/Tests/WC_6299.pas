unit WC_6299;
// WC-6299 Inv - Location
interface

implementation

uses
  MainModule,
  UniGUIApplication,
  TestReg,
  Location;

procedure Test;
begin
   TLocationsTable.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC-6299', 'Inv', 'Location', 'DoShow', Test);

end.

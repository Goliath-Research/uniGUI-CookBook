unit WC_6340;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  inv_by_loc;

procedure Test;
begin
  TFrmInventoryByLocations.DoShow(567);
end;

initialization
  TTestRepo.RegisterTest('WC-6340', 'Inv', 'inv_by_loc', 'DoShow', Test);
end.

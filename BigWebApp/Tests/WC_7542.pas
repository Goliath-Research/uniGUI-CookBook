unit WC_7542;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  NoShipChk;

procedure Test1;
begin
  CheckLocationForNoShip(188498);
end;

initialization

  TTestRepo.RegisterTest('WC-7542', 'Packslip', 'NoShipChk', 'CheckLocationForNoShip', Test1);

end.

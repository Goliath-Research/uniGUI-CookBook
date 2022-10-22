unit WC_7477;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  ShipExistsChk;

procedure Test;
begin
  CheckShipmentsExists(20239);
end;

initialization

  TTestRepo.RegisterTest('WC-7477', 'Oe', 'ShipExistsChk', 'CheckShipmentsExists', Test);

end.

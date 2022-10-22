unit WC_9002;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  wo_chk_expired_lot_location;

procedure Test;
begin

  CheckExpiredLotLocation(26);
end;

initialization

  TTestRepo.RegisterTest('WC-9002', 'Wrkorder', 'wo_chk_expired_lot_location', 'CheckExpiredLotLocation', Test);

end.

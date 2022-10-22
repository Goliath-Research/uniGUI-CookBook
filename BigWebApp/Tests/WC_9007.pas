unit WC_9007;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  wo_chk_shelf_life;

procedure Test1;
begin
  CheckShelfLifeExpired(1);
end;

initialization

  TTestRepo.RegisterTest('WC-9007', 'Wrkorder', 'wo_chk_shelf_life', 'CheckShelfLifeExpired', Test1, 1);

end.

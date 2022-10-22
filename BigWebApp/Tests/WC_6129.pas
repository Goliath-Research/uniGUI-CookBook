unit WC_6129;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  GJFX;

procedure Test1;
var
  R: Real;
begin
  R := 1;
  ShowMessage(BoolToStr(DoGJFX(1127, R), True));
end;

initialization

TTestRepo.RegisterTest('WC-6129', 'Gj', 'GJFX', 'DoGJFX', Test1, 1);

end.

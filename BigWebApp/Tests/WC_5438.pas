unit WC_5438;
// WC-5438 Cd - CD_Main
interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  CD_Main;

procedure Test1;
begin
  DoIQCD;
end;

initialization

  TTestRepo.RegisterTest('WC-5438', 'Cd', 'Cd_Main', 'DoIQCD', Test1,1);

end.

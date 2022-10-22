unit WC_5437;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  CDView;

procedure Test1;
begin
  DoJumptoCD(420);
end;

initialization

  TTestRepo.RegisterTest('WC-5437', 'Cd', 'CDView', 'DoJumptoCD', Test1,1);

end.

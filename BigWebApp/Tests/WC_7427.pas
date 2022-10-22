unit WC_7427;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  AutoCum;

procedure Test1;
begin
  DoAutoCum;
end;

initialization

  TTestRepo.RegisterTest('WC_7427', 'Oe', 'AutoCum', 'DoAutoCum', Test1);
end.

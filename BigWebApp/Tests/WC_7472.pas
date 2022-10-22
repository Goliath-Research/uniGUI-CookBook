unit WC_7472;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  RevControl;

procedure Test;
begin
  DoRevControl(21759);
end;

initialization

  TTestRepo.RegisterTest('WC-7472', 'Oe', 'RevControl', 'DoRevControl', Test);

end.

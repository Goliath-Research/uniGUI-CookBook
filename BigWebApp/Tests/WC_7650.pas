unit WC_7650;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  PR941;

procedure Test;
begin
  DoPR941;
end;

initialization

  TTestRepo.RegisterTest('WC-7650', 'Payroll', 'PR941', 'DoPR941', Test);

end.

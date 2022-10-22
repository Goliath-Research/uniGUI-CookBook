unit WC_7706;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  PRWC;

procedure Test1;
begin
  DoWCComp;
end;

initialization

  TTestRepo.RegisterTest('WC-7706', 'Payroll', 'PRWC', 'DoWCComp', Test1);

end.

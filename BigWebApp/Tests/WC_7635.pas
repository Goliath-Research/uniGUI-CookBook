unit WC_7635;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  AccrueSched;

procedure Test1;
begin
  DoAccrueSched
end;

initialization

  TTestRepo.RegisterTest('WC-7635', 'Payroll', 'AccrueSched', 'DoAccrueSched', Test1);

end.

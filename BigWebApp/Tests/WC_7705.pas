unit WC_7705;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  PrW2;

procedure Test1;
begin
  DoPRW2;
end;

initialization

  TTestRepo.RegisterTest('WC-7705', 'Payroll', 'PrW2', 'DoPRW2', Test1);

end.

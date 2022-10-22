unit WC_7669;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  PRW2Custom;

procedure Test1;
begin
  DoPRW2Custom(34521 , '', '');
end;

initialization

  TTestRepo.RegisterTest('WC-7669', 'Payroll', 'PRW2Custom', 'DoPRW2Custom', Test1);

end.

unit WC_7680;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  PrEin;

procedure Test1;
begin
  DoEin(nil);
end;

initialization

  TTestRepo.RegisterTest('WC-7680', 'Payroll', 'PrEin', 'DoEin', Test1, 1);

end.

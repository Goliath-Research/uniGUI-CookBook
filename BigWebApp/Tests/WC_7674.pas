unit WC_7674;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  PR941yr;

procedure Test;
var
  a : Boolean;
  b,c : Integer;
  d : Real;
begin
  a := True;
  b := 2016;
  c := 1;
  d := 1;
  Get941Year(a,b,c,d);
end;

initialization

  TTestRepo.RegisterTest('WC-7674', 'Payroll', 'PR941yr', 'Get941Year', Test);

end.

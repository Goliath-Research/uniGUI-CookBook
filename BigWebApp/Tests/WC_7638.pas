unit WC_7638;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  EditMap;

procedure Test1;
begin
  DoEditMap(158);
end;

initialization

  TTestRepo.RegisterTest('WC-7638', 'Payroll', 'EditMap', 'DoEditMap', Test1, 1);

end.

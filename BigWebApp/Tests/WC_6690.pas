unit WC_6690;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  exptypes;

procedure Test1;
begin
  DoExpenseTypes;
end;

initialization

  TTestRepo.RegisterTest('WC-6690', 'Iqexp', 'exptypes', 'DoExpenseTypes', Test1, 1);

end.

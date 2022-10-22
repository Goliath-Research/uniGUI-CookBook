unit WC_8293;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  LbrOvrHd;

procedure Test1;
begin
  DoLaborOverHead(1,1);
end;

initialization

  TTestRepo.RegisterTest('WC-8293', 'Rma', 'LbrOvrHd', 'DoLaborOverHead', Test1, 1);

end.

unit WC_8964;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  WC_Where;

procedure Test1;
begin
  DoShowWorkCenterTypeWhereUsed(1);
end;

initialization

  TTestRepo.RegisterTest('WC-8964', 'Workcntr', 'WC_Where', 'DoShowWorkCenterTypeWhereUsed', Test1, 1);

end.

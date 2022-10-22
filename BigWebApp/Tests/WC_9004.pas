unit WC_9004;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  wo_chk_jobshop2;

procedure Test1;
begin
  CheckWorkorderInJobshop2(1);
end;

initialization

  TTestRepo.RegisterTest('WC-9004', 'Wrkorder', 'wo_chk_jobshop2', 'CheckWorkorderInJobshop2', Test1, 1);

end.

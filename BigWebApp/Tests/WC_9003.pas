unit WC_9003;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  wo_chk_intransit;

procedure Test1;
begin
  CheckWorkorderInTransit(92389);
end;

initialization

  TTestRepo.RegisterTest('WC-9003', 'Wrkorder', 'wo_chk_intransit', 'CheckWorkorderInTransit', Test1, 1);

end.

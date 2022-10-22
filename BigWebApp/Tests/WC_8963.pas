unit WC_8963;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  WC_PM;

procedure Test1;
begin
  DoWorkCenterPMInfo(1);
end;

procedure Test2;
var
  R: Real;
begin
  R := 3;
  if DoWorkCenterPMInfoEx(R) then
    Showmessage(FloatToStr(R)) else
    Showmessage('Cancelled');
end;

initialization

  TTestRepo.RegisterTest('WC-8963', 'Workcntr', 'WC_PM', 'DoWorkCenterPMInfo', Test1, 1);
  TTestRepo.RegisterTest('WC-8963', 'Workcntr', 'WC_PM', 'DoWorkCenterPMInfoEx', Test2, 2);

end.

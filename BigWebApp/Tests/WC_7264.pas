unit WC_7264;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  tl_calc_task_dates;

procedure TestTFrmTLCalcTaskDates;
begin
  DoCalculateTaskDates(545, 25/04/2015, 24/08/2016);
end;

initialization

  TTestRepo.RegisterTest('WC-7264', 'Iqtool', 'tl_calc_task_dates', 'DoCalculateTaskDates', TestTFrmTLCalcTaskDates);

end.

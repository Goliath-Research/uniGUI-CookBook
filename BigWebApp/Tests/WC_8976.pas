unit WC_8976;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  wc_pm_workorders;

procedure Test1;
begin
  TFrmWorkCenterPMWorkorders.DoShow(0);
end;

initialization

  TTestRepo.RegisterTest('WC-8976', 'Workcntr', 'wc_pm_workorders', 'DoShow', Test1, 1);

end.

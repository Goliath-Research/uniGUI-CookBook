unit WC_7796;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  System.Classes,
  pm_types,
  pm_period_wo;

procedure TestTFrmPMPeriodWorkorders;
begin
  TFrmPMPeriodWorkorders.DoShow(24563, cwWeekly, 25/04/2015, 526,'TEST');
end;

initialization

  TTestRepo.RegisterTest('WC-7796', 'PM', 'pm_period_wo', 'DoShow', TestTFrmPMPeriodWorkorders);

end.

unit WC_7804;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  pm_select_task;

procedure TestTFrmPmSelectTask;
var APMJobID: Real;
begin
  APMJobID := 258;
  SelectEquipmentTask(APMJobID);
end;

initialization

  TTestRepo.RegisterTest('WC-7804','PM', 'pm_select_task', 'SelectEquipmentTask', TestTFrmPmSelectTask);

end.

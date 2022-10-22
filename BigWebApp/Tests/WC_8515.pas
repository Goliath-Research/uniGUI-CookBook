unit WC_8515;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  sched_sec_conf_sched_info;

procedure Test1;
var
 Form: TFrmSecuredConfirmSchedInfo;
begin
   Form := TFrmSecuredConfirmSchedInfo.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-8515', 'Sched', 'sched_sec_conf_sched_info', 'create', Test1);
end.

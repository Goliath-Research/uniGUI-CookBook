unit WC_8518;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  secured_confirm_sched_run_hold;

procedure Test1;
var
 Form: TFrmSecuredConfirmSchedRunHold;
begin
   Form := TFrmSecuredConfirmSchedRunHold.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-8518', 'Sched', 'secured_confirm_sched_run_hold', 'create', Test1);
end.

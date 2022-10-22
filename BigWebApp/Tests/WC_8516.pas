unit WC_8516;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  sched_sec_conf_wo_finished;

procedure Test1;
var
 Form: TFrmSecuredConfirmWoFinished;
begin
   Form := TFrmSecuredConfirmWoFinished.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-8516', 'Sched', 'sched_sec_conf_wo_finished', 'create', Test1);
end.

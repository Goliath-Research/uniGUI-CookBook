unit WC_7739;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  PM_clonetaskprompt;

procedure TestTFrmCloneTaskPrompt;
var
  Test : TCloneTaskRecord;
begin
    Test.CurrentPM_TASK_ID := 85255;
    Test.CurrentTaskNo := 'IQMS';
    Test.CurrentTaskDescrip := 'DESC';
    Test.NewTaskNo := 'TEST';
    Test.NewTaskDescrip := 'IQMS';
    Test.IncludeSkills := TRUE;
    Test.IncludeInternalDoc := TRUE;
    Test.IncludeExternalDoc := TRUE;
    Test.IncludeEMailCorr := TRUE;
    Test.EPLANT_ID := 53565;
   DoClonePMTaskPrompt(Test);
end;

initialization

  TTestRepo.RegisterTest('WC-7739','PM', 'PM_clonetaskprompt', 'DoWOTypes', TestTFrmCloneTaskPrompt);

end.

unit WC_6761;

interface

implementation

uses
  TestReg,
  System.Variants,
  hr_app_wf_filter,
  uniGUIApplication;

procedure Test1;
begin
  TFrmHrAppWorkflowFilter.Create(uniGUIApplication.UniApplication).ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-6761', 'Iqhr ', 'FrmHrAppWorkflowFilter ', 'create', Test1);
end.

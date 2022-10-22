unit WC_7327;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  wf_clone_tmpl;

procedure Test1;
var
  AChildTables : array of string;
begin
  AChildTables := ['WF_RESPONSIBILITY', 'WF_ELEMENT_ID'];
  TFrmCloneWorkflowTemplate.Execute(17, 'WF_TYPE', 'WF_TYPE_ELEMENT', AChildTables);
end;

initialization

  TTestRepo.RegisterTest('WC-7327', 'Iqworkflow', 'FrmCloneWorkflowTemplate', 'Execute', Test1);

end.

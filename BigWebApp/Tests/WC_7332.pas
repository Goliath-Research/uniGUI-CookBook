unit WC_7332;

interface

implementation

uses
  TestReg,
  wf_const,
  wf_filter;

procedure TestWorkflowFilter;
var
  WorkflowFilter : TWorkflowFilter;
begin
  WorkflowFilter.Showing := wsOpen;
  TFrmWorkflowFilter.DoModify(WorkflowFilter);
end;

initialization

  TTestRepo.RegisterTest('WC-7332', 'Iqworkflow', 'wf_filter', 'DoApRecDrillDown', TestWorkflowFilter);

end.

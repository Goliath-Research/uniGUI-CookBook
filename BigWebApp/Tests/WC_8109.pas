unit WC_8109;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  wf_const,
  qc_mrb_filter;

procedure TestDoShow;
var
AWorkflowFilter : TWorkflowFilter;
begin
      AWorkflowFilter.Kind := 'test';
      AWorkflowFilter.Arcusto_ID:= 44;
      AWorkflowFilter.Vendor_ID := 54;
      AWorkflowFilter.Showing   := wsAll;
      AWorkflowFilter.Wording   := 'test';
      AWorkflowFilter.PR_Emp_ID := 56;
      AWorkflowFilter.HR_App_ID := 32;
      TFrmWorkflowFilterMRB.DoModify(AWorkflowFilter);
end;

initialization

  TTestRepo.RegisterTest('WC-8109', 'Qc_Mrb', 'qc_mrb_filter', 'DoModify', TestDoShow);

end.

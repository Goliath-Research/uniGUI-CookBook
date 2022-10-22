unit WC_5181;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  wf_const,
  wf_filter,
  ap_wf_filter;

procedure Test1;
var
  AFilter : TWorkflowFilter;
begin
  if TFrmWorkflowFilterAP.DoModify(AFilter) then
    ShowMessage(Format('Kind=%s, Arcusto_ID=%f, Vendor_ID=%f, Wording=%s, PR_Emp_ID=%f, HR_App_ID=%f',
        [
          AFilter.Kind,
          AFilter.Arcusto_ID,
          AFilter.Vendor_ID,
          AFilter.Wording,
          AFilter.PR_Emp_ID,
          AFilter.HR_App_ID
        ]));
end;

initialization

  TTestRepo.RegisterTest('WC-5181', 'Ap', 'FrmWorkflowFilterAP', 'DoModify', Test1);

end.

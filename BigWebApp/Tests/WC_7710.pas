unit WC_7710;

interface

implementation

uses
  TestReg,
  System.Variants,
  pr_emp_wf_filter,
  uniGUIApplication;

procedure Test1;
begin
  TFrmPrEmpWorkflowFilter.Create(uniGUIApplication.UniApplication).Show;
end;

initialization

  TTestRepo.RegisterTest('WC-7710', 'Payroll', 'FrmPrEmpWorkflowFilter', 'Create', Test1);
end.

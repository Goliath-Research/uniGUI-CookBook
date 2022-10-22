unit WC_8058;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication, wf_const,
  qc_dev_wf_filter;

procedure Test1;
var AFilter: TWorkflowFilter ;
begin
  TFrmWorkflowFilterDev.DoModify( AFilter)
end;

initialization

  TTestRepo.RegisterTest('WC-8058', 'Qc_Dev ', 'qc_dev_wf_filter', 'DoModify', Test1);

end.

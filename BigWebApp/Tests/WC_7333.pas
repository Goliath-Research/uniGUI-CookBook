unit WC_7333;

interface

implementation

uses
  TestReg,
  System.Variants,
  wf_filter_ex,
  wf_const;

procedure Test1;
var
  AFilter: TWorkflowFilter;
begin
  AFilter.Kind := '';
  AFilter.Arcusto_ID := 23413;
  AFilter.Vendor_ID  := 34342;
  TFrmWorkflowFilterEx.DoModify(AFilter);
end;

initialization

  TTestRepo.RegisterTest('WC-7333', 'Iqworkflow', 'FrmWorkflowFilterEx', 'DoModify', Test1);
end.

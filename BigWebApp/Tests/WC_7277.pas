unit WC_7277;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  tl_rep_labor_by_emp;

procedure TestTFrmToolingReportLaborByEmployee;
begin
  TFrmToolingReportLaborByEmployee.DoShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-7277', 'Iqtool', 'tl_rep_labor_by_emp', 'DoShowModal', TestTFrmToolingReportLaborByEmployee);

end.

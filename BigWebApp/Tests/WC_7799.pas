unit WC_7799;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  pm_quickadd_labor_filter;

procedure TestTFrmPMQuickAddLaborFilter;
var
  Test : TPMQuickAddLaborFilter;
begin
    Test.WorkOrderID := 25;
    Test.WorkOrderDate := 25/05/2015;
    Test.WorkOrderDetailID := 852;
    Test.WorkOrderTaskNo := 'TestId';
    Test.WorkOrderTaskDescription := 'Desc';
    Test.EmployeeID := 74;
    Test.EmployeeNo := '42';
    Test.EmployeeName := 'IQMS';
    Test.DetailNumber := '421';
    Test.Hours := 56;
    Test.ChargeRate := 55;
  DoPMLaborQuickAddFilter(Test);
end;

initialization

  TTestRepo.RegisterTest('WC-7799', 'PM', 'pm_quickadd_labor_filter', 'DoPMLaborQuickAddFilter', TestTFrmPMQuickAddLaborFilter);

end.

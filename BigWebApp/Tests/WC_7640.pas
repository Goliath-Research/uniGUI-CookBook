unit WC_7640;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Emp_Level;

procedure Test1;
begin
  TFrmEmpLevel.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC-7640', 'Payroll', 'Emp_Level', 'DoShow', Test1, 1);

end.

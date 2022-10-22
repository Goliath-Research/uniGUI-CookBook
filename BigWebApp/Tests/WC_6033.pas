unit WC_6033;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  EmpHours;

procedure TestDoShow;
begin
   DoEmpHours(45);
end;

initialization
  TTestRepo.RegisterTest('WC-6033', 'Employee',  'EMPHOURS', 'DoEmpHours', TestDoShow);
end.

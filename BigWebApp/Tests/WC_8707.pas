unit WC_8707;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  taSelEmp_V;

procedure TestTFrmTASelEmpViol;
begin
  GetEmp(22,'TRUE');
end;

initialization
  TTestRepo.RegisterTest('WC-8707', 'Ta', 'taSelEmp_V', 'GetEmp', TestTFrmTASelEmpViol);
end.

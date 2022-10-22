unit WC_8675;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  TaEmpId;

procedure TestTFrmGetEmpId;
begin
  TaGetEmpId;
end;

initialization
  TTestRepo.RegisterTest('WC-8675', 'Ta',  'TaEmpId', 'TaGetEmpId', TestTFrmGetEmpId);
end.

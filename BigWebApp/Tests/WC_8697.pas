unit WC_8697;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  TAEmpPR;

procedure TestTFrmTASelEmpPR;
begin
  DoTAEmpPR;
end;

initialization
  TTestRepo.RegisterTest('WC-8697', 'Ta', 'TAEmpPR', 'DoTAEmpPR', TestTFrmTASelEmpPR);
end.

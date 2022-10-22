unit WC_8700;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  TAPostPR;

procedure TestTFrmTAPostPayroll;
begin
  DoTAPostPR('456');
end;

initialization
  TTestRepo.RegisterTest('WC-8700', 'Ta', 'TAPostPR', 'DoTAPostPR', TestTFrmTAPostPayroll);
end.

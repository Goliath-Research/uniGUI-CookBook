unit WC_7539;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  NMFC;

procedure TestTFrmNMFC;
begin
  DoNMFC;
end;

initialization
  TTestRepo.RegisterTest('WC-7539', 'Packslip',  'NMFC', 'DoNMFC', TestTFrmNMFC);
end.

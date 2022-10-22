unit WC_8704;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Taprshft;

procedure TestTFrmEmpPrePostShiftSched;
begin
  DoShowEmplPrepostShiftSched(201,08/04/2016);
end;

initialization
  TTestRepo.RegisterTest('WC-8704', 'Ta', 'Taprshft', 'DoShowEmplPrepostShiftSched', TestTFrmEmpPrePostShiftSched);
end.

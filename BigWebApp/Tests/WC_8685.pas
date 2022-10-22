unit WC_8685;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  TaPattern;

procedure TestTFrmTaPattern;
begin
  DoTaPattern(44);
end;

initialization
  TTestRepo.RegisterTest('WC-8685', 'Ta', 'TaPattern', 'DoTaPattern', TestTFrmTaPattern);
end.

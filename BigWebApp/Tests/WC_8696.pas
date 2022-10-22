unit WC_8696;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  TADeflts;

procedure TestTFrmTADefaults;
begin
  DoTADefaults;
end;

initialization
  TTestRepo.RegisterTest('WC-8696', 'Ta',  'TADeflts', 'DoTADefaults', TestTFrmTADefaults);
end.

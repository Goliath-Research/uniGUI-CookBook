unit WC_7221;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  AttachedLaborProperties;

procedure TestTFrmTLAttachedLaborProperties;
begin
  DoShowLaborProperties(235);
end;

initialization

  TTestRepo.RegisterTest('WC-7221', 'Iqtool', 'AttachedLaborProperties', 'DoShowLaborProperties', TestTFrmTLAttachedLaborProperties);

end.

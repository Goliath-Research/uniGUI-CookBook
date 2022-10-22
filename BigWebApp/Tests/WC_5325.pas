unit WC_5325;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  BomConfReplRG;

procedure TestTFrmBomConfReplaceRG;
var
  Test : Boolean;
begin
  Test := True;
  ConfirmReplaceRegrind(23,12,Test);
end;

initialization

  TTestRepo.RegisterTest('WC-5325', 'Bom', 'BomConfReplRG', 'ConfirmReplaceRegrind', TestTFrmBomConfReplaceRG);

end.

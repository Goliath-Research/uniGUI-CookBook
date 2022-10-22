unit WC_7492;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  oe_generated_manual_wo;

procedure TestTFrmOEGeneratedManualWorkorders;
begin
  TFrmOEGeneratedManualWorkorders.DoShow(1120);
end;

initialization

  TTestRepo.RegisterTest('WC-7492', 'Oe', 'oe_generated_manual_wo', 'DoShow', TestTFrmOEGeneratedManualWorkorders);

end.

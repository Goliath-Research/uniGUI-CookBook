unit WC_5992;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  dispo_sec_conf_zero_material;

procedure TestTFrmDispoSecConfZeroMaterial;
var
  Form : TFrmDispoSecConfZeroMaterial;
begin
  Form := TFrmDispoSecConfZeroMaterial.Create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC_5992', 'Dispo', 'dispo_sec_conf_zero_material', 'Create', TestTFrmDispoSecConfZeroMaterial);
end.

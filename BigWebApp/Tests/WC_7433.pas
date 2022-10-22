unit WC_7433;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  CheckShiptoTaxCode;

procedure TestTFrmCheckShipToTaxCode;
begin
  TFrmCheckShipToTaxCode.Create(UniGUIApplication.UniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-7433', 'Oe', 'CheckShiptoTaxCode', 'Create', TestTFrmCheckShipToTaxCode);

end.

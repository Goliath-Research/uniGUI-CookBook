unit WC_5990;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  dispo_sec_conf_over_consume_qty_percent;

procedure TestTFrmDispoSecuredConfirmOverConsumeQtyPercent;
var
  Form: TFrmDispoSecuredConfirmOverConsumeQtyPercent;
begin
  Form := TFrmDispoSecuredConfirmOverConsumeQtyPercent.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC_5990', 'Dispo', 'dispo_sec_conf_over_consume_qty_percent', 'Create', TestTFrmDispoSecuredConfirmOverConsumeQtyPercent);
end.

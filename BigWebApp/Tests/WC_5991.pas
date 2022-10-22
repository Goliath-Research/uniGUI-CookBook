unit WC_5991;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  dispo_sec_conf_over_consume_regrind_percent;

procedure TestFrmDispoSecuredConfirmOverConsumeRegrindPercent;
var
  Form : TFrmDispoSecuredConfirmOverConsumeRegrindPercent;
begin
  Form := TFrmDispoSecuredConfirmOverConsumeRegrindPercent.Create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC_5991', 'Dispo', 'dispo_sec_conf_over_consume_regrind_percent', 'Create', TestFrmDispoSecuredConfirmOverConsumeRegrindPercent);
end.

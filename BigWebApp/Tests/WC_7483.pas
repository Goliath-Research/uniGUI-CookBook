unit WC_7483;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  oe_conf_lead_days;

procedure TestTTOEConfirmLeadDays;
begin
  TOEConfirmLeadDays.Create(UniGUIApplication.UniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-7483', 'Oe', 'oe_conf_lead_days', 'TestTTOEConfirmLeadDays', TestTTOEConfirmLeadDays);

end.

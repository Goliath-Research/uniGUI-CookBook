unit WC_7420;

interface

implementation

uses
  TestReg,
  System.Variants,
  Mccqttot,
  uniGUIApplication;

procedure Test1;
var
  FrmMCCRMQuoteTotals : TFrmMCCRMQuoteTotals;
begin
  FrmMCCRMQuoteTotals := TFrmMCCRMQuoteTotals.Create(uniGUIApplication.UniApplication);
  FrmMCCRMQuoteTotals.ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-7420', 'Multicur', 'FrmMCCRMQuoteTotals', 'Create', Test1);
end.

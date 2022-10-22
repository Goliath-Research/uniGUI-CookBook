unit WC_7489;

interface

implementation

uses
  TestReg,
  System.Variants,
  oe_estimate_bol_crmquote,
  uniGUIApplication;

procedure Test1;
begin
  TFrmEstimateBOLCRMQuote.Create(uniGUIApplication.UniApplication).Show;
end;

initialization

  TTestRepo.RegisterTest('WC-7489', 'Oe', 'FrmEstimateBOLCRMQuote', 'Create', Test1);
end.

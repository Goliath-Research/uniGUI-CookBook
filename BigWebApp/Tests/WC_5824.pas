unit WC_5824;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  crmconvprospect_dlg;

procedure TestTFrmConvertProspectDlg;
begin
PromptConvertCRMProspectForQuote;
end;

initialization

  TTestRepo.RegisterTest('WC_5824', 'Crm_Quote', 'crmconvprospect_dlg', 'PromptConvertCRMProspectForQuote', TestTFrmConvertProspectDlg);
end.

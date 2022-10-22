unit WC_5819;

interface

implementation

uses
  TestReg,
  crm_soconfig_summary;

procedure Test1;
var
  CRMQuoteDetailID: Real;
begin
  CRMQuoteDetailID := 177;
  ShowSalesConfigSummary(CRMQuoteDetailID) ;
end;

initialization

  TTestRepo.RegisterTest('WC-5819', 'CRM_Quote', 'crm_soconfig_summary', 'ShowSalesConfigSummary', Test1);

end.

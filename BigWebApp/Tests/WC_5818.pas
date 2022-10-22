unit WC_5818;

interface

implementation

uses
  TestReg,
  crm_soconfig_pkchoice;

procedure TestDoSelectChoiceItem;
var
  CRMQuoteID, CRMQuoteDetailID: Int64;
  Event: TSelectSalesChoiceItemEvent;
  MultiSelect: Boolean;
begin
  CRMQuoteID := 772;
  CRMQuoteDetailID := 221;
  DoSelectChoiceItem(CRMQuoteID, CRMQuoteDetailID, Event, MultiSelect);
end;

initialization

  TTestRepo.RegisterTest('WC-5818', 'Crm', 'crm_soconfig_pkchoice', 'DoSelectChoiceItem', TestDoSelectChoiceItem);

end.

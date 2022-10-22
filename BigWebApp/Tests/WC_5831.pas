unit WC_5831;

interface

implementation

uses
  TestReg,
  crmquotemisc;

procedure Test1;
var
  MiscItemInfo: TMiscItemInfo;
begin
  AddMiscCRMQuoteItem(MiscItemInfo);
end;

initialization

  TTestRepo.RegisterTest('WC-5831', 'Crm_Quote', 'crmquotemisc', 'AddMiscCRMQuoteItem', Test1);

end.

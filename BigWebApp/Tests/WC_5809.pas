unit WC_5809;

interface

implementation

uses
  TestReg,
  crm_soconfig_check,
  Dialogs,
  System.SysUtils;

procedure Test1;
var
  CRMQuoteID: Real;
begin
  CRMQuoteID:= 73;
  if CheckOptionSalesConfigItems(CRMQuoteID) then
    Showmessage('CRM Quote ID : ' + Floattostr(CRMQuoteID));
end;

initialization

  TTestRepo.RegisterTest('WC-5809', 'CRM_Quote', 'crm_soconfig_check', 'CheckOptionSalesConfigItems', Test1);

end.

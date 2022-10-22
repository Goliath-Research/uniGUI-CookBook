unit WC_5820;

interface

implementation

uses
  TestReg,
  crm_soconfig_whereused_choice,
  Dialogs,
  System.SysUtils;

procedure Test1;
var
  SalesChoiceID: Real;
  SelectedChoiceID: Real;
begin
  SalesChoiceID := 47;
  if DoCRMSalesConfigChoiceWhereUsed(SalesChoiceID, SelectedChoiceID)then
    Showmessage('Sales Choice ID: '+ Floattostr(SalesChoiceID) + #13 + 'Selected Choice ID: ' + Floattostr(SelectedChoiceID));
end;

initialization

  TTestRepo.RegisterTest('WC-5820', 'CRM_Quote', 'crm_soconfig_whereused_choice', 'DoCRMSalesConfigChoiceWhereUsed', Test1);

end.

unit WC_5813;

interface

implementation

uses
  TestReg,
  crm_soconfig_choices;

procedure Test1;
begin
  TFrmSalesConfigChoices.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC-5813', 'CRM_Quote', 'crm_soconfig_choices', 'DoShow', Test1);

end.

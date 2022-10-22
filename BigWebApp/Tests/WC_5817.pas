unit WC_5817;

interface

implementation

uses
  TestReg,
  crm_soconfig_options;

procedure Test1;
begin
  DoSalesConfigOptions;
end;

initialization

  TTestRepo.RegisterTest('WC-5817', 'CRM_Quote', 'crm_soconfig_options', 'DoSalesConfigOptions', Test1);

end.

unit WC_5808;

interface

implementation

uses
  TestReg,
  crm_soconfig_attributes;

procedure Test1;
begin
  TFrmSalesConfigAttributes.DoShow();
end;

initialization

  TTestRepo.RegisterTest('WC-5808', 'CRM_Quote', 'crm_soconfig_attributes', 'DoShow', Test1);

end.

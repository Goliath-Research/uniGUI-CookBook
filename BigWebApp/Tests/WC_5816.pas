unit WC_5816;

interface

implementation

uses
  TestReg,
  crm_soconfig_option_attributes;

procedure Test1;
var
  Sales_Option_ID: Integer;
begin
  Sales_Option_ID := 72;
  TFrmSalesConfigOptionAttributes.DoShowModal(Sales_Option_ID);
end;

initialization

  TTestRepo.RegisterTest('WC-5816', 'CRM_Quote', 'crm_soconfig_option_attributes', 'DoShowModal', Test1);

end.

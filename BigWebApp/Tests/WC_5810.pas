unit WC_5810;

interface

implementation

uses
  TestReg,
  crm_soconfig_choice_attributes;

procedure Test1;
var
  Sales_Option_Choice_ID: Integer;
begin
  Sales_Option_Choice_ID:= 378;
  TFrmSalesConfigChoiceAttributes.DoShowModal(Sales_Option_Choice_ID);
end;

initialization

  TTestRepo.RegisterTest('WC-5810', 'CRM_Quote', 'crm_soconfig_choice_attributes', 'DoShowModal', Test1);

end.

unit WC_5821;

interface

implementation

uses
  TestReg,
  crm_soconfigsel;

procedure Test1;
var
  Res: Boolean;
  RequestedDate, PromisedDate: TDateTime;
  TemplateID: Real;
begin
  Res := DoSelectSalesConfigurationTemplate(TemplateID, RequestedDate, PromisedDate);
end;

initialization

  TTestRepo.RegisterTest('WC-5821', 'Crm_Quote', 'crm_soconfigsel', 'DoSelectSalesConfigurationTemplate', Test1);

end.

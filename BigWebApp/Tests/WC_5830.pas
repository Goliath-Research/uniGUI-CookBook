unit WC_5830;

interface

implementation

uses
  TestReg,
  crmquoteaddcust,
  uniGUIApplication;

procedure Test1;
var
  FrmCRMQuoteAddCustomer: TFrmCRMQuoteAddCustomer;
begin
  FrmCRMQuoteAddCustomer := TFrmCRMQuoteAddCustomer.create(uniGUIApplication.UniApplication );
end;

initialization

  TTestRepo.RegisterTest('WC-5830', 'Crm_Quote', 'crmquoteaddcust', 'FormCreate', Test1);
end.

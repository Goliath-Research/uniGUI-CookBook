unit WC_5610;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  crm_addcustomer;

procedure Test1;
begin
  TFrmCrmAddCustomer.Create(UniGUIApplication.UniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-5610', 'Crm', 'crm_addcustomer','Create', Test1);

end.

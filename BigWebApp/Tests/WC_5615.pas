unit WC_5615;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  crm_addvendorcontact;

procedure Test1;
var
  VendorID: Real ;
begin
  VendorID := 46590;
  DoGetQuickVendorContact(VendorID);
end;

initialization

  TTestRepo.RegisterTest('WC-5615', 'Crm', 'crm_addvendorcontact','DoGetQuickVendorContact', Test1);

end.

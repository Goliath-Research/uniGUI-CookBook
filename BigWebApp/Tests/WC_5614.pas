unit WC_5614;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  crm_addpartnercontact;

procedure Test1;
var
  PartnerID: Real;
begin
  PartnerID := 198;
  DoGetQuickPartnerContact(PartnerID);
end;

initialization

  TTestRepo.RegisterTest('WC-5614', 'Crm', 'crm_addpartnercontact','DoGetQuickPartnerContact', Test1);

end.

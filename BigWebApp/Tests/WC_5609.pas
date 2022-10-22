unit WC_5609;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  crm_addcontact;

procedure Test1;
var
  ArcustoID: Real;
begin
  ArcustoID := 20147;
  DoGetQuickContact(ArcustoID);
end;

initialization

  TTestRepo.RegisterTest('WC-5609', 'Crm', 'crm_addcontact','DoGetQuickContact', Test1);

end.

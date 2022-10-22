unit WC_5852;

interface

implementation

uses
  TestReg,
  crmword_prop;

procedure Test1;
var
  CRMWordDocID: Real;
begin
  CRMWordDocID := 19;
  DoDocProperties(CRMWordDocID);
end;

initialization

  TTestRepo.RegisterTest('WC-5852', 'CRM_Word', 'crmword_prop', 'DoDocProperties', Test1);

end.

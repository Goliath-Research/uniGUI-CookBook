unit WC_5787;

interface

implementation

uses
  TestReg,
  crm_partner_duplicates;

procedure Test1;
var
  AClass : String;
begin
  CancelIfPartnerExists(20396);
end;

initialization

  TTestRepo.RegisterTest('WC-5787', 'Crm_Market', 'crm_partner_duplicates', 'CancelIfPartnerExists', Test1);

end.

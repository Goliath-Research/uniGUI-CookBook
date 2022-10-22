unit WC_5668;

interface

implementation

uses
  TestReg,
  MainModule,
  crm_pick_employee ;

procedure Test1;
begin
  DoSelectEmployees;
end;

initialization

  TTestRepo.RegisterTest('WC-5668', 'CRM', 'crm_pick_employee', 'DoSelectEmployees', Test1);

end.

unit WC_5603;

interface

implementation

uses
  TestReg,
  crm_activity_props;

procedure Test1;
var
  ActivityID: Real;
begin
  ActivityID := 130;
  ShowActivityProperties(ActivityID);
end;

initialization

  TTestRepo.RegisterTest('WC-5603', 'Crm', 'crm_activity_props', 'ShowActivityProperties', Test1);

end.

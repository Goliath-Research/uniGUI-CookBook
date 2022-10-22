unit WC_5605;

interface

implementation

uses
  MainModule,
  TestReg,
  crm_activity_summary;

procedure Test1;
begin
  ShowBriefActivitySummary(100);
end;

initialization

  TTestRepo.RegisterTest('WC-5605', 'Crm', 'crm_activity_summary', 'ShowBriefActivitySummary', Test1);

end.

unit WC_7155;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  spc_select_run_rules;

procedure Test1;
begin
  DoSelectRunRules(147536);
end;

initialization

  TTestRepo.RegisterTest('WC_7155', 'Iqspc', 'spc_select_run_rules', 'DoSelectRunRules', Test1);
end.

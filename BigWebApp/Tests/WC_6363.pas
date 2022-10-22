unit WC_6363;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  inv_rf_teams;

procedure Test1;
begin
   TFrmInvRFTeams.DoShow;
end;

initialization
  TTestRepo.RegisterTest('WC-6363', 'Inv', 'inv_rf_teams', 'DoShow', Test1);
end.

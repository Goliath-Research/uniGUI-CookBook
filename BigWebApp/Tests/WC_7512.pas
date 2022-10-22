unit WC_7512;

interface

implementation

uses
  TestReg,
  System.Variants,
  oe_wf_team;

procedure Test1;
begin
  TFrmOEWorkflowTeam.DoShow(45376);
end;

initialization

  TTestRepo.RegisterTest('WC-7512', 'Payroll', 'FrmOEWorkflowTeam', 'DoShow', Test1);
end.

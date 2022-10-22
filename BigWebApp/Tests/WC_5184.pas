unit WC_5184;

interface

implementation

uses
  TestReg,
  SysUtils,
  StrUtils,
  uniGUIDialogs,
  ap_wf_team;

procedure Test1;
begin
   TFrmAPWorkflowTeam.DoShow(20);
end;

initialization

  TTestRepo.RegisterTest('WC-5184', 'Ap', 'ap_wf_team', 'DoShow', Test1);

end.

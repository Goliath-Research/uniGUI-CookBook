unit WC_7343;

interface

implementation

uses
  TestReg,
  SysUtils,
  StrUtils,
  uniGUIDialogs,
  wf_specific_team_base;

procedure TestTFrmWorkflowSpecificTeamBase;

begin
   TFrmWorkflowSpecificTeamBase.DoShow('USED_CAR');
end;

initialization

  TTestRepo.RegisterTest('WC-7343', 'Iqworkflow', 'wf_specific_team_base', 'DoShow', TestTFrmWorkflowSpecificTeamBase);

end.

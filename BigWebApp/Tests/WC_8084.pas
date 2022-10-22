unit WC_8084;

interface

implementation

uses
  TestReg,
  qc_doc_wf_team;

procedure TestTFrmDOCWorkflowTeam;
begin
  TFrmDOCWorkflowTeam.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC-8084', 'Qc_Doc', 'qc_doc_wf_team', 'DoShow', TestTFrmDOCWorkflowTeam);

end.

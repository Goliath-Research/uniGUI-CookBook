unit wc_8080;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  qc_doc_team;

procedure Test;
begin
  DoAssignDocTeam(16);
end;

initialization

  TTestRepo.RegisterTest('WC-8080', 'Qc_Doc', 'qc_doc_team', 'DoAssignDocTeam', Test);

end.

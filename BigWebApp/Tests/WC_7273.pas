unit WC_7273;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  tl_predecessor_prompt1;

procedure TestTFrmTLPredecessorPrompt1;
var
  APredecessorID: Real;
begin
  APredecessorID := 452;
  PromptAddPredecessor(564,'IQMS', 12/11/2014, APredecessorID);
end;

initialization

  TTestRepo.RegisterTest('WC_7273', 'Iqtool', 'tl_predecessor_prompt1', 'PromptAddPredecessor', TestTFrmTLPredecessorPrompt1);

end.

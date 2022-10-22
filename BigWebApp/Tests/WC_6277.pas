unit WC_6277;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  InvTrSum;

procedure Test;
begin
  DoInvTransSummary(148995);
end;

initialization
  TTestRepo.RegisterTest('WC-6277', 'Inv', 'InvTrSum', 'DoInvTransSummary', Test);

end.

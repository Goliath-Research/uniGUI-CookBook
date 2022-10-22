unit WC_6356;

interface

implementation

uses
  TestReg,
  uniGUIDialogs,
  inv_move_ranking;

procedure Test1;
begin
  TFrmInvMovementRanking.DoShow;
end;

initialization

TTestRepo.RegisterTest('WC-6356', 'Inv', 'inv_move_ranking', 'DoShow', Test1);

end.

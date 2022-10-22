unit WC_6355;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  inv_move_rank_calc;

procedure Test1;
var
 Form: TFrmInvMoveRankCalc;
begin
  Form := TFrmInvMoveRankCalc.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-6355', 'Inv', 'inv_move_rank_calc', 'create', Test1);
end.

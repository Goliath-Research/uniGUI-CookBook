unit WC_6354;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  inv_move_class;

procedure Test1;
var
 Form: TFrmInvMoveClass;
begin
  Form := TFrmInvMoveClass.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-6354', 'Inv', 'inv_move_class', 'create', Test1);
end.

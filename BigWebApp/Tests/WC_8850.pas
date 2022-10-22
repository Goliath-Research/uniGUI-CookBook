unit WC_8850;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  secured_confrim_trans_qty_zero;

procedure Test1;
var
 Form: TFrmSecuredConfirmTransQtyZero;
begin
   Form := TFrmSecuredConfirmTransQtyZero.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-8850', 'Trans', 'secured_confrim_trans_qty_zero', 'create', Test1);
end.

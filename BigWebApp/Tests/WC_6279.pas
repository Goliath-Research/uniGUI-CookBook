unit WC_6279;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  Inv_Clon;

procedure Test1;
var
  b : Real;
begin
  b := 157114;
  DoCloneInventoryItem(157118,b,'11','11');
end;

initialization

  TTestRepo.RegisterTest('WC_6279', 'Inv', 'Inv_Clon', 'DoCloneInventoryItem', Test1);
end.

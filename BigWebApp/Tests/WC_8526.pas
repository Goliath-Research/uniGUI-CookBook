unit WC_8526;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  uniDBGrid,
  SU_Shift;

procedure TestDoShopSetUpByShift;
var
  dbGrid : TUniDbGrid;
begin
  DoShopSetUpByShift(dbGrid);
end;

initialization

  TTestRepo.RegisterTest('WC-8526', 'Shop_Su', 'SU_Shift', 'DoShopSetUpByShift', TestDoShopSetUpByShift);

end.

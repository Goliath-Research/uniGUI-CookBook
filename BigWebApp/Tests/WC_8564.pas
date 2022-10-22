unit WC_8564;

interface

implementation

uses
  TestReg,
  sd_menu,
  uniGUIApplication;

procedure Test1;
var
  LForm : TFrmShopDataMenu;
begin
  LForm := TFrmShopDataMenu.create(uniGUIApplication.UniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-8564', 'Shopdata', 'sd_menu', 'FormCreate', Test1);
end.

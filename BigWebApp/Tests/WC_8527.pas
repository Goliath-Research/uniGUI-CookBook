unit WC_8527;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  ShopSchd;

procedure Test1;
begin
  DoShopSchedHolidays;
end;

initialization

  TTestRepo.RegisterTest('WC-8527', 'Shop_Su ', 'ShopSchd', 'DoShopSchedHolidays', Test1);

end.

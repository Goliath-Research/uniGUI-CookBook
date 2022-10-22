unit WC_8530;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  Shop_SU;

procedure Test1;
begin
  ShopSetUpEx;
end;

initialization

  TTestRepo.RegisterTest('WC-8530', 'Shop_Su ', 'Shop_SU', 'ShopSetUpEx', Test1);

end.

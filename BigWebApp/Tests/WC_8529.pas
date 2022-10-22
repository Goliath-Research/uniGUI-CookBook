unit WC_8529;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  Shop_Hol;

procedure Test1;
begin
  DoShopHoliday;
end;

initialization

  TTestRepo.RegisterTest('WC-8529', 'Shop_Su ', 'Shop_Hol', 'DoShopHoliday', Test1);

end.

unit WC_8532;

interface

implementation

uses
  TestReg,
  System.Variants,
  Shop_SU_PM,
  MainModule;

procedure Test1;
begin
  ShopSetUp_PM(UniMainModule.FDConnection1);
end;

initialization

  TTestRepo.RegisterTest('WC-8532', 'Shop_Su', 'TShop_SetUp_PM', 'ShopSetUp_PM', Test1);
end.

unit WC_7156;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  spc_select_sd;

procedure Test1;
var
LFrmSPCSelect_ShopData : TFrmSPCSelect_ShopData;

begin
   LFrmSPCSelect_ShopData:=TFrmSPCSelect_ShopData.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC_7156', 'Iqspc', 'spc_select_sd', 'create', Test1);
end.

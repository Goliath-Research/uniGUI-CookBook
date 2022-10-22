unit WC_8550;

interface

implementation

uses
  TestReg,
  sd_addlocation_dlg,
  IQMS.WebVcl.Hpick;

procedure Test1;
var
  PickList: TIQWebHPick;
  ShowRegrind: Boolean;
  FGMultiID, Quantity, RGQuantity: Real ;
begin
  FGMultiID := 0;
  Quantity := 0;
  RGQuantity := 0;
  ShowRegrind := True;
  GetValuesForLocationIn(PickList, ShowRegrind,  FGMultiID, Quantity, RGQuantity) ;
end;

procedure Test2;
var
   PickList: TIQWebHPick;
   FGMultiID, Quantity : Real;
begin
  FGMultiID := 0;
  Quantity := 0;
  GetValuesForLocationOut(PickList, FGMultiID, Quantity) ;
end;

initialization

  TTestRepo.RegisterTest('WC_8550', 'Shopdata', 'sd_addlocation_dlg', 'GetValuesForLocationIn', Test1, 1);
  TTestRepo.RegisterTest('WC_8550', 'Shopdata', 'sd_addlocation_dlg', 'GetValuesForLocationOut', Test2, 2);

end.

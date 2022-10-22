unit WC_7370;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  JSFilter;

procedure Test1;
var
  AJobShopRfqID, AJobShopTaskID, APrEmpID: Real;
  ADetailNo: String;
  AHours: Integer;
  AChargeRate: Real;
begin
  AJobShopRfqID := 50;
  AJobShopTaskID := 0;
  APrEmpID := 50;
  ADetailNo := 'detail';
  AHours := 0;
  AChargeRate := 0;

  if DoJSLaborQuickAddFilter(AJobShopRfqID, AJobShopTaskID, APrEmpID, ADetailNo, AHours, AChargeRate) then
    ShowMessage(
    'JobShopRfqID='  + FloatToStr(AJobShopRfqID)  + #13#10+
    'JobShopTaskID=' + FloatToStr(AJobShopTaskID) + #13#10+
    'PrEmpID='       + FloatToStr(APrEmpID)       + #13#10+
    'DetailNo='      + ADetailNo                  + #13#10+
    'Hours='         + IntToStr(AHours)           + #13#10+
    'ChargeRate='    +FloatToStr(AChargeRate)
    )
  else
    ShowMessage('Cancelled');

end;

initialization

TTestRepo.RegisterTest('WC-7370', 'Jobshop', 'JSFilter', 'DoJSLaborQuickAddFilter', Test1);

end.

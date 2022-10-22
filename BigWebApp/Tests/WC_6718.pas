unit WC_6718;

interface

implementation

uses
  TestReg,
  System.Classes,
  Fore_Calc;

procedure Test1;
var
  LFore_Item_ID: Real;
  LForecastType: string;
begin
  LFore_Item_ID := 225;
  LForecastType:= 'S';
  TFrmForeCalc.DoShow(LFore_Item_ID, LForecastType);
end;

initialization

  TTestRepo.RegisterTest('WC_6718', 'Iqforecast', 'Fore_Calc', 'DoShow', Test1);

end.

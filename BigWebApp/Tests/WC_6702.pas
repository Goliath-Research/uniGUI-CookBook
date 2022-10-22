unit WC_6702;

interface

implementation

uses
  TestReg,
  System.Variants,
  FR_OnOrd;

procedure Test1;
begin
  DoForecastShowOnOrder(VarArrayOf(['Aug-2000',147537,153]));
end;

initialization

  TTestRepo.RegisterTest('WC_6702', 'Iqforecast', 'FR_OnOrd', 'DoForecastShowOnOrder', Test1);

end.

unit WC_6704;

interface

implementation

uses
  TestReg,
  System.Variants,
  FR_Ship;

procedure Test1;
var
  LVar: Variant;
begin
  DoForecastShowShipped(VarArrayOf(['Aug-2000',147537,153]));
end;

initialization

  TTestRepo.RegisterTest('WC_6704', 'Iqforecast', 'FR_Ship', 'DoForecastShowShipped', Test1);
end.

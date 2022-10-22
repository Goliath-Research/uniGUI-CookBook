unit WC_6703;

interface

implementation

uses
  TestReg,
  FR_Param;

procedure Test1;
begin
  DoForecastParams();
end;

initialization

  TTestRepo.RegisterTest('WC_6703', 'Iqforecast', 'FR_Param', 'DoForecastParams', Test1);

end.

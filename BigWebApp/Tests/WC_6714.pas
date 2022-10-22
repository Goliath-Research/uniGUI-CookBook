unit WC_6714;

interface

implementation

uses
  TestReg,
  ForeMain;

procedure TestForecast;
begin
  DoForecast;
end;

procedure TestJumpForecast;
begin
  DoJumpForecast(148910, '0816');
end;
initialization

  TTestRepo.RegisterTest('WC_6714', 'Iqforecast', 'ForeMain', 'DoForecast', TestForecast, 1);
  TTestRepo.RegisterTest('WC_6714', 'Iqforecast', 'ForeMain', 'DoJumpForecast', TestJumpForecast, 2);

end.

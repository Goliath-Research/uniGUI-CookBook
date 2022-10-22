unit WC_6711;

interface

implementation

uses
  TestReg,
  System.Classes,
  Data.DB,
  ForeGrph;

procedure Test1;
var
  LDataSource: TDataSource;
begin
  LDataSource := TDataSource.create(nil);
  DoShowForecastGraph(LDataSource);
end;

initialization

  TTestRepo.RegisterTest('WC_6711', 'Iqforecast', 'ForeGrph', 'DoShowForecastGraph', Test1);

end.

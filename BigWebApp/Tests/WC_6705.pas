unit WC_6705;

interface

implementation

uses
  TestReg,
  ForeBase,
  uniGUIApplication;

procedure Test1;
var
  AForm : TFrmForecast;
begin
  AForm := TFrmForecast.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC_6705', 'Iqforecast', 'ForeBase', 'FormCreate', Test1);

end.

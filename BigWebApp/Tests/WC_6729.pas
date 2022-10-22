unit WC_6729;

interface

implementation


uses
  TestReg,
  System.Variants,
  fr_show_saved_values;

procedure Test1;
begin
  TFrmForecastShowSavedValues.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC_6729', 'Iqforecast', 'fr_show_saved_values', 'DoShow', Test1);

end.

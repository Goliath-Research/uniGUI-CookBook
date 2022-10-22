unit WC_6698;

interface

implementation

uses
  TestReg,
  System.Variants,
  FR_Gen;

procedure Test1;
var
  LVar: Variant;
begin
  DoForecastGenerate(VarArrayOf([56242,147537,'S',56242]));
end;

initialization

  TTestRepo.RegisterTest('WC_6698', 'Iqforecast', 'FR_Gen', 'DoForecastGenerate', Test1);
end.

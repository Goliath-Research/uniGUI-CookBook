unit WC_6685;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  ExpMileageCalc;

procedure Test1;
var
  aFrmMileageCalc : TFrmMileageCalc;
  AQty, ARate :Real;
begin
  AQty := 0;
  ARate := 0;
  aFrmMileageCalc.DoMileageCalculator(AQty, ARate);
end;

initialization

  TTestRepo.RegisterTest('WC_6685', 'Iqexp', 'FrmMileageCalc', 'DoForecastGenerate', Test1);
end.

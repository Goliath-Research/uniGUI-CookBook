unit WC_7237;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  Tldur;

procedure TestTDurationDisplayUnit;
var
  Duration : Real;
  DurationDisplayUnit: Integer;
begin
  Duration := 100;
  DurationDisplayUnit :=100;
  DoGetDurationValues(Duration,DurationDisplayUnit);
end;

initialization

  TTestRepo.RegisterTest('WC_7237', 'Iqtool', 'Tldur', 'DoGetDurationValues', TestTDurationDisplayUnit);

end.

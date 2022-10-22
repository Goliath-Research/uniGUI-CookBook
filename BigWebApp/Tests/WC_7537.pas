unit WC_7537;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  FrcstChk;

procedure TestTFrmForecastRelExcept;
begin
  CheckOrdLineForForecastReleases(1831);
end;

initialization

  TTestRepo.RegisterTest('WC-7537', 'Packslip', 'FrcstChk', 'CheckOrdLineForForecastReleases', TestTFrmForecastRelExcept);

end.

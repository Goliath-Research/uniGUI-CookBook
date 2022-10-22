unit WC_7417;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  MCSpotRateHist;

procedure Test;
begin
  DoHistSpotRate;
end;

initialization

  TTestRepo.RegisterTest('WC-7417', 'Multicur', 'MCSpotRateHist', 'DoHistSpotRate', Test);

end.

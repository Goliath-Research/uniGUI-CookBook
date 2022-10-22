unit WC_7452;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  OE_RelHist;

procedure Test;
begin
  DoShowReleasesHistoryLog(54);
end;

initialization

  TTestRepo.RegisterTest('WC-7452', 'OE', 'OE_RelHist', 'DoShowReleasesHistoryLog', Test);

end.

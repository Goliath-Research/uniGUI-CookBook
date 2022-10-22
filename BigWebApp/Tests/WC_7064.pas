unit WC_7064;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  shipman_ups_version;

procedure Test;
begin
  DoUPSVersionList;
end;

initialization
  TTestRepo.RegisterTest('WC-7064', 'Iqshipman',  'shipman_ups_version', 'DoUPSVersionList', Test);
end.

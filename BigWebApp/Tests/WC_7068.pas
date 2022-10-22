unit WC_7068;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  shipman_usps_weight;

procedure Test;
var
  AActualWeight: Real;
begin
  AActualWeight := 1154;
  GetUSPSWeight(AActualWeight);
end;

initialization
  TTestRepo.RegisterTest('WC-7068', 'Iqshipman',  'shipman_usps_weight', 'GetUSPSWeight', Test);
end.

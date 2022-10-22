unit WC_7001;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  shipman_carrier_url;

procedure Test;
begin
  DoCarrierURL(213);
end;

initialization
  TTestRepo.RegisterTest('WC-7001', 'Iqshipman',  'shipman_carrier_url', 'DoCarrierURL', Test);
end.

unit WC_7042;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  shipman_purge_base;

procedure Test;
begin
  TFrmShipmanPurgeBase.Create(UniGUIApplication.UniApplication);
end;

initialization
  TTestRepo.RegisterTest('WC-7042', 'Iqshipman',  'shipman_purge_base', 'DoCarrierURL', Test);
end.

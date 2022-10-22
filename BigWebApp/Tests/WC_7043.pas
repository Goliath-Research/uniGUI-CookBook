unit WC_7043;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  shipman_purgelog;

procedure Test;
begin
  DoShipmanPurgeLog;
end;

initialization
  TTestRepo.RegisterTest('WC-7043', 'Iqshipman',  'shipman_purgelog', 'DoShipmanPurgeLog', Test);
end.

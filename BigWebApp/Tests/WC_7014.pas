unit WC_7014;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  shipman_edit_third_party;

procedure Test;
begin
  DoEditThirdParty(1154);
end;

initialization
  TTestRepo.RegisterTest('WC-7014', 'Iqshipman',  'shipman_edit_third_party', 'DoEditThirdParty', Test);
end.

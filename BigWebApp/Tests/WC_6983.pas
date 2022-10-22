unit WC_6983;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  shipman_account_fedex_smartpost;

procedure Test;
begin
  TFrmShipManAccountFedExSmartPost.Create(UniGUIApplication.UniApplication);
end;

initialization
  TTestRepo.RegisterTest('WC-6983', 'Iqshipman',  'shipman_account_fedex_smartpost', 'Create', Test);
end.

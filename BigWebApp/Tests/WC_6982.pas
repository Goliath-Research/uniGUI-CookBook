unit WC_6982;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  shipman_account_fedex_express;

procedure Test;
begin
  TFrmShipManAccountFedExExpress.Create(UniGUIApplication.UniApplication);
end;

initialization
  TTestRepo.RegisterTest('WC-6982', 'Iqshipman',  'shipman_account_fedex_express', 'Create', Test);
end.

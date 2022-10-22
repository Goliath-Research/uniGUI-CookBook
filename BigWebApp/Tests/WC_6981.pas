unit WC_6981;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  shipman_account_fedex;

procedure Test;
begin
  TFrmShipManAccountFedEx.Create(UniGUIApplication.UniApplication);
end;

initialization
  TTestRepo.RegisterTest('WC-6981', 'Iqshipman',  'shipman_account_fedex', 'Create', Test);
end.

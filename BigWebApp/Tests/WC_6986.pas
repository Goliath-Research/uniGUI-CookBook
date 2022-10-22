unit WC_6986;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  MainModule,
  UniGUIApplication,
  shipman_account_usps_postage;

procedure Test1;
var
  aAmount : Real;
begin
  GetPostageAmount(aAmount);
end;


initialization

  TTestRepo.RegisterTest('WC-6986', 'Iqshipman', 'shipman_account_usps_postage', 'FrmShipManAccountUSPSPostage', Test1);

end.

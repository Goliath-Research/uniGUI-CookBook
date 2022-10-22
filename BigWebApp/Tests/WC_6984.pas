unit WC_6984;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  shipman_account_usps;

procedure test;
var
  LFrmShipManAccountUSPS : TFrmShipManAccountUSPS;
begin
  LFrmShipManAccountUSPS := TFrmShipManAccountUSPS.Create(UniGuiApplication.UniApplication);
  LFrmShipManAccountUSPS.Show;
end;

initialization

  TTestRepo.RegisterTest('WC-6984', ' Iqshipman', 'shipman_account_ups', 'Create', Test);

end.

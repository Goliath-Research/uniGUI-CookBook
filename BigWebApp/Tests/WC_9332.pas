unit WC_9332;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  oc_ship_order_info;

procedure TestDoShowModal;
begin
    TFrmOutSourceShipOrderInfo.DoShow(203);
end;

initialization
  TTestRepo.RegisterTest('WC-9332', 'outsource_central', 'oc_ship_order_info', 'DoShow', TestDoShowModal);
end.

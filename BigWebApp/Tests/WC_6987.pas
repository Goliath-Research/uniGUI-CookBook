unit WC_6987;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  MainModule,
  UniGUIApplication,
  shipman_address_edit;

procedure TestTFrmShipManAddrError;
begin
  EditPackingSlipAddress(25,'PARAMS');
end;

procedure TestTFrmShipManAddrError1;
begin
  CheckPackingSlipAddress(5123,'PARAMS');
end;

initialization

  TTestRepo.RegisterTest('WC-6987', 'Iqshipman', 'shipman_address_edit', 'EditPackingSlipAddress', TestTFrmShipManAddrError1);

end.

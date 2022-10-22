unit WC_7481;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  oe_cancel_drop_ship_dlg;

procedure TestTFrmCancelDropShipDlg;
begin
  TFrmCancelDropShipDlg.DoShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-7481', 'Oe', 'oe_cancel_drop_ship_dlg', 'DoShowModal', TestTFrmCancelDropShipDlg);

end.

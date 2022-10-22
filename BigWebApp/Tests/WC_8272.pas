unit WC_8272;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  secure_confirm_unposted_po_receipts;

procedure TestTFrmSecuredConfirmUnPostedPOReceipt;
var
  Form: TFrmSecuredConfirmUnPostedPOReceipt;
begin
  Form := TFrmSecuredConfirmUnPostedPOReceipt.Create(UniGUIApplication.UniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-8272', 'Receive', 'secure_confirm_unposted_po_receipts', 'Create', TestTFrmSecuredConfirmUnPostedPOReceipt);

end.

unit WC_7486;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  oe_confirm_same_po;

procedure TestTFrmOEConfirmSameP0;
begin
  TFrmOEConfirmSameP0.Create(UniGUIApplication.UniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-7486', 'Oe', 'oe_confirm_same_po', 'Create', TestTFrmOEConfirmSameP0);

end.

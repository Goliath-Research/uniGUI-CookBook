unit WC_7440;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  FreeForm;

procedure TestTFrmShipManAddrError;
var
  AKind : TFrmFreeFormKind;
begin
  AKind := fscNone;
  DoFreeFormItems(AKind);
end;

initialization

  TTestRepo.RegisterTest('WC-7440', 'Oe', 'FreeForm', 'DoFreeFormItems', TestTFrmShipManAddrError);

end.

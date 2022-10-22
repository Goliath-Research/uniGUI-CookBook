unit WC_8227;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  RBom_Clone_Input;

procedure Test1;
var
  b: boolean;
begin
  if TFrmRBomCloneInput.DoShowModal(1, b) then
    ShowMessage(BoolToStr(b, True))
  else
    ShowMessage('Cancelled');
end;

initialization

TTestRepo.RegisterTest('WC-8227', 'Rbom', 'RBom_Clone_Input', 'DoShowModal', Test1, 1);

end.

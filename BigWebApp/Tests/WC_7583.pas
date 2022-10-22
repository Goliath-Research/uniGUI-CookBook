unit WC_7583;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  VMI_pick_location;

procedure Test1;
var
  R: Real;
  S: string;
begin
  if TFrmVMIPickLocation.DoShowModal(31717, 148238, R, S) then
    ShowMessage(FloatToStr(R) + ' - ' + S)
  else
    ShowMessage('Cancelled');
end;

initialization

TTestRepo.RegisterTest('WC-7583', 'Packslip', 'VMI_pick_location', 'DoShowModal', Test1, 1);

end.

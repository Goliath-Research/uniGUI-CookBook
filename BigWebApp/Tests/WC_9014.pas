unit WC_9014;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  wo_pk_make_to_order;

procedure Test1;
var
  tmp: Real;
begin
  if TFrmWO_PickMakeToOrder.DoShowModal(1158000, tmp) then
    ShowMessage(FloatToStr(tmp))
  else
    ShowMessage('Cancelled');
end;

initialization

TTestRepo.RegisterTest('WC-9014', 'Wrkorder', 'wo_pk_make_to_order', 'DoShowModal', Test1, 1);

end.

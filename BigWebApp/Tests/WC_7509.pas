unit WC_7509;

interface

implementation

uses
  TestReg,
  uniGUIDialogs,
  TypInfo,
  SysUtils,
  oe_sel_price_update;

procedure Test1;
var
  tmp: TPriceUpdateParam;
begin
  if TFrmOESelectPriceUpdate.DoShowModal(tmp) then
    showMessage(
      'IncludeUninvoiced=' + BoolToStr(tmp.IncludeUninvoiced,True)+#13#10+
      'UpdateMode=' + GetEnumName(TypeInfo(TPriceUpdateMode), Ord(tmp.UpdateMode))
    ) else
    showMessage('Cancelled');
end;

initialization

TTestRepo.RegisterTest('WC-7509', 'Oe', 'oe_sel_price_update', 'DoShowModal', Test1);

end.

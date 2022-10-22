unit WC_7859;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  TypInfo,
  po_sel_price_update;

procedure Test1;
var
  tmp: TPOPriceUpdateParam;
begin
  if TFrmPOSelectPriceUpdate.DoShowModal(tmp) then
    showMessage( GetEnumName(TypeInfo(TPOPriceUpdateMode), Ord(tmp.UpdateMode)) ) else
    showMessage('Cancelled');
end;

initialization

  TTestRepo.RegisterTest('WC-7859', 'Po', 'po_sel_price_update', 'DoShowModal', Test1, 1);

end.

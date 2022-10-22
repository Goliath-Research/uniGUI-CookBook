unit WC_7500;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  oe_quick_add_multi;

procedure TestTFrmAssyDataChkFinalAssyZero;
var
  ACargo: TQuickAddOrderCargo ;
begin
  ACargo.Orders_ID := 56;
  ACargo.Arcusto_ID := 89;
  ACargo.Ship_To_ID := 55;
  ACargo.UseAKA := True;
  TFrmQuickOeAddMultipleItems.DoShowModal(ACargo);
end;

initialization

  TTestRepo.RegisterTest('WC-7500', 'OE', 'oe_quick_add_multi', 'TestTFrmAssyDataChkFinalAssyZero', TestTFrmAssyDataChkFinalAssyZero);

end.

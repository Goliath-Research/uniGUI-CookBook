unit WC_6342;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  inv_chk_negative_onhand;

procedure Test;
begin
  TFrmNegativeOnHandTransException.DoShowModal(187242,5000);
end;

initialization

  TTestRepo.RegisterTest('WC-6342', 'Inv', 'inv_chk_negative_onhand', 'DoShowModal', Test);

end.

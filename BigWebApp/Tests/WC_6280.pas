unit WC_6280;

interface

implementation

uses
  TestReg,
  System.Variants,
  System.StrUtils,
  System.Classes,
  uniGUIDialogs,
  Inv_CostParentMassCustFilter;

procedure Test1;
begin
  ShowMessage(IfThen( TFrmCostParentMassCustFilter.DoShowModal( 34221 ), 'OK', 'Cancel'));
end;

initialization

  TTestRepo.RegisterTest('WC-6280', 'Inv', 'FrmCostParentMassCustFilter', 'DoShowModalDialogCheckBox', Test1);
end.

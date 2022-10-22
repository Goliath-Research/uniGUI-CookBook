unit WC_7266;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  tl_conf_del_prod_wo;

procedure TestCheckDeleteProductionWorkOrder;

begin
 CheckDeleteProductionWorkOrder(1);
end;

initialization

  TTestRepo.RegisterTest('WC-7266', 'Iqtool', 'tl_conf_del_prod_wo', 'CheckDeleteProductionWorkOrder', TestCheckDeleteProductionWorkOrder);

end.

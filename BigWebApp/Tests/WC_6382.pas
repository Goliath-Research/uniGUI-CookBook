unit WC_6382;
// WC-6382 Inv - inv_trans_plan_base
interface

implementation

uses
  MainModule,
  UniGUIApplication,
  TestReg,
  inv_trans_plan_base;

procedure Test;
begin
   TFrmInvTransPlanBase.DoShow(420);
end;

initialization

  TTestRepo.RegisterTest('WC-6382', 'Inv', 'inv_trans_plan_base', 'DoShow', Test);

end.

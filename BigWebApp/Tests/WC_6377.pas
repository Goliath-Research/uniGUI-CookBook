unit WC_6377;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  inv_trans_share,
  inv_trans_exec_base;

procedure Test;
var
  LFrmInvTransExecBase : TFrmInvTransExecBase;
  ACargo: TInvTransPlanCargo;
begin
  LFrmInvTransExecBase.DoShowModal(ACargo);
end;

initialization

  TTestRepo.RegisterTest('WC-6377', 'Inv', 'inv_trans_exec_base', 'DoShowModal', Test);

end.

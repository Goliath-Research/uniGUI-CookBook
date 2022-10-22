unit WC_6315;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Qk_InvAl;

procedure Test;
var
  LQuickAddAllArinvt : TQuickAddAllArinvt;
  AArinvt_ID: Real;
begin
  LQuickAddAllArinvt.DoShowModal(AArinvt_ID,420);
end;

initialization

  TTestRepo.RegisterTest('WC-6315', 'Inv', 'Qk_inval', 'DoShowModal', Test);

end.

unit WC_6309;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  Qk_FG;

procedure Test1;
var
  frm: TQuickAddFGArinvt;
begin
  frm:= TQuickAddFGArinvt.Create(uniGUIApplication.uniApplication);
  frm.ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-6309', 'Inv', 'Qk_FG', 'ShowModal', Test1, 1);

end.

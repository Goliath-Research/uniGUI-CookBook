unit WC_8966;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  qk_add_cntr_type;

procedure Test1;
var
  frm: TQuickAddCntrType;
begin
  frm:= TQuickAddCntrType.Create(uniGUIApplication.uniApplication);
  frm.ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-8966', 'Workcntr', 'qk_add_cntr_type', 'Create', Test1, 1);

end.

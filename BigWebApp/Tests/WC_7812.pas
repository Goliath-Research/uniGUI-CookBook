unit WC_7812;

interface

implementation

uses
  TestReg,
  SysUtils,
  StrUtils,
  uniGUIDialogs,
  ChkPoBlanketQty;

procedure Test1;
var
  r : boolean;
begin
  r := DoShowModalCheckPoBlanketQty('test','');
  ShowMessage(IfThen(r, 'Update', 'Cancel'));
end;

initialization

  TTestRepo.RegisterTest('WC-7812', 'Po', 'ChkPoBlanketQty', 'DoShowModalCheckPoBlanketQtyk', Test1);

end.

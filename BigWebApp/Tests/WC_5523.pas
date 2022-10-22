unit WC_5523;

interface

implementation

uses
  TestReg,
  SysUtils,
  StrUtils,
  uniGUIDialogs,
  ConfMultiEplant;

procedure Test1;
var
  r : boolean;
begin
  r := DoShowModalConfMultiEplant('test','');
  ShowMessage(IfThen(r, 'Ok', 'Cancel'));
end;

initialization

  TTestRepo.RegisterTest('WC-5523', 'Cr', 'ConfMultiEplant', 'DoShowModalConfMultiEplant', Test1);

end.

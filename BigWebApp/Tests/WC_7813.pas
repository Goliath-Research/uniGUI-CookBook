unit WC_7813;

interface

implementation

uses
  TestReg,
  SysUtils,
  StrUtils,
  uniGUIDialogs,
  ConfUnitPrice;

procedure Test1;
var
  r : boolean;
begin
  r := DoShowModalConfUnitPrice('test','');
  ShowMessage(IfThen(r, 'yes', 'no'));
end;

initialization

  TTestRepo.RegisterTest('WC-7813', 'Po', 'ConfUnitPrice', 'DoShowModalConfUnitPrice', Test1);

end.

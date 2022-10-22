unit WC_7828;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  PO_UOM;

procedure Test1;
begin
  if GetPO_UOM then
    Showmessage('TRUE') else
    Showmessage('FALSE');
end;

initialization

  TTestRepo.RegisterTest('WC-7828', 'Po', 'PO_UOM', 'GetPO_UOM', Test1, 1);

end.

unit WC_7239;

interface

implementation

uses
  TestReg,
  SysUtils,
  StrUtils,
  uniGUIDialogs,
  Tlitem;

procedure Test1;
begin
  DoSelectItemType;
end;

initialization

  TTestRepo.RegisterTest('WC-7239', 'Iqtool', 'FrmTLItem', 'DoSelectItemType', Test1);

end.

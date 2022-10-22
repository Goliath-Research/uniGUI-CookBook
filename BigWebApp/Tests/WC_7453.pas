unit WC_7453;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  OE_UOM;

procedure Test;
begin
  GetOE_UOM;
end;

initialization

  TTestRepo.RegisterTest('WC-7453', 'OE', 'OE_UOM', 'GetOE_UOM', Test);

end.

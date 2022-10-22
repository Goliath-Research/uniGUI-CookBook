unit WC_5888;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  TpShipTo;

procedure Test1;
begin
  DoQuickAddTPShipTo(31369,1);
end;

initialization

TTestRepo.RegisterTest('WC-5888', 'Customer', 'TpShipTo', 'DoQuickAddTPShipTo', Test1, 1);

end.

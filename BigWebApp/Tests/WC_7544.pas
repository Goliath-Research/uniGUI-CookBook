unit WC_7544;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  PS_Share,
  Over_Ship_Chk;

procedure Test1;
var
  a,b : Real;
  C : TFixOrdExceeded;
begin
  a := 44;
  b := 88;
  TFrmOverShipCheck.Execute(373,a,b,c);
end;

initialization

  TTestRepo.RegisterTest('WC-7544', 'Packslip', 'Over_Ship_Chk', 'CheckOverDispo', Test1);
end.

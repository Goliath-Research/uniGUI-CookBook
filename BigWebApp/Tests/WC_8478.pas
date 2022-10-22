unit WC_8478;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  InvtClasEx;

procedure Test1;
var
  a,b : String;
begin
  a := 'HF';
  b := 'HANNAH INVENTORY';
  GetInventoryClassEx(a,b);
end;

initialization

  TTestRepo.RegisterTest('WC-8478', 'Sched', 'InvtClasEx', 'GetInventoryClassEx', Test1);
end.

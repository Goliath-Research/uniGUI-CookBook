unit WC_5554;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  cc_manual;

procedure Test1;
var
  a : Int64;
begin
  a := 28;
  DoManualTransaction(a);
end;

initialization

  TTestRepo.RegisterTest('WC_5554', 'Creditcard', 'cc_manual', 'DoManualTransaction', Test1);
end.

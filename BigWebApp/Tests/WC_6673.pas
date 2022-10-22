unit WC_6673;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  QkBillTo;

procedure Test;
var
  a : variant;
begin
  DoQuickAppendBillTo(a,5);
end;

initialization

  TTestRepo.RegisterTest('WC-6673', 'Iqedi', 'QkBillTo', 'DoQuickAppendBillTo', Test);

end.

unit WC_6674;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  QkShipTo;

procedure Test;
var
  a : variant;
begin
  DoQuickAppendShipTo(a,5);
end;

initialization

  TTestRepo.RegisterTest('WC-6674', 'Iqedi', 'QkShipTo', 'DoQuickAppendShipTo', Test);

end.

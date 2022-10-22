unit WC_7831;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  PEdRemt;

procedure Test1;
var
  Id : Real;
  RemitID : Real;
begin
  Id := 46664;
  RemitID := 40626;
  DoRemitTo(Id, RemitID);
end;

initialization

  TTestRepo.RegisterTest('WC_7831', 'PO', 'PEdRemt', 'DoRemitTo', Test1);

end.

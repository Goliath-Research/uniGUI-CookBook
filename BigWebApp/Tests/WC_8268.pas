unit WC_8268;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  RecRel;

procedure Test;
var
  a,b : Real;
begin
  a := 0;
  b := 0;
  TFrmPoReleases.DoShowModal(5335,a,b,True);
end;

initialization

  TTestRepo.RegisterTest('WC-8268', 'Receive', 'RecRel', 'DoShowModal', Test);

end.

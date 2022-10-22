unit WC_7847;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  po_clone;

procedure Test;
var
  x : String;
begin
  x := 'x';
  TFrmPO_Clone.DoShowModal(x);
end;

initialization

  TTestRepo.RegisterTest('WC-7847', 'Po', 'po_clone', 'DoShowModal', Test);

end.

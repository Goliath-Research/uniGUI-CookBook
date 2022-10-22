unit WC_8154;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  Q_LetDel;

procedure Test1;
var
  a : Boolean;
begin
  a := True;
  QuoteDelConfirm(a);
end;

initialization

  TTestRepo.RegisterTest('WC-8154', 'Quote', 'Q_LetDel', 'QuoteDelConfirm', Test1);

end.

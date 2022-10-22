unit WC_8155;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  Q_Let_SU;

procedure Test1;
var
  a,b : String;
begin
  a := 'text1';
  b := 'text2';
  GetQLetterParams(a,b,20239);
end;

initialization

  TTestRepo.RegisterTest('WC-8155', 'Quote', 'Q_Let_SU', 'GetQLetterParams', Test1);

end.

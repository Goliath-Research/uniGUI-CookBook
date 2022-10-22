unit WC_6253;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  Cost_Elm;

procedure Test1;
begin
  DoCostElem;
end;

initialization

  TTestRepo.RegisterTest('WC-6253', 'Inv', 'Cost_Elm', 'DoCostElem', Test1);

end.

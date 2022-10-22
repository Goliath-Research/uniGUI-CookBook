unit WC_5160;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  AP1099;

procedure TestDo1099;
begin
   Do1099;
end;

initialization

  TTestRepo.RegisterTest('WC-5160', 'Ap', 'AP1099', 'Do1099', TestDo1099);

end.

unit WC_6054;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  FaClass;

procedure Test1;
begin
  DoShowFaClass;
end;

initialization

  TTestRepo.RegisterTest('WC_6054', 'Fa', 'FaClass', 'DoShowFaClass', Test1);
end.

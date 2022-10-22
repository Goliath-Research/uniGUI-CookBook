unit WC_6053;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  FaBooks;

procedure Test1;
begin
  DoShowFaBooks();
end;

initialization

  TTestRepo.RegisterTest('WC_6053', 'Fa', 'FaBooks', 'DoShowFaBooks', Test1);
end.

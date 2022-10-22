unit WC_7318;

interface

implementation

uses
  MainModule,
  TestReg,
  ShowOpen;
procedure Test1;
begin
DoShowOpenForms
end;

initialization

  TTestRepo.RegisterTest('WC_7318', 'Iqwin32', 'ShowOpen', 'DoShowOpenForms', Test1);

end.

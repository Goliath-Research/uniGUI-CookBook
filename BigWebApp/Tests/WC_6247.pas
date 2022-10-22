unit WC_6247;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  CloneAKA;

procedure Test1;
begin
  IQCloneAKA(63);
end;

initialization

  TTestRepo.RegisterTest('WC-6247', 'Inv', 'CloneAKA', 'IQCloneAKA', Test1, 1);

end.

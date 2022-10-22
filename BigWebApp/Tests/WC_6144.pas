unit WC_6144;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Budget;

procedure Test1;

begin
    DoIQGL;
end;

initialization

  TTestRepo.RegisterTest('WC-6144', 'Gl', 'BUDGET', 'DoIQGL', Test1);

end.

unit WC_8647;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  TALogInBas;

procedure Test1;
begin
 LogINTAEmployee;
end;

initialization

  TTestRepo.RegisterTest('WC-8647', 'Ta', 'TALogInBas', 'LogINTAEmployee', Test1, 1);

end.

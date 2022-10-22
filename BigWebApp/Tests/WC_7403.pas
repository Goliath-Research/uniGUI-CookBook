unit WC_7403;

interface

implementation

uses

  TestReg,
  SysUtils,
  uniGUIDialogs,
  ln_login;

procedure Test1;
var
  a,b,c : string;
  d,e : Real;
begin
a := 'a';
LotusNotes_PromptPassword(a);
end;

initialization

  TTestRepo.RegisterTest('WC-7403', 'Lotusnotes',  'ln_login', 'LotusNotes_PromptPassword', Test1);

end.

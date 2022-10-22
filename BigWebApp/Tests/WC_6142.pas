unit WC_6142;

interface

implementation

uses
  TestReg,
  SysUtils,
  Classes,
  uniGUIDialogs,
  UniGUIApplication,
  BadRepl;

procedure Test1;
var
  a: TStringList;
begin
  a:=TStringList.Create;
  a.Add('1');
  a.Add('2');
  a.Add('3');

  DoShowNonReplicatedAccounts(a);
end;

initialization

  TTestRepo.RegisterTest('WC-6142', 'Gl ', 'BadRepl', 'DoShowNonReplicatedAccounts', Test1);

end.

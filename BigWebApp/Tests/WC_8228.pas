unit WC_8228;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  RBom_Components;

procedure Test1;
begin
  if DoRouteBom_Components(52120) then
    Showmessage('Modified')
  else
    Showmessage('Not Modified');
end;

initialization

TTestRepo.RegisterTest('WC-8228', 'Rbom', 'RBom_Components', 'DoRouteBom_Components', Test1, 1);

end.

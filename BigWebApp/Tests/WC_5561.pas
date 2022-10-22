unit WC_5561;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniguiapplication,
  cc_purge;

procedure Test1;
begin
  DoCCPurge;
end;

initialization

  TTestRepo.RegisterTest('WC-5561', 'Creditcard', 'cc_purge', 'DoCCPurge', Test1);

end.

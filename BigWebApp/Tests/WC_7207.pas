unit WC_7207;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  sys_ccencrypt;

procedure Test1;
begin
  if DoCCEncryptionKey then
    ShowMessage('TRUE')
  else
    ShowMessage('FALSE');
end;

initialization

TTestRepo.RegisterTest('WC-7207', 'Iqsys', 'sys_ccencrypt', 'Create', Test1, 1);

end.

unit WC_7993;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Profile_Clone;

procedure Test1;
begin
  if DoCloneProfileDialog('IQMS') then
    Showmessage('TRUE') else
    Showmessage('FALSE');
end;

initialization

  TTestRepo.RegisterTest('WC-7993', 'Profile', 'Profile_Clone', 'DoCloneProfileDialog', Test1, 1);

end.

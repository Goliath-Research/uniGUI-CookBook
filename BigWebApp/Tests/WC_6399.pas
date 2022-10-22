unit WC_6399;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  inv_user_team;

procedure Test1;
begin
 TFrmInvUserTeam.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC-6399', 'Inv', 'inv_user_team', 'DoShow', Test1, 1);

end.

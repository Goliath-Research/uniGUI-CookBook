unit WC_8048;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  qc_car_qk_member;

procedure Test1;
var
  frm: TQuickAddTeamMember;
begin

  frm:= TQuickAddTeamMember.Create(uniGUIApplication.uniApplication);
  frm.ShowModal;

end;

initialization

  TTestRepo.RegisterTest('WC-8048', 'Qc_Car', 'qc_car_qk_member', 'Create', Test1, 1);

end.

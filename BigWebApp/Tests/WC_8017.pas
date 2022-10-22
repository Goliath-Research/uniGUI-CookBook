unit WC_8017;

interface

implementation

uses

  TestReg,
  SysUtils,
  uniGUIDialogs,
  QC_Del_Team_Member;

procedure Test1;
var
  a : Real;
begin
a := 1;
TFrmDeleteTeamMember.DoExecute(a);
end;

initialization
  //WC-8017 Qc - QC_Del_Team_Member
  TTestRepo.RegisterTest('WC-8017', 'Qc',  'ln_login', 'QC_Del_Team_Member', Test1);

end.




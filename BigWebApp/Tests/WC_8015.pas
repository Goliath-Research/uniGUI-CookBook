unit WC_8015;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  QC_Del_Action;

procedure Test1;
var
  ModuleName : string;
  a,b : string;
  c   : char;
  d,e : Real;
begin
  ModuleName := 'CAR';
  a := 'a';
  b := 'b';
  c := 'N';
  d := 1;
  e := 2;
  if GetQCActionAndTeamMemberID(ModuleName, b,d,c,e) then
    ShowMessage(Format('Action: %s, New Team Member Id: %d', [c, round(e)]));
end;

initialization

  TTestRepo.RegisterTest('WC-8015', 'Qc',  'Qc_Del_Action', 'DoShowModal', Test1);

end.

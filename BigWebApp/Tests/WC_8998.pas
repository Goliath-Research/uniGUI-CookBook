unit WC_8998;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  wo_assign_rework_loc;

procedure Test1;
begin
  TFrmAssignReworkNonConformLoc.DoShowModal(640155);
end;

initialization

  TTestRepo.RegisterTest('WC-8998', 'Wrkorder', 'wo_assign_rework_loc', 'DoShowModal', Test1, 1);

end.

unit WC_5261;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  AssyTrack_AssignPosition;

procedure Test1;
var
  a : real;
begin
  a := 48;
  TFrmAssyTrackAssignPosition.DoShowModal(165504,463656,a);
end;

initialization

  TTestRepo.RegisterTest('WC_5261', 'AssyTrack', 'AssyTrack_AssignPosition', 'DoShowModal', Test1);
end.

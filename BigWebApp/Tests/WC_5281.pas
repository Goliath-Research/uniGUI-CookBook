unit WC_5281;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  AssyTrack_LaborSched;

procedure Test1;
begin
  TFrmAssyTrackLaborSched.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC_5281', 'AssyTrack', 'AssyTrack_LaborSched', 'DoShow', Test1);
end.

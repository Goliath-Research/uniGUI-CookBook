unit WC_5282;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  AssyTrack_LaborSchedParam;

procedure Test1;
var
 Form: TFrmAssyTrackLaborSchedParam;
begin
  Form := TFrmAssyTrackLaborSchedParam.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-5282', 'AssyTrack', 'AssyTrack_LaborSchedParam', 'create', Test1);
end.

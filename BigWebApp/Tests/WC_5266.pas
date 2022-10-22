unit WC_5266;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  AssyTrack_CheckTotalAboveWO;

procedure Test1;
var
 Form: TFrmAssyTrackCheckAboveException;
begin
  Form := TFrmAssyTrackCheckAboveException.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-5266', 'AssyTrack', 'AssyTrack_CheckTotalAboveWO', 'create', Test1);
end.

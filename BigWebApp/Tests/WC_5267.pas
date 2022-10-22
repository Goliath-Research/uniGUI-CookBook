unit WC_5267;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  AssyTrack_CheckTotalBelowWO;

procedure Test1;
var
 Form: TFrmAssyTrackCheckBelowException;
begin
  Form := TFrmAssyTrackCheckBelowException.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-5267', 'AssyTrack', 'AssyTrack_CheckTotalBelowWO', 'create', Test1);
end.

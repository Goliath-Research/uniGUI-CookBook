unit WC_5263;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  AssyTrack_CheckFinalAssyQty;

procedure Test1;
var
 Form: TFrmAssyTrackFinalAssembyQtyCheck;
begin
  Form := TFrmAssyTrackFinalAssembyQtyCheck.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-5263', 'AssyTrack', 'AssyTrack_CheckFinalAssyQty', 'create', Test1);
end.

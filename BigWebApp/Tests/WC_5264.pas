unit WC_5264;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  AssyTrack_CheckFinalAssyQtyAboveWO;

procedure Test1;
var
 Form: TFrmAssyTrackChkFinalAssyAbovWO;
begin
  Form := TFrmAssyTrackChkFinalAssyAbovWO.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-5264', 'AssyTrack', 'AssyTrack_CheckFinalAssyQtyAboveWO', 'create', Test1);
end.

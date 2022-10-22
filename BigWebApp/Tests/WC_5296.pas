unit WC_5296;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  assy_share,
  AssyTrack_SelectRejectMode;

procedure Test1;
var
AParams: TRejectModeParams;
begin
  TFrmAssyTrackSelectRejectMode.DoShowModal(AParams);
end;

initialization

  TTestRepo.RegisterTest('WC-5296', 'AssyTrack', 'AssyTrack_SelectRejectMode', 'DoShowModal', Test1);
end.

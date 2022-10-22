unit WC_5265;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  AssyTrack_CheckFinalAssyQtyZero;

procedure TestTFrmAssyTrackChkFinalAssyZero;
begin
  TFrmAssyTrackChkFinalAssyZero.DoShowModal(25,0);
end;

initialization

  TTestRepo.RegisterTest('WC-5265', 'AssyTrack', 'AssyTrack_CheckFinalAssyQtyZero', 'DoShowModal', TestTFrmAssyTrackChkFinalAssyZero);

end.

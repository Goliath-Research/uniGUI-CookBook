unit WC_5269;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  AssyTrack_ConfirmDeleteWO;

procedure TestTFrmAssyTrackConfirmDeleteWO;
begin
  TFrmAssyTrackConfirmDeleteWO.DoShowModal(1170);
end;

initialization

  TTestRepo.RegisterTest('WC-5269', 'AssyTrack', 'AssyTrack_ConfirmDeleteWO', 'DoShowModal', TestTFrmAssyTrackConfirmDeleteWO);

end.

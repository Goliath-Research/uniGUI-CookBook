unit WC_5291;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  AssyTrack_RejectsDetails;

procedure TestDoShowModal;
begin
  TFrmAssyTrackRejectsDetails.DoShowModal(66257,52448,162424,298,156117);
end;

initialization
  TTestRepo.RegisterTest('WC-5291', 'AssyTrack', 'AssyTrack_RejectsDetails', 'DoShowModal', TestDoShowModal);
end.

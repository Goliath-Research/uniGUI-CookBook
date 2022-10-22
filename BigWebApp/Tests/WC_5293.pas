unit WC_5293;

interface

implementation

uses
  TestReg,
  System.Variants,
  UniGUIApplication,
  AssyTrack_ScheduleOnWorkCenter;

procedure TestDoShowModal;
begin
  TFrmAssyTrack_ScheduleOnWorkCenter.DoShowModal(3595);
end;

initialization

  TTestRepo.RegisterTest('WC-5293', 'AssyTrack', 'FrmAssyTrack_ScheduleOnWorkCenter', 'DoShowModal', TestDoShowModal);
end.

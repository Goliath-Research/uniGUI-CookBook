unit WC_5294;

interface

implementation

uses
  TestReg,
  System.Variants,
  UniGUIApplication,
  AssyTrack_Schedule_WO_OnWorkCenter;

procedure TestDoShowModal;
begin
  TFrmAssyTrack_Schedule_WO_OnWorkCenter.DoShowModal(639);
end;

initialization

  TTestRepo.RegisterTest('WC-5294', 'AssyTrack', 'FrmAssyTrack_Schedule_WO_OnWorkCenter', 'DoShowModal', TestDoShowModal);
end.

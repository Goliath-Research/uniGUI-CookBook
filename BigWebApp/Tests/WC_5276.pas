unit WC_5276;

interface

implementation

uses
  TestReg,
  System.Variants,
  UniGUIApplication,
  AssyTrack_Dispatch;

procedure TestDoShow;
begin
  TFrmAssyTrackDispatch.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC-5276', 'AssyTrack', 'FrmAssyTrackDispatch', 'DoShow', TestDoShow);
end.

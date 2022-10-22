unit WC_5268;

interface

implementation

uses
  TestReg,
  System.Variants,
  UniGUIApplication,
  AssyTrack_ConfirmDel;

procedure TestDoShowModel;
begin
  TFrmAssyTrackConfirmDelete.DoShowModal(122929);
end;

procedure TestDoExecuteSilent;
begin
  TFrmAssyTrackConfirmDelete.DoExecuteSilent(122929);
end;

initialization

  TTestRepo.RegisterTest('WC-5268', 'AssyTrack', 'FrmAssyTrackConfirmDelete', 'DoShow', TestDoShowModel, 1);
  TTestRepo.RegisterTest('WC-5268', 'AssyTrack', 'FrmAssyTrackConfirmDelete', 'DoExecuteSilent', TestDoExecuteSilent, 2);
end.

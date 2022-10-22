unit WC_5295;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  AssyTrack_SelectMfgType;

procedure Test1;
var
  frm: TFrmAssyTrackSelectMfgType;
begin
  frm:= TFrmAssyTrackSelectMfgType.Create(uniGUIApplication.uniApplication);
  frm.ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-5295', 'AssyTrack', 'AssyTrack_SelectMfgType', 'Create', Test1, 1);

end.

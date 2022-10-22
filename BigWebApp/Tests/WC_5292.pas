unit WC_5292;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  AssyTrack_ReportGoodPtsAsRejects;

procedure Test1;
var
  R1, R2: Real;
begin
  R1 := 1;
  R2 := 2;
  if TFrmAssyTrackReportGoodPartsAsRejects.DoShowModal(3629, 1, R1, R2) then
    ShowMessage('AQty = ' + FloatToStr(R1) + #13#10 + 'AReject_Code_ID = ' + FloatToStr(R1))
  else
    ShowMessage('Cancelled');

end;

initialization

TTestRepo.RegisterTest('WC-5292', 'AssyTrack', 'AssyTrack_ReportGoodPtsAsRejects', 'DoShowModal', Test1, 1);

end.

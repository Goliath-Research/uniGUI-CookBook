unit WC_5273;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  AssyTrack_CostInfo_Details;

procedure Test1;
begin
//  TFrmAccyTrackCostInfoDetails.DoShowModal(108737, 0, 162590, 404);
  TFrmAccyTrackCostInfoDetails.DoShowModal(22482, 52347, 162265, 12);
end;

initialization

  TTestRepo.RegisterTest('WC-5273', 'AssyTrack', 'AssyTrack_CostInfo_Details', 'DoShowModal', Test1, 1);

end.

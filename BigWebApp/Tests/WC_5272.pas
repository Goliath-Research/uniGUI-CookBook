unit WC_5272;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  AssyTrack_CostInfo;

procedure Test1;
begin
  TFrmAssyTrackCosting.DoShow(52536,52433,162745,147536);
end;

initialization

  TTestRepo.RegisterTest('WC_5272', 'AssyTrack', 'AssyTrack_CostInfo', 'DoShow', Test1);
end.

unit WC_5274;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  AssyTrack_CostInfo_Wo;

procedure TestDoShow;
begin
   TFrmAssyTrackCostingWO.DoShow(1,2);
end;

initialization
  TTestRepo.RegisterTest('WC-5274', 'AssyTrack',  'Bom_SameInv', 'AssyTrack_CostInfo_Wo', TestDoShow);
end.

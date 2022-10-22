unit WC_6394;

interface

implementation

uses
  TestReg,
  inv_trans_shuttle_locs;

procedure Test;
begin
  TFrmInvTransShuttleLocs.DoShow;
end;

initialization
  TTestRepo.RegisterTest('WC-6394', 'inv',  'inv_trans_shuttle_locs', 'DoShow', Test);
end.

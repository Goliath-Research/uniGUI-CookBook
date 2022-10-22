unit WC_6395;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  inv_trans_staging_params;

procedure Test1;
begin
  TFrmInvTransStagingParams.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC-6395', 'Inv', 'inv_trans_staging_params', 'DoShow', Test1, 1);

end.

unit WC_6396;

interface

implementation

uses
  TestReg,
  inv_trans_trouble;

procedure Test;
begin
  TFrmInvTransTrouble.DoShow;
end;

initialization
  TTestRepo.RegisterTest('WC-6396', 'Inv',  'inv_trans_trouble', 'DoShow', Test);
end.

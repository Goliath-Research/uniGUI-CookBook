unit WC_8251;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  ctp_chk_below_mfg_min;

procedure Test1;
begin
  CheckCTPBelowMfgMinQty(148766, 1);
end;

initialization

  TTestRepo.RegisterTest('WC-8251', 'Rd', 'ctp_chk_below_mfg_min', 'CheckCTPBelowMfgMinQty', Test1, 1);

end.

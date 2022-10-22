unit WC_7506;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  oe_rel_on_wave_chk;

procedure Test;
begin
  CheckConfirmReleaseOnWave(399115);
end;

initialization

  TTestRepo.RegisterTest('WC-7506', 'Oe', 'oe_rel_on_wave_chk', 'CheckConfirmReleaseOnWave', Test);

end.

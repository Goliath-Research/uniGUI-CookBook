unit WC_5539;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  cc_charge_progress;

procedure Test1;
begin
  ShowChargeProgress;
end;

initialization

  TTestRepo.RegisterTest('WC-5539', 'Creditcard', 'FrmCCChargeProgress', 'ShowChargeProgress', Test1);

end.

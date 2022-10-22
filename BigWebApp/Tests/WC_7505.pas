unit WC_7505;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  oe_rel_on_pktkt_chk;

procedure Test;
begin
  CheckReleaseOnPickTicket(376579);
end;

initialization

  TTestRepo.RegisterTest('WC-7505', 'Oe', 'oe_rel_on_pktkt_chk', 'CheckOrdDetailForPickTicket', Test);

end.

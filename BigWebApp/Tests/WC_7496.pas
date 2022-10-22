unit WC_7496;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  oe_on_pktkt_chk;

procedure Test1;
begin
  TFrmOrderOnPkTicketException.DoShowModal( 3377 );
end;

initialization

  TTestRepo.RegisterTest('WC-7496', 'Oe', 'oe_on_pktkt_chk', 'DoShowModal', Test1);

end.

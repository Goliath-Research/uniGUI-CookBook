unit WC_7468;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  PkTktChk;

procedure Test;
begin
  CheckOrdDetailForPickTicket(1827);
end;

initialization

  TTestRepo.RegisterTest('WC-7468', 'Oe', 'PkTktChk', 'CheckOrdDetailForPickTicket', Test);

end.

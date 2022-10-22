unit WC_7441;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  HoldChk;

procedure Test;
begin
  CheckOrdDetailForHold(1784);
end;

initialization

  TTestRepo.RegisterTest('WC-7441', 'Oe', 'HoldChk', 'CheckOrdDetailForHold', Test);

end.

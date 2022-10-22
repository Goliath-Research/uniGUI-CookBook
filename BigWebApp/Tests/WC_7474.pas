unit WC_7474;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  SchdChk;

procedure Test;
begin
  CheckOrdScheduled(15711,12892);
end;

initialization

  TTestRepo.RegisterTest('WC-7474', 'Oe', 'SchdChk', 'CheckOrdScheduled', Test);

end.

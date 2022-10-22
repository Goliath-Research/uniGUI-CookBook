unit WC_5150;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  APCostAlloc;

procedure Test1;
begin
  APFreightCostAlloc(3505);
end;

initialization

TTestRepo.RegisterTest('WC-5150', 'Ap', 'APCostAlloc', 'APFreightCostAlloc', Test1, 1);

end.

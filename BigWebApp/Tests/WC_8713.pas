unit WC_8713;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  taclcinc;

procedure TestTFrmCalcIncPay;
var
  Paytype, Hours : Real;
begin
  Paytype := 56;
  Hours := 2;
  GetIncpaytype(Paytype,Hours);
end;

initialization
  TTestRepo.RegisterTest('WC-8713', 'Ta', 'taclcinc', 'GetIncpaytype', TestTFrmCalcIncPay);
end.

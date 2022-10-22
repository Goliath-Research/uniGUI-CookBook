unit WC_5574;

interface

uses
  cc_epayment;

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniguiapplication,
  cc_timeout_reversal;

procedure Test1;
var
  m : TEPaymentProcessor;
begin
  TFrmCCTimeOutReversal.DoShow(m);
end;
initialization

  TTestRepo.RegisterTest('WC-5574', 'Creditcard', 'cc_timeout_reversal', 'DoShow', Test1);

end.

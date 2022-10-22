unit WC_5898;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  CustCredit;

procedure TestTFrmCustCreditLimit;
begin
  DoCustCreditLimit(20714,23,53,234);
end;

initialization

  TTestRepo.RegisterTest('WC-5898', 'Custstat', 'CustCredit', 'DoCustCreditLimit', TestTFrmCustCreditLimit);

end.

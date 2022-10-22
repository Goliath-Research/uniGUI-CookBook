unit WC_5577;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  cc_trans_detail;

procedure Test1;
begin
  DoTransactionDetails(143);
end;

initialization

  TTestRepo.RegisterTest('WC_5577', 'Creditcard', 'cc_trans_detail', 'DoTransactionDetails', Test1);
end.

unit WC_5884;

interface

implementation

uses
  TestReg,
  StatChkBillTo;

procedure Test1;
var
  BILL_TO_ID: Real;
  Status: String;
begin
  BILL_TO_ID := 20179;
  Status := 'Quote';
  CheckCustBillToStatusIs2(BILL_TO_ID ,Status);
end;

initialization

  TTestRepo.RegisterTest('WC_5884', 'Customer', 'StatChkBillTo', 'CheckCustBillToStatusIs2', Test1);

end.

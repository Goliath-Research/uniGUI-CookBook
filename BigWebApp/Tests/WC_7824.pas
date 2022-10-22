unit WC_7824;

interface

implementation

uses
  TestReg,
  PO_ChkAP;

procedure Test1;
var
  PO_ID: Real;
begin
  PO_ID := 11612;
  CheckPOReceived_UnInvoiced(PO_ID);
end;

procedure Test2;
var
  PO_ID: Real;
  PO_DETAIL_ID: Real;
begin
  PO_ID := 11612;
  PO_DETAIL_ID := 12979;
  CheckPODetail_UnInvoiced(PO_DETAIL_ID, PO_ID);
end;

initialization

  TTestRepo.RegisterTest('WC_7824', 'PO', 'PO_ChkAP', 'CheckPOReceived_UnInvoiced', Test1, 1);
  TTestRepo.RegisterTest('WC_7824', 'PO', 'PO_ChkAP', 'CheckPODetail_UnInvoiced', Test2, 2);
end.

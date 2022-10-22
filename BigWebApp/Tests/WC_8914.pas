unit WC_8914;

interface

implementation

uses
  TestReg,
  VStatChk;

procedure Test1;
var
  Vendor_ID: Real;
begin
  Vendor_ID := 46568;
  CheckVendStatusFor( Vendor_ID ,['Approved','Not Approved','Denied']);
end;

initialization

  TTestRepo.RegisterTest('WC_8914', 'Vendor', 'VStatChk', 'CheckVendStatusFor', Test1);
end.

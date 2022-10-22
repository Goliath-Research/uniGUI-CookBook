unit WC_8920;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  vendor_price_brk;

procedure Test1;
begin
  DoShowVendorPriceBrks(1);
end;

initialization

  TTestRepo.RegisterTest('WC-8920', 'Vendor', 'vendor_price_brk', 'DoShowVendorPriceBrks', Test1, 1);

end.

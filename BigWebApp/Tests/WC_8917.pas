unit WC_8917;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  vendor_category;

procedure Test1;
begin
 TFrmVendorCategory.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC-8917', 'Vendor', 'vendor_category', 'DoShow', Test1, 1);

end.

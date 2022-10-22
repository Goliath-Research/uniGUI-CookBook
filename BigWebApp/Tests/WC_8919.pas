unit WC_8919;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  vendor_oem_dist;

procedure Test1;
begin
  TFrmVendorOEMDistributor.DoShowModal(1);
end;

initialization

  TTestRepo.RegisterTest('WC-8919', 'Vendor', 'vendor_oem_dist', 'DoShowModal', Test1, 1);

end.

unit WC_7497;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  oe_pallet_pkg_info;

procedure Test1;
begin
  TFrmOEPkgPalletInfo.DoShowModal(3476);
end;

initialization

TTestRepo.RegisterTest('WC-7497', 'OE', 'oe_pallet_pkg_info', 'DoShowModal', Test1, 1);

end.

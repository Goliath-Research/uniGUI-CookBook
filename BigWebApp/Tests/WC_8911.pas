unit WC_8911;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniguiapplication,
  Qk_vend;

procedure Test1;
var
  LQuickAddVendor : TQuickAddVendor;
begin
  LQuickAddVendor := TQuickAddVendor.create(UniGUIApplication.UniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-8911', 'Vendor', 'Qk_vend', 'create', Test1);

end.

unit WC_7858;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  po_sec_conf_drop_ship_change,
  uniGUIApplication;

procedure Test1;
begin
  TFrmPOSecConfDropShipChange.create(uniGUIApplication.UniApplication).Show;
end;

initialization

  TTestRepo.RegisterTest('WC-7858', 'Po', 'po_sec_conf_drop_ship_change', 'Create', Test1);

end.

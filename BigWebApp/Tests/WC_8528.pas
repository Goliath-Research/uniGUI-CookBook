unit WC_8528;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Shop_Cal;

procedure Test1;
begin
  TFrmShopCalendar.DoShowModal(nil, 'PARAMS', 1);
end;

initialization

  TTestRepo.RegisterTest('WC-8528', 'Shop_Su', 'Shop_Cal', 'DoShowModal', Test1, 1);

end.

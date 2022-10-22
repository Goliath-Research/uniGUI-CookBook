unit WC_6303;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  Oe_update_price;

procedure Test;
begin
  TFrmOEUpdatePrice.DoShowModal(147468);
end;

initialization
  TTestRepo.RegisterTest('WC-6303', 'Inv',  'Oe_update_price', 'DoShowModal', Test);
end.

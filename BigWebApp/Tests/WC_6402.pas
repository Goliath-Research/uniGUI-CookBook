unit WC_6402;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  inv_wms_eqmt;

procedure Test;
begin
  TFrmInvWMSEquipment.DoShow;
end;

initialization
  TTestRepo.RegisterTest('WC-6402', 'Inv',  'inv_wms_eqmt', 'DoShow', Test);
end.

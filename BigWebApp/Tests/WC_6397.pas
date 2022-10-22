unit WC_6397;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  inv_trans_zones_add_other;

procedure Test;
begin
  TFrmInvZonesAddOther.DoShowModal(565);
end;

initialization
  TTestRepo.RegisterTest('WC-6397', 'Inv',  'inv_trans_zones_add_other', 'DoShowModal', Test);
end.

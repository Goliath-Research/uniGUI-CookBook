unit WC_6405;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  inv_zones;

procedure Test;
begin
  TFrmInvZones.DoShow;
end;

initialization
  TTestRepo.RegisterTest('WC-6405', 'Inv',  'inv_zones', 'DoShowModal', Test);
end.

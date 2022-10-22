unit WC_6403;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  inv_wms_groups;

procedure Test;
begin
  TFrmInvWmsGroups.DoShow;
end;

initialization
  TTestRepo.RegisterTest('WC-6403', 'Inv',  'inv_wms_groups', 'DoShow', Test);
end.

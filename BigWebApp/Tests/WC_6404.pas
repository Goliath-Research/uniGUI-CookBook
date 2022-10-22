unit WC_6404;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  inv_wms_setup;

procedure Test1;
begin
  TFrmInvWmsSetup.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC-6404', 'Inv', 'inv_wms_setup', 'DoShow', Test1);
end.

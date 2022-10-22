unit WC_7547;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  PSChooseVoid;

procedure TestTFrmPSChooseVoid;
var
  ALocations_ID: Real;
begin
  ALocations_ID := 23;
  TFrmPSChooseVoid.DoShowModal(ALocations_ID,54);
end;

initialization
  TTestRepo.RegisterTest('WC-7547', 'Packslip',  'PSChooseVoid', 'DoShowModal', TestTFrmPSChooseVoid);
end.

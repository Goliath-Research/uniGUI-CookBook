unit WC_7546;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  PSBolWeight;

procedure TestTFrmBOLWeight;
begin
   TFrmBOLWeight.DoShowModal(421);
end;

initialization
  TTestRepo.RegisterTest('WC-7546', 'Packslip',  'PSBolWeight', 'DoShowModal', TestTFrmBOLWeight);
end.

unit WC_6234;

interface

implementation

uses
  TestReg,
  System.Variants,
  ict_truck_rate_destination;

procedure TestDoShowModal;
var
  LTrkDestCrgo: TTruckDestinationCargo;
begin
  TFrmICT_NewTruckRateDestination.DoShowModal(LTrkDestCrgo);
end;

initialization

  TTestRepo.RegisterTest('WC-6234', 'ict ', 'FrmICT_TruckRate', 'DoShowModal', TestDoShowModal);
end.

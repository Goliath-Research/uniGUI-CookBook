unit WC_7599;

interface

implementation

uses
  TestReg,
  ship_trailer;

procedure TestShip_Trailer;
begin
  TFrmShipTrailer.DoShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-7599', 'Packslip', 'TFrmShipTrailer', 'Ship trailer', TestShip_Trailer);

end.

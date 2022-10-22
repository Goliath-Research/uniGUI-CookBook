unit WC_7204;

interface

implementation

uses
  TestReg,
  System.Variants,
  ship_hours;

procedure TestDoShow;
begin
  TFrmShipHours.DoShow(1);
end;

initialization

  TTestRepo.RegisterTest('WC-7204', 'Iqsys ', 'FrmShipHours', 'DoShow', TestDoShow);
end.

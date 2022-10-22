unit WC_7560;

interface

implementation

uses
  TestReg,
  System.Variants,
  PS_FixOrphanPkTkt;

procedure Test1;
var
  APS_Ticket_ID: Real;
begin
  APS_Ticket_ID := 132245;
  TFrmPSFixOrphanedPkTkt.DoShowModal(APS_Ticket_ID);
end;

initialization

  TTestRepo.RegisterTest('WC-7560', 'Packslip', 'FrmPSFixOrphanedPkTkt', 'DoShowModal', Test1);
end.

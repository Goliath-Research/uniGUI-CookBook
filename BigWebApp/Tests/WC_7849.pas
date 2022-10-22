unit WC_7849;

interface

implementation

uses
  TestReg,
  System.Variants,
  PO_Share,
  po_dropship_report;

procedure Test1;
Var
AParams: TPODropShipRec;
begin
  TFrmPODropShipReportSilent.DoExecute(AParams);
end;

initialization

  TTestRepo.RegisterTest('WC-7849', 'Po', 'po_dropship_report', 'DoExecute', Test1);
end.

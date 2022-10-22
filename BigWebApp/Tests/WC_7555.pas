unit WC_7555;

interface

implementation

uses
  TestReg,
  System.Variants,
  PSTkBatchLabels;

procedure Test1;
begin
  TFrmPsTkBatchLabels.DoShowModal(132245);
end;

initialization

  TTestRepo.RegisterTest('WC-7555', 'Packslip', 'FrmPsTkBatchLabels', 'DoShowModal', Test1);
end.

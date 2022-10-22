unit WC_7488;

interface

implementation

uses
  TestReg,
  System.Variants,
  oe_estimate_bol_base;

procedure Test1;
begin
  TFrmEstimateBOLBase.DoShowModal(32451);
end;

initialization

  TTestRepo.RegisterTest('WC-7488', 'Oe', 'FrmEstimateBOLBase', 'DoShowModal', Test1);
end.

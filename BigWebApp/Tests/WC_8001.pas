unit WC_8001;

interface

implementation

uses
  TestReg,
  System.Variants,
  prw_params;

procedure Test1;
begin
  TFrmPRW_Params.DoShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-8001', 'Prw', 'FrmPRW_Params', 'DoShowModal', Test1);
end.

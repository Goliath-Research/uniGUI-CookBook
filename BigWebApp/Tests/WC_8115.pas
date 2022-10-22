unit WC_8115;

interface

implementation

uses
  TestReg,
  System.Variants,
  qc_ppap_psw_submit;

procedure Test1;
begin
  TFrmPSW_Submit.DoShowModal(45345);
end;

initialization

  TTestRepo.RegisterTest('WC-8115', 'Qc_Ppap', 'FrmPSW_Submit', 'DoShowModal', Test1);
end.

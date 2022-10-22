unit WC_7205;

interface

implementation

uses
  TestReg,
  System.Variants,
  sys_bol;

procedure TestDoShowModal;
begin
  TFrmBolParams.DoShowModal
end;

initialization

  TTestRepo.RegisterTest('WC-7205', 'Iqsys ', 'FrmBolParams', 'DoShowModal', TestDoShowModal);
end.

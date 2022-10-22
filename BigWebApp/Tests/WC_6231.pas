unit WC_6231;

interface

implementation

uses
  TestReg,
  System.Variants,
  ict_setup;

procedure TestDoShowModal;
begin
  TFrmICT_SetUp.DoShowModal
end;

initialization

  TTestRepo.RegisterTest('WC-6231', 'ict ', 'FrmICT_SetUp', 'DoShowModal', TestDoShowModal);
end.

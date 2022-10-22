unit WC_6228;

interface

implementation

uses
  TestReg,
  System.Variants,
  ict_params;

procedure TestDoShowModal;
begin
  TFrmICT_Params.DoShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-6228', 'ict ', 'FrmICT_Params', 'DoShowModal', TestDoShowModal);
end.

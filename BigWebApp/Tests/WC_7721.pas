unit WC_7721;

interface

implementation

uses
  TestReg,
  System.Variants,
  System.StrUtils,
  System.Classes,
  uniGUIDialogs,
  plm_params;

procedure Test1;
begin
  ShowMessage(IfThen( TFrmPlmParams.DoShowModal, 'OK', 'Cancel'));
end;

initialization

  TTestRepo.RegisterTest('WC-7721', 'Plm ', 'FrmOutOfBal', 'DoShowModal', Test1);
end.

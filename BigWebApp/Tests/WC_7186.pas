unit WC_7186;

interface

implementation

uses
  TestReg,
  System.Variants,
  Master_Labor;

procedure TestShowModeless;
begin
  TFrmMasterLabor.ShowModeless;
end;

initialization

  TTestRepo.RegisterTest('WC-7186', 'Iqsys ', 'FrmMasterLabor', 'ShowModeless', TestShowModeless);
end.

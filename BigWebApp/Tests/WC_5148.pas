unit WC_5148;

interface

implementation

uses
  TestReg,
  System.Variants,
  APConf3;

procedure Test1;
begin
  DoShowModalDialogCheckBox('Out of balance warning', 'Key1', True);
end;

initialization

  TTestRepo.RegisterTest('WC-5148', 'Ap', 'FrmOutOfBal', 'DoShowModalDialogCheckBox', Test1);
end.

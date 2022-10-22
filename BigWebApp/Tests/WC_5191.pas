unit WC_5191;

interface

implementation

uses
  TestReg,
  System.Variants,
  ARConfSp;

procedure Test1;
begin
  DoShowModalDialogCheckBox('Test Warning', 'Key1', True);
end;

initialization

  TTestRepo.RegisterTest('WC-5191', 'Ar', 'FrmConfirmArinvtSalesAccountSplit', 'DoShowModalDialogCheckBox', Test1);
end.

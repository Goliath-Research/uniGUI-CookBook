unit WC_7556;

interface

implementation

uses
  TestReg,
  System.Variants,
  PSTkChkQty;

procedure Test1;
begin
  //DoShowModalDialogCheckBox('Packslip warning test', 'Key1', True);
end;

initialization

  TTestRepo.RegisterTest('WC-7556', 'Packslip', 'FrmPSTkChkQty', 'DoShowModalDialogCheckBox', Test1);
end.

unit WC_6362;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  inv_relieve_to_parent_dlg;

procedure Test1;
var
 LFrmInvRelieveToParentDialog: TFrmInvRelieveToParentDialog;
 ACargo: TRelieveToParentCargo;
begin
  TFrmInvRelieveToParentDialog.DoShowModal(ACargo);
end;

initialization

  TTestRepo.RegisterTest('WC-6362', 'Inv', 'inv_relieve_to_parent_dlg', 'DoShowModal', Test1);
end.

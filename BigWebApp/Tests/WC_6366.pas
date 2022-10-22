unit WC_6366;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  inv_secured_confirm_add_mps;

procedure Test1;
var
 Form: TFrmSecuredConfirmAddMPS;
begin
   Form := TFrmSecuredConfirmAddMPS.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-6366', 'Inv', 'inv_secured_confirm_add_mps', 'create', Test1);
end.

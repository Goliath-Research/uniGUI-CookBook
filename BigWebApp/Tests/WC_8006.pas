unit WC_8006;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  prw_secured_confirm_delete_wo;

procedure Test1;
var
 Form: TFrmPRWSecuredConfirmDeleteWO;
begin
   Form := TFrmPRWSecuredConfirmDeleteWO.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-8006', 'Prw', 'prw_secured_confirm_delete_wo', 'create', Test1);
end.

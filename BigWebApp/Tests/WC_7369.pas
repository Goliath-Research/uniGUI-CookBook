unit WC_7369;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  JS2_secured_confirm_archive;

procedure Test1;
var
 Form: TFrmJS2SecuredConfirmArchive;
begin
   Form := TFrmJS2SecuredConfirmArchive.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-7369', 'Jobshop', 'JS2_secured_confirm_archive', 'create', Test1);
end.

unit WC_7866;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  secure_confirm_close_po;

procedure Test1;
var
 Form: TFrmSecuredConfirmClosePO;
begin
   Form := TFrmSecuredConfirmClosePO.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-7866', 'Po', 'secure_confirm_close_po', 'create', Test1);
end.

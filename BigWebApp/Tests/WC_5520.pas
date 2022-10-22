unit WC_5520;

interface

implementation

uses
  TestReg,
  System.StrUtils,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  CRConfirmVoid,
  IQMS.WebVcl.SecRoleGroups;

procedure Test;
var
  r : boolean;
begin
  r := DoShowModalConfirmCRVoid('Some Text','CrKey');
  ShowMessage(IfThen(r, 'Ok', 'Cancelled'));
end;

initialization

  TTestRepo.RegisterTest('WC-5520', 'Cr', 'ConfirmCRVoid', 'DoShowModalConfirmCRVoid', Test);

end.

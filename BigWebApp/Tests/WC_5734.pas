unit WC_5734;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  crm_alertmsg;

procedure TestShowAlertMessage;
var
  ANewGroup_ID:Real;
begin
  ShowAlertMessage('Form Caption',' Title ',' Message ');
end;

initialization

  TTestRepo.RegisterTest('WC-5734', 'Crm_Alert', 'crm_alertmsg', 'ShowAlertMessage', TestShowAlertMessage);

end.

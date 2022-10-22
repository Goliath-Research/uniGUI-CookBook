unit WC_5601;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  crm_activity_delete;

procedure TestDeleteActivity;
begin
  DeleteActivity(680);
end;

initialization

  TTestRepo.RegisterTest('WC-5601', 'CRM', 'crm_activity_delete', 'DeleteActivity', TestDeleteActivity);

end.

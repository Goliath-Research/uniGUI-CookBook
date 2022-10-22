unit WC_5677;

interface

implementation

uses
  TestReg,
  SysUtils,
  Classes,
  uniGUIDialogs,
  UniGUIApplication,
  crm_recur_open;

procedure Test1;
begin
  TFrmCRMOpenRecurrencePrompt.Create(UniGUIApplication.UniApplication).ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-5677', 'Crm', 'crm_recur_open', 'ShowModal', Test1);

end.

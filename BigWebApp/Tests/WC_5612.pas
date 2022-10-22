unit WC_5612;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  crm_addmins;

procedure Test1;
var AValue: Integer;
begin
  if DoCRMAddMinutes(AValue) then
    showmessage(inttostr(AValue));
end;

initialization

  TTestRepo.RegisterTest('WC-5612', 'CRM', 'crm_addmins', 'DoCRMAddMinutes', Test1);

end.

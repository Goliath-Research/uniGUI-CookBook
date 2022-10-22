unit WC_5814;

interface

implementation

uses
  TestReg,
  crm_soconfig_del_option_dlg,
  Dialogs;

procedure Test1;
begin
  if PromptDeleteSalesConfigOption then
    Showmessage('Record Deleted Successfully');
end;

initialization

  TTestRepo.RegisterTest('WC-5814', 'CRM_Quote', 'crm_soconfig_del_option_dlg', 'PromptDeleteSalesConfigOption', Test1);

end.

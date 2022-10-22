unit WC_5822;

interface

implementation

uses
  TestReg,
  crm_uom,
  Dialogs;

procedure Test1;
begin
  if GetCRM_UOM then
    Showmessage('Success');
end;

initialization

  TTestRepo.RegisterTest('WC-5822', 'CRM_Quote', 'crm_uom', 'GetCRM_UOM', Test1);

end.

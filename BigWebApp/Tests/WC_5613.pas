unit WC_5613;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  crm_addpartner,
  uniGUIApplication;

procedure Test1;
begin
  TQuickAddPartner.Create(uniGUIApplication.UniApplication).Show;
end;

initialization

  TTestRepo.RegisterTest('WC-5613', 'crm', 'crm_addpartner', 'Create', Test1);

end.

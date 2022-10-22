unit WC_5662;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  crm_menu_prop;

procedure Test1;
  var ADescrip,
      ACaption: String;
      AVisible: Boolean;
begin
  if DoCRMMenuProp(ADescrip,ACaption,AVisible) then
    showmessage(ACaption);
end;

initialization

  TTestRepo.RegisterTest('WC-5662', 'CRM', 'crm_menu_prop', 'DoCRMMenuProp', Test1);

end.

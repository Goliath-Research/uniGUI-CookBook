unit WC_5799;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  crm_popup_main;

procedure Test1;
var
 Form: TFrmCRMPopupMain;
begin
   Form := TFrmCRMPopupMain.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-5799', 'Crm_Popup', 'crm_popup_main', 'create', Test1);
end.

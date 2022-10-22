unit WC_5811;

interface

implementation

uses
  TestReg,
  crm_soconfig_choice_qk,
  Dialogs,
  System.SysUtils;

procedure Test1;
var
  Sales_Choice_ID: Real;
  Res : Integer;
begin
  Res := TFrmSalesConfigChoiceQk.DoShowModal(Sales_Choice_ID);
  {If 'OK' is pressed}
  If Res = 1 then
    Showmessage('Sales added with Sales Choice ID' + Floattostr(Sales_Choice_ID));
end;

initialization

  TTestRepo.RegisterTest('WC-5811', 'CRM_Quote', 'crm_soconfig_choice_qk', 'DoShowModal', Test1);

end.

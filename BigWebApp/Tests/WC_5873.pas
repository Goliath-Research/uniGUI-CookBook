unit WC_5873;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  InactiveContactSalesOrderChk;

procedure Test1;
begin
  CheckContactOrdersBeforeSettingInactive(20239,14323);
end;

initialization

  TTestRepo.RegisterTest('WC-5873', 'Customer', 'InactiveContactSalesOrderChk', 'CheckContactOrdersBeforeSettingInactive', Test1);

end.

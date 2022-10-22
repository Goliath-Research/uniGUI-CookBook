unit WC_5812;

interface

implementation

uses
  TestReg,
  crm_soconfig_choice_replace,
  Dialogs,
  System.SysUtils;

procedure Test1;
var
  SalesChoiceID: Real;
  Price: Real;
  ChangeSalesChoiceID: Boolean;
  ChangePrice: Boolean;
begin
  SalesChoiceID := 93;
  Price := 1;
  if ReplaceCRMConfigChoice(SalesChoiceID, Price, ChangeSalesChoiceID, ChangePrice) then
    Showmessage('Sales Choice ID: ' + Floattostr(SalesChoiceID) + #9 + 'Price: ' + Floattostr(Price) + #13 +'Changed Sales Choice ID: ' + BoolToStr(ChangeSalesChoiceID) + #9+'Changed Price : '+ Booltostr(ChangePrice));
end;

initialization

  TTestRepo.RegisterTest('WC-5812', 'CRM_Quote', 'crm_soconfig_choice_replace', 'ReplaceCRMConfigChoice', Test1);

end.

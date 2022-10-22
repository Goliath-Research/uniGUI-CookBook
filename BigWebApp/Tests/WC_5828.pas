unit WC_5828;

interface

implementation

uses
  TestReg,
  crmquote_soprompt,
  Dialogs,
  System.SysUtils;

procedure Test1;
var
  CRM_Quote_ID: Int64;
  IntDoc, ExtDoc, EMailCorr, CombineSalesConfig: Boolean;
  ExistingOrders_ID: Int64;
begin
  CRM_Quote_ID := 77;
  if DoPromptConvert(CRM_Quote_ID, IntDoc, ExtDoc, EMailCorr, CombineSalesConfig,ExistingOrders_ID)then
    Showmessage('CRM Quote ID: '+ Floattostr(CRM_Quote_ID) );
end;

initialization

  TTestRepo.RegisterTest('WC-5828', 'CRM_Quote', 'crmquote_soprompt', 'DoPromptConvert', Test1);

end.

unit WC_5804;

interface

implementation

uses
  TestReg,
  crm_quote_markup,
  IQMS.CRM.SalesQuote.MarkupConst,
  Dialogs,
  typInfo,
  System.SysUtils;

procedure Test1;
var
  Options: TMarkupOptions;
  CanApplyToAllSalesChoices: Boolean;
begin
  CanApplyToAllSalesChoices := true;
  if TFrmCRMMarkupOptionsDlg.DoShowModal(CanApplyToAllSalesChoices, Options) then
    if CanApplyToAllSalesChoices then
      Showmessage('Apply to All Sales Choices with Markup Option Type: ' +  getEnumName(TypeInfo(TMarkupOptionType), ord(Options.MarkupOptionType)) + #13 +'with Markup Value: ' + Floattostr(Options.MarkupValue));
end;

initialization

  TTestRepo.RegisterTest('WC-5804', 'CRM_Quote', 'crm_quote_markup', 'DoShowModal', Test1);

end.

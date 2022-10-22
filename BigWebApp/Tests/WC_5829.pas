unit WC_5829;

interface

implementation

uses
  TestReg,
  crmquote_svclbr,
  Dialogs,
  crmquotemisc,
  System.SysUtils;

procedure Test1;
var
  MiscItemInfo: TMiscItemInfo;
  I: Integer;
begin
  if AddServiceLaborCRMQuoteItem(MiscItemInfo) then
    with MiscItemInfo do
    begin
      ShowMessage('Description: ' + Description +'\n Quantity'+ FloatToStr(Quantity) + '\n Unit Price : ' + FloatToStr(UnitPrice) + '\n UOM: '+ UOM);
    end;
end;

initialization

  TTestRepo.RegisterTest('WC-5829', 'Crm_Quote', 'crmquote_svclbr', 'AddServiceLaborCRMQuoteItem', Test1);

end.

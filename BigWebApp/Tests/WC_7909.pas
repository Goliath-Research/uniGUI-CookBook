unit WC_7909;

interface

implementation

uses
  TestReg,
  System.Variants,
  prn_crm_quote,
  DateUtils,
  System.SysUtils  ;

procedure Test1;
begin
  DoPrintCRMQuote(34521, DateTimeToStr(now), DateTimeToStr(now-1));
end;

initialization

  TTestRepo.RegisterTest('WC-7909', 'Print_Dialogs', 'FrmPrintDocsCRMQuote', 'DoPrintCRMQuote', Test1);
end.

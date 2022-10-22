unit WC_7908;

interface

implementation

uses
  TestReg,
  System.Variants,
  prn_crm_ack,
  DateUtils,
  System.SysUtils  ;

procedure Test1;
begin
  DoPrintCRMQuoteAck(34521, DateTimeToStr(now), DateTimeToStr(now-1));
end;

initialization

  TTestRepo.RegisterTest('WC-7908', 'Print_Dialogs', 'FrmPrintDocsCRMAck', 'DoPrintCRMQuoteAck', Test1);
end.

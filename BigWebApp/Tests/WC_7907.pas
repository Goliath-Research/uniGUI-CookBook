unit WC_7907;

interface

implementation

uses
  TestReg,
  System.Variants,
  prn_commer_invoice,
  DateUtils,
  System.SysUtils  ;

procedure Test1;
begin
  DoPrintCommercialInvoice(DateTimeToStr(now), DateTimeToStr(now-1), True);
end;

initialization

  TTestRepo.RegisterTest('WC-7907', 'Print_Dialogs', 'FrmPrintCommerInvoice', 'DoPrintCommercialInvoice', Test1);
end.

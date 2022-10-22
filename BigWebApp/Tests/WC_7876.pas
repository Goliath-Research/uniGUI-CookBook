unit WC_7876;

interface

implementation

uses
  TestReg,
  System.Variants,
  Prn_CRMWarranty,
  DateUtils,
  System.SysUtils  ;

procedure Test1;
begin
  DoPrintCRMServiceReport(DateTimeToStr(now), DateTimeToStr(now-1));
end;

initialization

  TTestRepo.RegisterTest('WC-7876', 'Print_Dialogs', 'FrmPrintDocsCRMService', 'DoPrintCRMServiceReport', Test1);
end.

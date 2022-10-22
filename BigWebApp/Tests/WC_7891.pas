unit WC_7891;

interface

implementation

uses
  TestReg,
  System.Variants,
  Prn_RR_WO,
  DateUtils,
  System.SysUtils  ;

procedure Test1;
begin
  DoPrintRR_WO(DateTimeToStr(now), DateTimeToStr(now-1));
end;

initialization

  TTestRepo.RegisterTest('WC-7891', 'Print_Dialogs', 'FrmPrintRR_WO', 'DoPrintRR_WO', Test1);
end.

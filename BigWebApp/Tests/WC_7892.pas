unit WC_7892;

interface

implementation

uses
  TestReg,
  System.Variants,
  Prn_Rcv,
  DateUtils,
  System.SysUtils  ;

procedure Test1;
begin
  DoPrintRecv_Ticket(DateTimeToStr(now), DateTimeToStr(now-1));
end;

initialization

  TTestRepo.RegisterTest('WC-7892', 'Print_Dialogs', 'FrmPrintDocsReceive', 'DoPrintRecv_Ticket', Test1);
end.

unit WC_7898;

interface

implementation

uses
  TestReg,
  System.Variants,
  System.SysUtils,
  DateUtils,
  Prn_Tck_Over_Lbl;

procedure Test1;
begin
  DoPrintPS_Ticket_OverlayLabels(DateTimeToStr(now), DateTimeToStr(now-1));
end;

initialization

  TTestRepo.RegisterTest('WC-7898', 'Print_Dialogs ', 'FrmPrintDocsTicketOverlayLabels', 'DoPrintPS_Ticket_OverlayLabels', Test1);
end.

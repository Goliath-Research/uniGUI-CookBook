unit WC_7896;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Prn_Tck;

procedure Test1;
begin
  TFrmPrintDocsTicket.DoShow( DateTimeToStr(now-1), DateTimeToStr(now), 3);
end;

initialization

  TTestRepo.RegisterTest('WC-7896', 'Print_Dialogs', 'Prn_Tck', 'DoShow', Test1, 1);

end.

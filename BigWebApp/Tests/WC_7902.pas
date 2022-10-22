unit WC_7902;

interface

implementation

uses
  TestReg,
  System.SysUtils,
  DateUtils,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  Prn_exp;

procedure TestDoPrintExpReport;
begin
  DoPrintExpReport(DateTimeToStr(now), DateTimeToStr(now-1));
end;

initialization

  TTestRepo.RegisterTest('WC-7902', 'Print_Dialogs', 'FrmPrintDocsExpReport', 'DoPrintExpReport', TestDoPrintExpReport, 1);

end.

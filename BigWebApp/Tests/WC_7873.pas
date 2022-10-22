unit WC_7873;

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
  Prn_Bol;

procedure TestDoPrintPS_BOL;
begin
  DoPrintPS_BOL(DateTimeToStr(now), DateTimeToStr(now-1));
end;

initialization

  TTestRepo.RegisterTest('WC-7873', 'Print_Dialogs', 'FrmPrintBOL', 'DoPrintPS_BOL', TestDoPrintPS_BOL, 1);

end.

unit WC_7872;

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
  Prn_BOM;

procedure TestDoPrintBOM;
begin
  DoPrintBOM(DateTimeToStr(now), DateTimeToStr(now-1));
end;

initialization

  TTestRepo.RegisterTest('WC-7872', 'Print_Dialogs', 'TFrmPrintDocsBOM', 'DoPrintBOM', TestDoPrintBOM);

end.

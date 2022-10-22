unit WC_8148;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  Q_ConvBOM;

procedure Test;
begin
  TFrmQuoteConvertedBOMs.DoShow(56);
end;

initialization

  TTestRepo.RegisterTest('WC-8148', 'Quote', 'Q_ConvBOM', 'DoShow', Test);

end.

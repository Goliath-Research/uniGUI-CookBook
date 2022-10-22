unit WC_8144;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  Q_CHART;

procedure Test;
begin
  DoQ_Chart(4323);
end;

initialization

  TTestRepo.RegisterTest('WC-8144', 'Quote', 'Q_CHART', 'DoQ_Chart', Test);

end.

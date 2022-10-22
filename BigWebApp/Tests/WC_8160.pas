unit WC_8160;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  uniStringGrid,
  Q_Optim;

procedure Test;
var
  LFrmOptimize : TFrmOptimize;
  ACalcGrid : TUniStringGrid;
begin
  LFrmOptimize := TFrmOptimize.Create(UniGUIApplication.UniApplication);
  ACalcGrid := TUniStringGrid.Create(LFrmOptimize);
  LFrmOptimize.CalcGrid := ACalcGrid;
  LFrmOptimize.Show;
end;

initialization

  TTestRepo.RegisterTest('WC-8160', 'Quote', 'Q_Optim', 'Create', Test);

end.

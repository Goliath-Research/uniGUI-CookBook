unit WC_6409;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  kb_formulas;

procedure Test;
begin
  TFrmKB_Formula.DoShow('EPEI');
end;

initialization

  TTestRepo.RegisterTest('WC-6409', 'Inv', 'kb_formulas', 'DoShow', Test);

end.

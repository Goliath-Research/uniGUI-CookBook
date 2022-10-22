unit WC_6408;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  kb_formula_editor;

procedure Test;
var
  a : TStrings;
begin
  a := TStrings.create;
  TFrmKB_FormulaEditor.DoShowModal(12428,a);
end;

initialization

  TTestRepo.RegisterTest('WC-6408', 'Inv', 'kb_formula_editor', 'DoShowModal', Test);

end.

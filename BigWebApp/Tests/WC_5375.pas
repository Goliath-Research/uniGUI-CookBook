unit WC_5375;

interface

implementation

uses
  TestReg,
  SysUtils,
  StrUtils,
  uniGUIDialogs,
  bom_aux_tool;

procedure TestBomAuxTool;
begin
  TFrmBomAuxTool.DoShowModal(1252);
end;

initialization

  TTestRepo.RegisterTest('WC-5375', 'BOM', 'FrmBomAuxTool', 'DoShowModal', TestBomAuxTool);

end.

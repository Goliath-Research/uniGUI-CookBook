unit WC_7968;

interface

implementation

uses
  TestReg,
  SysUtils,
  StrUtils,
  uniGUIDialogs,
  ProdChangeItem;

procedure TestProdChangeItem_Execute;
var
  LVar: Real;
begin
  TFrmProdChangeItem.Execute(1252, 1252, 1252, LVar);
end;

procedure TestProdChangeItem_Execute_ExA;
var
  LVar: Real;
begin
  TFrmProdChangeItem.Execute_ExA(1252, LVar);
end;

initialization

  TTestRepo.RegisterTest('WC-7968', 'PROD', 'FrmProdChangeItem', 'Execute', TestProdChangeItem_Execute);
  //TTestRepo.RegisterTest('WC-7968', 'PROD', 'FrmProdChangeItem', 'Execute_ExA', TestProdChangeItem_Execute_ExA);

end.

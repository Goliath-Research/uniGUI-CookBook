unit WC_8294;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  ProdRprLst;

procedure Test1;
begin
  TFrmProdRepairList.DoShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-8294', 'Rma', 'ProdRprLst', 'DoShowModal', Test1, 1);

end.

unit WC_7974;

interface

implementation

uses
  TestReg,
  System.Variants,
  ProdPara;

procedure Test1;
begin
  DoProdRepParams;
end;

initialization

  TTestRepo.RegisterTest('WC-7974', 'Prod', 'FrmProdParams', 'DoProdRepParams', Test1);
end.

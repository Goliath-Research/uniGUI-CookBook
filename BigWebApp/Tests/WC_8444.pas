unit WC_8444;

interface

implementation

uses
  TestReg,
  System.Variants,
  SalesPiv;

procedure Test1;
begin
  DoSalesAnalysisViaPivotTable;
end;

initialization

  TTestRepo.RegisterTest('WC-8444', 'Sanalys ', 'FrmSalesPivot', 'DoSalesAnalysisViaPivotTable', Test1);
end.

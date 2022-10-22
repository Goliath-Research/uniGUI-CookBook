unit WC_7987;

interface

implementation

uses
  TestReg,
  System.Variants,
  prod_del_reported_chk;

procedure Test1;
begin
  CheckDeletingReportedProdDispo(443659);
end;

initialization

  TTestRepo.RegisterTest('WC-7987', 'Prod', 'TFrmDeleteReportedProdDispoException', 'CheckDeletingReportedProdDispo', Test1);
end.

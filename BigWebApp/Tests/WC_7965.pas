unit WC_7965;

interface

implementation

uses
  TestReg,
  ProdGoTo,
  FireDAC.Comp.Client;

procedure Test1;
var
  DataSet : TFDRDBMSDataSet;
begin
  DoProdGoToDlg( DataSet);
end;

initialization

  TTestRepo.RegisterTest('WC-7965', 'Prod', 'ProdGoTo', 'DoProdGoToDlg', Test1);
end.

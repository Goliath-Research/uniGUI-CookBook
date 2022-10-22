unit WC_6242;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  FireDAC.Comp.Client,
  MainModule,
  AutoMrp,
  Data.DB;

procedure Test1;
var
  DataSource : TDataSource;
  DataSet : TFDTable;
begin
try
  DataSource := TDataSource.create(nil);
  DataSet := TFDTable.create(nil);
  DataSet.Connection := UniMainModule.FDConnection1;
  DataSet.TableName := 'SHIPMENT_PACKAGES';
  DataSource.DataSet := DataSet;
  DataSet.Open;
  DoShowAutoMRP(DataSource);
finally
  DataSet.Free;
  DataSource.Free;
end;
end;

initialization

  TTestRepo.RegisterTest('WC-6242', 'Inv', 'AutoMrp', 'DoShowAutoMRP', Test1);
end.

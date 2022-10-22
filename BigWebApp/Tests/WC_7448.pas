unit WC_7448;

interface

implementation

uses
  TestReg,
  OE_2_WO,
  FireDAC.Comp.Client,
  Data.DB,
  MainModule;

procedure Test1;
var
  AQry  : TFDQuery;
  DataSource: TDataSource;
begin
  AQry := TFDQuery.Create(nil);
  AQry.Connection := UniMainModule.FDConnection1;
  AQry.SQL.Text :='select * from releases';
  AQry.Open();
  DataSource := TDataSource.Create(nil);
  DataSource.DataSet := AQry;
  DoOrderEntry2WorkOrderInfo( DataSource);
end;

procedure Test2;
begin

  DoJobShop2WorkOrderInfo( 1710 );
end;

initialization

  TTestRepo.RegisterTest('WC-7448', 'Oe', 'OE_2_WO', 'DoOrderEntry2WorkOrderInfo', Test1, 1);
  TTestRepo.RegisterTest('WC-7448', 'Oe', 'OE_2_WO', 'DoJobShop2WorkOrderInfo', Test2, 2);
end.

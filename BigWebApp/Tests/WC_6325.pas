unit WC_6325;

interface

implementation

uses
  TestReg,
  System.Variants,
  Uom_Conv,
  FireDAC.Comp.Client,
  Data.DB,
  MainModule;

procedure Test1;
var
  AQry  : TFDQuery;
  DataSource: TDataSource;
begin
  try
  AQry := TFDQuery.Create(nil);
  AQry.Connection := UniMainModule.FDConnection1;
  AQry.SQL.Text :='select * from arinvt';
  AQry.Open();
  DataSource := TDataSource.Create(nil);
  DataSource.DataSet := AQry;
  DoAssign_Arinvt_UOM_Conv(DataSource);
  finally
    AQry.free;
  end;
end;

initialization

  TTestRepo.RegisterTest('WC-6325', 'Inv', 'UOM_Conv', 'DoAssign_Arinvt_UOM_Conv', Test1);
end.

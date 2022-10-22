unit WC_6709;

interface

implementation

uses
  TestReg,
  System.Classes,
  FireDAC.comp.client,
  Data.DB,
  ForeEdit,
  MainModule;

procedure Test1;
var
  LQryDataset: TFDQuery;
  LArcusto_ID :Real;
  LForecastType:string;
  LForeHeadID:Real;
  ID: TBCDField;
  ARINVT_ID:TBCDField;
  FOREHEAD_ID: TBCDField;
  STANDARD_ID:TBCDField;
begin
  LQryDataset := TFDQuery.create(nil);
  with LQryDataset do
  begin
    Close;
    Connection := UniMainModule.FDConnection1;
    SQL.Text := 'select * from FORE_ITEM';
    Open;
  end;
  LArcusto_ID:= 20536;
  LForecastType:= 'S';
  LForeHeadID := 41;
  DoEditForecast('JAN',LQryDataset,LArcusto_ID,LForecastType,LForeHeadID);
end;

initialization

  TTestRepo.RegisterTest('WC_6709', 'Iqforecast', 'ForeEdit', 'DoEditForecast', Test1);

end.

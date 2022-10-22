unit WC_6341;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  uniGUIDialogs,
  MainModule,
  inv_calc_uom_factor,
  FireDAC.Comp.Client,
  IQMS.Common.DataConst,
  Data.DB;

procedure Test1;
var
  ADataSource: TDatasource;
  ADataset: TFDQuery;
begin

  ADataset := TFDQuery.create(UniApplication);
  ADataSource := TDatasource.create(UniApplication);
  try
    ADataset.ConnectionName := cnstFDConnectionName;
    ADataset.SQL.Text := 'select id from arinvt where id = 147534';
//    ADataset.SQL.Text := 'select id from arinvt where id = 147532';
    ADataset.Open;
    ADataSource.Dataset := ADataset;

    if TFrmCalcUOMFactor.DoShowModal(ADataSource) then
      Showmessage('TRUE')
    else
      Showmessage('FALSE');

  finally
    ADataSource.free;
    ADataset.free;
  end;

end;

initialization

TTestRepo.RegisterTest('WC-6341', 'Inv', 'inv_calc_uom_factor', 'DoShowModal', Test1);

end.

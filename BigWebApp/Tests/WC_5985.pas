unit WC_5985;

interface

uses
  TestReg,
  Dsp_Prod,
  FireDAC.Comp.Client,
  Data.DB,
  MainModule,
  IQMS.COmmon.DataLib;

  procedure SetQuery(AQry: TFDQuery; DataSource: TDataSource);
implementation



procedure Test1;
var
  AQry: TFDQuery;
  DataSource: TDataSource;
begin
  try
    AQry := TFDQuery.Create(nil);
    DataSource := TDataSource.Create(nil);
    SetQuery(AQry, DataSource);
    DoEditProdDisposition(DataSource);
  finally
    AQry.free;
    DataSource.free;
  end;
end;

procedure Test2;
var
  AQry: TFDQuery;
  DataSource: TDataSource;
begin
  try
    AQry := TFDQuery.Create(nil);
    DataSource := TDataSource.Create(nil);
    SetQuery(AQry, DataSource);
    CreateAutoDispoObject(DataSource, 'TEMPORARY', 'TEMPORARY');
  finally
    AQry.free;
    DataSource.free;
  end;
end;

procedure Test3;
var
  AQry: TFDQuery;
  DataSource: TDataSource;
begin
  try
    AQry := TFDQuery.Create(nil);
    DataSource := TDataSource.Create(nil);
    SetQuery(AQry, DataSource);
    AlertCreateAutoDispoObject(DataSource, 'TEMPORARY', 'TEMPORARY', 186, 1, 4);
  finally
    AQry.free;
    DataSource.free;
  end;
end;

procedure SetQuery(AQry: TFDQuery; DataSource: TDataSource);
begin
    AQry.Connection := UniMainModule.FDConnection1;
    AQry.SQL.Text := 'select p.id, p.dayprod_id,p.hist_illum_part_id,p.class, p.itemno,'+
                       ' p.rev,p.descrip,p.descrip2,nvl(p.stdcav, 1) as stdcav,nvl(p.actcav, 1) as actcav,DECODE( mfg.lookup_mfgtype(h.mfg_type), '+
                               ' ''EXTRUSION'', Round( p.rejects / (p.ptwt / 12), 2),'+
                               ' ''EXTRUSION2'', Round(uom.iqconvert(''EACH'', arinvt.unit, p.rejects, partno.arinvt_id, ''Y''), 2),'+
                               ' ''EXTRUSION3'', Round(uom.iqconvert(''EACH'', arinvt.unit, p.rejects, partno.arinvt_id, ''Y''), 2),'+
                               ' ''SLITTING'' , DECODE(mfg.is_weight(h.mfg_type), 1,'+
                                  ' p.rejects,'+
                                  ' Round( p.rejects / (p.ptwt / 12), 2)),'+
                               ' p.rejects) as rejects, p.dispo,p.trans_batch,partno.arinvt_id,p.ptwt,'+
                       ' DECODE( mfg.lookup_mfgtype(h.mfg_type),'+
                               ' ''EXTRUSION'', Round( p.good_pts / (p.ptwt / 12), 2),'+
                               ' ''SLITTING'', DECODE(mfg.is_weight(h.mfg_type), 1,'+
                                  ' p.good_pts,'+
                                  ' Round( p.good_pts / (p.ptwt / 12), 2)),'+
                               ' p.good_pts ) as good_pts,'+
                       ' DECODE( mfg.lookup_mfgtype(h.mfg_type),'+
                               ' ''EXTRUSION'', Round( p.floor_dispo_qty / (p.ptwt / 12), 2),'+
                               ' ''SLITTING'', DECODE(mfg.is_weight(h.mfg_type), 1,'+
                                  ' p.floor_dispo_qty,'+
                                  ' Round( p.floor_dispo_qty / (p.ptwt / 12), 2)),'+
                               ' p.floor_dispo_qty ) as floor_dispo_qty,'+
                       ' h.mfgcell_id,'+
                       ' arinvt.unit,'+
                       ' p.config_code,'+
                       ' p.ptwt_disp,'+
                       ' partno.id as partno_id,'+
                       ' partno.standard_id,'+
                       ' arinvt.is_by_product,'+
                       ' p.dispo_error,'+
                       ' partno.space_trim_width as width,'+
                       ' arinvt.loose_volume'+
                     ' from v_day_part p, dayprod, hist_illum_rt h, partno, arinvt'+
                     ' where p.dayprod_id = :id'+
                        ' and dayprod.id = p.dayprod_id'+
                        ' and h.id = dayprod.hist_illum_rt_id'+
                        ' and p.partno_id = partno.id(+)'+
                        ' and partno.arinvt_id = arinvt.id(+)'+
                           ' -- extrusion 2 must have actcav > 0'+
                        ' and decode( mfg.lookup_mfgtype(h.mfg_type),'+
                                    ' ''EXTRUSION2'', NVL(p.actcav,0),'+
                                    ' ''COMPOUND1'', NVL(p.actcav,0),'+
                                    ' 1 ) > 0';
    AQry.Params[0].ParamType := ptInput;
    AQry.Params[0].DataType := ftBCD;
    AssignQueryParamValue(AQry, 'ID', 448042);
    AQry.Open();
    DataSource.DataSet := AQry;
end;

initialization

TTestRepo.RegisterTest('WC-5985', 'Dispo', 'Dsp_Prod', 'DoEditProdDisposition',
  Test1, 1);
TTestRepo.RegisterTest('WC-5985', 'Dispo', 'Dsp_Prod', 'CreateAutoDispoObject',
  Test2, 2);
TTestRepo.RegisterTest('WC-5985', 'Dispo', 'Dsp_Prod',
  'AlertCreateAutoDispoObject', Test3, 3);

end.

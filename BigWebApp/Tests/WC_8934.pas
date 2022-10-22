unit WC_8934;

interface

implementation

uses
  TestReg,
  wave_pick_dlg,
  wave_share,
  FireDAC.comp.client,
  Data.DB,
  MainModule,
  IQMS.Common.DataLib;

procedure Test1;
var
  AParam: TWavePickCriteriaParam;
  QryWave: TFDQuery;
  FEvaluateRequestDate : Boolean;
begin
  QryWave := TFDQuery.create(nil);
  with QryWave do
  begin
    Close;
    Connection := UniMainModule.FDConnection1;
    SQL.Text := 'select * from wave_pick';
    Open;
  end;
  FEvaluateRequestDate := True;
  AParam:= TWavePickCriteriaParam.Create(QryWave.fieldByName('ID').asFloat);
  AParam.Division_ID   := SelectValueByID('division_id', 'wave_pick', QryWave.fieldByName('ID').asFloat );
  AParam.EPlant_ID     := SelectValueByID('eplant_id',   'wave_pick', QryWave.fieldByName('ID').asFloat );
  AParam.Arcusto_ID    := SelectValueByID('arcusto_id',  'wave_pick', QryWave.fieldByName('ID').asFloat );
  AParam.Ship_To_ID    := SelectValueByID('ship_to_id',  'wave_pick', QryWave.fieldByName('ID').asFloat );
  AParam.Freight_ID    := SelectValueByID('freight_id',  'wave_pick', QryWave.fieldByName('ID').asFloat );
  AParam.FromShipDate  := SelectValueByID('ship_date',   'wave_pick', QryWave.fieldByName('ID').asFloat );
  AParam.ToShipDate    := SelectValueByID('to_ship_date','wave_pick', QryWave.fieldByName('ID').asFloat );
  AParam.Expedite_Axe  := SelectValueByID('expedite_axe','wave_pick', QryWave.fieldByName('ID').asFloat );
  AParam.SalesPeople_ID:= SelectValueByID('salespeople_id', 'wave_pick', QryWave.fieldByName('ID').asFloat );
  AParam.PR_Emp_ID     := SelectValueByID('pr_emp_id',   'wave_pick', QryWave.fieldByName('ID').asFloat );
  AParam.Cust_Group    := SelectValueByID('cust_group',  'wave_pick', QryWave.fieldByName('ID').asFloat );
  AParam.EvalReqDate   := FEvaluateRequestDate;
  AParam.Ran_From      := SelectValueByID('ran_from',    'wave_pick', QryWave.fieldByName('ID').asFloat );
  AParam.Ran_To        := SelectValueByID('ran_to',      'wave_pick', QryWave.fieldByName('ID').asFloat );
  TFrmWavePickDlg.DoShow(AParam);
end;

initialization

  TTestRepo.RegisterTest('WC_8934', 'Wave', 'wave_pick_dlg', 'DoShow', Test1);

end.

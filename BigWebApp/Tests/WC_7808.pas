unit WC_7808;

interface

implementation

uses
  TestReg,
  pm_user_fields_dlg,
  FireDAC.comp.client,
  System.SysUtils,
  MainModule,
  IQMS.Common.Datalib;

procedure TestTFrmPMCode;
var
  LQryDataset: TFDQuery;
  AOwnerName: string;
  PMEQMT_ID: Real;
begin
  LQryDataset := TFDQuery.create(nil);
  with LQryDataset do
  begin
    Close;
    Connection := UniMainModule.FDConnection1;
    SQL.Text := 'select * from PMEQMT';
    Open;
  end;
  PMEQMT_ID := 20097;
  AOwnerName := SelectValueFmtAsString('select class from PMEQMT where id = %f', [PMEQMT_ID]);
  AOwnerName := Format('FrmPM_%s', [Trim(UpperCase(AOwnerName))]);
  DoPMUserFields(LQryDataset, AOwnerName);
end;

initialization

  TTestRepo.RegisterTest('WC-7808','PM', 'pmwocode', 'DoPMCode', TestTFrmPMCode);

end.

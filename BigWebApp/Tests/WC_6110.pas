unit WC_6110;

interface

implementation

uses
  TestReg,
  System.Variants,
  Upd_Fin,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

procedure Test1;
var
  AQry : TFDQuery;
begin
  AQry :=  TFDQuery.create(nil);
  AQry.Sql.text := 'select * from GLACCT';
  DoUpdate_Fin_Rpt(AQry);
end;

initialization

  TTestRepo.RegisterTest('WC-6110', 'Fin_Rpt', 'FrmUpdate_Fin_Rpt', 'DoUpdate_Fin_Rpt', Test1);
end.

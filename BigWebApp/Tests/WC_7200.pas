unit WC_7200;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  repdef_cat_rep_list,
  FireDAC.Comp.Client,
  MainModule,
  Data.DB;

procedure Test1;
var
  DataSource : TDataSource;
  DataSet : TFDTable;
begin
  DataSource := TDataSource.create(nil);
  DataSet := TFDTable.create(nil);
  DataSet.Connection := UniMainModule.FDConnection1;
  DataSet.TableName := 'car';
  DataSource.DataSet := DataSet;
  DataSet.Open;
  TFrmRepdef_Cat_Rep_List.DoShow(DataSource);
end;

initialization

  TTestRepo.RegisterTest('WC_7200', 'Iqsys', 'repdef_cat_rep_list', 'DoShow', Test1);
end.

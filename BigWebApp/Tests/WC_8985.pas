unit WC_8985;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Data.DB,
  MainModule,
  FireDAC.Comp.Client,
  Wo_Gantt;

procedure Test1;
var
  DataSource : TDataSource;
  Table : TFDTable;
begin
Datasource := TDataSource.Create(nil);
  Table := TFDTable.create(nil);
  Table.Connection := UniMainModule.FDConnection1;
  Table.tablename := 'car';
  Table.open;
  DataSource.DataSet := Table;
  DoShowItemGantt(DataSource);
end;

procedure Test2;
var
  DataSource : TDataSource;
  Table : TFDTable;
begin
Datasource := TDataSource.Create(nil);
  Table := TFDTable.create(nil);
  Table.Connection := UniMainModule.FDConnection1;
  Table.tablename := 'car';
  Table.open;
  DataSource.DataSet := Table;
  DoShowItemGanttEx(DataSource);
end;


initialization

  TTestRepo.RegisterTest('WC-8985', 'Wrkorder', 'Wo_Gantt', 'DoShowItemGantt', Test1,1);
  TTestRepo.RegisterTest('WC-8985', 'Wrkorder', 'Wo_Gantt', ' DoShowItemGanttEx', Test2,2);
end.

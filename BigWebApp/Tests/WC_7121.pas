unit WC_7121;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,  MainModule,

  spc_gage_linearity, FireDAC.Comp.Client, Data.DB;

procedure Test1;
var
 Form: TFrmSPCGageLinearity;
 ADataSource : TDatasource;
 ADataset : TFDQuery;
begin
   Form := TFrmSPCGageLinearity.create(uniGUIApplication.uniApplication);
   ADataset:=TFDQuery.create(UniMainModule);
   ADataSource := TDatasource.create(UniMainModule);
   try
   ADataset.Connection:=UniMainModule.FDConnection1;
   ADataset.SQL.Text:='select 42*10 from dual';
   ADataset.Open;
   ADataSource.Dataset:=ADataset;
   Form.DataSource := ADataSource;
   Form.showmodal;
   finally
            ADataset.free;
            ADataSource.free;
   end;


end;

initialization

  TTestRepo.RegisterTest('WC-7121', 'Iqspc', 'spc_gage_child_base', 'create', Test1);
end.

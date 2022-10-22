unit WC_5893;

interface

implementation

uses
  TestReg,
  System.Variants,
  Data.DB,
  MainModule,
  FireDAC.Comp.Client,
  cust_vmi_items;

procedure Test1;
var
   DataSource : TDataSource;
   Table : TFDTable;
begin
  Datasource := TDataSource.Create(nil);
  Table := TFDTable.create(nil);
  Table.Connection := UniMainModule.FDConnection1;
  Table.tablename := 'VMI_ARINVT';
  Table.open;
  DataSource.DataSet := Table;
  TFrmCustVMIItems.ShowModeless(DataSource,31735);
end;

initialization

  TTestRepo.RegisterTest('WC-5893', 'Customer', 'cust_vmi_items', 'ShowModeless', Test1);
end.

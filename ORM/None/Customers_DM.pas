unit Customers_DM;

interface

uses
  System.SysUtils, System.Classes,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, MainModule;

type
  TCustomersDM = class(TDataModule)
    tblCustomers: TFDTable;
    dsCustomers: TDataSource;
    procedure tblCustomersAfterPost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustomersDM: TCustomersDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TCustomersDM.DataModuleCreate(Sender: TObject);
begin
  tblCustomers.Open;
end;

procedure TCustomersDM.DataModuleDestroy(Sender: TObject);
begin
  tblCustomers.Close;
end;

procedure TCustomersDM.tblCustomersAfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

end.

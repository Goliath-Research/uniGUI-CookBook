unit Customers_DM;

interface

uses
  System.SysUtils, System.Classes,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  MainModule,
  SalesModel,
  Spring.Collections,
  Spring.Data.ObjectDataSet,
  Spring.Persistence.Mapping.Attributes, Spring.Data.VirtualDataSet;

type

  TCustomersDM = class(TDataModule)
    dsCustomers: TDataSource;
    dstCustomers: TObjectDataSet;
    dstCustomersID: TIntegerField;
    dstCustomersName: TStringField;
    procedure tblCustomersAfterPost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FCustomers : IList<TCustomer>;
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
  FCustomers := MainDM.Session.FindAll<TCustomer>();

  dstCustomers.DataList := FCustomers as IObjectList;

  dstCustomers.Open;
end;

procedure TCustomersDM.DataModuleDestroy(Sender: TObject);
begin
  dstCustomers.Close;
end;

procedure TCustomersDM.tblCustomersAfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

end.

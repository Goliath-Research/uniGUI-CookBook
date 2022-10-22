unit Master_DetailDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDM = class(TDataModule)
    tblOrders: TFDMemTable;
    tblOrdersID: TAutoIncField;
    tblOrdersCustomerID: TIntegerField;
    tblOrdersCustomer: TStringField;
    tblOrdersPosted: TDateTimeField;
    tblCustomers: TFDMemTable;
    tblCustomersID: TAutoIncField;
    tblCustomersName: TStringField;
    dsOrders: TDataSource;
    tblItems: TFDMemTable;
    tblItemsOrderID: TIntegerField;
    tblItemsProductID: TIntegerField;
    tblItemsProduct: TStringField;
    tblItemsQuantity: TIntegerField;
    tblItemsPrice: TCurrencyField;
    tblItemsTotal: TCurrencyField;
    tblProducts: TFDMemTable;
    tblProductsID: TAutoIncField;
    tblProductsDescription: TStringField;
    tblProductsPrice: TCurrencyField;
    dsItems: TDataSource;
    procedure tblItemsCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.tblItemsCalcFields(DataSet: TDataSet);
begin
  if not tblItemsQuantity.IsNull and not tblItemsPrice.IsNull then
    tblItemsTotal.Value := tblItemsQuantity.Value * tblItemsPrice.Value;
end;

end.

unit Master_DetailDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Phys,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.DApt, FireDAC.Phys.SQLiteWrapper.Stat;

type
  TDM = class(TDataModule)
    dsOrders: TDataSource;
    dsItems: TDataSource;
    Conn: TFDConnection;
    tblCustomers: TFDTable;
    tblCustomersID: TIntegerField;
    tblCustomersName: TStringField;
    tblProducts: TFDTable;
    tblProductsID: TIntegerField;
    tblProductsDescription: TStringField;
    tblProductsPrice: TCurrencyField;
    tblOrders: TFDTable;
    tblOrdersID: TIntegerField;
    tblOrdersCustomerID: TIntegerField;
    tblOrdersPosted: TDateTimeField;
    tblOrdersCustomer: TStringField;
    tblItems: TFDTable;
    tblItemsOrderID: TIntegerField;
    tblItemsProductID: TIntegerField;
    tblItemsQuantity: TIntegerField;
    tblItemsProduct: TStringField;
    tblItemsPrice: TCurrencyField;
    tblItemsTotal: TCurrencyField;
    procedure tblItemsCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
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

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  Conn.Open;
  tblCustomers.Open;
  tblProducts.Open;
  tblOrders.Open;
  tblItems.Open;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  Conn.Close;
end;

procedure TDM.tblItemsCalcFields(DataSet: TDataSet);
begin
  if not tblItemsQuantity.IsNull and not tblItemsPrice.IsNull then
    tblItemsTotal.Value := tblItemsQuantity.Value * tblItemsPrice.Value;
end;

end.


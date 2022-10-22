unit LocalSQLDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.SQLiteVDataSet, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.DApt;

type
  TDM = class(TDataModule)
    tblOrders: TFDMemTable;
    tblOrdersID: TAutoIncField;
    tblOrdersCustomerID: TIntegerField;
    tblOrdersPosted: TDateTimeField;
    tblCustomers: TFDMemTable;
    tblCustomersID: TAutoIncField;
    tblCustomersName: TStringField;
    tblItems: TFDMemTable;
    tblItemsOrderID: TIntegerField;
    tblItemsProductID: TIntegerField;
    tblItemsQuantity: TIntegerField;
    tblProducts: TFDMemTable;
    tblProductsID: TAutoIncField;
    tblProductsDescription: TStringField;
    tblProductsPrice: TCurrencyField;
    SQLiteConn: TFDConnection;
    LocalSQL: TFDLocalSQL;
    qrySales: TFDQuery;
    dsSales: TDataSource;
  private
    { Private declarations }
  public
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

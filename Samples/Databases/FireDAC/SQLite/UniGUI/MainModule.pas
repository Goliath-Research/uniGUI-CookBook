unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.SQLiteWrapper.Stat;

type
  TUniMainModule = class(TUniGUIMainModule)
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
    tblOrdersCustomer: TStringField;
    tblOrdersPosted: TDateTimeField;
    tblItems: TFDTable;
    tblItemsOrderID: TIntegerField;
    tblItemsProductID: TIntegerField;
    tblItemsProduct: TStringField;
    tblItemsQuantity: TIntegerField;
    tblItemsPrice: TCurrencyField;
    tblItemsTotal: TCurrencyField;
    procedure UniGUIMainModuleCreate(Sender: TObject);
    procedure UniGUIMainModuleDestroy(Sender: TObject);
    procedure tblItemsCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UniMainModule: TUniMainModule;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication;

function UniMainModule: TUniMainModule;
begin
  Result := TUniMainModule(UniApplication.UniMainModule)
end;

procedure TUniMainModule.UniGUIMainModuleCreate(Sender: TObject);
begin
  Conn.Open;
  tblCustomers.Open;
  tblProducts.Open;
  tblOrders.Open;
  tblItems.Open;
end;

procedure TUniMainModule.UniGUIMainModuleDestroy(Sender: TObject);
begin
  tblItems.Close;
  tblOrders.Close;
  tblProducts.Close;
  tblCustomers.Close;
  Conn.Close;
end;

procedure TUniMainModule.tblItemsCalcFields(DataSet: TDataSet);
begin
  if Conn.Connected and not tblItemsQuantity.IsNull and not tblItemsPrice.IsNull then
    tblItemsTotal.Value := tblItemsQuantity.Value * tblItemsPrice.Value;
end;

initialization
  RegisterMainModuleClass(TUniMainModule);
end.

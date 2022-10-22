unit Orders_DM;

interface

uses
  System.SysUtils, System.Classes,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.Actions, Vcl.ActnList, System.ImageList,
  Vcl.ImgList, Vcl.Controls, MainModule;

type
  TOrdersDM = class(TDataModule)
    tblProducts: TFDTable;
    dsItems: TDataSource;
    tblItems: TFDTable;
    dsOrders: TDataSource;
    tblOrders: TFDTable;
    tblItemsOrderID: TIntegerField;
    tblItemsProductID: TIntegerField;
    tblItemsQuantity: TIntegerField;
    tblItemsProductName: TStringField;
    tblItemsPrice: TCurrencyField;
    tblItemsTotal: TCurrencyField;
    tblCustomers: TFDTable;
    tblOrdersID: TIntegerField;
    tblOrdersCustomerID: TIntegerField;
    tblOrdersPosted: TDateTimeField;
    tblOrdersPaid: TDateTimeField;
    tblOrdersCustomer: TStringField;
    OrdersActionList: TActionList;
    actOpenProductsForm: TAction;
    actOpenCustomersForm: TAction;
    ImageList1: TImageList;
    tblOrdersTotal: TCurrencyField;
    procedure tblItemsCalcFields(DataSet: TDataSet);
    procedure tblOrdersCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OrdersDM: TOrdersDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TOrdersDM.DataModuleCreate(Sender: TObject);
begin
  tblProducts.Open;
  tblCustomers.Open;
  tblItems.Open;
  tblOrders.Open;
end;

procedure TOrdersDM.DataModuleDestroy(Sender: TObject);
begin
  tblOrders.Close;
  tblItems.Close;
  tblCustomers.Close;
  tblProducts.Close;
end;

procedure TOrdersDM.tblItemsCalcFields(DataSet: TDataSet);
begin
  if not tblItemsProductID.IsNull then
    tblItemsTotal.Value := tblItemsQuantity.Value * tblItemsPrice.Value;
end;

procedure TOrdersDM.tblOrdersCalcFields(DataSet: TDataSet);
begin
  if not tblOrdersID.IsNull then
    tblOrdersTotal.Value := MainDM.FDConnection1.ExecSQLScalar
    (
      Format
      (
        'SELECT SUM(i.Quantity * p.Price) FROM Items i INNER JOIN Products p ON i.ProductID = p.ID WHERE i.OrderID = %d',
        [
          tblOrdersID.Value
        ]
      )
    );
end;

end.

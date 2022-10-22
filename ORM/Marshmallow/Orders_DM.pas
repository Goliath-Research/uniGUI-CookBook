unit Orders_DM;

interface

uses
  System.SysUtils, System.Classes,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.Actions, Vcl.ActnList, System.ImageList,
  Vcl.ImgList, Vcl.Controls, MainModule,
  Spring,
  Spring.Collections,
  Spring.Persistence.Mapping.Attributes,
  Spring.Persistence.Criteria.Interfaces,
  Spring.Persistence.Criteria.Properties,
  Spring.Data.VirtualDataSet,
  Spring.Data.ObjectDataSet,
  SalesModel;

type

  TOrdersDM = class(TDataModule)
    dsItems: TDataSource;
    dsOrders: TDataSource;
    OrdersActionList: TActionList;
    actOpenProductsForm: TAction;
    actOpenCustomersForm: TAction;
    ImageList1: TImageList;
    dstOrders: TObjectDataSet;
    dstOrdersID: TIntegerField;
    dstOrdersCustomerID: TIntegerField;
    dstOrdersPosted: TDateTimeField;
    dstOrdersPaid: TDateTimeField;
    dstOrdersCustomer: TStringField;
    dstOrdersTotal: TCurrencyField;
    dstItems: TObjectDataSet;
    dstItemsOrderID: TIntegerField;
    dstItemsProductID: TIntegerField;
    dstItemsQuantity: TIntegerField;
    dstItemsProductName: TStringField;
    dstItemsPrice: TCurrencyField;
    dstItemsTotal: TCurrencyField;
    dstProducts: TObjectDataSet;
    dstProductsID: TAutoIncField;
    dstProductsDescription: TStringField;
    dstProductsPrice: TCurrencyField;
    dstCustomers: TObjectDataSet;
    dstCustomersID: TIntegerField;
    dstCustomersName: TStringField;
    dstItemsID: TAutoIncField;
    procedure tblItemsCalcFields(DataSet: TDataSet);
    procedure tblOrdersCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure dstOrdersAfterScroll(DataSet: TDataSet);
  private
    FCustomers : IList<TCustomer>;
    FOrders    : IList<TOrder>;
    FProducts  : IList<TProduct>;
    FItems     : IList<TItem>;
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
  FCustomers := MainDM.Session.FindAll<TCustomer>();
  dstCustomers.DataList := FCustomers as IObjectList;
  dstCustomers.Open;

  dstOrders.AfterScroll := nil;
  try
    FOrders := MainDM.Session.FindAll<TOrder>();
    dstOrders.DataList := FOrders as IObjectList;
    dstOrders.Open;

    FProducts := MainDM.Session.FindAll<TProduct>();
    dstProducts.DataList := FProducts as IObjectList;
    dstProducts.Open;
  finally
    dstOrders.AfterScroll := dstOrdersAfterScroll;
  end;

  FItems := MainDM.Session.FindAll<TItem>();
  dstItems.DataList := FItems as IObjectList;
  dstItems.Open;

  // Move to the first order to filter the items

  dstOrders.First;
end;

procedure TOrdersDM.DataModuleDestroy(Sender: TObject);
begin
  dstProducts.Close;
  dstItems.Close;
  dstOrders.Close;
  dstCustomers.Close;
end;

procedure TOrdersDM.dstOrdersAfterScroll(DataSet: TDataSet);
//var
//  OrderID  : Prop;
begin
  // Load Items for the selected order

  dstItems.DataList := dstOrders.GetCurrentModel<TOrder>.Items.Value as IObjectList;
  dstItems.Open;

//  OrderID := Prop.Create('OrderID');
//  FItems := MainDM.Session.FindWhere<TItem>(OrderID = DataSet['ID']);
//  dstItems.DataList := FItems as IObjectList;
//  dstItems.Open;
end;

procedure TOrdersDM.tblItemsCalcFields(DataSet: TDataSet);
begin
  if not dstItemsProductID.IsNull then
    dstItemsTotal.Value := dstItemsQuantity.Value * dstItemsPrice.Value;
end;

procedure TOrdersDM.tblOrdersCalcFields(DataSet: TDataSet);
begin
  if not dstOrdersID.IsNull then
    dstOrdersTotal.Value := MainDM.FDConnection1.ExecSQLScalar
    (
      Format
      (
        'SELECT SUM(i.Quantity * p.Price) FROM Items i INNER JOIN Products p ON i.ProductID = p.ID WHERE i.OrderID = %d',
        [
          dstOrdersID.Value
        ]
      )
    );
end;

end.

unit SalesModel.Classes;

{$I EntityDac.inc}

interface

uses
  SysUtils, Classes, FmtBcd, SqlTimSt,
  EntityDAC.ComplexData,
  EntityDAC.Context,
  EntityDAC.DataProvider,
  EntityDAC.Entity, 
  EntityDAC.EntityAttributes, 
  EntityDAC.EntityConnection,
  EntityDAC.EntityContext,
  EntityDAC.MetaData,
  EntityDAC.MetaEntity, 
  EntityDAC.NullableTypes,
  EntityDAC.Types,
  SalesModel.Linq;
 
type
  TCustomer = class;
  TProduct = class;
  TItem = class;
  TUser = class;
  TOrder = class;
  TViewsale = class;


{$IFDEF USE_GENERICS}
  TCustomerOrders = TMappedCollection<TOrder>;
{$ELSE}
  TCustomerOrders = class(TMappedCollection)
  private
    function GetItem(Index: Integer): TOrder; reintroduce;
  public
    property Items[Index: Integer]: TOrder read GetItem; default;
  end;
{$ENDIF}

  [Table('"main".Customers')]
  [Model('SalesModel')]
  [Key('FId')]
  TCustomer = class(TMappedEntity)
  private
    [Column('ID', [ReadOnly], asOnInsert)]
    FId: Int64;
    [Column('Name', 64)]
    FName: String;

    [Column]
    [Collection('TOrder', 'FCustomer', 'FId', 'FCustomerid', srCascade, drCascade)]
    FOrders: TCollectionData;

    function GetId: Int64;
    function GetName: String;
    procedure SetName(const Value: String);

    function GetOrders: TCustomerOrders;
  protected
    procedure Register; override;

    constructor Create(AMetaType: TMetaType); overload; override;

  public
    constructor Create; overload; override;

    property Id: Int64 read GetId;
    property Name: String read GetName write SetName;

    property Orders: TCustomerOrders read GetOrders;
  end;


{$IFDEF USE_GENERICS}
  TProductItems = TMappedCollection<TItem>;
{$ELSE}
  TProductItems = class(TMappedCollection)
  private
    function GetItem(Index: Integer): TItem; reintroduce;
  public
    property Items[Index: Integer]: TItem read GetItem; default;
  end;
{$ENDIF}

  [Table('"main".Products')]
  [Model('SalesModel')]
  [Key('FId')]
  TProduct = class(TMappedEntity)
  private
    [Column('ID', [ReadOnly], asOnInsert)]
    FId: Int64;
    [Column('Description', 64)]
    FDescription: String;
    [Column('Price', '0', etScalar, [CanBeNull])]
    FPrice: TObjectData;

    [Column]
    [Collection('TItem', 'FProduct', 'FId', 'FProductid', srCascade, drCascade)]
    FItems: TCollectionData;

    function GetId: Int64;
    function GetDescription: String;
    procedure SetDescription(const Value: String);
    function GetPrice: TObjectData;
    procedure SetPrice(const Value: TObjectData);

    function GetItems: TProductItems;
  protected
    procedure Register; override;

    constructor Create(AMetaType: TMetaType); overload; override;

  public
    constructor Create; overload; override;

    property Id: Int64 read GetId;
    property Description: String read GetDescription write SetDescription;
    property Price: TObjectData read GetPrice write SetPrice;

    property Items: TProductItems read GetItems;
  end;


  [Table('"main".Items')]
  [Model('SalesModel')]
  [Key('FOrderid, FProductid')]
  TItem = class(TMappedEntity)
  private
    [Column('OrderID')]
    FOrderid: Int64;
    [Column('ProductID')]
    FProductid: Int64;
    [Column('Quantity')]
    FQuantity: Integer;

    [Column]
    [Reference('TProduct', 'FItems', 'FProductid', 'FId', srCascade, drCascade)]
    FProduct: TReferenceData;
    [Column]
    [Reference('TOrder', 'FItems', 'FOrderid', 'FId', srCascade, drCascade)]
    FOrder: TReferenceData;

    function GetOrderid: Int64;
    procedure SetOrderid(const Value: Int64);
    function GetProductid: Int64;
    procedure SetProductid(const Value: Int64);
    function GetQuantity: Integer;
    procedure SetQuantity(const Value: Integer);

    function GetProduct: TProduct;
    procedure SetProduct(const Value: TProduct);
    function GetOrder: TOrder;
    procedure SetOrder(const Value: TOrder);

  protected
    procedure Register; override;

    constructor Create(AMetaType: TMetaType); overload; override;

  public
    constructor Create; overload; override;

    property Orderid: Int64 read GetOrderid write SetOrderid;
    property Productid: Int64 read GetProductid write SetProductid;
    property Quantity: Integer read GetQuantity write SetQuantity;

    property Product: TProduct read GetProduct write SetProduct;
    property Order: TOrder read GetOrder write SetOrder;
  end;


  [Table('"main".Users')]
  [Model('SalesModel')]
  [Key('FUsername')]
  TUser = class(TMappedEntity)
  private
    [Column('Username', 16)]
    FUsername: String;
    [Column('Password', 32)]
    FPassword: String;
    [Column('Admin', [CanBeNull])]
    FAdmin: BooleanNullable;

    function GetUsername: String;
    procedure SetUsername(const Value: String);
    function GetPassword: String;
    procedure SetPassword(const Value: String);
    function GetAdmin: BooleanNullable;
    procedure SetAdmin(const Value: BooleanNullable);
  protected
    procedure Register; override;

    constructor Create(AMetaType: TMetaType); overload; override;

  public
    constructor Create; overload; override;

    property Username: String read GetUsername write SetUsername;
    property Password: String read GetPassword write SetPassword;
    property Admin: BooleanNullable read GetAdmin write SetAdmin;
  end;


{$IFDEF USE_GENERICS}
  TOrderItems = TMappedCollection<TItem>;
{$ELSE}
  TOrderItems = class(TMappedCollection)
  private
    function GetItem(Index: Integer): TItem; reintroduce;
  public
    property Items[Index: Integer]: TItem read GetItem; default;
  end;
{$ENDIF}

  [Table('"main".Orders')]
  [Model('SalesModel')]
  [Key('FId')]
  TOrder = class(TMappedEntity)
  private
    [Column('ID', [ReadOnly], asOnInsert)]
    FId: Int64;
    [Column('CustomerID')]
    FCustomerid: Int64;
    [Column('Posted', 'DATETIME ('now')', etScalar)]
    FPosted: TDateTime;
    [Column('Paid', [CanBeNull])]
    FPaid: TDateTimeNullable;

    [Column]
    [Reference('TCustomer', 'FOrders', 'FCustomerid', 'FId', srCascade, drCascade)]
    FCustomer: TReferenceData;

    [Column]
    [Collection('TItem', 'FOrder', 'FId', 'FOrderid', srCascade, drCascade)]
    FItems: TCollectionData;

    function GetId: Int64;
    function GetCustomerid: Int64;
    procedure SetCustomerid(const Value: Int64);
    function GetPosted: TDateTime;
    procedure SetPosted(const Value: TDateTime);
    function GetPaid: TDateTimeNullable;
    procedure SetPaid(const Value: TDateTimeNullable);

    function GetCustomer: TCustomer;
    procedure SetCustomer(const Value: TCustomer);


    function GetItems: TOrderItems;
  protected
    procedure Register; override;

    constructor Create(AMetaType: TMetaType); overload; override;

  public
    constructor Create; overload; override;

    property Id: Int64 read GetId;
    property Customerid: Int64 read GetCustomerid write SetCustomerid;
    property Posted: TDateTime read GetPosted write SetPosted;
    property Paid: TDateTimeNullable read GetPaid write SetPaid;

    property Customer: TCustomer read GetCustomer write SetCustomer;

    property Items: TOrderItems read GetItems;
  end;


  [Table('"main".viewSales')]
  [Model('SalesModel')]
  [Key('FCustomerid, FOrderid, FProductid')]
  TViewsale = class(TMappedEntity)
  private
    [Column('CustomerID')]
    FCustomerid: Int64;
    [Column('Customer', 64, [CanBeNull])]
    FCustomer: String;
    [Column('OrderID')]
    FOrderid: Int64;
    [Column('Posted', [CanBeNull])]
    FPosted: TDateTimeNullable;
    [Column('ProductID')]
    FProductid: Int64;
    [Column('Product', 64, [CanBeNull])]
    FProduct: String;
    [Column('Quantity', [CanBeNull])]
    FQuantity: IntegerNullable;
    [Column('Price', [CanBeNull])]
    FPrice: TObjectData;
    [Column('Total', [CanBeNull])]
    FTotal: TObjectData;

    function GetCustomerid: Int64;
    procedure SetCustomerid(const Value: Int64);
    function GetCustomer: String;
    procedure SetCustomer(const Value: String);
    function GetOrderid: Int64;
    procedure SetOrderid(const Value: Int64);
    function GetPosted: TDateTimeNullable;
    procedure SetPosted(const Value: TDateTimeNullable);
    function GetProductid: Int64;
    procedure SetProductid(const Value: Int64);
    function GetProduct: String;
    procedure SetProduct(const Value: String);
    function GetQuantity: IntegerNullable;
    procedure SetQuantity(const Value: IntegerNullable);
    function GetPrice: TObjectData;
    procedure SetPrice(const Value: TObjectData);
    function GetTotal: TObjectData;
    procedure SetTotal(const Value: TObjectData);
  protected
    procedure Register; override;

    constructor Create(AMetaType: TMetaType); overload; override;

  public
    constructor Create; overload; override;

    property Customerid: Int64 read GetCustomerid write SetCustomerid;
    property Customer: String read GetCustomer write SetCustomer;
    property Orderid: Int64 read GetOrderid write SetOrderid;
    property Posted: TDateTimeNullable read GetPosted write SetPosted;
    property Productid: Int64 read GetProductid write SetProductid;
    property Product: String read GetProduct write SetProduct;
    property Quantity: IntegerNullable read GetQuantity write SetQuantity;
    property Price: TObjectData read GetPrice write SetPrice;
    property Total: TObjectData read GetTotal write SetTotal;
  end;


implementation

uses
  EntityDAC.Utils;

{ TCustomer }

constructor TCustomer.Create(AMetaType: TMetaType);
begin
  inherited Create(AMetaType);
end;

constructor TCustomer.Create;
begin
  Create(Models.GetMetaType(Self.ClassType));
end;

procedure TCustomer.Register;
begin
  inherited;

  RegisterAttribute(FId, MetaType.MetaAttributes.Get('Id'));
  RegisterAttribute(FName, MetaType.MetaAttributes.Get('Name'));

  RegisterCollection(FOrders, MetaType.MetaCollections.Get('Orders'), TCustomerOrders);
end;

function TCustomer.GetId: Int64;
begin
  Result := FId;
end;

function TCustomer.GetName: String;
begin
  Result := FName;
end;

procedure TCustomer.SetName(const Value: String);
begin
  if AttributeChanging(MetaType.MetaAttributes.Get('Name'), Value) then begin
    FName := Value;
    AttributeChanged(MetaType.MetaAttributes.Get('Name'));
  end;
end;

function TCustomer.GetOrders: TCustomerOrders;
begin
  Result := TCustomerOrders(FOrders.Entities);
end;

{ TProduct }

constructor TProduct.Create(AMetaType: TMetaType);
begin
  inherited Create(AMetaType);
end;

constructor TProduct.Create;
begin
  Create(Models.GetMetaType(Self.ClassType));
end;

procedure TProduct.Register;
begin
  inherited;

  RegisterAttribute(FId, MetaType.MetaAttributes.Get('Id'));
  RegisterAttribute(FDescription, MetaType.MetaAttributes.Get('Description'));
  RegisterAttribute(FPrice, MetaType.MetaAttributes.Get('Price'));

  RegisterCollection(FItems, MetaType.MetaCollections.Get('Items'), TProductItems);
end;

function TProduct.GetId: Int64;
begin
  Result := FId;
end;

function TProduct.GetDescription: String;
begin
  Result := FDescription;
end;

procedure TProduct.SetDescription(const Value: String);
begin
  if AttributeChanging(MetaType.MetaAttributes.Get('Description'), Value) then begin
    FDescription := Value;
    AttributeChanged(MetaType.MetaAttributes.Get('Description'));
  end;
end;

function TProduct.GetPrice: TObjectData;
begin
  Result.Assign(FPrice);
end;

procedure TProduct.SetPrice(const Value: TObjectData);
begin
  if AttributeChanging(MetaType.MetaAttributes.Get('Price'), Value) then begin
    FPrice.Assign(Value);
    AttributeChanged(MetaType.MetaAttributes.Get('Price'));
  end;
end;

function TProduct.GetItems: TProductItems;
begin
  Result := TProductItems(FItems.Entities);
end;

{ TItem }

constructor TItem.Create(AMetaType: TMetaType);
begin
  inherited Create(AMetaType);
end;

constructor TItem.Create;
begin
  Create(Models.GetMetaType(Self.ClassType));
end;

procedure TItem.Register;
begin
  inherited;

  RegisterAttribute(FOrderid, MetaType.MetaAttributes.Get('Orderid'));
  RegisterAttribute(FProductid, MetaType.MetaAttributes.Get('Productid'));
  RegisterAttribute(FQuantity, MetaType.MetaAttributes.Get('Quantity'));

  RegisterReference(FProduct, MetaType.MetaReferences.Get('Product'));
  RegisterReference(FOrder, MetaType.MetaReferences.Get('Order'));
end;

function TItem.GetOrderid: Int64;
begin
  Result := FOrderid;
end;

procedure TItem.SetOrderid(const Value: Int64);
begin
  if AttributeChanging(MetaType.MetaAttributes.Get('Orderid'), Value) then begin
    FOrderid := Value;
    AttributeChanged(MetaType.MetaAttributes.Get('Orderid'));
  end;
end;

function TItem.GetProductid: Int64;
begin
  Result := FProductid;
end;

procedure TItem.SetProductid(const Value: Int64);
begin
  if AttributeChanging(MetaType.MetaAttributes.Get('Productid'), Value) then begin
    FProductid := Value;
    AttributeChanged(MetaType.MetaAttributes.Get('Productid'));
  end;
end;

function TItem.GetQuantity: Integer;
begin
  Result := FQuantity;
end;

procedure TItem.SetQuantity(const Value: Integer);
begin
  if AttributeChanging(MetaType.MetaAttributes.Get('Quantity'), Value) then begin
    FQuantity := Value;
    AttributeChanged(MetaType.MetaAttributes.Get('Quantity'));
  end;
end;

function TItem.GetProduct: TProduct;
begin
  Result := FProduct.Entity as TProduct;
end;

procedure TItem.SetProduct(const Value: TProduct);
begin
  FProduct.Entity := Value;
end;

function TItem.GetOrder: TOrder;
begin
  Result := FOrder.Entity as TOrder;
end;

procedure TItem.SetOrder(const Value: TOrder);
begin
  FOrder.Entity := Value;
end;

{ TUser }

constructor TUser.Create(AMetaType: TMetaType);
begin
  inherited Create(AMetaType);
end;

constructor TUser.Create;
begin
  Create(Models.GetMetaType(Self.ClassType));
end;

procedure TUser.Register;
begin
  inherited;

  RegisterAttribute(FUsername, MetaType.MetaAttributes.Get('Username'));
  RegisterAttribute(FPassword, MetaType.MetaAttributes.Get('Password'));
  RegisterAttribute(FAdmin, MetaType.MetaAttributes.Get('Admin'));
end;

function TUser.GetUsername: String;
begin
  Result := FUsername;
end;

procedure TUser.SetUsername(const Value: String);
begin
  if AttributeChanging(MetaType.MetaAttributes.Get('Username'), Value) then begin
    FUsername := Value;
    AttributeChanged(MetaType.MetaAttributes.Get('Username'));
  end;
end;

function TUser.GetPassword: String;
begin
  Result := FPassword;
end;

procedure TUser.SetPassword(const Value: String);
begin
  if AttributeChanging(MetaType.MetaAttributes.Get('Password'), Value) then begin
    FPassword := Value;
    AttributeChanged(MetaType.MetaAttributes.Get('Password'));
  end;
end;

function TUser.GetAdmin: BooleanNullable;
begin
  Result := FAdmin;
end;

procedure TUser.SetAdmin(const Value: BooleanNullable);
begin
  if AttributeChanging(MetaType.MetaAttributes.Get('Admin'), Value) then begin
    FAdmin := Value;
    AttributeChanged(MetaType.MetaAttributes.Get('Admin'));
  end;
end;

{ TOrder }

constructor TOrder.Create(AMetaType: TMetaType);
begin
  inherited Create(AMetaType);
end;

constructor TOrder.Create;
begin
  Create(Models.GetMetaType(Self.ClassType));
end;

procedure TOrder.Register;
begin
  inherited;

  RegisterAttribute(FId, MetaType.MetaAttributes.Get('Id'));
  RegisterAttribute(FCustomerid, MetaType.MetaAttributes.Get('Customerid'));
  RegisterAttribute(FPosted, MetaType.MetaAttributes.Get('Posted'));
  RegisterAttribute(FPaid, MetaType.MetaAttributes.Get('Paid'));

  RegisterReference(FCustomer, MetaType.MetaReferences.Get('Customer'));

  RegisterCollection(FItems, MetaType.MetaCollections.Get('Items'), TOrderItems);
end;

function TOrder.GetId: Int64;
begin
  Result := FId;
end;

function TOrder.GetCustomerid: Int64;
begin
  Result := FCustomerid;
end;

procedure TOrder.SetCustomerid(const Value: Int64);
begin
  if AttributeChanging(MetaType.MetaAttributes.Get('Customerid'), Value) then begin
    FCustomerid := Value;
    AttributeChanged(MetaType.MetaAttributes.Get('Customerid'));
  end;
end;

function TOrder.GetPosted: TDateTime;
begin
  Result := FPosted;
end;

procedure TOrder.SetPosted(const Value: TDateTime);
begin
  if AttributeChanging(MetaType.MetaAttributes.Get('Posted'), Value) then begin
    FPosted := Value;
    AttributeChanged(MetaType.MetaAttributes.Get('Posted'));
  end;
end;

function TOrder.GetPaid: TDateTimeNullable;
begin
  Result := FPaid;
end;

procedure TOrder.SetPaid(const Value: TDateTimeNullable);
begin
  if AttributeChanging(MetaType.MetaAttributes.Get('Paid'), Value) then begin
    FPaid := Value;
    AttributeChanged(MetaType.MetaAttributes.Get('Paid'));
  end;
end;

function TOrder.GetCustomer: TCustomer;
begin
  Result := FCustomer.Entity as TCustomer;
end;

procedure TOrder.SetCustomer(const Value: TCustomer);
begin
  FCustomer.Entity := Value;
end;

function TOrder.GetItems: TOrderItems;
begin
  Result := TOrderItems(FItems.Entities);
end;

{ TViewsale }

constructor TViewsale.Create(AMetaType: TMetaType);
begin
  inherited Create(AMetaType);
end;

constructor TViewsale.Create;
begin
  Create(Models.GetMetaType(Self.ClassType));
end;

procedure TViewsale.Register;
begin
  inherited;

  RegisterAttribute(FCustomerid, MetaType.MetaAttributes.Get('Customerid'));
  RegisterAttribute(FCustomer, MetaType.MetaAttributes.Get('Customer'));
  RegisterAttribute(FOrderid, MetaType.MetaAttributes.Get('Orderid'));
  RegisterAttribute(FPosted, MetaType.MetaAttributes.Get('Posted'));
  RegisterAttribute(FProductid, MetaType.MetaAttributes.Get('Productid'));
  RegisterAttribute(FProduct, MetaType.MetaAttributes.Get('Product'));
  RegisterAttribute(FQuantity, MetaType.MetaAttributes.Get('Quantity'));
  RegisterAttribute(FPrice, MetaType.MetaAttributes.Get('Price'));
  RegisterAttribute(FTotal, MetaType.MetaAttributes.Get('Total'));
end;

function TViewsale.GetCustomerid: Int64;
begin
  Result := FCustomerid;
end;

procedure TViewsale.SetCustomerid(const Value: Int64);
begin
  if AttributeChanging(MetaType.MetaAttributes.Get('Customerid'), Value) then begin
    FCustomerid := Value;
    AttributeChanged(MetaType.MetaAttributes.Get('Customerid'));
  end;
end;

function TViewsale.GetCustomer: String;
begin
  Result := FCustomer;
end;

procedure TViewsale.SetCustomer(const Value: String);
begin
  if AttributeChanging(MetaType.MetaAttributes.Get('Customer'), Value) then begin
    FCustomer := Value;
    AttributeChanged(MetaType.MetaAttributes.Get('Customer'));
  end;
end;

function TViewsale.GetOrderid: Int64;
begin
  Result := FOrderid;
end;

procedure TViewsale.SetOrderid(const Value: Int64);
begin
  if AttributeChanging(MetaType.MetaAttributes.Get('Orderid'), Value) then begin
    FOrderid := Value;
    AttributeChanged(MetaType.MetaAttributes.Get('Orderid'));
  end;
end;

function TViewsale.GetPosted: TDateTimeNullable;
begin
  Result := FPosted;
end;

procedure TViewsale.SetPosted(const Value: TDateTimeNullable);
begin
  if AttributeChanging(MetaType.MetaAttributes.Get('Posted'), Value) then begin
    FPosted := Value;
    AttributeChanged(MetaType.MetaAttributes.Get('Posted'));
  end;
end;

function TViewsale.GetProductid: Int64;
begin
  Result := FProductid;
end;

procedure TViewsale.SetProductid(const Value: Int64);
begin
  if AttributeChanging(MetaType.MetaAttributes.Get('Productid'), Value) then begin
    FProductid := Value;
    AttributeChanged(MetaType.MetaAttributes.Get('Productid'));
  end;
end;

function TViewsale.GetProduct: String;
begin
  Result := FProduct;
end;

procedure TViewsale.SetProduct(const Value: String);
begin
  if AttributeChanging(MetaType.MetaAttributes.Get('Product'), Value) then begin
    FProduct := Value;
    AttributeChanged(MetaType.MetaAttributes.Get('Product'));
  end;
end;

function TViewsale.GetQuantity: IntegerNullable;
begin
  Result := FQuantity;
end;

procedure TViewsale.SetQuantity(const Value: IntegerNullable);
begin
  if AttributeChanging(MetaType.MetaAttributes.Get('Quantity'), Value) then begin
    FQuantity := Value;
    AttributeChanged(MetaType.MetaAttributes.Get('Quantity'));
  end;
end;

function TViewsale.GetPrice: TObjectData;
begin
  Result.Assign(FPrice);
end;

procedure TViewsale.SetPrice(const Value: TObjectData);
begin
  if AttributeChanging(MetaType.MetaAttributes.Get('Price'), Value) then begin
    FPrice.Assign(Value);
    AttributeChanged(MetaType.MetaAttributes.Get('Price'));
  end;
end;

function TViewsale.GetTotal: TObjectData;
begin
  Result.Assign(FTotal);
end;

procedure TViewsale.SetTotal(const Value: TObjectData);
begin
  if AttributeChanging(MetaType.MetaAttributes.Get('Total'), Value) then begin
    FTotal.Assign(Value);
    AttributeChanged(MetaType.MetaAttributes.Get('Total'));
  end;
end;

{$IFNDEF USE_GENERICS}
function TCustomerOrders.GetItem(Index: Integer): TOrder;
begin
  Result := inherited Items[Index] as TOrder;
end;
{$ENDIF}

{$IFNDEF USE_GENERICS}
function TProductItems.GetItem(Index: Integer): TItem;
begin
  Result := inherited Items[Index] as TItem;
end;
{$ENDIF}

{$IFNDEF USE_GENERICS}
function TOrderItems.GetItem(Index: Integer): TItem;
begin
  Result := inherited Items[Index] as TItem;
end;
{$ENDIF}

{******************************************************************************}
{  The following code is used for automatic entity mapping                     }
{******************************************************************************}

initialization
  ForceRtti(TCustomer);
  ForceRtti(TProduct);
  ForceRtti(TItem);
  ForceRtti(TUser);
  ForceRtti(TOrder);
  ForceRtti(TViewsale);

end.

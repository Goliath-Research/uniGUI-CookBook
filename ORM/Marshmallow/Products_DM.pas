unit Products_DM;

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

  TProductsDM = class(TDataModule)
    dsProducts: TDataSource;
    dstProducts: TObjectDataSet;
    dstProductsID: TAutoIncField;
    dstProductsDescription: TStringField;
    dstProductsPrice: TCurrencyField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure dstProductsAfterPost(DataSet: TDataSet);
  private
    FProducts : IList<TProduct>;
  public

    property Products : IList<TProduct> read FProducts;
  end;

var
  ProductsDM: TProductsDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TProductsDM.DataModuleCreate(Sender: TObject);
begin
  FProducts := MainDM.Session.FindAll<TProduct>();

  dstProducts.DataList := FProducts as IObjectList;

  dstProducts.Open;
end;

procedure TProductsDM.DataModuleDestroy(Sender: TObject);
begin
  dstProducts.Close;
end;

procedure TProductsDM.dstProductsAfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

end.

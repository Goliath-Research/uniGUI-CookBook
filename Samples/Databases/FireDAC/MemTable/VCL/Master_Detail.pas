unit Master_Detail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ExtCtrls, Vcl.ToolWin, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.StorageBin;

type
  TMaster_DetailForm = class(TForm)
    tblOrders: TFDMemTable;
    tblOrdersID: TAutoIncField;
    tblOrdersCustomerID: TIntegerField;
    tblCustomers: TFDMemTable;
    tblCustomersID: TAutoIncField;
    tblCustomersName: TStringField;
    tblOrdersCustomer: TStringField;
    tblItems: TFDMemTable;
    tblItemsOrderID: TIntegerField;
    tblItemsProductID: TIntegerField;
    tblProducts: TFDMemTable;
    tblProductsID: TAutoIncField;
    tblProductsDescription: TStringField;
    tblProductsPrice: TCurrencyField;
    tblItemsProduct: TStringField;
    tblItemsQuantity: TIntegerField;
    tblItemsPrice: TCurrencyField;
    tblItemsTotal: TCurrencyField;
    dsOrders: TDataSource;
    dsItems: TDataSource;
    dbgOrders: TDBGrid;
    dbnOrders: TDBNavigator;
    pnlOrders: TPanel;
    Splitter1: TSplitter;
    pnlMasterGrid: TPanel;
    dbnItems: TDBNavigator;
    pnlItems: TPanel;
    pnlDetailGrid: TPanel;
    dbgItems: TDBGrid;
    tblOrdersPosted: TDateTimeField;
    procedure tblItemsCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Master_DetailForm: TMaster_DetailForm;

implementation

{$R *.dfm}

procedure TMaster_DetailForm.tblItemsCalcFields(DataSet: TDataSet);
begin
  if not tblItemsQuantity.IsNull and not tblItemsPrice.IsNull then
    tblItemsTotal.Value := tblItemsQuantity.Value * tblItemsPrice.Value;
end;

end.

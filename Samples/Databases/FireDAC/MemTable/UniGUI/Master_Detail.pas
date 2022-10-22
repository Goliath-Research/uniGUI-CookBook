unit Master_Detail;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.ToolWin,
  Vcl.DBGrids,
  FireDAC.Stan.StorageBin,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniGUIRegClasses,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniDBNavigator;

type
  TMaster_DetailForm = class(TUniForm)
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
    dbgOrders: TUniDBGrid;
    dbnOrders: TUniDBNavigator;
    pnlOrders: TUniPanel;
    Splitter1: TUniSplitter;
    pnlMasterGrid: TUniPanel;
    dbnItems: TUniDBNavigator;
    pnlItems: TUniPanel;
    pnlDetailGrid: TUniPanel;
    dbgItems: TUniDBGrid;
    tblOrdersPosted: TDateTimeField;
    procedure tblItemsCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function Master_DetailForm: TMaster_DetailForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication;

function Master_DetailForm: TMaster_DetailForm;
begin
  Result := TMaster_DetailForm(UniMainModule.GetFormInstance(TMaster_DetailForm));
end;

procedure TMaster_DetailForm.tblItemsCalcFields(DataSet: TDataSet);
begin
  if not tblItemsQuantity.IsNull and not tblItemsPrice.IsNull then
    tblItemsTotal.Value := tblItemsQuantity.Value * tblItemsPrice.Value;
end;

initialization
  RegisterAppFormClass(TMaster_DetailForm);

end.

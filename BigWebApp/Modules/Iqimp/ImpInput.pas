unit ImpInput;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
  Vcl.Menus,
  IQMS.WebVcl.About,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, Vcl.Controls, uniGUIFrame;

type
  TFrmInput = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQSearch1: TIQUniGridControl;
    QryImp: TFDQuery;
    SrcImp: TDataSource;
    QryImpPONO: TStringField;
    QryImpORD_DATE: TDateTimeField;
    QryImpSHIP_ATTN: TStringField;
    QryImpSHIP_ADDR1: TStringField;
    QryImpSHIP_CITY: TStringField;
    QryImpSHIP_STATE: TStringField;
    QryImpSHIP_COUNTRY: TStringField;
    QryImpSHIP_ZIP: TStringField;
    QryImpITEMNO: TStringField;
    QryImpDESCRIP: TStringField;
    QryImpPROMISE_DATE: TDateTimeField;
    QryImpREQUEST_DATE: TDateTimeField;
    QryImpQTY: TBCDField;
    QryImpORDERNO: TStringField;
    IQAbout1: TIQWebAbout;
    PopupMenu1: TUniPopupMenu;
    Jumptoorders1: TUniMenuItem;
    QryImpORDERS_ID: TBCDField;
    QryImpARINVT_ITEMNO: TStringField;
    QryImpORD_DETAIL_ID: TBCDField;
    QryImpID: TBCDField;
    QryImpINPUT_FILE_ID: TBCDField;
    QryImpSHIP_TO_ID: TBCDField;
    QryImpARINVT_ID: TBCDField;
    QryImpCUSER1: TStringField;
    QryImpCUSER2: TStringField;
    QryImpCUSER3: TStringField;
    QryImpCUSER4: TStringField;
    QryImpCUSER5: TStringField;
    QryImpRELEASES_ID: TBCDField;
    QryImpARCUSTO_ID: TBCDField;
    QryImpEDI_ORD_DETAIL_ID: TBCDField;
    QryImpEDI_SHIP_ID: TBCDField;
    QryImpUOM: TStringField;
    QryImpLAST_RECEIPT_QTY: TBCDField;
    QryImpLAST_RECEIPT_DATE: TDateTimeField;
    QryImpDELORDERNO: TStringField;
    QryImpPT_DESCRIP: TStringField;
    QryImpFORECAST: TStringField;
    QryImpBILL_TO_ID: TBCDField;
    QryImpCUST_CUM_ATH_PQ: TBCDField;
    QryImpFA_ASSET_NO: TStringField;
    QryImpFA_DESCRIP: TStringField;
    QryImpFA_SERIAL_NUMBER: TStringField;
    QryImpFA_PURCHASE_DATE: TDateTimeField;
    QryImpFA_IN_SERVICE_DATE: TDateTimeField;
    QryImpFA_GLACCT_ID_ASSET: TBCDField;
    QryImpFA_SALVAGE_VALUE: TBCDField;
    QryImpFA_USEFUL_LIFE: TBCDField;
    QryImpFA_ACQUISITION_COST: TBCDField;
    QryImpFA_DISPOSAL_DATE: TDateTimeField;
    QryImpFA_DISPOSAL_TYPE: TStringField;
    QryImpFA_SALE_AMOUNT: TBCDField;
    QryImpFA_DEPRECIATION_METHOD: TStringField;
    QryImpFA_BOOK_TYPE: TStringField;
    QryImpFA_DECLINING_BAL_PERCENT: TBCDField;
    QryImpFA_CONVENTION: TStringField;
    QryImpFA_PROPERTY_CLASS: TStringField;
    QryImpFA_SEC_1250_REAL_PROPERTY: TStringField;
    QryImpFA_SEC_1245_PROPERTY: TStringField;
    QryImpFA_LISTED_PROPERTY: TStringField;
    QryImpFA_NY_LIBERTY__ZONE: TStringField;
    QryImpFA_AMORTIZED: TStringField;
    QryImpFA_BUSINESS_USE_PRCNT: TBCDField;
    QryImpFA_ITC_AMOUNT: TBCDField;
    QryImpFA_SECTION_179_DED: TBCDField;
    QryImpFA_MAIN_ID: TBCDField;
    QryImpFA_POSTING_BASIS: TStringField;
    QryImpFA_BOOK_ID: TBCDField;
    QryImpFA_POST_DATE: TDateTimeField;
    QryImpFA_AMOUNT: TBCDField;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Jumptoorders1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoViewParsedFile();
implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  {TODO -omugdha -cWEBIQ : Dependancy on oe_main
    oe_main,}
  IQMS.Common.Dialogs;
{$R *.DFM}

procedure DoViewParsedFile();
var
  LFrmInput: TFrmInput;
begin
  LFrmInput := TFrmInput.Create(uniGUIApplication.UniApplication);
end;

procedure TFrmInput.Exit1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmInput.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmInput.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmInput.Jumptoorders1Click(Sender: TObject);
begin
  with QryImp do
    if FieldByName('ORDERS_ID').asFloat <> 0 then
    { TODO -omugdha -cWEBIQ : Dependancy on oe_main
      DoIQJumpOrderDetail(self, FieldByName('ORD_DETAIL_ID').asFloat)}
      { in oe_main.pas }
    else
      IqConfirm('No Sales Order is associated with this item');
end;

procedure TFrmInput.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead(self, [self]);
end;

end.

unit q_set_mat;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  vcl.Wwdatainspector,
  Vcl.Menus,
  IQMS.WebVcl.About,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  vcl.wwdblook,
  IQMS.WebVcl.Jump,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Controls, Vcl.Grids, IQUniGrid,
  uniGUIFrame, uniComboBox, uniDBComboBox;

type
  TFrmQSetMatInfo = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Splitter1: TUniSplitter;
    Label1: TUniLabel;
    wwDBGrid1: TIQUniGridControl;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    QryQSetPrice: TFDQuery;
    QryQSetPriceID: TBCDField;
    QryQSetPriceQUAN: TBCDField;
    wwDBLookupComboQuoteQty: TUniDBLookupComboBox;
    SrcQSetPrice: TDataSource;
    QryQSetMat: TFDQuery;
    SrcQSetMat: TDataSource;
    QryQSetMatID: TBCDField;
    QryQSetMatQSET_PRICE_ID: TBCDField;
    QryQSetMatQINVT_ID: TBCDField;
    QryQSetMatQUAN: TStringField;
    QryQSetMatITEMNO: TStringField;
    QryQSetMatDESCRIP: TStringField;
    QryQSetMatDESCRIP2: TStringField;
    QryQSetMatCLASS: TStringField;
    QryQSetMatREV: TStringField;
    QryQSetMatONHAND: TBCDField;
    QryQSetMatNON_COMMITTED: TFMTBCDField;
    QryQSetMatMIN_ORDER_QTY: TBCDField;
    PopupMenu1: TUniPopupMenu;
    JumpToInventory1: TUniMenuItem;
    IQJumpInv: TIQWebJump;
    QryQSetMatARINVT_ID: TBCDField;
    QryQSetMatEXCESS: TFMTBCDField;
    Contents1: TUniMenuItem;
    wwDataInspector1: TwwDataInspector;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure QryQSetPriceBeforeOpen(DataSet: TDataSet);
    procedure JumpToInventory1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FQuote_ID: Integer;
    procedure SetQuote_ID(const Value: Integer);
  public
    { Public declarations }
    property Quote_ID: Integer write SetQuote_ID;
    class procedure DoShow(AQuote_ID: Integer);
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook;

{ TFrmQSetMatInfo }

class procedure TFrmQSetMatInfo.DoShow(AQuote_ID: Integer);
var
  LFrmQSetMatInfo : TFrmQSetMatInfo;
begin
  LFrmQSetMatInfo := TFrmQSetMatInfo.Create(UniGUIApplication.UniApplication);
  LFrmQSetMatInfo.Quote_ID := AQuote_ID;
  LFrmQSetMatInfo.Show;
end;

procedure TFrmQSetMatInfo.QryQSetPriceBeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('quote_id').asInteger:= FQuote_ID;
end;

procedure TFrmQSetMatInfo.SetQuote_ID(const Value: Integer);
begin
  FQuote_ID := Value;
end;

procedure TFrmQSetMatInfo.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, wwDBGrid1, Panel3 ]);
  IQSetTablesActive( TRUE, self );
end;

procedure TFrmQSetMatInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1, Panel3 ]);
end;

procedure TFrmQSetMatInfo.JumpToInventory1Click(Sender: TObject);
begin
  IQJumpInv.Execute
end;

procedure TFrmQSetMatInfo.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;

procedure TFrmQSetMatInfo.Exit1Click(Sender: TObject);
begin
  Close;
end;


procedure TFrmQSetMatInfo.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmEIQ{CHM}, iqhtmEIQ{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmQSetMatInfo.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;


end.

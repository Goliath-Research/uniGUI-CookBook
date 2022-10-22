unit ven_rfq_template;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Vcl.Wwdatsrc,
  Vcl.Wwdbigrd,
  Vcl.Wwdbgrid,
  Vcl.Menus,
  IQMS.WebVcl.About,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Data.DB,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniSplitter,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, IQUniGrid, uniGUIFrame,
  Vcl.Controls;

type
  TFrmVendorRFQTemplate = class(TUniForm)
    pnlTop1: TUniPanel;
    Splitter1: TUniSplitter;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    NavMain: TUniDBNavigator;
    Panel4: TUniPanel;
    NavDet: TUniDBNavigator;
    wwDBGrid2: TIQUniGridControl;
    SrcMain: TDataSource;
    QryMain: TFDQuery;
    QryMainCODE: TStringField;
    QryMainDESCRIP: TStringField;
    wwDBGrid1: TIQUniGridControl;
    UpdateSQLTemplate: TFDUpdateSQL;
    SrcDetail: TDataSource;
    QryDetail: TFDQuery;
    UpdateSQLDetail: TFDUpdateSQL;
    QryDetailID: TBCDField;
    QryDetailVENDOR_RFQ_TEMPL_ID: TBCDField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    QryDetailPRICE: TFMTBCDField;
    QryMainID: TBCDField;
    QryMainEPLANT_ID: TBCDField;
    QryDetailQUAN: TBCDField;
    procedure QryMainBeforePost(DataSet: TDataSet);
   // procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryDetailBeforePost(DataSet: TDataSet);
    procedure QryDetailNewRecord(DataSet: TDataSet);
    procedure PostParentBeforeEdit(DataSet: TDataSet);
    procedure About1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShowModal;
  end;

implementation

{$R *.dfm}

uses
  //IQRegFrm;
  IQMS.Common.DataLib;


class procedure TFrmVendorRFQTemplate.DoShowModal;
var
  frm : TFrmVendorRFQTemplate;
begin
  frm:=TFrmVendorRFQTemplate.create(uniGUIApplication.UniApplication);
  frm.ShowModal;
end;

procedure TFrmVendorRFQTemplate.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  //IQRegFormWrite( self, [ self, pnlTop1, wwDBGrid1 ]);
end;

procedure TFrmVendorRFQTemplate.QryMainBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet, 'vendor_rfq_templ' );
end;

procedure TFrmVendorRFQTemplate.UniFormShow(Sender: TObject);
begin
   IQSetTablesActive( TRUE, self );
  //IQRegFormRead( self, [ self, pnlTop1, wwDBGrid1 ]);
end;


//procedure TFrmVendorRFQTemplate.CheckRefresh(Sender: TObject;
//  Button: TNavigateBtn);
//begin
//  IQCheckRefresh(Sender, Button);
//end;


procedure TFrmVendorRFQTemplate.QryDetailBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet, 'vendor_rfq_templ_quan' );
end;

procedure TFrmVendorRFQTemplate.QryDetailNewRecord(DataSet: TDataSet);
begin
  QryDetailVENDOR_RFQ_TEMPL_ID.asFloat:= QryMainID.asFloat;
end;

procedure TFrmVendorRFQTemplate.PostParentBeforeEdit(DataSet: TDataSet);
begin
  QryMain.CheckBrowseMode;
end;

procedure TFrmVendorRFQTemplate.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;

procedure TFrmVendorRFQTemplate.Close1Click(Sender: TObject);
begin
  Close;
end;

end.

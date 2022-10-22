unit APRec;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.DBGrids,
  FireDAC.Comp.Client,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniSplitter,
  uniLabel,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator;

type
  TFrmAPPoRecDrillDwn = class(TUniForm)
    Panel12: TUniPanel;
    Splitter3: TUniSplitter;
    Panel11: TUniPanel;
    SrcRej: TDataSource;
    QryRej: TFDQuery;
    SrcRec: TDataSource;
    QryRec: TFDQuery;
    QryRecRECEIPTNO: TStringField;
    QryRecQTY_RECEIVED: TBCDField;
    QryRecDATE_RECEIVED: TDateTimeField;
    QryRecPOSTED: TStringField;
    QryRecCOMMENT1: TStringField;
    GridPoReceipts: TUniDBGrid;
    gridRejects: TUniDBGrid;
    PnlToolbar: TUniPanel;
    PnlToolbarCaption: TUniPanel;
    lblCaptionLabel: TUniLabel;
    PnlToolbarInner: TUniPanel;
    NavReceipts: TUniDBNavigator;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Label1: TUniLabel;
    Panel3: TUniPanel;
    navRejects: TUniDBNavigator;
    QryRecID: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    procedure SetPo_Detail_ID(const Value: integer);
    { Private declarations }
  public
    { Public declarations }

    property Po_Detail_ID : integer write SetPo_Detail_ID;
  end;

procedure DoApRecDrillDown(APo_Detail_ID : integer);

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;


procedure DoApRecDrillDown;
var
  FrmAPPoRecDrillDwn : TFrmAPPoRecDrillDwn;
begin
  FrmAPPoRecDrillDwn := TFrmAPPoRecDrillDwn.Create(UniApplication);
  FrmAPPoRecDrillDwn.Po_Detail_ID := APo_Detail_ID;
  IQSetTablesActive( TRUE, FrmAPPoRecDrillDwn );
  FrmAPPoRecDrillDwn.ShowModal;
end;

procedure TFrmAPPoRecDrillDwn.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, Panel12, GridPoReceipts, gridRejects]);
end;

procedure TFrmAPPoRecDrillDwn.SetPo_Detail_ID(const Value: integer);
begin
  QryRec.ParamByName('PO_DETAIL_ID').Value := Value;
end;

procedure TFrmAPPoRecDrillDwn.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self, Panel12, GridPoReceipts, gridRejects]);
end;

end.

unit oe_pallet_pkg_info;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, IQUniGrid, uniGUIFrame;

type
  TFrmOEPkgPalletInfo = class(TUniForm)
    wwDBGrid1: TIQUniGridControl;
    wwDataSource1: TDataSource;
    wwQuery1: TFDQuery;
    wwQuery1ID: TBCDField;
    wwQuery1ORDERS_ID: TBCDField;
    wwQuery1ARINVT_ID: TBCDField;
    wwQuery1ORD_DET_SEQNO: TBCDField;
    wwQuery1ITEMNO: TStringField;
    wwQuery1DESCRIP: TStringField;
    wwQuery1DESCRIP2: TStringField;
    wwQuery1UNIT: TStringField;
    wwQuery1TOTAL_QTY_ORD: TBCDField;
    wwQuery1EPLANT_ID: TBCDField;
    wwQuery1PTS_PER_PKG: TFMTBCDField;
    wwQuery1PALLET_PTSPER: TFMTBCDField;
    wwQuery1PALLET_COUNT: TFMTBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwQuery1BeforeOpen(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FOrders_ID: Real;
    procedure SetOrders_ID(const Value:Real);
  public
    { Public declarations }
    property Orders_ID: Real write SetOrders_ID;
    class procedure DoShowModal( AOrders_ID: Real );
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

{ TFrmOEPkgPalletInfo }

procedure TFrmOEPkgPalletInfo.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [ self, wwDBGrid1 ]);
end;

procedure TFrmOEPkgPalletInfo.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
end;

class procedure TFrmOEPkgPalletInfo.DoShowModal(AOrders_ID: Real);
var
  frm: TFrmOEPkgPalletInfo;
begin
  frm := TFrmOEPkgPalletInfo.Create(uniGUIApplication.UniApplication);
  frm.FOrders_ID := AOrders_ID;
  frm.ShowModal;
end;

procedure TFrmOEPkgPalletInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self, wwDBGrid1 ]);
end;

procedure TFrmOEPkgPalletInfo.SetOrders_ID(const Value: Real);
begin
  FOrders_ID := Value;
end;

procedure TFrmOEPkgPalletInfo.wwQuery1BeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('orders_id').asFloat:= FOrders_ID;
end;

end.

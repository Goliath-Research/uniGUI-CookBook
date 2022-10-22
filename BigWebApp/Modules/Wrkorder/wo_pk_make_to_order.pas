unit wo_pk_make_to_order;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame;

type
  TFrmWO_PickMakeToOrder = class(TUniForm)
    IQSearch1: TIQUniGridControl;
    wwQuery1: TFDQuery;
    wwDataSource1: TDataSource;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    wwQuery1ORDERNO: TStringField;
    wwQuery1CUSTNO: TStringField;
    wwQuery1ORD_DET_SEQNO: TBCDField;
    wwQuery1ITEMNO: TStringField;
    wwQuery1DESCRIP: TStringField;
    wwQuery1ORD_DETAIL_ID: TBCDField;
    wwQuery1SHIP_QUAN: TFMTBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure wwQuery1BeforeOpen(DataSet: TDataSet);
    procedure wwDataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FWorkorder_ID: Real;
    procedure SetWorkorder_ID(const Value: Real);
    procedure SetButtons;
  public
    { Public declarations }
    property Workorder_ID: Real write SetWorkorder_ID;
    class function DoShowModal(AWorkorder_ID: Real; var AMake_To_Order_Detail_ID: Real): Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  wo_rscstr;

{ TFrmWO_PickMakeToOrder }

class function TFrmWO_PickMakeToOrder.DoShowModal(AWorkorder_ID: Real; var AMake_To_Order_Detail_ID: Real): Boolean;
var
  frm: TFrmWO_PickMakeToOrder;
begin
  frm := TFrmWO_PickMakeToOrder.Create(uniGUIApplication.UniApplication);
  frm.FWorkorder_ID := AWorkorder_ID;
  Result := (frm.ShowModal = mrOK);
  if Result then
    AMake_To_Order_Detail_ID := frm.wwQuery1ORD_DETAIL_ID.asFloat;

end;

procedure TFrmWO_PickMakeToOrder.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
  IQSetTablesActive(TRUE, self);
  SetButtons;
end;

procedure TFrmWO_PickMakeToOrder.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmWO_PickMakeToOrder.SetButtons;
begin
  btnOK.Enabled := wwQuery1ORD_DETAIL_ID.AsLargeInt > 0;
end;

procedure TFrmWO_PickMakeToOrder.SetWorkorder_ID(const Value: Real);
begin
  FWorkorder_ID := Value;
end;

procedure TFrmWO_PickMakeToOrder.btnOKClick(Sender: TObject);
begin
  //wo_rscstr
  if wwQuery1ORD_DETAIL_ID.AsLargeInt > 0 then
    ModalResult := mrOK;
end;

procedure TFrmWO_PickMakeToOrder.wwDataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  if Showing then
    SetButtons;
end;

procedure TFrmWO_PickMakeToOrder.wwQuery1BeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'workorder_id', FWorkorder_ID);
end;

end.

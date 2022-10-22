unit ARCustMt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Vcl.Wwdatsrc, Vcl.ExtCtrls, IQSearch, Vcl.Wwdbigrd, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Menus, IQAbout, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Stan.Param, FireDAC.Phys,
  FireDAC.Phys.Intf, FireDAC.DatS, FireDAC.DApt, FireDAC.DApt.Intf,
  FireDAC.UI.Intf, db_dm;

type
  TFrmARCustMaterial = class(TForm)
    IQSearch1: TIQSearch;
    Src: TwwDataSource;
    Qry: TFDQuery;
    QryPO_DETAIL_ID: TBCDField;
    QryARCUSTO_ID: TBCDField;
    QryQTY_RECEIVED: TFMTBCDField;
    QryQTY_REJECTED: TFMTBCDField;
    QryPREPOST_INVOICE_QTY: TFMTBCDField;
    QryCREDITED_INVOICE_QTY: TFMTBCDField;
    QryTOTAL_CREDITED_QTY: TFMTBCDField;
    QryAP_QTY_INVOICED: TFMTBCDField;
    QryQTY_TO_CREDIT: TFMTBCDField;
    QryARINVT_ID: TBCDField;
    QryITEMNO: TStringField;
    QryDESCRIP: TStringField;
    QryCLASS: TStringField;
    QryREV: TStringField;
    QryMISC_ITEM: TStringField;
    QryABS_DESCRIP: TStringField;
    Panel2: TPanel;
    BtnAssign: TSpeedButton;
    QryUNIT_PRICE: TFMTBCDField;
    QryGLACCT_ID_INV: TBCDField;
    QryPRICE_PER_1000: TFMTBCDField;
    QryEPLANT_ID: TBCDField;
    QryPONO: TStringField;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    Options1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    SelectbyPOdetail1: TMenuItem;
    SelectbyPOreceipt1: TMenuItem;
    Splitter1: TSplitter;
    SrcRec: TwwDataSource;
    QryRec: TFDQuery;
    QryRecRECEIPTNO: TStringField;
    QryRecQTY_RECEIVED: TBCDField;
    QryRecDATE_RECEIVED: TDateTimeField;
    QryRecQTY_REJECTED: TFMTBCDField;
    QryRecQTY_INVOICED: TBCDField;
    QryRecQTY_TO_INVOICE: TFMTBCDField;
    QryRecID: TBCDField;
    QryRecPO_DETAIL_ID: TBCDField;
    QryRecPOSTED: TStringField;
    QryRecECODE: TStringField;
    QryRecEID: TBCDField;
    QryRecEDATE_TIME: TDateTimeField;
    QryRecCOMMENT1: TStringField;
    QryRecECOPY: TStringField;
    QryRecEPLANT_ID: TBCDField;
    IQSearch2: TIQSearch;
    IQAbout1: TIQAbout;
    Panel1: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAssignClick(Sender: TObject);
    procedure QryBeforeOpen(DataSet: TDataSet);
    procedure SelectbyPOdetail1Click(Sender: TObject);
    procedure SelectbyPOreceipt1Click(Sender: TObject);
    procedure QryAfterScroll(DataSet: TDataSet);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure QryRecAfterScroll(DataSet: TDataSet);
  protected
    procedure wwDbGridMouseDown(Sender: TObject;
             Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure wwDbGrid2MouseDown(Sender: TObject;
             Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent; ArcustoID:Real);
  end;

procedure DoARCustomerMaterial(AOwner:TComponent; ArcustoID:Real);

var
  FrmARCustMaterial: TFrmARCustMaterial;

implementation
{$R *.DFM}
uses IqRegfrm, inv_main, IQMS.Data.Lib;

procedure DoARCustomerMaterial(AOwner:TComponent; ArcustoID:Real);
begin
  with TFrmARCustMaterial.Create(AOwner, ArcustoId) do show;
end;

constructor TFrmARCustMaterial.Create(AOwner:TComponent; ArcustoID:Real);
var
  AType:Integer;
begin
  inherited Create(AOwner);
  TFrmInvoice(AOwner).fCustomerMaterial := self;
  with Qry do
  begin
    Close;
    ParamByName('nId').Value := ArcustoID;
    Open;
  end;
  QryRec.Open;
  IQRegFormRead( self, [self]);
  IqSearch1.wwDBGrid.Color := clbtnFace;
  IqSearch1.wwDBGrid.Ctl3D := False;
  IqSearch2.wwDBGrid.Color := clbtnFace;
  IqSearch2.wwDBGrid.Ctl3D := False;
  IqSearch1.wwDBGrid.OnMouseDown := wwDBGridMouseDown;
  IqSearch2.wwDBGrid.OnMouseDown := wwDBGrid2MouseDown;


  AType := 0;

  if IQRegIntegerScalarRead( self, 'AR_PO_BY_DETAIL', AType ) then
  begin
    if AType = 1 then
      SelectbyPOdetail1Click(nil)
    else
      SelectbyPOreceipt1Click(nil);
  end
  else
    SelectbyPOdetail1Click(nil);



end;

procedure TFrmARCustMaterial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
  TFrmInvoice(Owner).fCustomerMaterial := nil;
  Action := caFree;
end;

procedure TFrmARCustMaterial.BtnAssignClick(Sender: TObject);
begin
  if SelectbyPOdetail1.Checked then
  begin
    if IQSearch1.wwDBGrid.SelectedList.Count = 0 then
      IQSearch1.wwDBGrid.SelectRecord;
  end
  else
  begin
    if IQSearch2.wwDBGrid.SelectedList.Count = 0 then
      IQSearch2.wwDBGrid.SelectRecord;
  end;
  TFrmInvoice(Owner).AppendCustomerSuppliedMaterial;
end;


procedure TFrmARCustMaterial.wwDbGridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  IqSearch1.wwDBGrid.BeginDrag( False );
end;

procedure TFrmARCustMaterial.wwDbGrid2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  IqSearch2.wwDBGrid.BeginDrag( False );
end;

procedure TFrmARCustMaterial.QryBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );  {pas}
end;

procedure TFrmARCustMaterial.SelectbyPOdetail1Click(Sender: TObject);
begin
  SelectbyPOdetail1.Checked  := True;
  SelectbyPOreceipt1.Checked := False;
  IqSearch2.wwDBGrid.OnMouseDown := nil;
  IqSearch1.wwDBGrid.OnMouseDown := wwDBGridMouseDown;

  IQRegIntegerScalarWrite( self, 'AR_PO_BY_DETAIL', 1);
end;

procedure TFrmARCustMaterial.SelectbyPOreceipt1Click(Sender: TObject);
begin
  SelectbyPOdetail1.Checked  := False;
  SelectbyPOreceipt1.Checked := True;
  IqSearch2.wwDBGrid.OnMouseDown := wwDBGrid2MouseDown;
  IqSearch1.wwDBGrid.OnMouseDown := nil;
  IQRegIntegerScalarWrite( self, 'AR_PO_BY_DETAIL', 0);
end;

procedure TFrmARCustMaterial.QryAfterScroll(DataSet: TDataSet);
begin
  IQSearch2.wwDBGrid.UnselectAll;
  BtnAssign.Enabled := (SelectValueFmtAsFloat('select sum(qty_invoiced) from apprepost_detail where po_detail_id = %f', [QryRecPO_DETAIL_ID.Value]) = 0)
                       and (QryAP_QTY_INVOICED.value = 0);
end;

procedure TFrmARCustMaterial.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmARCustMaterial.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmARCustMaterial.QryRecAfterScroll(DataSet: TDataSet);
begin
  BtnAssign.Enabled := (SelectValueFmtAsFloat('select sum(qty_invoiced) from apprepost_detail where po_detail_id = %f', [QryRecPO_DETAIL_ID.Value]) = 0)
                       and (QryAP_QTY_INVOICED.value = 0)
end;



end.

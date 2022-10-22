unit ARCustMt;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
  Vcl.Buttons,
  Vcl.Menus,
  IQMS.WebVcl.About,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniMainMenu, uniGUIFrame, IQUniGrid;

type
  TFrmARCustMaterial = class(TUniForm)
    IQSearch1: TIQUniGridControl;
    Src: TDataSource;
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
    Panel2: TUniPanel;
    BtnAssign: TUniSpeedButton;
    QryUNIT_PRICE: TFMTBCDField;
    QryGLACCT_ID_INV: TBCDField;
    QryPRICE_PER_1000: TFMTBCDField;
    QryEPLANT_ID: TBCDField;
    QryPONO: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Options1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    SelectbyPOdetail1: TUniMenuItem;
    SelectbyPOreceipt1: TUniMenuItem;
    Splitter1: TUniSplitter;
    SrcRec: TDataSource;
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
    IQSearch2: TIQUniGridControl;
    IQAbout1: TIQWebAbout;
    Panel1: TUniPanel;
    Label1: TUniLabel;
    Panel3: TUniPanel;
    Label2: TUniLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAssignClick(Sender: TObject);
    procedure QryBeforeOpen(DataSet: TDataSet);
    procedure SelectbyPOdetail1Click(Sender: TObject);
    procedure SelectbyPOreceipt1Click(Sender: TObject);
    procedure QryAfterScroll(DataSet: TDataSet);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure QryRecAfterScroll(DataSet: TDataSet);
    procedure UniFormShow(Sender: TObject);
  protected
    procedure wwDbGridMouseDown(Sender: TObject;
             Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure wwDbGrid2MouseDown(Sender: TObject;
             Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    FAArcustoID: Real;
    procedure SetAArcustoID(const Value: Real);
    { Private declarations }
  public
    { Public declarations }
    property AArcustoID : Real write SetAArcustoID;
  end;

procedure DoARCustomerMaterial(ArcustoID:Real);

implementation
{$R *.DFM}
uses
  IQMS.Common.RegFrm,
  inv_main,
  IQMS.Common.DataLib;

procedure DoARCustomerMaterial(ArcustoID:Real);
var
  LFrmARCustMaterial : TFrmARCustMaterial;
begin
  LFrmARCustMaterial := TFrmARCustMaterial.Create(UniGUIApplication.UniApplication);
  with LFrmARCustMaterial do
  begin
    AArcustoId := ArcustoId;
    show;
  end;
end;

procedure TFrmARCustMaterial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
  { TODO : inv_main has no member fCustomerMaterial }
  //TFrmInvoice(Owner) := nil;
end;

procedure TFrmARCustMaterial.BtnAssignClick(Sender: TObject);
begin
  if SelectbyPOdetail1.Checked then
  begin
  { TODO : TIQUniGridControl doe not contain any member wwDBGrid }
   { if IQSearch1.wwDBGrid.SelectedList.Count = 0 then
      IQSearch1.wwDBGrid.SelectRecord;    }
  end
  else
  begin
  { TODO : TIQUniGridControl doe not contain any member wwDBGrid }
    {if IQSearch2.wwDBGrid.SelectedList.Count = 0 then
      IQSearch2.wwDBGrid.SelectRecord;      }
  end;
  TFrmInvoice(Owner).AppendCustomerSuppliedMaterial;
end;


procedure TFrmARCustMaterial.wwDbGridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
{ TODO : TIQUniGridControl doe not contain any member wwDBGrid }
//  IqSearch1.wwDBGrid.BeginDrag( False );
end;

procedure TFrmARCustMaterial.wwDbGrid2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
{ TODO : TIQUniGridControl doe not contain any member wwDBGrid }
 // IqSearch2.wwDBGrid.BeginDrag( False );
end;

procedure TFrmARCustMaterial.QryBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );  {pas}
end;

procedure TFrmARCustMaterial.SelectbyPOdetail1Click(Sender: TObject);
begin
  SelectbyPOdetail1.Checked  := True;
  SelectbyPOreceipt1.Checked := False;
  { TODO : TIQUniGridControl doe not contain any member wwDBGrid }
 { IqSearch2.wwDBGrid.OnMouseDown := nil;
  IqSearch1.wwDBGrid.OnMouseDown := wwDBGridMouseDown;     }

  IQRegIntegerScalarWrite( self, 'AR_PO_BY_DETAIL', 1);
end;

procedure TFrmARCustMaterial.SelectbyPOreceipt1Click(Sender: TObject);
begin
  SelectbyPOdetail1.Checked  := False;
  SelectbyPOreceipt1.Checked := True;
  { TODO : TIQUniGridControl doe not contain any member wwDBGrid }
 { IqSearch2.wwDBGrid.OnMouseDown := wwDBGrid2MouseDown;
  IqSearch1.wwDBGrid.OnMouseDown := nil;       }
  IQRegIntegerScalarWrite( self, 'AR_PO_BY_DETAIL', 0);
end;

procedure TFrmARCustMaterial.SetAArcustoID(const Value: Real);
begin
  FAArcustoID := Value;
end;

procedure TFrmARCustMaterial.UniFormShow(Sender: TObject);
var
  AType:Integer;
begin
{ TODO : inv_main has no member fCustomerMaterial }
  //TFrmInvoice(Owner).fCustomerMaterial := self;
  with Qry do
  begin
    Close;
    ParamByName('nId').Value := FAArcustoID;
    Open;
  end;
  QryRec.Open;
  IQRegFormRead( self, [self]);
  { TODO : TIQUniGridControl doe not contain any member wwDBGrid }
{  IqSearch1.wwDBGrid.Color := clbtnFace;
  IqSearch1.wwDBGrid.Ctl3D := False;
  IqSearch2.wwDBGrid.Color := clbtnFace;
  IqSearch2.wwDBGrid.Ctl3D := False;
  IqSearch1.wwDBGrid.OnMouseDown := wwDBGridMouseDown;
  IqSearch2.wwDBGrid.OnMouseDown := wwDBGrid2MouseDown;}


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

procedure TFrmARCustMaterial.QryAfterScroll(DataSet: TDataSet);
begin
{ TODO : TIQUniGridControl doe not contain any member wwDBGrid }
 // IQSearch2.wwDBGrid.UnselectAll;
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

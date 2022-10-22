unit Oe_update_price;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Data.DB,
  Vcl.Menus,
  IQMS.WebVcl.Jump,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniMainMenu,
  uniLabel, IQUniGrid, uniGUIFrame;

type
  TFrmOEUpdatePrice = class(TUniForm)
    Panel1: TUniPanel;
    IQSearch1: TIQUniGridControl;
    SrcOrdDetail: TDataSource;
    QryOrdDetail: TFDQuery;
    QryOrdDetailID: TBCDField;
    QryOrdDetailPONO: TStringField;
    QryOrdDetailORDERNO: TStringField;
    QryOrdDetailCUSTNO: TStringField;
    QryOrdDetailADDR1: TStringField;
    QryOrdDetailADDR2: TStringField;
    QryOrdDetailADDR3: TStringField;
    QryOrdDetailSTATUS: TStringField;
    QryOrdDetailCOMPANY: TStringField;
    QryOrdDetailDATE_TAKEN: TDateTimeField;
    QryOrdDetailORD_BY: TStringField;
    QryOrdDetailCLASS: TStringField;
    QryOrdDetailREV: TStringField;
    QryOrdDetailITEMNO: TStringField;
    QryOrdDetailDESCRIPTION: TStringField;
    QryOrdDetailDESCRIPTION2: TStringField;
    QryOrdDetailCUST_ITEMNO: TStringField;
    QryOrdDetailCUST_DESCRIP: TStringField;
    QryOrdDetailTOTAL_QTY_ORD: TBCDField;
    QryOrdDetailECODE: TStringField;
    QryOrdDetailEPLANT_ID: TBCDField;
    QryOrdDetailWEB_ORDERS_ID: TBCDField;
    QryOrdDetailATTN: TStringField;
    QryOrdDetailUNIT_PRICE: TFMTBCDField;
    QryOrdDetailUNIT: TStringField;
    QryOrdDetailORD_DETAIL_ID: TBCDField;
    StatusBar1: TUniStatusBar;
    PopupMenu1: TUniPopupMenu;
    IQJumpOrdDetail: TIQWebJump;
    JumptoSalesOrder1: TUniMenuItem;
    PnlCaption: TUniPanel;
    lblCaption1: TUniLabel;
    lblCaption2: TUniLabel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryOrdDetailBeforeOpen(DataSet: TDataSet);
    procedure btnOKClick(Sender: TObject);
    procedure JumptoSalesOrder1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FArinvt_ID: Real;
    FStd_Price: Real;
    procedure AssignPrice( AOrd_Detail_ID: Int64 );
    procedure SetArinvt_ID(const Value: Real);
  public
    { Public declarations }
    property Arinvt_ID: Real read FArinvt_ID write SetArinvt_ID;
    class procedure DoShowModal( AArinvt_ID: Real );
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Dialogs,
  inv_rscstr;

{ TFrmOEUpdatePrice }

class procedure TFrmOEUpdatePrice.DoShowModal( AArinvt_ID: Real);
var
  LFrmOEUpdatePrice : TFrmOEUpdatePrice;
begin
  LFrmOEUpdatePrice := TFrmOEUpdatePrice.Create(UniGUIApplication.UniApplication);
  LFrmOEUpdatePrice.Arinvt_ID := AArinvt_ID;
  LFrmOEUpdatePrice.ShowModal;
end;

procedure TFrmOEUpdatePrice.FormShow(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain ReadGrid
  IQSearch1.ReadGrid;   }
end;

procedure TFrmOEUpdatePrice.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  { TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain WriteGrid ]);
  IQRegFormWrite( self, [
  IQSearch1.WriteGrid;    }
end;

procedure TFrmOEUpdatePrice.QryOrdDetailBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'arinvt_id', FArinvt_ID);
end;

procedure TFrmOEUpdatePrice.SetArinvt_ID(const Value: Real);
begin
  FArinvt_ID := Value;
  lblCaption1.Caption := Format(inv_rscstr.cTXT0000109 {'Item #: %s'}, [SelectValueByID('itemno', 'arinvt', Value )]);
end;

procedure TFrmOEUpdatePrice.UniFormCreate(Sender: TObject);
begin
  FStd_Price:= SelectValueByID('std_price', 'arinvt', FArinvt_ID );
  IQSetTablesActive( TRUE, self );
  // Update caption
  // lblCaption2.Caption := Format(inv_rscstr.cTXT0000110 {'Update current sales orders price to %.6f'}, [FStd_Price]);
end;

procedure TFrmOEUpdatePrice.btnOKClick(Sender: TObject);
var
  I: Integer;
begin
  if not IQConfirmYN(inv_rscstr.cTXT0000111 {'Update marked sales order(s) price?'}) then
     EXIT;

  with IQSearch1 do
  try
    DataSource.DataSet.DisableControls;
(* TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain selectedlist
    IQAssert(( DBGrid.SelectedList.Count > 0 ) or not( DataSource.DataSet.Eof and DataSource.DataSet.Bof ), inv_rscstr.cTXT0000112 {'Please select one or more records.'});

    if DBGrid.SelectedList.Count > 0 then
       for I:= 0 to DBGrid.SelectedList.Count - 1 do
       begin
         DataSource.DataSet.GotoBookmark( DBGrid.SelectedList.Items[ I ]);
         // inv_rscstr.cTXT0000115 = 'Processing Sales Order # %s...'
         IQMS.Common.Controls.SetStatus(StatusBar1, Format(inv_rscstr.cTXT0000115,
           [QryOrdDetailORDERNO.AsString]));
         AssignPrice( DataSource.DataSet.FieldByName('ord_detail_id').AsLargeInt );
       end
    else
       AssignPrice( DataSource.DataSet.FieldByName('ord_detail_id').AsLargeInt );
*)
  finally
    DataSource.DataSet.EnableControls;
  end;

  // Clear the status
  IQMS.Common.Controls.SetStatus(StatusBar1, '');

  // inv_rscstr.cTXT0000113 =
  // 'Sales orders updated successfully.'
  IQInformation(inv_rscstr.cTXT0000113);

  Close;
end;


procedure TFrmOEUpdatePrice.AssignPrice( AOrd_Detail_ID: Int64 );
//var
//  A: Variant;
//  AOrderno: string;
//  AOrder_UOM_Factor: Real;
begin
  ExecuteCommandFmt('BEGIN iqms.oe_misc.update_unit_price(%d); END;',
    [AOrd_Detail_ID]);
(*  A:= SelectValueArrayFmt( 'select o.orderno, NVL(uom_factor,1) from ord_detail d, orders o where d.id = %f and d.orders_id = o.id', [ AOrd_Detail_ID ]);
  if VarArrayDimCount( A ) = 0 then
     raise Exception.CreateFmt(inv_rscstr.cTXT0000114 {'Cannot find Order detail item [ID=%.0f]'}, [ AOrd_Detail_ID ]);

  StatusBar1.SimpleText:= Format(inv_rscstr.cTXT0000115 {'Processing Sales Order # %s...'}, [ A[ 0 ]]);
  StatusBar1.Update;

  AOrder_UOM_Factor:= A[ 1 ];
  if AOrder_UOM_Factor = 0 then
     AOrder_UOM_Factor:= 1;

  ExecuteCommandFmt('update ord_detail set unit_price = %.6f, price_per_1000 = %.6f where id = %f',
            [ FStd_Price * AOrder_UOM_Factor,
              FStd_Price * AOrder_UOM_Factor * 1000,
              AOrd_Detail_ID ]);
*)
end;


procedure TFrmOEUpdatePrice.JumptoSalesOrder1Click(Sender: TObject);
begin
  IQJumpOrdDetail.Execute;
end;

end.

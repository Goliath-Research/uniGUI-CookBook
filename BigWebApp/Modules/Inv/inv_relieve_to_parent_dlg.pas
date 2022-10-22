unit inv_relieve_to_parent_dlg;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Mask,
  inv_relieve_params,
  Data.DB,
  IQMS.WebVcl.Hpick,
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
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TRelieveToParentCargo = record
    Arinvt_ID   : Real;        // in
    Batch       : Real;        // out
    FGLotNo     : string;      // out
    Workorder_ID: Real;        // out
  end;

  TFrmInvRelieveToParentDialog = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel3: TUniPanel;
    Bevel1: TUniPanel;
    Panel4: TUniPanel;
    Label1: TUniLabel;
    pnlRelieveTo: TUniPanel;
    lblRelieveTo: TUniLabel;
    wwDBComboDlgRelieveTo: TUniEdit;
    PkWorkOrder: TIQWebHPick;
    PkWorkOrderID: TBCDField;
    PkWorkOrderMFGNO: TStringField;
    PkWorkOrderITEMNO: TStringField;
    PkWorkOrderDESCRIP: TStringField;
    PkWorkOrderDESCRIP2: TStringField;
    PkWorkOrderREV: TStringField;
    PkWorkOrderEPLANT_ID: TBCDField;
    PkWorkOrderCYCLES_REQ: TBCDField;
    PkWorkOrderBUCKET: TBCDField;
    PkWorkOrderORIGIN: TStringField;
    PkWorkOrderMFG_TYPE: TStringField;
    PkWorkOrderFIRM: TStringField;
    PkOrdDetail: TIQWebHPick;
    PkOrdDetailID: TBCDField;
    PkOrdDetailPONO: TStringField;
    PkOrdDetailCUSTNO: TStringField;
    PkOrdDetailCOMPANY: TStringField;
    PkOrdDetailDATE_TAKEN: TDateTimeField;
    PkOrdDetailORD_BY: TStringField;
    PkOrdDetailCLASS: TStringField;
    PkOrdDetailREV: TStringField;
    PkOrdDetailITEMNO: TStringField;
    PkOrdDetailDESCRIPTION: TStringField;
    PkOrdDetailDESCRIPTION2: TStringField;
    PkOrdDetailADDR1: TStringField;
    PkOrdDetailADDR2: TStringField;
    PkOrdDetailADDR3: TStringField;
    PkOrdDetailSTATUS: TStringField;
    PkOrdDetailCUST_ITEMNO: TStringField;
    PkOrdDetailCUST_DESCRIP: TStringField;
    PkOrdDetailORDERNO: TStringField;
    PkOrdDetailTOTAL_QTY_ORD: TBCDField;
    PkOrdDetailEPLANT_ID: TBCDField;
    PkOrdDetailATTN: TStringField;
    PkOrdDetailCUST_REV: TStringField;
    PkOrdDetailIS_DROP_SHIP: TStringField;
    PkOrdDetailBLANKET_ORDER_BACKLOG: TFMTBCDField;
    PkOrdDetailCUMM_SHIPPED: TBCDField;
    PkOrdDetailTELEPHONE: TStringField;
    PkOrdDetailORD_DETAIL_ID: TBCDField;
    PkWorkCenter: TIQWebHPick;
    PkWorkCenterEQNO: TStringField;
    PkWorkCenterCNTR_DESC: TStringField;
    PkWorkCenterCNTR_TYPE: TStringField;
    PkWorkCenterID: TBCDField;
    PkWorkCenterEPLANT_ID: TBCDField;
    PkWorkCenterMFGCELL: TStringField;
    PkWorkCenterDIVISION_NAME: TStringField;
    PkWorkCenterPK_HIDE: TStringField;
    PkWorkCenterMFG_TYPE: TStringField;
    PkMasterLabel: TIQWebHPick;
    PkMasterLabelSERIAL: TStringField;
    PkMasterLabelWORKORDER_ID: TFMTBCDField;
    PkMasterLabelVIN_NO: TStringField;
    PkMasterLabelMFGNO: TStringField;
    PkMasterLabelITEMNO: TStringField;
    PkMasterLabelDESCRIP: TStringField;
    PkMasterLabelQTY: TFMTBCDField;
    PkMasterLabelID: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure wwDBComboDlgRelieveToKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wwDBComboDlgRelieveToCustomDlg(Sender: TObject);
    procedure PkMasterLabelBeforeOpen(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FInvRelieveToType: TInvRelieveToType;
    procedure AdjustScreen;
    function InvRelieveToTypeToText: string;
    procedure ProcessInput;
    procedure Validate;
    procedure ProcessWorkorder(AWorkOrder_ID: Real);
    procedure AssignPromptFromPicklist(APk: TIQWebHPick; AFieldName: string = 'ID');
    procedure ProcessOrdDetail(AOrdDetail_ID: Real);
    procedure ProcessWorkCenter(AEqNo: string);
    procedure ProcessParentSerial(ASerial: string);
    procedure SetCargo(const Value: TRelieveToParentCargo);
  public
    { Public declarations }
    FCargo: TRelieveToParentCargo;

    class function DoShowModal(var ACargo: TRelieveToParentCargo): Boolean;
    property Cargo: TRelieveToParentCargo write SetCargo;
  end;

implementation

{$R *.dfm}

uses
{ TODO -ohphadke : Dependency
  assy_share,
  touchscrn, }
  bom_share,
  IQMS.Common.ApplicationSet,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm;

{ TFrmInvRelieveToParentDialog }

class function TFrmInvRelieveToParentDialog.DoShowModal(var ACargo: TRelieveToParentCargo): Boolean;
var
LFrmInvRelieveToParentDialog : TFrmInvRelieveToParentDialog;
begin
LFrmInvRelieveToParentDialog := TFrmInvRelieveToParentDialog.Create(UniGUIApplication.UniApplication);
  with LFrmInvRelieveToParentDialog do
  begin
    Result:= ShowModal = mrOK;
    if Result then
       ACargo:= FCargo;
         ACargo.Batch       := 0;
         ACargo.FGLotNo     := '';
        ACargo.Workorder_ID:= 0;
  end;
end;


procedure TFrmInvRelieveToParentDialog.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmInvRelieveToParentDialog.AdjustScreen;
begin
  case FInvRelieveToType of
    irtNone: pnlRelieveTo.Visible:= FALSE;
  else
    lblRelieveTo.Caption:= 'Relieve Inventory To ' + InvRelieveToTypeToText();
  end;

//  if IQMS.Common.ApplicationSet.IsTouchScreen then
//     touchscrn.ApplyTouchscreenFont( self );

  PkWorkOrder.TouchScreen  := IQMS.Common.ApplicationSet.IsTouchScreen;
  PkOrdDetail.TouchScreen  := IQMS.Common.ApplicationSet.IsTouchScreen;
  PkWorkCenter.TouchScreen := IQMS.Common.ApplicationSet.IsTouchScreen;
  PkMasterLabel.TouchScreen:= IQMS.Common.ApplicationSet.IsTouchScreen;
end;

function TFrmInvRelieveToParentDialog.InvRelieveToTypeToText: string;
begin
  case FInvRelieveToType of
    irtNone        : Result:= '';
    irtWorkorder   : Result:= 'Work Order';
    irtSalesOrder  : Result:= 'Sales Order Detail Line ID';
    irtParentSerial: Result:= 'Parent Serial#';
    irtWorkCenter  : Result:= 'Work Center';
  end;
end;

procedure TFrmInvRelieveToParentDialog.wwDBComboDlgRelieveToKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    btnOK.Click;
    Key:= 0;
  end;
end;

procedure TFrmInvRelieveToParentDialog.AssignPromptFromPicklist( APk: TIQWebHPick; AFieldName: string = 'ID' );
begin
  with APk do
    if Execute then
       wwDBComboDlgRelieveTo.Text:= GetValue( AFieldName );
end;

procedure TFrmInvRelieveToParentDialog.btnOKClick(Sender: TObject);
begin
  Validate;
  ProcessInput;
  ModalResult:= mrOK;
end;

procedure TFrmInvRelieveToParentDialog.PkMasterLabelBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'arinvt_id', FCargo.Arinvt_ID);
//  TFDQuery(DataSet).ParamByName('arinvt_id').Value := FCargo.Arinvt_ID;
end;


procedure TFrmInvRelieveToParentDialog.wwDBComboDlgRelieveToCustomDlg(Sender: TObject);
begin
  case FInvRelieveToType of
    irtWorkorder   : AssignPromptFromPicklist( PkWorkOrder );
    irtSalesOrder  : AssignPromptFromPicklist( PkOrdDetail,   'ord_detail_id' );
    irtWorkCenter  : AssignPromptFromPicklist( PkWorkCenter,  'eqno' );
    irtParentSerial: AssignPromptFromPicklist( PkMasterLabel, 'serial' );
  end;
end;

procedure TFrmInvRelieveToParentDialog.Validate;
var
  AValue: Real;
begin
  if FInvRelieveToType <> irtNone then
     IQAssert( wwDBComboDlgRelieveTo.Text > '', Format('''%s'' must be entered - operation aborted.', [lblRelieveTo.Caption ]));

  case FInvRelieveToType of
    irtWorkorder   : IQAssert( IQMS.Common.Numbers.IsStringValidFloat( wwDBComboDlgRelieveTo.Text, AValue ), 'Invalid number - check entered Work Order' );
    irtSalesOrder  : IQAssert( IQMS.Common.Numbers.IsStringValidFloat( wwDBComboDlgRelieveTo.Text, AValue ), 'Invalid number - check entered Order Detail Line ID' );
    irtParentSerial: {Not applicable};
    irtWorkCenter  : {Not applicable};
  end;
end;


procedure TFrmInvRelieveToParentDialog.ProcessInput;
begin
  case FInvRelieveToType of
    irtWorkorder   : ProcessWorkorder( StrToFloat( wwDBComboDlgRelieveTo.Text ));
    irtSalesOrder  : ProcessOrdDetail( StrToFloat( wwDBComboDlgRelieveTo.Text ));
    irtWorkCenter  : ProcessWorkCenter( wwDBComboDlgRelieveTo.Text );
    irtParentSerial: ProcessParentSerial( wwDBComboDlgRelieveTo.Text );
  end;
end;

procedure TFrmInvRelieveToParentDialog.ProcessWorkorder( AWorkOrder_ID: Real );
var
  APartno_ID: Real;
  ABatch    : Real;
  AStandard_ID: Real;
begin
  // validate
  IQAssert( SelectValueByID('1', 'workorder', AWorkOrder_ID) = 1, 'Invalid work order - operation aborted.' );

  // grab the 1st ptorder - no family mold support for now
  APartno_ID:= SelectValueFmtAsFloat('select partno_id from ptorder where workorder_id = %f order by id', [ AWorkOrder_ID ]);
  IQAssert( APartno_ID > 0, Format('Unable to verify work order %.0f details - operation aborted.', [ AWorkOrder_ID ]));

  // batch
  //assy_share.ensure_assy1_translog_batch_assigned( AWorkorder_ID, APartno_ID, ABatch );

  FCargo.Batch  := ABatch;
  FCargo.FGLotNo:= bom_share.bom_get_fg_lotno( SelectValueByID( 'standard_id', 'workorder', AWorkOrder_ID ), APartno_ID );
  FCargo.Workorder_ID:= AWorkOrder_ID;
end;

procedure TFrmInvRelieveToParentDialog.SetCargo(
  const Value: TRelieveToParentCargo);
begin
  FCargo := Value;
end;

procedure TFrmInvRelieveToParentDialog.UniFormCreate(Sender: TObject);
begin
  inherited ;
  if IQMS.Common.ApplicationSet.IsTouchScreen then self.Position:= poScreenCenter else IQRegFormRead( self, [ self ]);
  IQSetTablesActive( TRUE, self );
  FInvRelieveToType:= TFrmInvRelieveParams.GetRelieveToInventoryType; // irtNone, irtWorkorder, irtSalesOrder, irtParentSerial, irtWorkCenter
  AdjustScreen;
end;

procedure TFrmInvRelieveToParentDialog.ProcessOrdDetail( AOrdDetail_ID: Real );
var
  AWorkorder_ID: Real;
begin
  // validate
  IQAssert( SelectValueByID('1', 'ord_detail', AOrdDetail_ID) = 1, 'Invalid sales order line ID - operation aborted.' );

  // attempt to get the workorder
  AWorkorder_ID:= SelectValueFmtAsFloat('select p.workorder_id from ptorder_rel r, ptorder p where r.ord_detail_id = %f and r.ptorder_id = p.id and ptallocate_parent_id is not null',
                            [ AOrdDetail_ID ]);
  if AWorkorder_ID = 0 then
     AWorkorder_ID:= SelectValueFmtAsFloat('select p.workorder_id from ptorder_rel r, ptorder p where r.ord_detail_id = %f and r.ptorder_id = p.id',
                               [ AOrdDetail_ID ]);
  IQAssert( AWorkorder_ID > 0, Format('Unable to identify a work order related to order detail line ID %f - operation aborted.', [ AOrdDetail_ID ]));

  ProcessWorkorder( AWorkOrder_ID );
end;


procedure TFrmInvRelieveToParentDialog.ProcessWorkCenter( AEqNo: string );
var
  AWork_Center_ID: Real;
  AWorkorder_ID: Real;
begin
  AWork_Center_ID:= SelectValueFmtAsFloat('select id from work_center where rtrim(eqno) = ''%s''', [ AEqNo ]);
  // validate
  IQAssert( AWork_Center_ID > 0, 'Invalid work center - operation aborted.' );

  // attempt to get the workorder
  AWorkorder_ID:= SelectValueFmtAsFloat('select workorder_id from cntr_sched where work_center_id = %f and cntr_seq = 1', [ AWork_Center_ID ]);
  IQAssert( AWorkorder_ID > 0, Format('Unable to identify a work order among currently running on work center ''%s'' - operation aborted.', [ AEqNo ]));

  ProcessWorkorder( AWorkOrder_ID );
end;


procedure TFrmInvRelieveToParentDialog.ProcessParentSerial( ASerial: string );
var
  AMaster_Label_ID: Real;
  AWorkorder_ID: Real;
begin
  AMaster_Label_ID:= SelectValueFmtAsFloat('select id from master_label where serial = ''%s''', [ ASerial ]);
  // validate
  IQAssert( AMaster_Label_ID > 0, 'Invalid serial # - operation aborted.' );

  // attempt to get the workorder
  AWorkorder_ID:= SelectValueFmtAsFloat('select nvl(workorder_id, vin_wo_id) from master_label where id = %f', [ AMaster_Label_ID ]);
  IQAssert( AWorkorder_ID > 0, Format('Unable to identify a work order associated with the scanned parent label ''%s'' - operation aborted.', [ ASerial ]));

  ProcessWorkorder( AWorkOrder_ID );
end;

end.

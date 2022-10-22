unit AssyTrack_RejectsDetails;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.Menus,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Hpick,
  assy_share,
  FireDAC.Comp.Client,
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
  FireDAC.Comp.DataSet,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu, uniGUIFrame, IQUniGrid;

type
  TFrmAssyTrackRejectsDetails = class(TUniForm)
    SrcRejects: TDataSource;
    QryRejects: TFDQuery;
    QryRejectsID: TBCDField;
    QryRejectsREJECTS: TBCDField;
    QryRejectsREJECT_CODE: TStringField;
    QryRejectsDESCRIP: TStringField;
    QryRejectsTIME_STAMP: TDateTimeField;
    IQSearch1: TIQUniGridControl;
    PopupMenu1: TUniPopupMenu;
    VoidRejectEntry1: TUniMenuItem;
    SrcArinvtForTrans: TDataSource;
    QryArinvtForTrans: TFDQuery;
    QryRejectsARINVT_ID: TBCDField;
    SR: TIQWebSecurityRegister;
    QryRejectsTA_LABOR_ID: TBCDField;
    PkFGMulti: TIQWebHPick;
    PkFGMultiFGMULTI_ID: TBCDField;
    PkFGMultiLOC_DESC: TStringField;
    PkFGMultiLOTNO: TStringField;
    PkFGMultiONHAND: TFMTBCDField;
    PkFGMultiEPLANT_ID: TBCDField;
    PkFGMultiDIVISION_ID: TBCDField;
    PkFGMultiDIVISION_NAME: TStringField;
    PkFGMultiIN_DATE: TDateTimeField;
    procedure VoidRejectEntry1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryRejectsBeforeOpen(DataSet: TDataSet);
    procedure QryArinvtForTransBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure PkFGMultiBeforeOpen(DataSet: TDataSet);
    procedure PkFGMultiIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
  private
    { Private declarations }
    FWorkorder_ID: Real;
    FPartno_ID   : Real;
    FSndop_ID    : Real;
    FArinvt_ID   : Real;
    FPopupMenuSecurityPropagated: Boolean;
    FSub_Batch: Real;
    FPtoper_ID: Real;

    procedure VoidRejectEntry;
    procedure VoidComponent(AFGMulti_ID: Real);
    function IsVoidingMfgPart: Boolean;
    procedure VoidMfgPart(AFGMulti_ID: Real);
    procedure PrepareCreateAdjustWIPTransactions( ARejectedMfgQty: Real; AKind: TProcessRejectsEditKind );
    function GetRejectedMfgQty(var ARejectedMfgQty: Real): Boolean;
    procedure SetArinvt_ID(const Value: Real);
    procedure SetPartno_ID(const Value: Real);
    procedure SetPtoper_ID(const Value: Real);
    procedure SetSndop_ID(const Value: Real);
    procedure SetWorkorder_ID(const Value: Real);
  public
    { Public declarations }
    property Workorder_ID : Real write SetWorkorder_ID;
    property Partno_ID : Real write SetPartno_ID;
    property Sndop_ID : Real write SetSndop_ID;
    property Ptoper_ID : Real write SetPtoper_ID;
    property Arinvt_ID: Real write SetArinvt_ID;
    class procedure DoShowModal(AWorkorder_ID, APartno_ID, ASndop_ID, APtoper_ID, AArinvt_ID: Real );
  end;

implementation

{$R *.dfm}

uses
  AssyTrack_Share,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  { TODO : IQSecIns not yet converted }
 // IQSecIns,
  IQMS.Common.Sequence,
  IQMS.WebVcl.Trans,
  IQMS.Common.UserMessages,
  TrNewLoc;

class procedure TFrmAssyTrackRejectsDetails.DoShowModal( AWorkorder_ID, APartno_ID, ASndop_ID, APtoper_ID, AArinvt_ID: Real);
var
  LFrmAssyTrackRejectsDetails : TFrmAssyTrackRejectsDetails;
begin
  LFrmAssyTrackRejectsDetails := TFrmAssyTrackRejectsDetails.Create( UniGUIApplication.UniApplication);
  with LFrmAssyTrackRejectsDetails do
  begin
    Workorder_ID := AWorkorder_ID;
    Partno_ID := APartno_ID;
    Sndop_ID := ASndop_ID;
    Ptoper_ID := APtoper_ID;
    Arinvt_ID :=AArinvt_ID;
    ShowModal;
  end;
end;

procedure TFrmAssyTrackRejectsDetails.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;


procedure TFrmAssyTrackRejectsDetails.QryRejectsBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  // begin
  //   ParamByName('workorder_id').Value := FWorkorder_ID;
  //   ParamByName('partno_id').Value := FPartno_ID;
  //   ParamByName('sndop_id').Value := FSndop_ID;
  //   ParamByName('arinvt_id').Value := FArinvt_ID;
  //   ParamByName('ptoper_id').Value := FPtoper_ID;
  // end;
  AssignQueryParamValue(DataSet, 'workorder_id',FWorkorder_ID );
  AssignQueryParamValue(DataSet, 'partno_id',   FPartno_ID );
  AssignQueryParamValue(DataSet, 'sndop_id',    FSndop_ID );
  AssignQueryParamValue(DataSet, 'arinvt_id',   FArinvt_ID );
  AssignQueryParamValue(DataSet, 'ptoper_id',   FPtoper_ID );
end;


procedure TFrmAssyTrackRejectsDetails.SetArinvt_ID(const Value: Real);
begin
  FArinvt_ID := Value;
end;

procedure TFrmAssyTrackRejectsDetails.SetPartno_ID(const Value: Real);
begin
  FPartno_ID := Value;
end;

procedure TFrmAssyTrackRejectsDetails.SetPtoper_ID(const Value: Real);
begin
  FPtoper_ID := Value;
end;

procedure TFrmAssyTrackRejectsDetails.SetSndop_ID(const Value: Real);
begin
  FSndop_ID := Value;
end;

procedure TFrmAssyTrackRejectsDetails.SetWorkorder_ID(const Value: Real);
begin
  FWorkorder_ID := Value;
end;

procedure TFrmAssyTrackRejectsDetails.QryArinvtForTransBeforeOpen( DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  //   ParamByName('arinvt_id').Value := QryRejectsARINVT_ID.asFLoat;
  AssignQueryParamValue(DataSet, 'arinvt_id', QryRejectsARINVT_ID.asFLoat );
end;

procedure TFrmAssyTrackRejectsDetails.FormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self ]);
  { TODO : IQSecIns not yet converted }
//  EnsureSecurityInspectorOnTopOf( self );
end;


procedure TFrmAssyTrackRejectsDetails.VoidRejectEntry1Click( Sender: TObject);
begin
  if not IQConfirmYN('Are you sure you want to void this reject entry?') then
     EXIT;

  VoidRejectEntry;
end;

procedure TFrmAssyTrackRejectsDetails.VoidRejectEntry;
var
  DB          : TFDConnection;
  AFGMulti_ID : Real;
begin
  DB:= UniMainModule.FDConnection1;
  try
    DB.StartTransaction;

    // get most recent fgmulti as of time when the reject was done from the translog
    AFGMulti_ID:= SelectValueFmtAsFloat('select fgmulti_id from translog where source_id = %f and source = ''REJECTS'' and arinvt_id = %f order by id desc', [ QryRejectsID.asFloat, QryRejectsARINVT_ID.asFloat ]);
    // validate fgmulti
    AFGMulti_ID:= SelectValueFmtAsFloat('select id from fgmulti where id = %f', [ AFGMulti_ID ]);
    // ensure fgmulti exists
    assy_share.EnsureFGMultiAssigned( QryRejectsARINVT_ID.asFloat, AFGMulti_ID, PkFGMulti );

    Reopen( QryArinvtForTrans );

    if IsVoidingMfgPart() then
       VoidMfgPart( AFGMulti_ID )     // reverse backflush
    else
       VoidComponent( AFGMulti_ID );  // just IN the component

    DB.Commit;
  finally
    if DB.InTransaction then DB.RollBack;
  end;

  AssyTrack_Share.PostMessageToRecalcStartEndDate( FWorkorder_ID );

  Reopen( QryRejects );
end;


function TFrmAssyTrackRejectsDetails.IsVoidingMfgPart: Boolean;
begin
  Result:= (FArinvt_ID = SelectValueByID('arinvt_id', 'partno', FPartno_ID)); // SelectValueFmtAsFloat('select 1 from rejects where parent_id = %f and rownum < 2', [ ARejects_ID ]) = 1;
end;

procedure TFrmAssyTrackRejectsDetails.VoidComponent( AFGMulti_ID: Real );
var
  ACargo: TReverseBackflushCargo;
begin
  // prepare
  ACargo.FGMulti_ID       := AFGMulti_ID;
  ACargo.VoidQty          := QryRejectsREJECTS.asFloat;
  ACargo.Reason           := 'Void ASSY1 Reject Component';
  ACargo.SrcArinvtForTrans:= SrcArinvtForTrans;
  ACargo.Arinvt_ID        := QryRejectsARINVT_ID.asFloat;
  ACargo.Rejects_ID       := QryRejectsID.asFloat;
  ACargo.VoidType         := vtVoidRejects;
  ACargo.TA_Labor_ID      := QryRejectsTA_LABOR_ID.asFloat;
  ACargo.Sndop_ID         := FSndop_ID;
  ACargo.Ptoper_ID        := FPtoper_ID;
  ACargo.TransAttribute   := '';

  // execute
  assy_share.ReverseBackflushComponent( ACargo );

  Reopen(QryRejects);
  IQMS.Common.Controls.PostMessageToForm( 'TFrmAssyTrackMain', iq_RefreshDataSets, 1, 0 );
end;


procedure TFrmAssyTrackRejectsDetails.VoidMfgPart( AFGMulti_ID: Real );
var
  ACargo: TReverseBackflushCargo;
  ARejectedMfgQty: Real;
  ARejectReportedThroughTheLaborScreen: Boolean;
begin
  // prepare
  FSub_Batch:= IQMS.Common.Sequence.GetNextSequenceNumber( 'S_TRANSLOG_SUB_BATCH' );
  // ACargo is only used in ReverseBackflushMfgPart
  ACargo.FGMulti_ID       := AFGMulti_ID;
  ACargo.VoidQty          := QryRejectsREJECTS.asFloat;
  ACargo.Reason           := 'Void ASSY1 Reject Mfg Parts';
  ACargo.SrcArinvtForTrans:= SrcArinvtForTrans;
  ACargo.Arinvt_ID        := QryRejectsARINVT_ID.asFloat;
  ACargo.Rejects_ID       := QryRejectsID.asFloat;
  ACargo.TA_Labor_ID      := QryRejectsTA_LABOR_ID.asFloat;
  ACargo.Sndop_ID         := FSndop_ID;
  ACargo.Sub_Batch        := FSub_Batch;
  ACargo.VoidType         := assy_share.vtVoidMfgRejects;
  ACargo.Ptoper_ID        := FPtoper_ID;
  ACargo.TransAttribute   := 'RECORD_COST_ELEMENT';

  ARejectReportedThroughTheLaborScreen:= TMfgRejectKind( Trunc(SelectValueByID( 'kind', 'rejects', QryRejectsID.asFloat ))) = mrkNotReportedWIP;
  if ARejectReportedThroughTheLaborScreen then  // if mfg part was rejected through labor entry form
     begin
        // Inv trans. This will also adjust rejects and ta_labor
        if assy_share.ReverseBackflushMfgPart( ACargo ) <> 0 then
           System.SysUtils.ABORT;

        // adjust wip
        PrepareCreateAdjustWIPTransactions( assy_share.GetQtyBasedOnTranslog( FSub_Batch, FArinvt_ID, TRUE, assy_share.vtVoidMfgRejects ), prekAllAbove );
     end

   else
     begin
        // get void reject qty
        ARejectedMfgQty:= QryRejectsREJECTS.asFloat;
        if not GetRejectedMfgQty( ARejectedMfgQty ) then
           System.SysUtils.ABORT;

        // adjust wip
        PrepareCreateAdjustWIPTransactions( ARejectedMfgQty, prekSelectedAndAllAbove );
     end;


  // if rejects were reported "Report Existing as Rejects"
  if not ARejectReportedThroughTheLaborScreen then
  begin
     assy_share.AdjustRejectedQuan( ARejectedMfgQty,
                                    FSub_Batch,
                                    QryRejectsARINVT_ID.asFloat,
                                    QryRejectsID.asFloat,
                                    QryRejectsTA_LABOR_ID.asFloat,
                                    vtVoidMfgRejects,
                                    TRUE );

     assy_share.AdjustCompletedQuan( ARejectedMfgQty,
                                     QryRejectsTA_LABOR_ID.asFloat,
                                     vtVoidMfgRejects,
                                     TRUE );
  end;

  Reopen(QryRejects);
  PostMessageToForm( 'TFrmAssyTrackMain', iq_RefreshDataSets, 1, 0 );
end;


procedure TFrmAssyTrackRejectsDetails.PrepareCreateAdjustWIPTransactions( ARejectedMfgQty: Real; AKind: TProcessRejectsEditKind );
var
  ACargo: TAdjustWIPCargo;
begin
  ACargo:= TAdjustWIPCargo.Create(0);
  ACargo.MfgQty      := ARejectedMfgQty;
  ACargo.Sndop_ID    := FSndOp_ID;
  ACargo.Standard_ID := SelectValueByID('standard_id', 'partno', FPartno_ID);
  ACargo.Partno_ID   := FPartno_ID;
  ACargo.Workorder_ID:= FWorkorder_ID;
  ACargo.RejectMode  := rmMfgParts;
  ACargo.Kind        := AKind;
  ACargo.Sub_Batch   := FSub_Batch;
  ACargo.In_Out      := IQMS.WebVcl.Trans.TRAN_IN;
  ACargo.Reason      := 'Void ASSY1 Reject Mfg Parts';
  ACargo.Ptoper_ID   := FPtoper_ID;
  ACargo.TransAttribute:= 'RECORD_COST_ELEMENT';

  assy_share.PrepareCreateAdjustWIPTransactions( ACargo );
end;


procedure TFrmAssyTrackRejectsDetails.PopupMenu1Popup(Sender: TObject);
begin
  if not FPopupMenuSecurityPropagated then
  begin
  { TODO : TIQUniGridControl has no member PropagateSecurityOfPopupMenu (which is associated with the scurity register)}
    //IQSearch1.PropagateSecurityOfPopupMenu( (Sender as TUniPopupMenu), SR );
    FPopupMenuSecurityPropagated:= TRUE;
  end;
end;

procedure TFrmAssyTrackRejectsDetails.PkFGMultiBeforeOpen(DataSet: TDataSet);
begin
  // TFDQuery(DataSet).ParamByName('arinvt_id').Value := QryRejectsARINVT_ID.asFloat;
  AssignQueryParamValue(DataSet, 'arinvt_id', QryRejectsARINVT_ID.asFLoat );
end;

procedure TFrmAssyTrackRejectsDetails.PkFGMultiIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
var
  AFGMulti_ID: Real;
begin
  Action:= mrCancel;
  if CreateTranNewLocation( QryRejectsARINVT_ID.asFloat, AFGMulti_ID, 0 ) then  // TrNewLoc.pas
  begin
    Action:= mrOK;
    ResultValue:= AFGMulti_ID;
  end;
end;

function TFrmAssyTrackRejectsDetails.GetRejectedMfgQty( var ARejectedMfgQty: Real ): Boolean;
var
  S: string;
  AMaxValue: Real;
begin
  Result:= FALSE;
  S:= FloatToStr( ARejectedMfgQty );
  AMaxValue:= ARejectedMfgQty;
  repeat
    if not InputQuery('Void Mfg Rejects', 'Enter Void Qty', S) then
       System.SysUtils.ABORT;
    try
      IQAssert( IQMS.Common.Numbers.IsStringValidFloat( S, ARejectedMfgQty ), Format('Invalid number - enter valid rejects qty not exceeding %.6f', [ AMaxValue ]));
      IQAssert( ARejectedMfgQty  <= AMaxValue, Format('Max rejects qty %.6f is exceeded', [ AMaxValue ]));
      IQAssert( ARejectedMfgQty > 0, 'Rejected qty must be greater than zero');
      BREAK;
    except on E: Exception do
      Application.ShowException( E );
    end;
  until FALSE;

  Result:= TRUE;
end;


end.

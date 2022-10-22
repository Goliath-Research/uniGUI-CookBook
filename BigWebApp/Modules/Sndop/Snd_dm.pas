unit Snd_DM;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Dialogs,
  Data.DB,
  IQMS.WebVcl.Hpick,
//  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt;

type
  TCostMembers = record
  private
  public
    Active                  : Boolean;
    LaborNeedsRecalc        : Boolean;
    OverheadNeedsRecalc     : Boolean;
    FixedOverheadNeedsRecalc: Boolean;
    constructor Create( AActive: Boolean );
    procedure Reset;
    procedure MarkNeedsRecalc( AFieldName: string; AValue: Boolean );
    function NeedsRecalc: Boolean;
  end;

  TSndDM = class(TDataModule)
    SrcSndOp: TDataSource;
    SrcOpMat: TDataSource;
    SrcLabor_Rates: TDataSource;
    SrcSndOp_Qty_Breaks: TDataSource;
    TblOpMat: TFDTable;
    TblLabor_Rates: TFDTable;
    TblSndOp_Qty_Breaks: TFDTable;
    TblOpMatSNDOP_ID: TBCDField;
    TblOpMatARINVT_ID: TBCDField;
    TblOpMatPTSPER: TFMTBCDField;
    TblOpMatWEIGHT: TFMTBCDField;
    TblOpMatLBL_FORMAT: TBCDField;
    TblLabor_RatesID: TBCDField;
    TblLabor_RatesLABOR_RATE: TFMTBCDField;
    TblSndOp_Qty_BreaksSNDOP_ID: TBCDField;
    TblSndOp_Qty_BreaksQUAN: TBCDField;
    TblSndOp_Qty_BreaksQPRICE: TFMTBCDField;
    TblSndOp_Qty_BreaksPRICE_DATE: TDateTimeField;
    TblSndOp_Qty_BreaksEFFECT_DATE: TDateTimeField;
    SrcArinvt: TDataSource;
    TblArinvt: TFDTable;
    TblOpMatClass: TStringField;
    TblOpMatDescrip: TStringField;
    TblOpMatRev: TStringField;
    SrcArinvt_Breaks: TDataSource;
    TblArinvt_Breaks: TFDTable;
    TblArinvt_BreaksARINVT_ID: TBCDField;
    TblArinvt_BreaksQUAN: TBCDField;
    TblArinvt_BreaksQPRICE: TFMTBCDField;
    TblArinvt_BreaksPRICE_DATE: TDateTimeField;
    TblArinvt_BreaksEFFECT_DATE: TDateTimeField;
    TblOpMatItemNo: TStringField;
    SrcVendor: TDataSource;
    TblVendor: TFDTable;
    TblArinvtID: TBCDField;
    TblArinvtCLASS: TStringField;
    TblArinvtITEMNO: TStringField;
    TblArinvtREV: TStringField;
    TblArinvtDESCRIP: TStringField;
    TblArinvtVENDOR_ID: TBCDField;
    TblArinvtUNIT: TStringField;
    SrcBlendArinvt_Breaks: TDataSource;
    TblBlendArinvt_Breaks: TFDTable;
    TblBlendArinvt_BreaksARINVT_ID: TBCDField;
    TblBlendArinvt_BreaksQUAN: TBCDField;
    TblBlendArinvt_BreaksQPRICE: TFMTBCDField;
    TblBlendArinvt_BreaksPRICE_DATE: TDateTimeField;
    TblBlendArinvt_BreaksEFFECT_DATE: TDateTimeField;
    wwQryElements: TFDQuery;
    wwQryElementsID: TBCDField;
    wwQryElementsELEM_DESCRIP: TStringField;
    wwQryElementsELEM_TYPE: TStringField;
    TblOpMatID: TBCDField;
    TblArinvtEPLANT_ID: TBCDField;
    TblBlendArinvt_BreaksBUYING: TStringField;
    TblArinvt_BreaksBUYING: TStringField;
    TblBlendArinvt_BreaksID: TBCDField;
    TblOpMatLET_DOWN_RATIO: TBCDField;
    TblSndOp_Qty_BreaksDEACTIVE_DATE: TDateTimeField;
    TblArinvt_BreaksDEACTIVE_DATE: TDateTimeField;
    TblBlendArinvt_BreaksDEACTIVE_DATE: TDateTimeField;
    TblOpMatPTSPER_DISP: TFMTBCDField;
    SrcSndop_PmEqmt: TDataSource;
    TblSndop_PmEqmt: TFDTable;
    TblSndop_PmEqmtID: TBCDField;
    TblSndop_PmEqmtSNDOP_ID: TBCDField;
    TblSndop_PmEqmtPMEQMT_ID: TBCDField;
    TblSndop_PmEqmtIS_PRIMARY: TStringField;
    TblSndop_PmEqmtEqno: TStringField;
    TblSndop_PmEqmtLocation: TStringField;
    wwQryWork_Center: TFDQuery;
    wwQryWork_CenterCNTR_TYPE: TStringField;
    wwQryWork_CenterMFG_TYPE: TStringField;
    wwQryWork_CenterEPLANT_ID: TBCDField;
    wwQryWork_CenterMFGCELL_ID: TBCDField;
    QryHr_Job_Descrip: TFDQuery;
    QryHr_Job_DescripDESCRIP: TStringField;
    QryHr_Job_DescripID: TBCDField;
    SrcSndop_WC: TDataSource;
    TblSndop_WorkCenter: TFDTable;
    TblSndop_WorkCenterID: TBCDField;
    TblSndop_WorkCenterSNDOP_ID: TBCDField;
    TblSndop_WorkCenterWORKCENTER_ID: TBCDField;
    TblSndop_WorkCenterSEQ: TBCDField;
    TblSndop_WorkCenterEqNo: TStringField;
    TblSndop_WorkCenterCntr_desc: TStringField;
    TblSndop_WorkCenterCntr_Type: TStringField;
    SrcSndop_Insp: TDataSource;
    TblSndop_Insp: TFDTable;
    TblSndop_InspID: TBCDField;
    TblSndop_InspSNDOP_ID: TBCDField;
    TblSndop_InspSPC_INSPECTION_ID: TBCDField;
    TblSndop_InspSEQ: TBCDField;
    TblSndop_InspName: TStringField;
    TblSndop_InspDescrip: TStringField;
    TblSndop_InspPRE_INSPECT: TStringField;
    TblSndop_InspPOST_INSPECT: TStringField;
    wwQryWork_CenterMFGCELL: TStringField;
    SrcSndopJobs: TDataSource;
    TblSndopJobs: TFDTable;
    TblSndopJobsID: TBCDField;
    TblSndopJobsSNDOP_ID: TBCDField;
    TblSndopJobsHR_JOB_DESCRIP_ID: TBCDField;
    TblSndopJobsCERT_LEVEL: TBCDField;
    TblSndopJobsSUPERVISOR_RIGHTS: TStringField;
    TblSndopJobsJobDescrip: TStringField;
    TblArinvt_BreaksCURRENCY_ID: TBCDField;
    TblBlendArinvt_BreaksCURRENCY_ID: TBCDField;
    TblOpMatALLOC_REQ: TStringField;
    TblOpMatFAB_ALLOC_MULTI: TStringField;
    SrcSndop_RejectCode: TDataSource;
    TblSndop_RejectCode: TFDTable;
    TblSndop_RejectCodeID: TBCDField;
    TblSndop_RejectCodeSNDOP_ID: TBCDField;
    TblSndop_RejectCodeREJECT_CODE_ID: TBCDField;
    TblSndop_RejectCodeReject_Code_Disp: TStringField;
    TblSndop_RejectCodeReject_Desc_Disp: TStringField;
    SrcSndop_Aux: TDataSource;
    TblSndop_Aux: TFDTable;
    TblSndop_AuxID: TBCDField;
    TblSndop_AuxSNDOP_ID: TBCDField;
    TblSndop_AuxAUX_ID: TBCDField;
    TblSndop_AuxDescrip: TStringField;
    SrcSndop_PR_Emp: TDataSource;
    TblSndop_PR_Emp: TFDTable;
    TblSndop_PR_EmpID: TBCDField;
    TblSndop_PR_EmpSNDOP_ID: TBCDField;
    TblSndop_PR_EmpPR_EMP_ID: TBCDField;
    TblSndop_PR_EmpIS_ACTIVE: TStringField;
    TblSndop_PR_EmpEmpNo: TStringField;
    TblSndop_PR_EmpFirstName: TStringField;
    TblSndop_PR_EmpLastName: TStringField;
    SrcSndopEmpDocs: TDataSource;
    QrySndopEmpDocs: TFDQuery;
    QrySndopEmpDocsDOC_DESCRIP: TStringField;
    QrySndopEmpDocsCURRENT_DOC_REVISION_ID: TBCDField;
    QrySndopEmpDocsCURRENT_REVISION: TStringField;
    QrySndopEmpDocsASSIGNED_DOC_REVISION_ID: TBCDField;
    QrySndopEmpDocsASSIGNED_REVISION: TStringField;
    QrySndopEmpDocsStatus: TStringField;
    QrySndopEmpDocsID: TBCDField;
    QrySndopEmpDocsCERTIFIED_DATE: TDateTimeField;
    TblOpMatUOM: TStringField;
    TblArinvtDESCRIP2: TStringField;
    TblOpMatDescrip2: TStringField;
    TblOpMatSpg: TFloatField;
    TblOpMatUNIT: TStringField;
    QrySndopEmpDocsCERT_TRAINING_ID: TBCDField;
    QrySndopEmpDocsCERT_TRAINING_DESCRIP: TStringField;
    TblArinvt_BreaksID: TBCDField;
    TblOpMatNonMaterial: TStringField;
    TblOpMatSTARTUP_QTY: TFMTBCDField;
    TblOpMatINCLUDE_STARTUP_QTY_STD_COST: TStringField;
    TblOpMatCUSER1: TStringField;
    TblOpMatCUSER2: TStringField;
    TblOpMatCUSER3: TStringField;
    TblOpMatNUSER1: TFMTBCDField;
    TblOpMatNUSER2: TFMTBCDField;
    TblOpMatNUSER3: TFMTBCDField;
    TblOpMatSEQ: TBCDField;
    TblOpMatMTRL_INFO: TMemoField;
    TblSndop: TFDQuery;
    TblSndopOP_CLASS: TStringField;
    TblSndopOPNO: TStringField;
    TblSndopOPDESC: TStringField;
    TblSndopCUSER1: TStringField;
    TblSndopCUSER2: TStringField;
    TblSndopCUSER3: TStringField;
    TblSndopCUSER4: TStringField;
    TblSndopCUSER5: TStringField;
    TblSndopCUSER6: TStringField;
    TblSndopCUSER7: TStringField;
    TblSndopCUSER8: TStringField;
    TblSndopCUSER9: TStringField;
    TblSndopCUSER10: TStringField;
    TblSndopNUSER1: TFMTBCDField;
    TblSndopNUSER2: TFMTBCDField;
    TblSndopNUSER3: TFMTBCDField;
    TblSndopNUSER4: TFMTBCDField;
    TblSndopNUSER5: TFMTBCDField;
    TblSndopNUSER6: TFMTBCDField;
    TblSndopNUSER7: TFMTBCDField;
    TblSndopNUSER8: TFMTBCDField;
    TblSndopNUSER9: TFMTBCDField;
    TblSndopNUSER10: TFMTBCDField;
    TblSndopIS_SUPERMARKET: TStringField;
    TblSndopCNTR_TYPE: TStringField;
    TblSndopMULTIPLES: TBCDField;
    TblSndopSCRAP: TBCDField;
    TblSndopEPlantID: TBCDField;
    TblSndopUOM: TStringField;
    TblSndopCYCLETM_DISP: TBCDField;
    TblSndopSCRAP_DISP: TBCDField;
    TblSndopID: TBCDField;
    TblSndopVENDOR_ID: TBCDField;
    TblSndopVEN_LEAD: TBCDField;
    TblSndopCYCLETM: TBCDField;
    TblSndopOPERATOR: TBCDField;
    TblSndopSETUPHRS: TBCDField;
    TblSndopPRICEDATE: TDateTimeField;
    TblSndopLABOR_RATES_ID: TBCDField;
    TblSndopLabor_Rate: TFMTBCDField;
    TblSndopCNTR_RATE: TBCDField;
    TblSndopSETUP_RATE: TBCDField;
    TblSndopVendorName: TStringField;
    TblSndopARINVT_ID: TBCDField;
    TblSndopItemNo: TStringField;
    TblSndopDescrip: TStringField;
    TblSndopRev: TStringField;
    TblSndopUnit: TStringField;
    TblSndopATPRESS: TStringField;
    TblSndopCalc_Cost: TFMTBCDField;
    TblSndopELEMENTS_ID: TBCDField;
    TblSndopUSE_LET_DOWN_RATIO: TStringField;
    TblSndopEPLANT_ID: TBCDField;
    TblSndopELEMENTS_ID_LBR: TBCDField;
    TblSndopELEMENTS_ID_OH: TBCDField;
    TblSndopSTD_COST_LBR: TFMTBCDField;
    TblSndopSTD_COST_OH: TFMTBCDField;
    TblSndopSETUPHRS2: TBCDField;
    TblSndopFAB_ALLOW_ALL_WC: TStringField;
    TblSndopCLEAR_LINE_REQUIRED: TStringField;
    TblSndopASSY1_SEQ_PROCESSING: TStringField;
    TblSndopNOTE1: TStringField;
    TblSndopEMP_CERTIFICATION_NOT_REQUIRED: TStringField;
    TblSndopPK_HIDE: TStringField;
    TblSndopASSY1_REWORK: TStringField;
    TblSndopASSY1_OH_RATE: TFMTBCDField;
    TblSndopSndOp_ID: TBCDField;
    TblSndopBATCH_TYPE: TStringField;
    TblSndopExtDescrip: TStringField;
    TblSndopMOVE_TIME: TFMTBCDField;
    TblSndopMOVE_SIZE: TFMTBCDField;
    TblSndopEXCLUDE_SCHED: TStringField;
    TblSndopSetupLaborCost: TFMTBCDField;
    TblSndopFIXED_ELEMENTS_ID_OH: TBCDField;
    TblSndopFIXED_ASSY1_OH_RATE: TFMTBCDField;
    TblSndopFIXED_STD_COST_OH: TFMTBCDField;
    TblSndopSPG: TFMTBCDField;
    TblSndopEXCL_TASK_CLOCK_REP: TStringField;
    TblSndopUSE_MULTIPLIER: TStringField;
    TblSndopUseMultiplesDisp: TStringField;
    procedure AssignIDBeforePost(DataSet: TDataSet);
    procedure PostParentsBeforeEdit(DataSet: TDataSet);
    procedure ConfirmCancel(DataSet: TDataSet);
    procedure TblArinvt_BreaksNewRecord(DataSet: TDataSet);
    procedure TblSndOp2OPNOValidate(Sender: TField);
    procedure HandleError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure PkArinvtIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure PkSndOpIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure TblSndOpCalcFields(DataSet: TDataSet);
    procedure TblSndOpFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure TblOpMatAfterPost(DataSet: TDataSet);
    procedure TblSndop_PmEqmtAfterPost(DataSet: TDataSet);
    procedure TblSndop_PmEqmtBeforePost(DataSet: TDataSet);
    procedure TblSndop_PmEqmtNewRecord(DataSet: TDataSet);
    procedure TblSndop_WorkCenterNewRecord(DataSet: TDataSet);
    procedure AssignEPlantFilter(DataSet: TDataSet);
    procedure TblSndop_InspNewRecord(DataSet: TDataSet);
    procedure PkInspectionIQModify(Sender: TObject;
      var Action: TModalResult; var ResultValue: Variant);
    procedure FilterNativeCurrency(DataSet: TDataSet; var Accept: Boolean);
    procedure DataModuleCreate(Sender: TObject);
    procedure TblSndop_RejectCodeBeforePost(DataSet: TDataSet);
    procedure TblSndop_RejectCodeCalcFields(DataSet: TDataSet);
    procedure TblSndop_AuxCalcFields(DataSet: TDataSet);
    procedure QrySndopEmpDocsCalcFields(DataSet: TDataSet);
    procedure QrySndopEmpDocsUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure QrySndopEmpDocsBeforeInsert(DataSet: TDataSet);
    procedure QrySndopEmpDocsBeforeDelete(DataSet: TDataSet);
    procedure CommitUpdate(DataSet: TDataSet);
    procedure AssignIDBeforePostOpmat(DataSet: TDataSet);
    procedure TblSndOpAfterPost(DataSet: TDataSet);
    procedure TblSndOpBeforeEdit(DataSet: TDataSet);
    procedure TblOpMatCalcFields(DataSet: TDataSet);
    procedure CheckConditionsBeforeEditOpmat(DataSet: TDataSet);
    procedure TblArinvt_BreaksBeforePost(DataSet: TDataSet);
    procedure TblOpMatNewRecord(DataSet: TDataSet);
    procedure MarkCostMemberNeedsRecalc(Sender: TField);
    procedure TblSndOpAfterScroll(DataSet: TDataSet);
    procedure TblSndOpBeforeScroll(DataSet: TDataSet);
    procedure TblSndop_PR_EmpFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure PkCertEmpBeforeOpen(DataSet: TDataSet);
    procedure TblOpMatMTRL_INFOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure TblOpMatMTRL_INFOSetText(Sender: TField; const Text: string);
    procedure TblSndopBeforeOpen(DataSet: TDataSet);
    procedure TblSndop_PR_EmpCalcFields(DataSet: TDataSet);
    procedure TblSndop_PmEqmtCalcFields(DataSet: TDataSet);
    procedure TblSndop_WorkCenterCalcFields(DataSet: TDataSet);
    procedure TblSndop_InspCalcFields(DataSet: TDataSet);
    procedure TblSndopJobsCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FNativeCurrencyID: Real;

    FEditing: Boolean;
    FOldCycletm_Disp: Real;
    FOldUom         : string;
    FOldMultiples   : Real;
    FOldScrap_Disp  : Real;
    FOldMoveSize    : Real;
    FOldMoveTime    : Real;
    function HideInactiveCertifiedEmployees: Boolean;
  public
    { Public declarations }
    Breakout_Setup_Cost: Boolean;
    FRangeSet:Boolean;
    CostMembers: TCostMembers;

    function GetSndop_ID: Real;
    class procedure RollSndopInfoToPtOper( ASndop_ID,
                                           ACycletm_Disp,
                                           AMultiples,
                                           AScrap_Disp,
                                           AMoveSize,
                                           AMoveTime: Real;
                                           AUom: string );
    procedure CheckRecalcCost;

    procedure StartNestedTransaction;
    procedure CloseNestedTransaction;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  IQMS.Common.JumpConstants,
  IQMS.Common.QC_PkBase,
  Qk_Inv,
  Qk_Pkg,
  Qk_Plast,
  { TODO -ombaral -cWebIQ : Check dependecies Snd_As
  snd_as,
  }
  snd_as_confirm_ptoper_update,
  Snd_Base,
  snd_conf_cost_recalc,
  snd_pr,
  sndop_rscstr,
  spc_qk_newinsp,
  System.Variants,
  bom_pts_per_check;

const
    constPICK_REPLACE_ARINVT = 10;


{ TCostMembersNeedRecalc }

constructor TCostMembers.Create(AActive: Boolean);
begin
  Active:= AActive;
  Reset;
end;

procedure TCostMembers.MarkNeedsRecalc(AFieldName: string; AValue: Boolean);
begin
  if (AFieldName = 'ELEMENTS_ID_LBR') or (AFieldName = 'OPERATOR') then
     LaborNeedsRecalc:= AValue
  else if (AFieldName = 'ELEMENTS_ID_OH') or (AFieldName = 'ASSY1_OH_RATE') then
     OverheadNeedsRecalc:= AValue
  else if (AFieldName = 'FIXED_ELEMENTS_ID_OH') or (AFieldName = 'FIXED_ASSY1_OH_RATE') then
     FixedOverheadNeedsRecalc:= AValue
end;

function TCostMembers.NeedsRecalc: Boolean;
begin
  Result:= LaborNeedsRecalc or OverheadNeedsRecalc or FixedOverheadNeedsRecalc;
end;

procedure TCostMembers.Reset;
begin
  if not Active then
     EXIT;
  LaborNeedsRecalc        := False;
  OverheadNeedsRecalc     := False;
  FixedOverheadNeedsRecalc:= False;
end;

{ TSndDM }

procedure TSndDM.PostParentsBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
end;

procedure TSndDM.ConfirmCancel(DataSet: TDataSet);
var
  S:string;
begin
  if DataSet is TFDTable then
    S:= Format('Table %s - Are you sure you want to Cancel Changes?', [TFDTable(DataSet).TableName])
  else
    S:= Format('%s - Are you sure you want to Cancel Changes?', [DataSet.Name]);

  if MessageDlg(S, mtConfirmation, [mbYes, mbNo],0) = mrNo then
     ABORT
end;


procedure TSndDM.TblArinvt_BreaksNewRecord(DataSet: TDataSet);
begin
  TblArinvtCLASS.Value:= 'PL';
  TblArinvt_BreaksBUYING.asString:= 'Y';
  if DataSet.FindField('BUYING') <> nil then
     DataSet.FieldByName('BUYING').asString:= 'Y';
end;

procedure TSndDM.TblSndOp2OPNOValidate(Sender: TField);
begin
   if Empty( Sender.Value ) then raise Exception.Create('Oper# must be entered');
end;

procedure TSndDM.HandleError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  Action:= daAbort;
  //IQHandleDBEngineError( DataSet, E );
end;

procedure TSndDM.AssignIDBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TSndDM.PkArinvtIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  (*
  if TblSndOp.FieldByName('OP_CLASS').asString = 'BL'
    then Action:= DoQuickAppend( TQuickAddPlastic, ResultValue )
  else if TblSndOp.FieldByName('OP_CLASS').asString = 'PK'
    then Action:= DoQuickAppend( TQuickAddPackaging, ResultValue )
  else  Action:= DoQuickAppend( TQuickAddRawArinvt, ResultValue );
  *)
  end;

procedure TSndDM.PkSndOpIQModify(Sender: TObject; var Action: TModalResult;
  var ResultValue: Variant);
begin
  Action:= mrOK;
  ResultValue:= 0;
  PostMessage( TSndBase(Owner).Handle, wm_Command, TSndBase(Owner).New1.Command, 0 );   { Call "New" }
end;

procedure TSndDM.TblSndOpCalcFields(DataSet: TDataSet);
var
  A: Variant;
begin
  TblSndOpCalc_Cost.asFloat:= TblSndOpCNTR_RATE.asFloat * TblSndOpCYCLETM.asFloat;
  TblSndOpSndOp_ID.asFloat:= TblSndOpID.asFloat;

  if Breakout_Setup_Cost and (TblSndOpSETUPHRS.asFloat > 0) then
     TblSndOpSetupLaborCost.asFloat:= SelectValueFmtAsFloat('select appdef_bom_assy1.get_setup_labor_cost( %f, %.6f ) from dual', [ TblSndOpID.asFloat, TblSndOpSETUPHRS.asFLoat ]);

  // replace arinvt lookup fields with calc 01-050-2010
  if TblSndOpARINVT_ID.asFloat > 0 then
  begin
    A:= SelectValueArrayFmt( 'select itemno, descrip, rev, unit, descrip2, eplant_id, spg from arinvt where id = %f', [ TblSndOpARINVT_ID.asFloat ]);
    if VarArrayDimCount( A ) > 0 then
    begin
      TblSndOpItemNo.asString    := A[ 0 ];
      TblSndOpDescrip.asString   := A[ 1 ];
      TblSndOpRev.asString       := A[ 2 ];
      TblSndOpUnit.asString      := A[ 3 ];
      TblSndOpExtDescrip.asString:= A[ 4 ];
      if A[ 5 ] > 0 then
         TblSndOpEPlantID.asFloat:= A[ 5 ];

      TblSndOpSPG.asFloat:= A[ 6 ];
    end;
  end;

  if TblSndOpUSE_MULTIPLIER.asString = 'Y' then
     TblSndOpUseMultiplesDisp.asString:= 'Multiplier'
  else
     TblSndOpUseMultiplesDisp.asString:= 'Multiples Of';
end;

procedure TSndDM.TblSndOpFilterRecord(DataSet: TDataSet; var Accept: Boolean);
var
  AEplantId:Real;
begin
  with TblSndOp do
  begin
    if (TblSndOpARINVT_ID.asFloat <> 0) and (SecurityManager.EPlant_ID <> 'NULL') then
      begin
        AEplantId := SelectValueFmtAsFloat('select eplant_id from arinvt where id = %f', [TblSndOpARINVT_ID.asFloat]);
        Accept := AEplantId = StrToFloat(SecurityManager.EPlant_ID)
      end
    else
      begin
        if SecurityManager.EPlant_ID = 'NULL' then
           Accept:= True
        else
           Accept:= (TblSndOpEPLANT_ID.asFloat > 0) and (TblSndOpEPLANT_ID.asFloat = StrToFloat(SecurityManager.EPlant_ID))
      end;

    // 11-10-2009 if user checks Propagate Sort on the picklist I was loosing the SetRange established in the constructor.
    if FRangeSet then
      Accept:= Accept and (TSndBase(self.Owner).OpClass = TblSndOpOP_CLASS.asString);

//    Accept:= Accept and (TSndBase(self.Owner).OpClass = TblSndOpOP_CLASS.asString);
  end;
end;

procedure TSndDM.TblOpMatAfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

procedure TSndDM.TblSndop_PmEqmtAfterPost(DataSet: TDataSet);
var
  AID: Real;
begin
  if TblSndop_PmeqmtIS_PRIMARY.asString = 'Y' then
     ExecuteCommandFmt('update sndop_pmeqmt set is_primary = NULL where sndop_id = %f and id <> %f and is_primary = ''Y''',
               [ GetSndop_ID, TblSndop_PmeqmtID.asFloat ]);

  if SelectValueFmtAsFloat('select 1 from sndop_pmeqmt where sndop_id = %f and is_primary = ''Y''', [ GetSndop_ID ]) = 0 then
     ExecuteCommandFmt('update sndop_pmeqmt set is_primary = ''Y'' where id = %f',
               [ TblSndop_PmeqmtID.asFloat ]);

  TblSndop_Pmeqmt.Refresh;
end;

procedure TSndDM.TblSndop_PmEqmtBeforePost(DataSet: TDataSet);
begin
  AssignIDBeforePost(DataSet);

  {prevent from unchecking is_primary}
  if (TblSndop_PmeqmtIS_PRIMARY.asString <> 'Y') and (SelectValueByID('is_primary', 'sndop_pmeqmt', TblSndop_PmeqmtID.asFloat ) = 'Y') then
     TblSndop_PmeqmtIS_PRIMARY.asString:= 'Y';
end;

procedure TSndDM.TblSndop_PmEqmtCalcFields(DataSet: TDataSet);
var
  A: Variant;
begin
  if TblSndop_PmEqmtPMEQMT_ID.asFloat > 0 then
  begin
    A:= SelectValueArrayFmt('select eqno, location from pmeqmt where id = %f',
                            [TblSndop_PmEqmtPMEQMT_ID.asFloat]);
    if VarArrayDimCount( A ) > 0 then
    begin
      TblSndop_PmEqmtEqno.asString := A[0];
      TblSndop_PmEqmtLocation.asString := A[1];
    end;
  end;
end;

procedure TSndDM.TblSndop_PmEqmtNewRecord(DataSet: TDataSet);
begin
  if SelectValueFmtAsFloat('select 1 from sndop_pmeqmt where sndop_id = %f and is_primary = ''Y''', [ GetSndop_ID ]) = 0 then
     TblSndop_PmeqmtIS_PRIMARY.asString:= 'Y';
end;

procedure TSndDM.TblSndop_WorkCenterCalcFields(DataSet: TDataSet);
var
  A: Variant;
begin
  if TblSndop_WorkCenterWORKCENTER_ID.asFloat > 0 then
  begin
    A:= SelectValueArrayFmt('select eqno, cntr_desc, cntr_type from work_center where id = %f',
                            [ TblSndop_WorkCenterWORKCENTER_ID.asFloat ]);
    if VarArrayDimCount( A ) > 0 then
    begin
      TblSndop_WorkCenterEqNo.asString:= A[0];
      TblSndop_WorkCenterCntr_desc.asString:= A[1];
      TblSndop_WorkCenterCntr_Type.asString:= A[2];
    end;
  end;
end;

procedure TSndDM.TblSndop_WorkCenterNewRecord(DataSet: TDataSet);
begin
  TblSndop_WorkCenterID.asFloat:= 0;
  TblSndop_WorkCenterSNDOP_ID.asFloat:= GetSndop_ID;
  TblSndop_WorkCenterSEQ.asFloat:= SelectValueFmtAsFloat('select count(*) from sndop_workcenter where sndop_id = %f', [ GetSndop_ID ]) + 1;
end;

procedure TSndDM.AssignEPlantFilter(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );
end;

procedure TSndDM.TblSndop_InspCalcFields(DataSet: TDataSet);
var
  A: Variant;
begin
  if TblSndop_InspSPC_INSPECTION_ID.asFloat > 0 then
  begin
    A:= SelectValueArrayFmt( 'select name, description from spc_inspection where id = %f',
                                 [ TblSndop_InspSPC_INSPECTION_ID.asFloat ]);
    if VarArrayDimCount( A ) > 0 then
    begin
      TblSndop_InspName.asString := A[0];
      TblSndop_InspDescrip.asString := A[1];
    end;
  end;
end;

procedure TSndDM.TblSndop_InspNewRecord(DataSet: TDataSet);
begin
  TblSndop_InspSNDOP_ID.asFloat:= GetSndop_ID;
  TblSndop_InspSEQ.asFloat:= SelectValueFmtAsFloat('select count(*) from sndop_inspection where sndop_id = %f', [ GetSndop_ID ]) + 1;
end;

procedure TSndDM.PkInspectionIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
var
  ASPC_Inspection_ID: Real;
begin
  ResultValue:= 0;
  Action:= mrCancel;
  (*
  if DoSPCNewQuickInspection( self, ASPC_Inspection_ID ) then   {spc_qk_newinsp.pas;}
  begin
    ResultValue:= ASPC_Inspection_ID;
    Action     := mrOK;
  end;
  *)
end;

procedure TSndDM.FilterNativeCurrency(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:= TRUE;

  with DataSet as TFDTable do if FindField('currency_id') <> nil then
  begin
     Accept:= (FieldByName('currency_id').asFloat = 0)
              or
              (FNativeCurrencyID = 0)
              or
              (FieldByName('currency_id').asFloat = FNativeCurrencyID);
  end;
end;

procedure TSndDM.DataModuleCreate(Sender: TObject);
begin
  FNativeCurrencyID:= GetNativeCurrencyID;  {pas}
  Breakout_Setup_Cost:= SelectValueAsString('select nvl(breakout_setup_cost, ''N'') from iqsys') = 'Y';
  CostMembers:= TCostMembers.Create( TRUE );
end;

function TSndDM.GetSndop_ID: Real;
begin
  if Assigned( SrcSndOp.DataSet ) then
     Result:= SrcSndOp.DataSet.FieldByName('ID').asFloat
  else
     Result:= -1;
end;

procedure TSndDM.TblSndop_RejectCodeBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet)
end;

procedure TSndDM.TblSndop_RejectCodeCalcFields(DataSet: TDataSet);
var
  A: Variant;
begin
  if TblSndop_RejectCodeREJECT_CODE_ID.asFloat = 0 then
     EXIT;

  A:= SelectValueArrayFmt('select reject_code, attribute from reject_code where id = %f', [ TblSndop_RejectCodeREJECT_CODE_ID.asFloat ]);
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  TblSndop_RejectCodeReject_Code_Disp.asString:= A[ 0 ];
  TblSndop_RejectCodeReject_Desc_Disp.asString:= A[ 1 ];
end;

procedure TSndDM.TblSndop_AuxCalcFields(DataSet: TDataSet);
var
  A: Variant;
begin
  if TblSndop_AuxAUX_ID.asFloat = 0 then
     EXIT;

  A:= SelectValueArrayFmt( 'select aux_desc from aux where id = %f', [ TblSndop_AuxAUX_ID.asFloat ]);
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  TblSndop_AuxDescrip.asString:= A[0];
end;

procedure TSndDM.QrySndopEmpDocsCalcFields(DataSet: TDataSet);
begin
  if QrySndopEmpDocsASSIGNED_DOC_REVISION_ID.asFloat = 0 then
     QrySndopEmpDocsStatus.asString:= 'Not Certified'

  else if QrySndopEmpDocsASSIGNED_DOC_REVISION_ID.asFloat <> QrySndopEmpDocsCURRENT_DOC_REVISION_ID.asFloat  then
     QrySndopEmpDocsStatus.asString:= 'Certification Revision Mismatch'

  else if (QrySndopEmpDocsASSIGNED_DOC_REVISION_ID.asFloat = QrySndopEmpDocsCURRENT_DOC_REVISION_ID.asFloat) and  (QrySndopEmpDocsASSIGNED_DOC_REVISION_ID.asFloat > 0) then
     QrySndopEmpDocsStatus.asString:= 'Certified'
end;

procedure TSndDM.QrySndopEmpDocsUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  if ARequest = arDelete then
  begin
    ExecuteCommandFmt('delete sndop_pr_emp_doc where id = %f', [ DtoF(ASender.FieldByName('id').OldValue) ]);
  end;
  AAction := eaApplied;
end;

procedure TSndDM.QrySndopEmpDocsBeforeInsert(DataSet: TDataSet);
begin
  ABORT;
end;

procedure TSndDM.QrySndopEmpDocsBeforeDelete(DataSet: TDataSet);
begin
  IQAssert( QrySndopEmpDocsID.asFloat > 0, 'Certificaton is not assigned for this document');
end;

procedure TSndDM.CheckConditionsBeforeEditOpmat(DataSet: TDataSet);
begin
  PostParentsBeforeEdit(DataSet);
  IQAssert( TblSndOpEXCL_TASK_CLOCK_REP.asString <> 'Y', 'Process ''Exclude from Task Clock Reporting'' is checked - unable to continue');
end;

procedure TSndDM.CommitUpdate(DataSet: TDataSet);
begin
  //  IQApplyUpdateToTable(DataSet);
  Reopen(DataSet);
end;

procedure TSndDM.AssignIDBeforePostOpmat(DataSet: TDataSet);
begin
  if ( TblOpMatNonMaterial.asString = 'Y' ) and
     ( TblOpMatPTSPER_DISP.asFloat <> 0 )   then
  begin
    IQError(sndop_rscstr.cTXT0000056 ); //'Parts per are not allowed for non-material items.';
    TblOpMatPTSPer_DISP.Clear;
    Exit;
  end;

  AssignIDBeforePost(DataSet);

  // 04-02-2013 SCR #2257  BOM -> Allow zero parts per CRM 766101
  // IQAssert(TblOpMatPTSPER_DISP.asFloat <> 0, Format('''%s'' cannot be zero', [ TblOpMatPTSPER_DISP.DisplayLabel ]));
  //bom_pts_per_check.CheckBOMPtsPerIsZero( TblSndopID.asFloat, TblOpmatARINVT_ID.asFloat, TblOpMatPTSPER_DISP.asFloat );
end;

procedure TSndDM.TblSndOpAfterPost(DataSet: TDataSet);
var
  ACount: Real;
begin
  try
    if FEditing and
       ( (FOldCycletm_Disp <> TblSndOp.FieldByName('Cycletm_Disp').asFloat)
         or
         (FOldUom <> TblSndOp.FieldByName('Uom').asString)
         or
         (FOldMultiples <> TblSndOp.FieldByName('Multiples').asFloat)
         or
         (FOldScrap_Disp <> TblSndOp.FieldByName('Scrap_Disp').asFloat)
         or
         (FOldMoveSize <> TblSndOp.FieldByName('move_size').asFloat)
         or
         (FOldMoveTime <> TblSndOp.FieldByName('move_time').asFloat)) then
    begin
       ACount:= SelectValueFmtAsFloat('select count(*) from ptoper where sndop_id = %f', [ TblSndOp.FieldByName('id').asFloat ]);
       (*
       if ACount > 0 then
          case IQDialogChkEx( TFrmSndAssy1ConfirmPtoperUpdate,     {IQDialogChkEx is defined in IQMesg, TFrmSndAssy1ConfirmPtoperUpdate is in snd_as_confirm_ptoper_update.pas}
                              Format('Propagate changes to all BOMs (%.0f) where this process is used?', [ ACount ]),
                              'FrmSndAssy1ConfirmPtoperUpdate' ) of
            0: ; {do nothing}
            1: begin
                 TSndDM.RollSndopInfoToPtOper( TblSndOp.FieldByName('id').asFloat,
                                               TblSndOp.FieldByName('Cycletm_Disp').asFloat,
                                               TblSndOp.FieldByName('Multiples').asFloat,
                                               TblSndOp.FieldByName('Scrap_Disp').asFloat,
                                               TblSndOp.FieldByName('move_size').asFloat,
                                               TblSndOp.FieldByName('move_time').asFloat,
                                               TblSndOp.FieldByName('Uom').asString );
               end;
          end;
          *)
    end;
  finally
    FEditing:= FALSE;
  end;
end;


class procedure TSndDM.RollSndopInfoToPtOper( ASndop_ID,
                                              ACycletm_Disp,
                                              AMultiples,
                                              AScrap_Disp,
                                              AMoveSize,
                                              AMoveTime: Real;
                                              AUom: string );
begin
  ExecuteCommandFmt('begin                                             '+
            '  sndop_misc.roll_sndop_info_to_ptoper( %f,       '+     // v_sndop_id
            '                                        %.6f,     '+     //  v_cycletm_disp
            '                                        %.6f,     '+     //  v_multiples
            '                                        %.6f,     '+     //  v_scrap_disp
            '                                        %.6f,     '+     //  v_move_size
            '                                        %.6f,     '+     //  v_move_time
            '                                        ''%s'' ); '+     //  v_uom
            'end;                                              ',
            [ ASndop_ID,
              ACycletm_Disp,
              AMultiples,
              AScrap_Disp,
              AMoveSize,
              AMoveTime,
              AUom  ]);
end;


procedure TSndDM.TblSndOpBeforeEdit(DataSet: TDataSet);
begin
  FEditing:= TRUE;
  FOldCycletm_Disp:= TblSndOp.FieldByName('Cycletm_Disp').asFloat;
  FOldUom         := TblSndOp.FieldByName('Uom').asString;
  FOldMultiples   := TblSndOp.FieldByName('Multiples').asFloat;
  FOldScrap_Disp  := TblSndOp.FieldByName('Scrap_Disp').asFloat;
  FOldMoveSize    := TblSndOp.FieldByName('move_size').asFloat;
  FOldMoveTime    := TblSndOp.FieldByName('move_time').asFloat;
end;

procedure TSndDM.TblOpMatCalcFields(DataSet: TDataSet);
var
  A: Variant;
begin
  if TblOpMatARINVT_ID.asFloat > 0 then
  begin
    A:= SelectValueArrayFmt( 'select class, itemno, descrip, rev, unit, descrip2, spg, nvl(non_material, ''N'') from arinvt where id = %f', [ TblOpMatARINVT_ID.asFloat ]);
    if VarArrayDimCount( A ) > 0 then
    begin
      TblOpMatClass.asString   := A[ 0 ];
      TblOpMatItemNo.asString  := A[ 1 ];
      TblOpMatDescrip.asString := A[ 2 ];
      TblOpMatRev.asString     := A[ 3 ];
      TblOpMatUOM.asString     := A[ 4 ];
      TblOpMatDescrip2.asString:= A[ 5 ];
      TblOpMatSpg.asFloat      := A[ 6 ];
      TblOpMatNonMaterial.asString := A[ 7 ];
    end;
  end;
end;

procedure TSndDM.TblOpMatMTRL_INFOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if TblOpMatMTRL_INFO.IsNull then
    Text := ''
  else
    Text := TblOpMatMTRL_INFO.AsString;
  DisplayText := true;
end;

procedure TSndDM.TblOpMatMTRL_INFOSetText(Sender: TField; const Text: string);
begin
  if Text = '' then
    TblOpMatMTRL_INFO.Clear
  else
    TblOpMatMTRL_INFO.AsString := Text;
end;

procedure TSndDM.StartNestedTransaction;
begin
  TblOpMat.CheckBrowseMode;
  TblOpMat.Connection.StartTransaction;
end;

procedure TSndDM.CloseNestedTransaction;
begin
  if TblOpMat.State = dsEdit then
    TblOpMat.Post;
  TblOpMat.Connection.Commit;
end;

procedure TSndDM.TblArinvt_BreaksBeforePost(DataSet: TDataSet);
begin
  if TblArinvt_BreaksID.asFloat = 0 then
    TblArinvt_BreaksID.asFloat := GetNextID('ARINVT_BREAKS');
end;

procedure TSndDM.TblOpMatNewRecord(DataSet: TDataSet);
begin
  PostMessage( TSndBase(Owner).Handle, iq_Notify, constPICK_REPLACE_ARINVT, 0 );
end;


procedure TSndDM.MarkCostMemberNeedsRecalc(Sender: TField);
begin
  CostMembers.MarkNeedsRecalc( Sender.FieldName, TRUE );
end;

procedure TSndDM.TblSndOpAfterScroll(DataSet: TDataSet);
begin
  CostMembers.Reset;
end;

procedure TSndDM.TblSndOpBeforeScroll(DataSet: TDataSet);
begin
  CheckRecalcCost;
end;

procedure TSndDM.CheckRecalcCost;
begin
  if not CostMembers.Active then
     EXIT;

  if not CostMembers.NeedsRecalc then
     EXIT;
  (*
  case IQDialogChkEx( TFrmSndOpConfirmCostRecalc,      {IQDialogChkEx is defined in IQMesg, TFrmSndOpConfirmCostRecalc is in snd_conf_cost_recalc.pas}
                      sndop_rscstr.cTXT0000055,        {'Calculate the standard labor and overhead costs for this process?'}
                      'FrmSndOpConfirmCostRecalc' ) of
    0: EXIT;
    1: ;{continue to recalc}
  *)
  //end;

  if (Owner is TSnd_Process) and CostMembers.LaborNeedsRecalc then
     TSnd_Process(Owner).CalcLaborCost;

  if (Owner is TSnd_Process) and CostMembers.OverheadNeedsRecalc then
     TSnd_Process(Owner).CalcStandardOverheadCost;

  //if (Owner is TSnd_Assembly) and CostMembers.FixedOverheadNeedsRecalc then
  //   TSnd_Assembly(Owner).CalcFixedOverheadCost;

  TblSndOp.CheckBrowseMode;
end;


function TSndDM.HideInactiveCertifiedEmployees: Boolean;
begin
  Result:= FALSE;

  //if not (Owner is TSnd_Assembly) then
  //   EXIT;

  //Result:= TSnd_Assembly(Owner).sbtnHideInactiveEmployees.Down;
end;

procedure TSndDM.TblSndop_PR_EmpCalcFields(DataSet: TDataSet);
var
  A: Variant;
begin
  if TblSndop_PR_EmpPR_EMP_ID.asFloat > 0 then
  begin
    A:= SelectValueArrayFmt( 'select empno, first_name, last_name from pr_emp where id = %f',
                                 [ TblSndop_PR_EmpPR_EMP_ID.asFloat ]);
    if VarArrayDimCount( A ) > 0 then
    begin
      TblSndop_PR_EmpEmpNo.asString := A[0];
      TblSndop_PR_EmpFirstName.asString := A[1];
      TblSndop_PR_EmpLastName.asString := A[2];
    end;
  end;
end;

procedure TSndDM.TblSndop_PR_EmpFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:= True;
  if HideInactiveCertifiedEmployees() then
     Accept:= SelectValueByID('pk_hide', 'pr_emp', DataSet.FieldByName('PR_EMP_ID').asFloat) <> 'Y';
end;

procedure TSndDM.PkCertEmpBeforeOpen(DataSet: TDataSet);
begin
  // with TFDQuery(DataSet) do
  // begin
  //   ParamByName('sndop_id').Value := TblSndOpID.asFloat;
  //   ParamByName('hide_inactive').asString:= IQMS.Common.StringUtils.BoolToYN( HideInactiveCertifiedEmployees );
  // end;
  AssignQueryParamValue(DataSet, 'sndop_id', TblSndOpID.asFloat);
  AssignQueryParamValue(DataSet, 'hide_inactive', IQMS.Common.StringUtils.BoolToYN( HideInactiveCertifiedEmployees ));
end;

procedure TSndDM.TblSndopBeforeOpen(DataSet: TDataSet);
begin
  if Assigned(Owner) and (Owner is TSndBase) then
     AssignQueryParamValue( DataSet, 'op_class', TSndBase(self.Owner).OpClass );
end;



procedure TSndDM.TblSndopJobsCalcFields(DataSet: TDataSet);
begin
  if TblSndopJobsHR_JOB_DESCRIP_ID.asFloat > 0 then
     TblSndopJobsJobDescrip.asString := SelectValueByID('descrip', 'hr_job_descrip', TblSndopJobsHR_JOB_DESCRIP_ID.asFloat );
end;

end.


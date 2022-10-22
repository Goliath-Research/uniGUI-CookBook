unit Schd_DM;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Vcl.DBGrids,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Wwdatsrc,
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
  uniBasicGrid,
  uniDBGrid;

type
  TSchdDM = class(TDataModule)
    SrcParams: TDataSource;
    TblParams: TFDTable;
    SrcCntr_Sched: TDataSource;
    SrcWorkOrder: TDataSource;
    SrcWork_Center: TDataSource;
    TblWork_Center: TFDTable;
    TblWork_CenterID: TBCDField;
    TblWork_CenterEQNO: TStringField;
    TblWork_CenterCNTR_TYPE: TStringField;
    TblWork_CenterMFGCELL: TStringField;
    TblWork_CenterMFG_TYPE: TStringField;
    TblWork_CenterCNTR_DESC: TStringField;
    TblWork_CenterCAPACITY: TBCDField;
    PkCenter: TIQWebHPick;
    PkCenterEQNO: TStringField;
    PkCenterCNTR_DESC: TStringField;
    PkCenterCAPACITY: TBCDField;
    PkCenterCNTR_TYPE: TStringField;
    PkCenterID: TBCDField;
    SrcPtOrder: TDataSource;
    TblParamsSCHED_SCOPE: TBCDField;
    TblParamsMFG_SCOPE: TBCDField;
    TblParamsSHIFTS: TBCDField;
    TblParamsSHIFT_START1: TStringField;
    TblParamsSHIFT_START2: TStringField;
    TblParamsSHIFT_START3: TStringField;
    TblParamsMFG_DAYS_WEEK: TBCDField;
    TblParamsASSY_DAYS_WEEK: TBCDField;
    TblWork_CenterIS_RT: TStringField;
    TblParamsSCHED_POOL_OVERRIDE: TStringField;
    TblParamsMFG_SHIFT1: TStringField;
    TblParamsMFG_SHIFT2: TStringField;
    TblParamsMFG_SHIFT3: TStringField;
    TblParamsASSY_SHIFT1: TStringField;
    TblParamsASSY_SHIFT2: TStringField;
    TblParamsASSY_SHIFT3: TStringField;
    TblWork_CenterASY_MACH: TStringField;
    QryPMEqmt: TFDQuery;
    TblParamsTIME_FENCE: TBCDField;
    TblParamsSAFETY_LEAD_TIME: TBCDField;
    QryPtOrder: TFDQuery;
    QryPtOrderID: TBCDField;
    QryPtOrderWORKORDER_ID: TBCDField;
    QryPtOrderPARTNO_ID: TBCDField;
    QryPtOrderREL_DATE: TDateTimeField;
    QryPtOrderREL_QUAN: TBCDField;
    QryPtOrderORDERNO: TStringField;
    QryPtOrderPONO: TStringField;
    QryPtOrderPTALLOCATE_ID: TBCDField;
    QryPtOrderARINVT_ID: TBCDField;
    QryPtOrderCLASS: TStringField;
    QryPtOrderITEMNO: TStringField;
    QryPtOrderREV: TStringField;
    QryPtOrderDESCRIP: TStringField;
    QryPtOrderDESCRIP2: TStringField;
    QryPtOrderUNIT: TStringField;
    QryPtOrderCOMPANY: TStringField;
    QryPtOrderPARTS_TO_GO: TFMTBCDField;
    QryPtOrderPROMISE_DATE: TDateTimeField;
    QryPtOrderREQUEST_DATE: TDateTimeField;
    QryPtOrderREL_QUAN_DISP: TFMTBCDField;
    QryPtOrderORDERS_ID: TBCDField;
    TblWork_CenterEPLANT_ID: TBCDField;
    QryEPlant: TFDQuery;
    TblWork_CenterEPlant_Name: TStringField;
    PkCenterEPLANT_ID: TBCDField;
    TblParamsCAPACITY_SCOPE: TBCDField;
    QryPMEqmtID: TBCDField;
    QryPMEqmtPMEQMT_ID: TBCDField;
    QryPMEqmtEQNO: TStringField;
    QryIsOnExceptionList: TFDQuery;
    QryPMEqmtSERVICE_DATE_IN: TDateTimeField;
    QryPMEqmtSERVICE_DATE_OUT: TDateTimeField;
    TblParamsFR_HIDE: TStringField;
    QryV_Sched: TFDQuery;
    QryV_SchedCYCLES_TO_GO: TFMTBCDField;
    QryV_SchedHOURS_TO_GO: TFMTBCDField;
    QryV_SchedUNITS_TO_GO: TFMTBCDField;
    QryV_SchedUOM: TStringField;
    TblParamsSCHED_EVAL_NEG_CONS: TStringField;
    TblParamsWO_CASCADE_FIRM: TStringField;
    TblParamsSCHED_MOVE_SAME_TOOL_WO: TStringField;
    QryPtOrderSTANDARD_ID: TBCDField;
    TblParamsSCHED_INC_LOT_ON_SETUP: TStringField;
    TblParamsSCHED_CHK_RUNSBEST_ON_INSERT: TStringField;
    QryPtOrderORD_DETAIL_ID: TBCDField;
    TblParamsDEL_FIRM_WO: TStringField;
    TblWork_CenterSNAP_TO_LAST: TBCDField;
    TblParamsSCHED_INC_LOT_EXCLUDE_SAME_MFG: TStringField;
    PkCenterPK_HIDE: TStringField;
    TblParamsSCHED_USE_WO_FOR_LOTNO: TStringField;
    TblWork_CenterPK_HIDE: TStringField;
    TblWork_CenterSCHED_JIT: TStringField;
    QryPtOrderSO_comment_exists: TStringField;
    TblParamsAUTO_LOAD_EVAL_CONF: TStringField;
    TblParamsSCHED_RESET_MANUAL_WO_QTY: TStringField;
    TblParamsCAPACITY_AVAIL_THRESHOLD: TBCDField;
    TblParamsCAPACITY_BOOKED_THRESHOLD: TBCDField;
    TblWork_CenterLookup_Mfgtype: TStringField;
    QryPtOrderPTORDER_ID: TBCDField;
    TblWork_CenterMFGCELL_ID: TBCDField;
    QryPtOrderARCUSTO_ID: TFMTBCDField;
    QryPtOrderRELEASES_ID: TBCDField;
    QryPtOrderWO_NOTE: TStringField;
    TblWork_CenterFRAME_ID: TBCDField;
    TblWork_CenterFRAME_SET_ID: TBCDField;
    TblWork_CenterFRAME_ARINVT_ID_MAT: TBCDField;
    TblWork_CenterFRAME_PARENT_WORK_CENTER_ID: TBCDField;
    TblParamsSCHED_FIRM_ON_SETUP: TStringField;
    TblParamsSCHED_ALLOC_BY_DIVISION: TStringField;
    QryPMEqmtDown: TFDQuery;
    QryPMEqmtDownEQNO: TStringField;
    QryPMEqmtDownSERVICE_DATE_OUT: TDateTimeField;
    QryPMEqmtDownSERVICE_DATE_IN: TDateTimeField;
    TblWork_CenterPARENT_ID: TBCDField;
    TblParamsFR_WO_SCOPE: TBCDField;
    TblParamsSCHED_AUTO_REMOVE_EMPTY_WO: TStringField;
    TblParamsSCHED_COMBINE_SO_FORECAST_WO: TStringField;
    TblParamsAUTO_LOAD_SCOPE: TBCDField;
    TblParamsAUTO_LOAD_BACKPASS: TStringField;
    QryPtOrderSHIP_TO_COMPANY: TStringField;
    QryPtOrderSHIP_TO_ADDR1: TStringField;
    QryPtOrderSHIP_TO_CITY: TStringField;
    QryPtOrderSHIP_TO_STATE: TStringField;
    QryPtOrderSHIP_TO_ZIP: TStringField;
    TblParamsSCHED_CHECK_MRO: TStringField;
    SrcPmEqmtWODetails: TDataSource;
    QryPmEqmtWODetails: TFDQuery;
    QryPmEqmtWODetailsPMWO_ID: TBCDField;
    QryPmEqmtWODetailsSTATUS: TStringField;
    QryPmEqmtWODetailsPMEQMT_ID: TBCDField;
    QryPmEqmtWODetailsEQNO: TStringField;
    QryPmEqmtWODetailsEQUIP_DESCRIP: TStringField;
    QryPmEqmtWODetailsEQUIP_CLASS: TStringField;
    QryPmEqmtWODetailsLOCATION: TStringField;
    QryPmEqmtWODetailsTASK_NUMBER: TStringField;
    QryPmEqmtWODetailsTASK_DESCRIPTION: TStringField;
    QryPmEqmtWODetailsSTART_UNITS: TBCDField;
    QryPmEqmtWODetailsTOTAL_UNITS: TBCDField;
    TblParamsUSE_MFG_MIN_QTY_BUCKET: TStringField;
    TblParamsSCHED_RUN_AUTO_LOAD: TStringField;
    QryPtOrderONHAND: TBCDField;
    TblParamsMAT_REQ_IGNORE_HARD_ALLOC: TStringField;
    TblCntr_Sched: TFDQuery;
    TblCntr_SchedWORK_CENTER_ID: TBCDField;
    TblCntr_SchedCNTR_SEQ: TBCDField;
    TblCntr_SchedWORKORDER_ID: TBCDField;
    TblCntr_SchedPROD_START_TIME: TDateTimeField;
    TblCntr_SchedPROD_END_TIME: TDateTimeField;
    TblCntr_SchedFORCE_REASON: TStringField;
    TblCntr_SchedDOWN_IDLE: TBCDField;
    TblCntr_SchedPRODHRS: TFMTBCDField;
    TblCntr_SchedSETUPHRS: TBCDField;
    TblCntr_SchedPRIORITY_NOTE: TStringField;
    TblCntr_SchedFORCE_SOURCE: TStringField;
    TblCntr_SchedMfgNo: TStringField;
    TblCntr_SchedCycles: TFloatField;
    TblCntr_SchedBucket: TIntegerField;
    TblCntr_SchedJobMfgNo: TStringField;
    TblCntr_SchedStart_Time: TDateTimeField;
    TblCntr_SchedEnd_Time: TDateTimeField;
    TblCntr_SchedMatItemNo: TStringField;
    TblCntr_SchedMatDescrip: TStringField;
    TblCntr_SchedCycles_To_Go: TFloatField;
    TblCntr_SchedUnits_To_Go: TFloatField;
    TblCntr_SchedHours_To_Go: TFloatField;
    TblCntr_SchedStandard_ID: TFloatField;
    TblCntr_SchedLBSK: TFMTBCDField;
    TblCntr_SchedMat_Req: TFloatField;
    TblCntr_SchedArinvt_ID_Mat: TFloatField;
    TblCntr_SchedSched_Scope: TFloatField;
    TblCntr_SchedMfg_Scope: TFloatField;
    TblCntr_SchedPROD_BUCKET_END: TDateTimeField;
    TblCntr_SchedWO_Bucket_Start: TDateTimeField;
    TblCntr_SchedWO_Bucket_End: TDateTimeField;
    TblCntr_SchedBucket_End_Disp: TDateTimeField;
    TblCntr_SchedTool_EqNo: TStringField;
    TblCntr_SchedMaybe_On_Time_Count: TIntegerField;
    TblCntr_SchedMfgType: TStringField;
    TblCntr_SchedPMWO_ID: TBCDField;
    TblCntr_SchedDays_Diff: TFloatField;
    TblCntr_SchedProd_Start_Time_Disp: TStringField;
    TblCntr_SchedWO_Origin: TStringField;
    TblCntr_SchedStart_Time_Disp: TStringField;
    TblCntr_SchedEnd_Time_Disp: TStringField;
    TblCntr_SchedWO_IsOnExceptionList: TStringField;
    TblCntr_SchedSets: TFloatField;
    TblCntr_SchedWO_Type: TStringField;
    TblCntr_SchedBom_UOM: TStringField;
    TblCntr_SchedTool_Is_Down: TStringField;
    TblCntr_SchedTool_Service_Date_In: TDateTimeField;
    TblCntr_SchedTool_Service_Date_Out: TDateTimeField;
    TblCntr_SchedOperator: TFloatField;
    TblCntr_SchedPriority: TStringField;
    TblCntr_SchedDel_Firm_WO: TStringField;
    TblCntr_SchedScrap: TFloatField;
    TblCntr_SchedEPlant_ID_Arinvt_Mat: TFloatField;
    TblCntr_SchedMfg_Descrip: TStringField;
    TblCntr_SchedOpNo: TStringField;
    TblCntr_SchedOpDesc: TStringField;
    TblCntr_SchedOpSeq: TFloatField;
    TblCntr_SchedAssy1_End_Time: TDateTimeField;
    TblCntr_SchedHasQualityException: TStringField;
    TblCntr_SchedID: TBCDField;
    TblCntr_SchedFORCE_SETUPHRS: TStringField;
    TblCntr_SchedSNDOP_DISPATCH_ID: TBCDField;
    TblCntr_SchedPriority_Level: TFloatField;
    TblCntr_SchedFG_LotNo: TStringField;
    TblCntr_SchedPRIORITY_NOTE2: TStringField;
    TblCntr_SchedRunHold: TStringField;
    TblCntr_SchedMatClass: TStringField;
    TblCntr_SchedMatDryTime: TFloatField;
    TblCntr_SchedFORCE_START_DATE: TDateTimeField;
    TblCntr_SchedProd_End_Time_Disp: TStringField;
    TblCntr_SchedFORCE_START_DATE_DISP: TDateTimeField;
    TblCntr_SchedProd_Start_Time_DispAsDate: TDateTimeField;
    TblCntr_SchedProcess_IsOnExceptionList: TStringField;
    TblCntr_SchedWOGroupID: TFloatField;
    TblCntr_SchedUSERID: TStringField;
    TblWorkOrder: TFDQuery;
    TblWorkOrderID: TBCDField;
    TblWorkOrderSTANDARD_ID: TBCDField;
    TblWorkOrderBUCKET: TBCDField;
    TblWorkOrderCYCLES_REQ: TBCDField;
    TblWorkOrderPRODHRS: TFMTBCDField;
    TblWorkOrderARCUSTO_ID: TBCDField;
    TblWorkOrderSTART_TIME: TDateTimeField;
    TblWorkOrderEND_TIME: TDateTimeField;
    TblWorkOrderCNTR_TYPE: TStringField;
    TblWorkOrderSETUPHRS: TBCDField;
    TblWorkOrderMFGNO: TStringField;
    TblWorkOrderITEMNO: TStringField;
    TblWorkOrderDESCRIP: TStringField;
    TblWorkOrderCOMPANY: TStringField;
    TblWorkOrderMFG_TYPE: TStringField;
    TblWorkOrderMFGCELL: TStringField;
    TblWorkOrderLBSK: TFMTBCDField;
    TblWorkOrderARINVT_ID_MAT: TBCDField;
    TblWorkOrderSCHED_SCOPE: TFMTBCDField;
    TblWorkOrderMFG_SCOPE: TFMTBCDField;
    TblWorkOrderBUCKET_START_TIME: TDateTimeField;
    TblWorkOrderBUCKET_END_TIME: TDateTimeField;
    TblWorkOrderORIGIN: TStringField;
    TblWorkOrderSETS: TFMTBCDField;
    TblWorkOrderFIRM: TStringField;
    TblWorkOrderOPERATOR: TBCDField;
    TblWorkOrderPRIORITY: TStringField;
    TblWorkOrderDEL_FIRM_WO: TStringField;
    TblWorkOrderSCRAP: TBCDField;
    TblWorkOrderBOM_DESCRIP: TStringField;
    TblWorkOrderASSY_START_TIME: TDateTimeField;
    TblWorkOrderASSY_END_TIME: TDateTimeField;
    TblWorkOrderPRIORITY_LEVEL: TBCDField;
    TblWorkOrderFG_LOTNO: TStringField;
    TblWorkOrderRUN_HOLD: TStringField;
    TblWorkOrderDRYTIME: TBCDField;
    TblWorkOrderCLASS: TStringField;
    TblWorkOrderGROUPID: TBCDField;
    TblParamsID: TBCDField;
    procedure SrcWork_CenterDataChange(Sender: TObject; Field: TField);
    procedure TblCntr_Sched1CalcFields(DataSet: TDataSet);
    procedure HandleError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure TblCntr_Sched1BeforePost(DataSet: TDataSet);
    procedure v_sched_parts_to_goCalcFields(DataSet: TDataSet);
    procedure TblWork_CenterFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure SchdDMDestroy(Sender: TObject);
    procedure SrcCntr_SchedDataChange(Sender: TObject; Field: TField);
    procedure AssignEPlantFilter(DataSet: TDataSet);
    procedure SchdDMCreate(Sender: TObject);
    procedure QryV_SchedCalcFields(DataSet: TDataSet);
    procedure QryPtOrderCalcFields(DataSet: TDataSet);
    procedure TblWork_CenterCalcFields(DataSet: TDataSet);
    procedure TblCntr_Sched1AfterScroll(DataSet: TDataSet);
    procedure QryV_SchedBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FLookup_WO_ID: Real;
    FLookup_Cntr_Sched_ID: Real;
    // FLookup_Standard_ID: Real;
    // FLookup_Tool_EqNo: string;
    // FLookup_Tool_Service_IN : TDateTime;
    // FLookup_Tool_Service_OUT: TDateTime;

    procedure AssignWorkorderLookupFields( AWorkorder_ID: Real );
    procedure AssignV_PmEqmtLookupFields( AStandard_ID: Real; AProdStartTime, AProdEndTime: TDateTime );
    procedure AssignV_SCHEDLookupFields( ACntr_Sched_ID: Real );

    function DtoS( ADate: TDateTime ): string;
    function IsDateBetween( TheDate, ALeft, ARight: TDateTime ): Boolean;
    function IsPeriodXinY( X1, X2, Y1, Y2: TDateTime ): Boolean;
    procedure AssignASSY1LookupFields(ASndop_Dispatch_ID: Real);
    function DateTimeToStrNullDateAsBlank(ADate: TDateTime): string;
    function IsInsideOpenPeriod(ADate, X1, X2: TDateTime): Boolean;
    function EvalIsToolDown(AStandard_ID: Real; AProdStartTime, AProdEndTime: TDateTime; var AServiceDateIn, AServiceDateOut: TDateTime;  var AEqNo: string): Boolean;
  public
    { Public declarations }
    function IsOnExceptionList( AWorkorder_ID: Real ): string;
    function IsToolDown( AStandard_ID: Real; AServiceDateIn, AServiceDateOut, AProdStartTime, AProdEndTime: TDateTime): Boolean;
    class function GetArinvtHavingQualityException( AStandard_ID: Real ): Real;
    procedure ApplySecurityToColumn(AField: TField; ADBGrid: TUniDBGrid;  SR: TIQWebSecurityRegister);
    function MaybeOnTime(AWorkOrder_ID: Real): Real;
  end;

//var
//  SchdDM: TSchdDM;

implementation

{$R *.DFM}

uses
  CAR_ECO_Exist,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.UOM,
  { TODO -oathite -cWebConvert : depends on IQMS.Common.UserMessages
  IQMS.Common.UserMessages, }
  IQMS.Common.MfgShare,
  RtTypes,
  { TODO -oathite -cWebConvert : Depends on Sched_mn
  Sched_mn,  }
  System.Variants,
  AssyTrack_Share;

procedure TSchdDM.SchdDMCreate(Sender: TObject);
begin
  FLookup_WO_ID        := -1;
  FLookup_Cntr_Sched_ID:= -1;
  // FLookup_Standard_ID  := -1;
end;

procedure TSchdDM.SrcWork_CenterDataChange(Sender: TObject; Field: TField);
var
  i:Integer;
begin
  { TODO -oathite -cWebConvert : Depends on Sched_mn
  if Assigned( Owner ) then with TFrm_MainSched(Owner) do
    if Assigned(Child) then Child.Work_CenterDataChange( Sender, Field );  }
end;

function TSchdDM.IsDateBetween( TheDate, ALeft, ARight: TDateTime ): Boolean;
begin
  Result:= (ALeft <= TheDate) and (TheDate <= ARight) and (ALeft > 0);
end;

function TSchdDM.IsPeriodXinY( X1, X2, Y1, Y2: TDateTime ): Boolean;
begin
  //  Y:  y1 ------------------ y2
  //  X:  x1   ------ x2
  Result:= (Y1 <= X1) and (X2 <= Y2) and (X1 > 0) and (X2 > 0);
end;


procedure TSchdDM.TblCntr_Sched1CalcFields(DataSet: TDataSet);
var
  nFlag:Real;
  ADate: TDateTime;
begin
  with TblCntr_Sched do
  begin
    {LookupFields}
    AssignV_SCHEDLookupFields( TblCntr_SchedID.asFloat );
    AssignWorkOrderLookupFields( TblCntr_SchedWORKORDER_ID.asFloat );
    AssignV_PmEqmtLookupFields( TblCntr_SchedStandard_ID.asFloat,
                                TblCntr_SchedPROD_START_TIME.asDateTime,
                                TblCntr_SchedPROD_END_TIME.asDateTime );
    AssignASSY1LookupFields( TblCntr_SchedSNDOP_DISPATCH_ID.asFloat );  // this will also update must start time in the grid

    {DownTime}
    nFlag:= FieldByName('DOWN_IDLE').AsInteger;
    if nFlag = 0 then
       FieldByName('JobMfgNo').value:= FieldByName('MfgNo').value
    else if nFlag = 1 then
       FieldByName('JobMfgNo').value:= 'DOWN-TIME'
    else if nFlag = 2 then
       FieldByName('JobMfgNo').value:= 'DOWN-TIME (MRO)';

    {Days Late Dec-16-02}
    if TblCntr_SchedStart_Time.asFloat > 0 then
       TblCntr_SchedDays_Diff.asFloat:= TblCntr_SchedPROD_START_TIME.asDateTime - TblCntr_SchedStart_Time.asDateTime
    else
       TblCntr_SchedDays_Diff.Clear;
  end;

  {Material UOM}
  if TblCntr_SchedMfgType.asString = 'EXTRUSION' then
     TblCntr_SchedMat_Req.AsFloat:= IQConvertUom( TblCntr_SchedCycles.asFloat {Ft Required} / TblCntr_SchedSets.asFloat {Ft/Lb} / ( 1 - TblCntr_SchedScrap.asFloat/100 ),
                                                  'LBS',
                                                  NativeWeightUOM( TblCntr_SchedEPlant_ID_Arinvt_Mat.asFloat ),
                                                  TblCntr_SchedArinvt_ID_Mat.asFloat )
  else if TblCntr_SchedMfgType.asString = 'EXTRUSION2' then
     TblCntr_SchedMat_Req.AsFloat:= IQConvertUom( TblCntr_SchedUnits_To_Go.asFloat,
                                                  'LBS',
                                                  NativeWeightUOM( TblCntr_SchedEPlant_ID_Arinvt_Mat.asFloat ),
                                                  TblCntr_SchedArinvt_ID_Mat.asFloat )
  else if ((TblWork_CenterLookup_Mfgtype.AsString = 'SLITTING') and not IQMS.Common.MfgShare.IsDefaultUomWeight(TblCntr_SchedMfgType.asString)) then
     TblCntr_SchedMat_Req.AsFloat:= TblCntr_SchedCycles.asFloat
  else
     TblCntr_SchedMat_Req.AsFloat:= IQConvertUom( TblCntr_SchedCycles.asFloat * TblCntr_SchedLBSK.asFloat / 1000,
                                                  'LBS',
                                                  NativeWeightUOM( TblCntr_SchedEPlant_ID_Arinvt_Mat.asFloat ),
                                                  TblCntr_SchedArinvt_ID_Mat.asFloat );

  {Bucket end}
  // if TblCntr_SchedCNTR_SEQ.asFloat = 1 then
  //    TblCntr_SchedBucket_End_Disp.asString:= DtoS( TblCntr_SchedPROD_BUCKET_END.asDateTime )  // TblCntr_SchedPROD_BUCKET_END.asString
  // else
  //    TblCntr_SchedBucket_End_Disp.asString:= DtoS( TblCntr_SchedWO_Bucket_End.asDateTime ); // TblCntr_SchedWO_Bucket_End.asString;

  {07-20-2007 when date format is set dd-MMM-yy delphi func StrToDateTime does not work}
  if TblCntr_SchedCNTR_SEQ.asFloat = 1 then
     begin
       if TblCntr_SchedPROD_BUCKET_END.asDateTime > 0 then
          TblCntr_SchedBucket_End_Disp.asDateTime:= TblCntr_SchedPROD_BUCKET_END.asDateTime
     end
  else
     begin
       if TblCntr_SchedWO_Bucket_End.asDateTime > 0 then
          TblCntr_SchedBucket_End_Disp.asDateTime:= TblCntr_SchedWO_Bucket_End.asDateTime;
     end;

  // translate server date to eplant time zone
  ADate:= SelectValueFmtAsFloat('select IQDate.tz_date_server_to_eplant( to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''), %f ) from dual',
                    [ FormatDateTime('mm/dd/yyyy hh:nn:ss', TblCntr_SchedPROD_START_TIME.asDateTime ),
                      TblWork_CenterEPLANT_ID.asFloat ]);
  TblCntr_SchedProd_Start_Time_DispAsDate.asDateTime:= ADate;  // used in edit force start time form

  {Must Start with/without Force Indicator}
  if TblCntr_SchedFORCE_SOURCE.asString = 'U' then
     TblCntr_SchedProd_Start_Time_Disp.asString:= DtoS( ADate ) + ' <F>'
  else if TblCntr_SchedFORCE_SOURCE.asString = 'A' then
     TblCntr_SchedProd_Start_Time_Disp.asString:= DtoS( ADate ) + ' <A>'
  else
     TblCntr_SchedProd_Start_Time_Disp.asString:= DtoS( ADate );

  {prod end time with the time zone in}
  ADate:= SelectValueFmtAsFloat('select IQDate.tz_date_server_to_eplant( to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''), %f ) from dual',
                    [ FormatDateTime('mm/dd/yyyy hh:nn:ss', TblCntr_SchedPROD_END_TIME.asDateTime ),
                      TblWork_CenterEPLANT_ID.asFloat ]);
  TblCntr_SchedProd_End_Time_Disp.asString:= DtoS( ADate );

  {Is tool down?}
  // 09-12-2011 see AssignV_PmEqmtLookupFields
  // TblCntr_SchedTool_Is_Down.asString:= 'N';
  // if IsToolDown( TblCntr_SchedTool_Service_Date_IN.asDateTime,
  //                TblCntr_SchedTool_Service_Date_OUT.asDateTime,
  //                TblCntr_SchedPROD_START_TIME.asDateTime,
  //                TblCntr_SchedPROD_END_TIME.asDateTime ) then
  // begin
  //   { Toggle flag - used to detemine the color of the column in the grid}
  //   TblCntr_SchedTool_Is_Down.asString:= 'Y';
  //   { Make it look: 103 (01/12/2001 23:11:33 - 01/12/2001 23:19:33) }
  //   TblCntr_SchedTool_EqNo.asString:= Format('%s (%s - %s)',
  //                                           [ TblCntr_SchedTool_EqNo.asString,
  //                                             DateTimeToStrNullDateAsBlank( TblCntr_SchedTool_Service_Date_OUT.asDateTime ),
  //                                             DateTimeToStrNullDateAsBlank( TblCntr_SchedTool_Service_Date_IN.asDateTime )]);
  // end;
end;


function TSchdDM.DateTimeToStrNullDateAsBlank( ADate: TDateTime ): string;
begin
  if ADate > 0 then
     Result:= DateTimeToStr( ADate )
  else
     Result:= ''
end;


function TSchdDM.IsToolDown( AStandard_ID: Real; AServiceDateIn, AServiceDateOut, AProdStartTime, AProdEndTime: TDateTime ): Boolean;
var
  AEqNo: string;
begin

  Result:= EvalIsToolDown( AStandard_ID, AProdStartTime, AProdEndTime, AServiceDateIn, AServiceDateOut, AEqNo );

  // Result:= IsPeriodXinY( AServiceDateOut,
  //                        AServiceDateIn,    {service time all covered by start-end time of the job}
  //                        AProdStartTime,
  //                        AProdEndTime )
  //          or
  //          IsPeriodXinY( AProdStartTime,    {start-end time of the job all covered by service timw}
  //                        AProdEndTime,
  //                        AServiceDateOut,
  //                        AServiceDateIn )
  //          or
  //          IsDateBetween( AServiceDateOut,
  //                         AProdStartTime,
  //                         AProdEndTime )
  //          or
  //          IsDateBetween( AServiceDateIn,
  //                         AProdStartTime,
  //                         AProdEndTime )
  //          or
  //          IsInsideOpenPeriod( AProdStartTime,
  //                              AServiceDateOut,
  //                              AServiceDateIn )
end;


function TSchdDM.IsInsideOpenPeriod( ADate, X1, X2: TDateTime ): Boolean;
begin
  // (open period) x1 ------------  open (x2 is not assigned)
  //                     ADate --------  dont care when is finished
  Result:= (X1 <= ADate) and (X2 = 0) and (X1 > 0);
end;

procedure TSchdDM.HandleError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  Action:= daAbort;
  IQHandleDBEngineError( DataSet, E );
end;

procedure TSchdDM.TblCntr_Sched1BeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet, 'CNTR_SCHED' );
end;

procedure TSchdDM.v_sched_parts_to_goCalcFields(DataSet: TDataSet);
begin
  //if DataSet <> NIL then with DataSet do
  //   FieldByName('Parts_To_Go').asFloat:= V_Sched_Parts_To_Go.FieldByName('Parts_To_Go').asFloat;
end;

procedure TSchdDM.TblWork_CenterFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  { TODO -oathite -cWebConvert : Depends on Sched_mn
  with TFrm_MainSched(Owner).RTFilter  do
  begin
    if CellOrMfgType = cmCELL then
       begin
         Accept:= ( DataSet['MFGCELL'] = Cell ) or ((DataSet['MFGCELL'] = NULL) and ( DataSet['MFG_TYPE'] = MfgType ))
       end

    else if CellOrMfgType = cmMfgType then
       begin
         if UseBaseMfgType then
            Accept:= IQMS.Common.MfgShare.Lookup_MfgType(DataSet['MFG_TYPE']) = Lookup_MfgType
         else
            Accept:= DataSet['MFG_TYPE'] = MfgType;
       end;
  end;

  if Accept then
     Accept:= DataSet['PK_HIDE'] <> 'Y';

  // do not allow physical converted to logical machines
  if Accept then
     Accept:= (DataSet.FieldByName('FRAME_ID').asFloat = 0)
              or
              (DataSet.FieldByName('FRAME_SET_ID').asFloat > 0);

  // do not allow complex workcenter children
  if Accept then
     Accept:= (DataSet.FieldByName('PARENT_ID').asFloat = 0)
              or
              (DataSet.FieldByName('PARENT_ID').asFloat > 0) and not IQMS.Common.MfgShare.WorkCenterBelongsToComplex( DataSet.FieldByName('ID').asFloat ); }
end;

procedure TSchdDM.SchdDMDestroy(Sender: TObject);
begin
  {commented out on 07-20-2007 - caused AV since some of the ondatachange events were firing after owner went nil}
  // IQSetTablesActive( FALSE, self );

  //Application.ProcessMessages;
end;

procedure TSchdDM.SrcCntr_SchedDataChange(Sender: TObject; Field: TField);
begin
  {Jan 10, 2002 - replaced with workorder_id parameter }
  { TODO -oathite -cWebConvert : Depends on Sched_mn
  if Assigned(TblCntr_Sched) and (TblCntr_Sched.State = dsBrowse) then  with TFrm_MainSched(self.Owner) do
     if Assigned(Child) then
        Child.Cntr_SchedDataChange( Sender, Field ); }
end;

procedure TSchdDM.AssignEPlantFilter(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );
end;


procedure TSchdDM.AssignV_SCHEDLookupFields( ACntr_Sched_ID: Real );
begin
  if (ACntr_Sched_ID = 0) then
     begin
       TblCntr_SchedCycles_To_Go.Clear;
       TblCntr_SchedUnits_To_Go.Clear;
       TblCntr_SchedHours_To_Go.Clear;
       TblCntr_SchedBom_UOM.Clear;
     end
  else
     begin
       QryV_Sched.Close;
       QryV_Sched.Open;
       TblCntr_SchedCycles_To_Go.asFloat:= QryV_SchedCYCLES_TO_GO.asFloat;
       TblCntr_SchedUnits_To_Go.asFloat := QryV_SchedUNITS_TO_GO.asFloat;
       TblCntr_SchedHours_To_Go.asFloat := QryV_SchedHOURS_TO_GO.asFloat;
       TblCntr_SchedBom_UOM.asString    := QryV_SchedUOM.asString;
       FLookup_Cntr_Sched_ID:= ACntr_Sched_ID;
     end
end;

procedure TSchdDM.AssignWorkOrderLookupFields( AWorkorder_ID: Real );
begin
  if (AWorkorder_ID = 0) or not (TblWorkOrder.State = dsBrowse) then
     begin
       TblCntr_SchedMfgNo.Clear;
       TblCntr_SchedCycles.Clear;
       TblCntr_SchedBucket.Clear;
       TblCntr_SchedStart_Time.Clear;
       TblCntr_SchedEnd_Time.Clear;
       TblCntr_SchedMatItemNo.Clear;
       TblCntr_SchedMatDescrip.Clear;
       TblCntr_SchedStandard_ID.Clear;
       TblCntr_SchedLBSK.Clear;
       TblCntr_SchedArinvt_ID_Mat.Clear;
       TblCntr_SchedSched_Scope.Clear;
       TblCntr_SchedMfg_Scope.Clear;
       TblCntr_SchedWO_Bucket_Start.Clear;
       TblCntr_SchedWO_Bucket_End.Clear;
       TblCntr_SchedMfgType.Clear;
       TblCntr_SchedWO_Origin.Clear;
       TblCntr_SchedStart_Time_Disp.Clear;
       TblCntr_SchedEnd_Time_Disp.Clear;
       TblCntr_SchedWO_IsOnExceptionList.Clear;
       TblCntr_SchedSets.Clear;
       TblCntr_SchedWO_Type.Clear;
       TblCntr_SchedBom_UOM.Clear;
       TblCntr_SchedOperator.Clear;
       TblCntr_SchedPriority.Clear;
       TblCntr_SchedDel_Firm_WO.Clear;
       TblCntr_SchedScrap.Clear;
       TblCntr_SchedEPlant_ID_Arinvt_Mat.Clear;
       TblCntr_SchedPriority_Level.Clear;
       TblCntr_SchedFG_LotNo.Clear;
       TblCntr_SchedRunHold.Clear;
       TblCntr_SchedMatClass.Clear;
       TblCntr_SchedMatDryTime.Clear;
     end
  else if (FLookup_WO_ID = AWorkorder_ID) or TblWorkOrder.Locate( 'ID', AWorkorder_ID, []) then
     begin
       TblCntr_SchedMfgNo.asString               := TblWorkOrderMfgNo.asString;
       TblCntr_SchedMfg_Descrip.asString         := TblWorkOrderBOM_DESCRIP.asString;
       TblCntr_SchedCycles.asFloat               := TblWorkOrderCYCLES_REQ.asFloat;
       TblCntr_SchedBucket.asString              := TblWorkOrderBUCKET.asString;
       TblCntr_SchedOperator.asFloat             := TblWorkOrderOPERATOR.asFloat;
       TblCntr_SchedPriority.asString            := TblWorkOrderPRIORITY.asString;

       TblCntr_SchedStart_Time.asDateTime        := TblWorkOrderSTART_TIME.asDateTime;
       TblCntr_SchedEnd_Time.asDateTime          := TblWorkOrderEND_TIME.asDateTime;

       TblCntr_SchedStart_Time_Disp.asString     := DtoS( TblWorkOrderSTART_TIME.asDateTime );
       TblCntr_SchedEnd_Time_Disp.asString       := DtoS( TblWorkOrderEND_TIME.asDateTime );

       TblCntr_SchedMatItemNo.asString           := TblWorkOrderITEMNO.asString;
       TblCntr_SchedMatDescrip.asString          := TblWorkOrderDESCRIP.asString;
       TblCntr_SchedStandard_ID.asFloat          := TblWorkOrderSTANDARD_ID.asFloat;
       TblCntr_SchedLBSK.asFloat                 := TblWorkOrderLBSK.asFloat;
       TblCntr_SchedArinvt_ID_Mat.asFloat        := TblWorkOrderARINVT_ID_MAT.asFloat;
       TblCntr_SchedSched_Scope.asFloat          := TblWorkOrderSCHED_SCOPE.asFloat;
       TblCntr_SchedMfg_Scope.asFloat            := TblWorkOrderMFG_SCOPE.asFloat;

       // TblCntr_SchedWO_Bucket_Start.asString  := DtoS( TblWorkOrderBUCKET_START_TIME.asDateTime );
       {07-20-2007 when date format is set dd-MMM-yy delphi func StrToDateTime does not work}
       if TblWorkOrderBUCKET_START_TIME.asDateTime > 0 then
          TblCntr_SchedWO_Bucket_Start.asDateTime   := TblWorkOrderBUCKET_START_TIME.asDateTime;

       TblCntr_SchedWO_Bucket_End.asDateTime     := TblWorkOrderBUCKET_END_TIME.asDateTime;

       TblCntr_SchedMfgType.asString             := TblWorkOrderMFG_TYPE.asString;
       TblCntr_SchedWO_Origin.asString           := TblWorkOrderORIGIN.asString;
       TblCntr_SchedWO_Type.asString             := IIf(TblWorkOrderFIRM.asString = 'Y', 'FIRM', '');

       TblCntr_SchedWO_IsOnExceptionList.asString:= IsOnExceptionList( AWorkorder_ID );
       TblCntr_SchedSets.asFloat                 := TblWorkOrderSETS.asFloat;

       TblCntr_SchedDel_Firm_WO.asString         := IIf(TblWorkOrderFIRM.asString <> 'Y', 'N/A',
                                                        IIf( TblWorkOrderDEL_FIRM_WO.asString = '', 'System Default', TblWorkOrderDEL_FIRM_WO.asString ));

       TblCntr_SchedScrap.asFloat                := TblWorkOrderSCRAP.asFloat;

       TblCntr_SchedEPlant_ID_Arinvt_Mat.asFloat := SelectValueFmtAsFloat('select eplant_id from arinvt where id = %f', [ TblCntr_SchedArinvt_ID_Mat.asFloat ]);

       if TSchdDM.GetArinvtHavingQualityException( TblCntr_SchedStandard_ID.asFloat ) > 0 then
          TblCntr_SchedHasQualityException.asString:= 'Y';

       if TblWorkOrderPRIORITY_LEVEL.asFloat <> 0 then
          TblCntr_SchedPriority_Level.asFloat:= TblWorkOrderPRIORITY_LEVEL.asFloat;

       TblCntr_SchedFG_LotNo.asString:= TblWorkOrderFG_LOTNO.asString;

       TblCntr_SchedRunHold.asString:= TblWorkOrderRUN_HOLD.asString;

       TblCntr_SchedMatClass.asString:= TblWorkOrderCLASS.asString;
       TblCntr_SchedMatDryTime.asFloat:= TblWorkOrderDRYTIME.asFloat;

       if TblWorkOrderGROUPID.asFloat > 0 then
          TblCntr_SchedWOGroupID.asFloat:= TblWorkOrderGROUPID.asFloat;

       TblCntr_SchedMaybe_On_Time_Count.asFloat:= MaybeOnTime( AWorkOrder_ID );
     end;

  FLookup_WO_ID:= AWorkorder_ID;
end;


procedure TSchdDM.AssignV_PmEqmtLookupFields( AStandard_ID: Real; AProdStartTime, AProdEndTime: TDateTime );
var
   AServiceDateIn : TDateTime;
   AServiceDateOut: TDateTime;
   AEqNo          : string;
begin
  if (AStandard_ID = 0) or not (QryPMEqmt.State = dsBrowse) then
      EXIT;

  // get lookup pmeqmt and evaluate at the same time if the tool is out
  if EvalIsToolDown( AStandard_ID, AProdStartTime, AProdEndTime, AServiceDateIn, AServiceDateOut, AEqNo ) then
     TblCntr_SchedTool_Is_Down.asString:= 'Y';

  TblCntr_SchedTool_EqNo.asString:= AEqNo;
  if AServiceDateOut > 0 then
     TblCntr_SchedTool_Service_Date_OUT.asDateTime:= AServiceDateOut;
  if AServiceDateIn > 0 then
     TblCntr_SchedTool_Service_Date_IN.asDateTime := AServiceDateIn;

  // change pmeqmt eqno display if the tool is out of service
  if TblCntr_SchedTool_Is_Down.asString = 'Y' then
     TblCntr_SchedTool_EqNo.asString:= Format('%s (%s - %s)',
                                              [ TblCntr_SchedTool_EqNo.asString,
                                                DateTimeToStrNullDateAsBlank( TblCntr_SchedTool_Service_Date_OUT.asDateTime ),
                                                DateTimeToStrNullDateAsBlank( TblCntr_SchedTool_Service_Date_IN.asDateTime )]);

  // else if ( FLookup_Standard_ID = AStandard_ID ) then
  //    begin
  //      TblCntr_SchedTool_EqNo.asString:= FLookup_Tool_EqNo;
  //      TblCntr_SchedTool_Service_Date_In.asDateTime := FLookup_Tool_Service_IN;
  //      TblCntr_SchedTool_Service_Date_Out.asDateTime:= FLookup_Tool_Service_OUT;
  //    end
  //
  // else if QryPMEqmt.Locate('id', AStandard_ID, []) then
  //    begin
  //    end
  //
  // else
  //    begin
  //      TblCntr_SchedTool_EqNo.Clear;
  //      TblCntr_SchedTool_Service_Date_In.Clear;
  //      TblCntr_SchedTool_Service_Date_Out.Clear;
  //    end;
  //
  // FLookup_Standard_ID     := AStandard_ID;
  // FLookup_Tool_EqNo       := TblCntr_SchedTool_EqNo.asString;
  // FLookup_Tool_Service_IN := TblCntr_SchedTool_Service_Date_In.asDateTime ;
  // FLookup_Tool_Service_OUT:= TblCntr_SchedTool_Service_Date_Out.asDateTime;
end;

function TSchdDM.EvalIsToolDown( AStandard_ID: Real; AProdStartTime, AProdEndTime: TDateTime; var AServiceDateIn, AServiceDateOut: TDateTime; var AEqNo: string ): Boolean;
begin
  Result         := FALSE;
  AEqNo          := '';
  AServiceDateIn := 0;
  AServiceDateOut:= 0;

  if (AStandard_ID = 0) then
      EXIT;

  // check if pmeqmt is out of service
  with QryPMEqmtDown do
  begin
    Close;
    Params.ParamByName('standard_id').Value  := AStandard_ID;
    Params.ParamByName('start_time').asDateTime:= AProdStartTime;
    Params.ParamByName('end_time').asDateTime  := AProdEndTime;
    Open;
  end;

  Result:= not QryPMEqmtDown.Eof;

  case Result of
    TRUE:  // equipment is out of service (down)
           begin
             AEqNo          := QryPMEqmtDownEQNO.asString;
             AServiceDateIn := QryPMEqmtDownSERVICE_DATE_IN.asDateTime;
             AServiceDateOut:= QryPMEqmtDownSERVICE_DATE_OUT.asDateTime;
           end;

    FALSE: // equipment is not out of service
           if QryPMEqmt.Locate('id', AStandard_ID, []) then
           begin
             AEqNo          := QryPMEqmtEQNO.asString;
             AServiceDateIn := QryPMEqmtSERVICE_DATE_IN.asDateTime;
             AServiceDateOut:= QryPMEqmtSERVICE_DATE_OUT.asDateTime;
           end;
  end;
end;


function TSchdDM.DtoS( ADate: TDateTime ): string;
begin
  // Result:= IIf( ADate = 0, '', FormatDateTime( 'mm/dd/yyyy hh:nn', ADate ));
  // Result:= IIf( ADate = 0, '', FormatDateTime( FormatSettings.FormatSettings.ShortDateFormat + ' hh:nn', ADate )); Oct-04-01
  Result:= IIf( ADate = 0, '', DateTimeToStr( ADate ));
end;


function TSchdDM.IsOnExceptionList( AWorkorder_ID: Real ): string;
begin
  Result:= SelectValueFmtAsString('select is_xcpt_mat from workorder where id = %f', [ AWorkorder_ID ]);
  EXIT;

  // 02-22-2010 obsolete
  with QryIsOnExceptionList do
  begin
    Close;
    ParamByName('workorder_id').Value:= AWorkorder_ID;
    Open;
    Result:= FieldByName('On_Exception_List').asString;
  end;
end;


procedure TSchdDM.QryV_SchedBeforeOpen(DataSet: TDataSet);
begin
  // TFDQuery(DataSet).ParamByName('cntr_sched_id').asFloat:=  TblCntr_SchedID.asFLoat;
  AssignQueryParamValue(DataSet, 'cntr_sched_id', TblCntr_SchedID.asFLoat)
end;

procedure TSchdDM.QryV_SchedCalcFields(DataSet: TDataSet);
begin
  // 03-09-2015 EIQ-6356 Slowness when opening scheduling fro ASSY1 - Load Trail - CRM#1206656
  // replaced with a query
  (*
  { Hours to go includes setup time except of ASSY1 }
  if QryV_SchedCNTR_SEQ.asFloat = 1 then
     QryV_SchedHours_To_Go_Disp.asFloat:= QryV_SchedHOURS_TO_GO.asFloat

  else if (TblWork_CenterLookup_Mfgtype.asString = 'ASSY1') or (TblWork_CenterLookup_Mfgtype.asString = 'ASSY2') then
     QryV_SchedHours_To_Go_Disp.asFloat:= QryV_SchedHOURS_TO_GO.asFloat

  else
     QryV_SchedHours_To_Go_Disp.asFloat:= QryV_SchedHOURS_TO_GO.asFloat - QryV_SchedSETUPHRS.asFloat;
  *)

  {Days Late is changed to be based on MSD and actual Prod_Start_Date Dec-16-02. Code below is obsolete}
  //if QryV_SchedEARLIEST_REL_DATE.asFloat > 0 then
  //   QryV_SchedDays_Diff.asFloat:= (QryV_SchedPROD_END_TIME.asDateTime - QryV_SchedEARLIEST_REL_DATE.asDateTime)
  //else
  //   QryV_SchedDays_Diff.Clear;
end;

procedure TSchdDM.QryPtOrderCalcFields(DataSet: TDataSet);
begin
  QryPtOrderSO_comment_exists.asString:= SelectValueFmtAsString( 'select ''Y'' from ord_detail where id = %f and comment1 is not NULL', [ QryPtOrderORD_DETAIL_ID.asFloat ]);
end;


procedure TSchdDM.AssignASSY1LookupFields( ASndop_Dispatch_ID: Real );
var
  A            : Variant;
  AWorkorder_ID: Real;
  APartno_ID   : Real;
begin
  if ASndop_Dispatch_ID = 0 then EXIT;

  A:= SelectValueArrayFmt( 'select s.opno, s.opdesc, p.opseq,              '+
                            '       d.partno_id, d.workorder_id,            '+
                            '       d.start_time, d.start_time,             '+
                            '       d.is_xcpt_mat                           '+
                            '  from sndop_dispatch d, sndop s, ptoper p     '+
                            ' where d.id = %f                               '+
                            '   and d.sndop_id = s.id                       '+
                            '   and d.ptoper_id = p.id(+)                   ',
                            [ ASndop_Dispatch_ID ]);
  if VarArrayDimCount( A ) = 0 then EXIT;

  TblCntr_SchedOpNo.asString  := Format('%s [%.0f]', [ A[ 0 ], DtoF(A[ 2 ])]);
  TblCntr_SchedOpDesc.asString:= A[ 1 ];

  AWorkorder_ID:= A[ 3 ];
  APartno_ID   := A[ 4 ];

  TblCntr_SchedAssy1_End_Time.asDateTime:= TblWorkOrderASSY_END_TIME.asDateTime;

  if not VarIsNull(A[ 5 ]) then
     TblCntr_SchedStart_Time.asDateTime:= A[ 5 ];
  if not VarIsNull(A[ 6 ]) then
     TblCntr_SchedEnd_Time.asDateTime:= A[ 6 ];
  // Do not update TblCntr_SchedStart_Time_Disp - leave it pointing to workorder.start_time

  TblCntr_SchedProcess_IsOnExceptionList.asString:= A[ 7 ];
end;

procedure TSchdDM.TblWork_CenterCalcFields(DataSet: TDataSet);
begin
  TblWork_CenterLookup_Mfgtype.asString:= IQMS.Common.MfgShare.Lookup_MfgType( TblWork_CenterMFG_TYPE.asString );
end;

procedure TSchdDM.TblCntr_Sched1AfterScroll(DataSet: TDataSet);
begin
  { TODO -oathite -cWebConvert : Depends on Sched_mn
  with TFrm_MainSched(Owner) do
    if IsAssy1 then
       IQMS.Common.Controls.PostMessageToForm( 'TSchdMoveDlg', iq_RefreshDataSets, 0, TblCntr_SchedSNDOP_DISPATCH_ID.asInteger); }
end;

class function TSchdDM.GetArinvtHavingQualityException( AStandard_ID: Real ): Real;
begin
  if AStandard_ID > 0 then
  begin
     with TFDQuery.Create(nil) do
     try
       Connection:= UniMainModule.FDConnection1;
       SQL.Add( Format('select arinvt_id from partno where standard_id = %.0f', [ AStandard_ID ]));
       Open;
       while not Eof do
       begin
         if TFrmCAR_ECO_Exist.HasQualityException( FieldByName('arinvt_id').asFloat ) then  // CAR_ECO_Exist.pas
         begin
           Result:= FieldByName('arinvt_id').asFloat;
           EXIT;
         end;
         Next;
       end;
     finally
       Free;
     end;
  end;

  Result:= 0;
end;

procedure TSchdDM.ApplySecurityToColumn( AField: TField; ADBGrid: TUniDBGrid; SR: TIQWebSecurityRegister );
var
  AColumn: TColumn;
begin
  { TODO -oathite -cWebConvert : Depends on Sched_mn
  TFrm_MainSched(Owner).SR.ApplySecurity( AField.Name );
  AColumn:= IQMS.Common.Controls.IQColumnByName( ADBGrid, AField.FieldName );
  if Assigned( AColumn ) then
     AColumn.Visible:= AField.Visible }
end;


function TSchdDM.MaybeOnTime( AWorkOrder_ID: Real ):Real;
begin
  Result:= SelectValueFmtAsFloat(
    'select count(*) as maybe_on_time_count '+
    '  from cntr_sched s,                   '+
    '       ptorder_rel r,                  '+
    '       ptallocate a                    '+
    ' where s.workorder_id = %f             '+
    '   and s.workorder_id = r.ptorder_id   '+
    '   and r.ptallocate_id = a.id          '+
    '   and s.prod_end_time between a.must_ship_date and a.promise_date '+
    '   and rownum < 2',
    [ AWorkOrder_ID ]);
end;

end.

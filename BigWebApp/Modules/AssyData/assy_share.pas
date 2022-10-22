unit assy_share;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule;

type
  TRejectMode = (rmComponents, rmMfgParts);
  TMfgRejectKind = (mrkNone, mrkNotReportedWIP, mrkPastReportedWIP);
  TProcessRejectsEditKind = (prekSelected, prekAllAbove, prekSelectedAndAllAbove);
  TVoidType = (vtUnknown, vtVoidRejects, vtVoidGoodParts, vtVoidMfgRejects );

type
  TRejectTransCargo = record
    Workorder_ID: Real;
    Partno_ID: Real;
    TA_Labor_ID: Real;
    Work_Center_ID: Real;
    Trans_Reason:string;
    Reject_Qty: Real;
    Reject_Code: string;
    Reject_Code_ID: Real;
    Arinvt_ID: Real;           // consumed:  opmat.arinvt_id
    Standard_ID: Real;         // parent: partno.standard_id
    Trans_Date: TDateTime;
    Prod_Date: TDateTime;
    ParentRejects_ID: Real;   // parent mfgpart rejects id
    FgLotNo: string;          // assigned by the user and propgated to translog
    Sub_Batch: Real;
    Ptoper_ID: Real;
    Sndop_Dispatch_ID: Real;
    WorkOpmatRejects_ID: Real; // work_opmat_rejects.id
    RejectMode: TRejectMode;
    DayPartID: Int64;
    Source: string;
    constructor Create( AWorkorder_ID: Real );
  end;

  TRejectMfgPartCargo = record
    TA_Labor_ID     : Real;
    Workorder_ID    : Real;
    Arinvt_ID       : Real;
    RejectedMfgParts: Real;
    Reject_Code_ID  : Real;
    Sub_Batch       : Real;
    MfgRejectKind   : TMfgRejectKind;
    FG_Lotno        : string;
  end;

  TReverseBackflushCargo = record
    FGMulti_ID: Real;         // we need a fgmulti eventhough nothing is going to be dispo-ed out
    VoidQty: Real;            // qty to void
    Reason: string;
    SrcArinvtForTrans: TDataSource;
    Arinvt_ID: Real;          // mfg part arinvt_id
    Rejects_ID: Real;         // rejects id of the mfg part recorded in the rejects table. Optional - used when voiding mfg part rejects
    VoidType: TVoidType;
    TA_Labor_ID: Real;
    Sndop_ID: Real;           // used when voiding mfg part rejects to record source and source_id in translog
    Sub_Batch: Real;
    Ptoper_ID: Real;
    TransAttribute: string;   // optional - used to void mfg rejects 'RECORD_COST_ELEMENT'
  end;

  TAdjustWIPCargo = record    // use TAdjustWIPCargo to pass parameters to main wrapper
    MfgQty: Real;             // voided parent mfg qty
    Sndop_ID: Real;           // create ADJUST WIP records in translog for all sndop opmats up to but not including passed SndOp_ID
    Standard_ID: Real;
    Partno_ID: Real;
    Workorder_ID: Real;
    RejectMode: TRejectMode;
    Kind: TProcessRejectsEditKind;
    Sub_Batch: Real;
    In_Out: string;
    Reason: string;
    Ptoper_ID: Real;
    TransAttribute: string;   // optional - used to void mfg rejects 'RECORD_COST_ELEMENT'
    TransDate: TDateTime;
    constructor Create( ADummy: Real );
  end;

  TAdjustWIPComponentsCargo = record  // use TAdjustWIPComponentsCargo to pass params to call IQTran wrapper per adjusted component
    Arinvt_ID: Real;
    Parent_Arinvt_ID: Real;
    Qty: Real;
    Sndop_ID: Real;
    Workorder_ID: Real;
    Partno_ID: Real;
    Trans_Reason: string;
    Trans_Date: TDateTime;
    Std_Cost: Real;
    Sub_Batch: Real;
    In_Out: string;
    Ptoper_ID: Real;
    TransAttribute: string;   // optional - used to void mfg rejects 'RECORD_COST_ELEMENT'
  end;

  TRejectModeParams = record
    Workorder_ID: Real;
    Partno_ID: Real;
    Arinvt_ID: Real;
    Sndop_ID: Real;
    Ptoper_ID: Real;
    TargetUOM: string;
    MfgTypeLookup: string;
    FGLotNo: string;
    Non_Conform_Locations_ID: Real;
    Non_Conform_ID: Real;
    Master_Label_List: TStringList;
    RejectMode: TRejectMode;
    MfgRejectedParts: Real;
    Reject_Code_ID: Real;
    Trans_Code_ID: Real;
    TransDate: TDateTime;
    constructor Create( AMaster_Label_List: TStringList );
    procedure Assign( AParam: TRejectModeParams );
    procedure CheckMoveMfgRejectsToNonConform( AGenerateMRB: Boolean = FALSE );
  private
    procedure UpdateMasterLabelLocDesc(AMaster_Label_ID, AFGMulti_ID: Real);
    procedure CheckCreateMRB(AFGMulti_ID, ATranslog_ID: Real);
  end;


  TCalcMatReq = record
    MainArinvt_ID: Real;
    Qty: Real;
    Batch: Real;
    Standard_ID: Real;
    Workorder_ID: Real;
    PtOper_ID: Real;
    constructor Create( ABatch: Real );
  end;


  (*
  TVoidRejectedMfgPartCargo = record
    FGMulti_ID: Real;         // need an fgmulti eventhough nothing is going to be dispo-ed out
    VoidQty: Real;            // qty to void
    Reason: string;
    SrcArinvtForTrans: TDataSource;
    Arinvt_ID: Real;          // mfg part arinvt_id
    Rejects_ID: Real;         // rejects id of the main mfg part recorded in the rejects table.
    TA_Labor_ID: Real;
    Sndop_ID: Real;           // used when voiding mfg part rejects to record source and source_id in translog
  end;
  *)

function get_assy1_translog_batch( AWorkorder_ID, APartno_ID: Real ): Real;
procedure ensure_assy1_translog_batch_assigned( AWorkorder_ID, APartno_ID: Real; var ABatch: Real );
procedure assign_assy1_translog_batch( AWorkorder_ID, APartno_ID: Real; ABatch: Real );
procedure ValidateCertificationLevel( APR_Emp_ID, ASndop_ID: Real );
procedure ExecuteComponentRejectTransaction( AParam: TRejectTransCargo );
function get_assy1_backflush_each_process( AStandard_ID: Real ): Boolean;

function ExecuteBackflushedWIPTransaction( ATA_Labor_ID: Real;
                                           SrcArinvt: TDataSource;
                                           AFGLotNo: string = '';
                                           ATransDate: TDateTime = 0;
                                           ASubBatch: Real = 0;
                                           AMatReqBatch: Real = 0): Real;

procedure UpdatePrevMaintCounter( ASndop_ID, ACycles: Real );
procedure UpdatePrevMaintCounterAllProcesses( APartno_ID, ACycles: Real );
procedure UpdatePrevMaintCounterPickedAtLineClearance( ASndop_Clear_Line_ID, ACycles: Real );
procedure CheckUpdatePrevMaintCounterPickedAtLineClearance( ATALabor_ID, ACycles: Real );

function IsProcessLinkedToPartno( APartno_ID, ASndop_ID: Real ): Boolean;
function get_process_total_good_and_rejected_parts( AWorkorder_ID, APtoper_ID: Real ): Real;
function get_process_total_good_parts( AWorkorder_ID, APtoper_ID: Real ): Real;
function get_outstanding_workorder_parts( AWorkorder_ID, APartno_ID: Real ): Real;
function get_total_final_assembly_qty( AWorkorder_ID, APartno_ID: Real ): Real;
procedure PopulateWorkOpMatRejects( ABatch, AStandard_ID, APartno_ID, ASndop_ID, APtoper_ID, ACurrentOpSeq, ARejectMfgParts: Real; ARejectMode: TRejectMode; AReject_Code_ID: Real = 0);
procedure PopulateWorkOpMatRejects_HardAlloc( AWorkorder_ID, ABatch, AStandard_ID, APartno_ID, ASndop_ID, APtoper_ID, ACurrentOpSeq, ARejectMfgParts: Real; ARejectMode: TRejectMode; AReject_Code_ID: Real = 0);

function WriteRejectedMfgPartsToRejects( AParam: TRejectMfgPartCargo ): Real;

function GetProcessRejectsEditKind( AStandard_ID: Real; ARejectMode: TRejectMode ): TProcessRejectsEditKind;
function IsSerialized( AArinvt_ID: Real ): Boolean;
procedure update_ptorder_backflushed( AWorkorder_ID, APartno_ID, ASndop_ID, AArinvt_ID, AQty: Real );
function GetFIFOMasterLabelForFgmulti( AFGMulti_ID: Real ): Real;
function GetProcessOverHeadRate(ASndop_ID: Real): Real;
function DeltaPercentCompleteToParts( APercentComplete, AWorkorder_ID, ASndop_ID, APartno_ID, APtoper_ID: Real ): Real;

{
When voiding rejects:
  1. Void Rejected Mfg Parts:
      a. Put consumed components back into inventory (IN transaction)
      b. Create OUT transaction with trans_quan = 0 and wip_trans = voided amount for the mfg part
      c. Reduce rejects table record for both Rejected Mfg Part and all rejected components. Use rejects.parent_id for that.
      d. Update ta_labor.rejected_qty and process_qty for mfg part

  2. Void rejected component:
      a. Put rejected component back in inventory
      b. Reduce rejects table record for the rejected component

When voiding good parts:
  1. Void Good Parts:
     a. Put consumed components back into inventory (IN transaction)
     b. Create an OUT transaction with trans_quan = 0 and wip_trans = voided amount for the mfg part
     c. Update ta_labor.process_qty for mfg_part

  2. Adjust/Report good parts as rejects:
     a. Add record to rejects
     b. Update ta_labor.process_qty and reject_qty
}

function ReverseBackflushMfgPart( ACargo: TReverseBackflushCargo ): Real;
procedure ReverseBackflushComponent( ACargo: TReverseBackflushCargo );

procedure AdjustRejectedQuanBasedOnTranslog( ASub_Batch, AArinvt_ID,  ARejects_ID, ATA_Labor_ID: Real; AVoidType: TVoidType; AIsMfgPart: Boolean = FALSE );
procedure AdjustRejectedQuan( AQty, ASub_Batch, AArinvt_ID, ARejects_ID, ATA_Labor_ID: Real; AVoidType: TVoidType; AIsMfgPart: Boolean );
procedure AdjustCompletedQuan( AQty, ATA_Labor_ID: Real; AVoidType: TVoidType; AIsMfgPart: Boolean );

procedure EnsureFGMultiAssigned( AArinvt_ID: Real; var AFGMulti_ID: Real; APkFGMulti: TIQWebHPick = nil );
function GetQtyBasedOnTranslog( ASub_Batch, AArinvt_ID: Real; AIsMfgPart: Boolean; AVoidType: TVoidType ): Real;

procedure PrepareCreateAdjustWIPTransactions( ACargo: TAdjustWIPCargo );
procedure ExecuteAdjustWIPTransaction( AParam: TAdjustWIPComponentsCargo );

procedure CheckAssignArinvtLotDocs( AWorkorder_ID, AArinvt_ID: Real; AFGLotNo: string );

function IsAssy3BackflushEachProcess( AMfgType: string ): Boolean;

function IsUsePercentComplete( AWorkorder_ID: Real ): Boolean;
function GetProcessPercentComplete( AWorkorder_ID, APtoper_ID: Real ): Real;

function IsProcessDesignatedToInvokeFinalAssy( APartno_ID, APtoper_ID: Real ): Boolean;

procedure UpdateProcessWipActCost( ASndop_Dispatch_ID,
                                   ASub_Batch: Real;
                                   ASource: string  = '';
                                   ASource_ID: Real = 0 );

function ProcessBelongsArchivedJobShop( ASndOp_Dispatch_ID: Real ): Boolean;
function WorkorderLinkedToArchivedJobShop( AWorkorder_ID: Real ): Boolean;
function WorkorderLinkedToJobShop( AWorkorder_ID: Real ): Boolean;
function RejectCodeNonConformLocations_ID( AReject_Code_ID: Real ): Real;
function IsRejectCodeAssignedNonConformLocation( ARejectCode: string ): Boolean; overload;
function IsRejectCodeAssignedNonConformLocation( AReject_Code_ID: Real ): Boolean; overload;
function CurrentFG_LotNo( AWorkorder_ID: Real ): string;
procedure ExecuteCalcMatReq( ACargo: TCalcMatReq );
procedure PopulateWorkOpMatRejectsEx( ABatchMatReq,
                                      ABatchRejects,
                                      AMainArinvt_ID,
                                      AQty,
                                      AStandard_ID,
                                      AWorkorder_ID,
                                      APtoper_ID: Real;
                                      ARejectMode: TRejectMode;
                                      AIncludePrevProcesses: Boolean;
                                      ASndop_Dispatch_ID: Real;
                                      AReject_Code_ID: Real );


// procedure VoidRejectedMfgPart( ACargo: TVoidRejectedMfgPartCargo );

implementation

uses
  assy_const,
  { TODO -oSanketG -cWC : Need to revisit }
  {AssyTrack_Main,
  AssyTrack_NonConform,}
  CheckMrb,
  dispo_misc,
  fd_share,
  IQMS.Common.Applications,
  IQMS.Common.COMExe,
  IQMS.Common.Controls,
  IQMS.Common.Dispo,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Sequence,
  IQMS.Common.StringUtils,
  IQMS.WebVcl.Trans,
  IQMS.Common.QC_Const,
  StrUtils,
  { TODO -oSanketG -cWC : Need to revisit }
  {TranDlg,
  TranReverseBackflush,}
  trans_share;

function get_assy1_translog_batch( AWorkorder_ID, APartno_ID: Real ): Real;
begin
  // Result:= SelectValueFmtAsFloat('select batch from ptorder where workorder_id = %f and partno_id = %f', [ AWorkorder_ID, APartno_ID ]);
  Result:= SelectValueFmtAsFloat('select batch from workorder where id = %f', [ AWorkorder_ID ]);
end;

procedure ensure_assy1_translog_batch_assigned( AWorkorder_ID, APartno_ID: Real; var ABatch: Real );
begin
  ABatch:= get_assy1_translog_batch( AWorkorder_ID, APartno_ID );
  if ABatch = 0 then
  begin
    ABatch:= GetNextSequenceNumber( 'S_INVTRANS_BATCHNO' );
    assign_assy1_translog_batch( AWorkorder_ID, APartno_ID, ABatch );
  end;
end;

procedure assign_assy1_translog_batch( AWorkorder_ID, APartno_ID: Real; ABatch: Real );
begin
  // ExecuteCommandFmt('update ptorder set batch = %f where workorder_id = %f and partno_id = %f', [ ABatch, AWorkorder_ID, APartno_ID ]);
  ExecuteCommandFmt('update workorder set batch = %f where id = %f', [ ABatch, AWorkorder_ID ]);
end;

procedure ValidateCertificationLevel( APR_Emp_ID, ASndop_ID: Real );
begin
  {02-21-2008 since we removed the ‘Certified Jobs’ tab from ASSY Processes, we shouldn’t be looking for job description and cert level}
  {01-15-2009 Certified Jobs reinstated}
  // EXIT;

  // nothing is defined - good to go
  if SelectValueFmtAsFloat('select count(*) from sndop_job_descrip where sndop_id = %f', [ASndop_ID]) = 0 then
     EXIT;

  // validate as supervisor
  if EmployeeJobMatchExists( APR_Emp_ID, ASndop_ID, FALSE ) then   {FD_Share.pas}
     EXIT;

  // validate as non supervisor
  IQAssert( EmployeeJobMatchExists( APR_Emp_ID, ASndop_ID, FALSE ),   {FD_Share.pas}
            Format( assy_msg0006, [ SelectValueByID('rtrim(empno)', 'pr_emp', APR_Emp_ID), SelectValueByID('rtrim(opno)', 'sndop', ASndop_ID ) ]));
end;


procedure ExecuteComponentRejectTransaction( AParam: TRejectTransCargo );
var
  AUserSelectedLocations: Boolean;
  ANon_Conform_ID: Real;
  AFGLotNo: string;

  // ---------------------------------------------------------------------------
  procedure _CheckMoveRejectsToNonConform( AParam: TRejectTransCargo; AMaster_Label_List: TStringList; AQty: Real);
  var
    AReject: TRejectModeParams;
  begin
    if not assy_share.IsRejectCodeAssignedNonConformLocation( AParam.Reject_Code_ID ) then
       EXIT;

    AReject:= TRejectModeParams.Create( AMaster_Label_List );
    AReject.RejectMode              := rmComponents;
    AReject.Workorder_ID            := AParam.Workorder_ID;
    AReject.Partno_ID               := AParam.Partno_ID;
    AReject.Arinvt_ID               := AParam.Arinvt_ID;
    AReject.MfgRejectedParts        := AQty;
    AReject.Reject_Code_ID          := AParam.Reject_Code_ID;
    AReject.Non_Conform_Locations_ID:= RejectCodeNonConformLocations_ID( AParam.Reject_Code_ID );
    AReject.TransDate               := AParam.Prod_Date;

    if ANon_Conform_ID = 0 then
    begin
      { TODO -oSanketG -cWC : Need to revisit , dependent on AssyTrack_NonConform}
      {if not TFrmAssyTrackNonConform.DoShowModal( Application, AReject ) then  // AssyTrack_NonConform.pas
         ANon_Conform_ID:= -1
      else
         ANon_Conform_ID:= AReject.Non_Conform_ID;}
    end;

    if ANon_Conform_ID <= 0 then
       EXIT;

    AReject.CheckMoveMfgRejectsToNonConform;
  end;


  // ---------------------------------------------------------------------------
  procedure _ExecuteRejectTransaction( AFGMulti_ID, AQty: Real; AMaster_Label_ID: Real = 0);
  var
    ATRansReject: TIQWebTransReject;
    ARejects_ID: Real;
    AMaster_Label_List: TStringList;
  begin
    ARejects_ID:= GetNextID('REJECTS');

    AMaster_Label_List:= TStringList.Create;
    try
      if AMaster_Label_ID > 0 then
         AMaster_Label_List.Add( FloatToStr( AMaster_Label_ID ));

      ATRansReject:= TIQWebTransReject.Create(nil);
      with ATRansReject do
      try
        FGMulti_ID   := AFGMulti_ID;
        Trans_Quan   := AQty;
        Trans_RG_Quan:= 0;
        Trans_Reason   := trans_share.ExpandRejectCodeToAttribute(AParam.Reject_Code);   // Trim( AParam.Trans_Reason );
        Receipt_Comment:= Trim( AParam.Trans_Reason );
        Act_Cost     := 0;
        Trans_Date   := AParam.Trans_Date;
        Trans_Batch  := get_assy1_translog_batch( AParam.Workorder_ID, AParam.Partno_ID ); {assy_share.pas}
        Workorder_ID := AParam.Workorder_ID;
        Trans_Source := 'REJECTS';
        Trans_Source_ID:= ARejects_ID;
        Parent_Arinvt_ID:= SelectValueByID('arinvt_id', 'partno', AParam.Partno_ID);
        FG_LotNo     := AParam.FgLotNo;
        Sub_Batch    := AParam.Sub_Batch;
        Ptoper_ID    := AParam.Ptoper_ID;

        {typecasted just in order to get to the TransBatchAutoInc property}
        TIQWebTransDispoBase(ATRansReject).TransBatchAutoInc:= Trans_Batch = 0;

        if AMaster_Label_List.Count > 0 then
           Master_Label_List:= AMaster_Label_List;

        {11-03-2008 just to be on the safe side request explicitly to consume serialized items as oppose to making any MANUAL OUT transaction to do that automatically}
        {04-14-2009 instruct to record cost_element}
        {04-01-2014 account for user selected locations and labels}
        if AUserSelectedLocations then
           Attribute:= 'RECORD_COST_ELEMENT'
        else
           Attribute:= 'CHECK_CONSUME_SERIALIZED;RECORD_COST_ELEMENT';

        // update back the label qty just in case they changed it
        if Abs(SelectValueByID('qty', 'master_label', AMaster_Label_ID) - Trans_Quan) > 0.000001 then
        begin
           ExecuteCommandFmt('update master_label set qty = qty - %f where id = %f', [ Trans_Quan, AMaster_Label_ID ]);
           SkipMasterLabelUpdate:= True;
        end;

        Execute;

        assy_share.UpdateProcessWipActCost( AParam.Sndop_Dispatch_ID, AParam.Sub_Batch, Trans_Source {REJECTS},  Trans_Source_ID {Rejects_ID} );

        {if this is the first trans for this woorkorder/partno - record batch in ptorder to keep all the future trans under the same batch}
        if TIQWebTransDispoBase(ATRansReject).TransBatchAutoInc then
           assign_assy1_translog_batch( AParam.Workorder_ID, AParam.Partno_ID, Trans_Batch );

        // Insert rejects and populate arinvt_id and ta_labor_id.
        // Note we assign ta_labor_id regardless of the sndop record
        // against thich they reject consumed components.
{
        ExecuteCommandFmt(
          'insert into rejects '+
          '       ( id, prod_date, shift, hist_illum_part_id, rejects, arinvt_id, source, reject_code, trans_reason, '+
          '         ta_labor_id, parent_id, translog_sub_batch, fg_lotno, ptoper_id, components_reject, workorder_id ) ' +
          'values ( %f, To_Date(''%s'', ''MM/DD/RRRR''), NULL, NULL, %f, %f, ''AS'', ''%s'', ''%s'', '+
          '         %f, %s, ''%s'', ''%s'', %s, ''Y'', %f )',
          [ ARejects_ID,
            FormatDateTime('mm/dd/yyyy', AParam.Prod_Date ),
            AQty,                 //  AParam.Reject_Qty,
            AParam.Arinvt_ID,
            AParam.Reject_Code,
            FixStr(Trim( AParam.Trans_Reason )),
            AParam.TA_Labor_ID,
            IQMS.Common.StringUtils.FloatToStr0asNull( AParam.ParentRejects_ID, 'NULL'),
            IQMS.Common.StringUtils.FloatToStr0asNull( AParam.Sub_Batch ),
            AParam.FgLotNo,
            IQMS.Common.StringUtils.FloatToStr0asNull( AParam.Ptoper_ID, 'null' ),
            AParam.Workorder_ID]);
}
        ExecuteCommandParam(
          'INSERT INTO rejects(id,                      '#13 +
          '                    prod_date,               '#13 +
          '                    shift,                   '#13 +
          '                    hist_illum_part_id,      '#13 +
          '                    rejects,                 '#13 +
          '                    arinvt_id,               '#13 +
          '                    source,                  '#13 +
          '                    reject_code,             '#13 +
          '                    trans_reason,            '#13 +
          '                    ta_labor_id,             '#13 +
          '                    parent_id,               '#13 +
          '                    translog_sub_batch,      '#13 +
          '                    fg_lotno,                '#13 +
          '                    ptoper_id,               '#13 +
          '                    components_reject,       '#13 +
          '                    workorder_id,            '#13 +
          '                    day_part_id)             '#13 +
          '    VALUES (:ID,                             '#13 +
          '            :PROD_DATE,                      '#13 +
          '            NULL,                            '#13 +
          '            NULL,                            '#13 +
          '            :REJECTS,                        '#13 +
          '            :ARINVT_ID,                      '#13 +
          '            :SOURCE,                         '#13 +
          '            :REJECT_CODE,                    '#13 +
          '            :TRANS_REASON,                   '#13 +
          '            :TA_LABOR_ID,                    '#13 +
          '            :PARENT_ID,                      '#13 +
          '            :TRANSLOG_SUB_BATCH,             '#13 +
          '            :FG_LOTNO,                       '#13 +
          '            :PTOPER_ID,                      '#13 +
          '            ''Y'',                           '#13 +
          '            :WORKORDER_ID,                   '#13 +
          '            :DAY_PART_ID)                    ',
          ['ID;INT64',
           'PROD_DATE;D',
           'REJECTS;FLOAT',
           'ARINVT_ID;INT64',
           'SOURCE;STRING',
           'REJECT_CODE;STRING',
           'TRANS_REASON;STRING',
           'TA_LABOR_ID;INT64',
           'PARENT_ID;INT64',
           'TRANSLOG_SUB_BATCH;INT64',
           'FG_LOTNO;STRING',
           'PTOPER_ID;INT64',
           'WORKORDER_ID;INT64',
           'DAY_PART_ID;INT64'
          ],
          [ Trunc(ARejects_ID), // 'ID;INT64'
            AParam.Prod_Date, // 'PROD_DATE;D'
            AQty, // 'REJECTS;F'
            Trunc(AParam.Arinvt_ID), // 'ARINVT_ID;INT64'
            AParam.Source, // 'SOURCE'
            AParam.Reject_Code, // 'REJECT_CODE'
            FixStr(AParam.Trans_Reason.Trim), // 'TRANS_REASON'
            NullIfZero(Trunc(AParam.TA_Labor_ID)), // 'TA_LABOR_ID'
            NullIfZero(Trunc(AParam.ParentRejects_ID)), // 'PARENT_ID'
            NullIfZero(Trunc(AParam.Sub_Batch)), // 'TRANSLOG_SUB_BATCH'
            AParam.FgLotNo, // 'FG_LOTNO'
            NullIfZero(Trunc(AParam.Ptoper_ID)), // 'PTOPER_ID'
            Trunc(AParam.Workorder_ID), // 'WORKORDER_ID;INT64'
            NullIfZero(AParam.DayPartID) // 'DAY_PART_ID;INT64'
          ]);

        if not IsConsole then
           _CheckMoveRejectsToNonConform( AParam, AMaster_Label_List, AQty );
      finally
        Free;
      end;
    finally
      AMaster_Label_List.Free;
    end;
  end;

  // ---------------------------------------------------------------------------
  procedure _execute_based_on_selected;
  begin
    with TFDQuery.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add(Format('select fgmulti_id, quan, master_label_id       '+
                     '  from work_opmat_rejects_loc                  '+
                     ' where work_opmat_rejects_id = %.0f order by id',
                      [  AParam.WorkOpmatRejects_ID ]));
      Open;
      while not Eof do
      begin
        _ExecuteRejectTransaction( FieldByName('fgmulti_id').asFloat,
                                   FieldByName('quan').asFloat,
                                   FieldByName('master_label_id').asFloat );
        Next;
      end;
    finally
      Free;
    end;
  end;

  // ---------------------------------------------------------------------------
  procedure _execute_based_on_fifo;
  var
    AList: TList;
    I    : Integer;
  begin
    AList:= TList.Create;
    try
      GetAutoDispoFGMultiFIFO( AList,                         {IQMS.Common.Dispo.pas}
                               AParam.Reject_Qty,
                               0,                             // ARG_Qty
                               AParam.Arinvt_ID,
                               AParam.Standard_ID,
                               'TEMPORARY',                   // DefaultLocation
                               AParam.Work_Center_ID,
                               0,                             // Division_ID
                               FALSE,                         // AInclude_All_Locations
                               '',                            // AMandatoryLotNo
                               0,                             // AShipment_Dtl_ID_In_Transit - passed from receiving pending outsource asns. See oc_transfer_pend_asn.pas
                               AParam.Workorder_ID );         // pass workorder_id to check for hardallocated materials
      for I:= 0 to AList.Count - 1 do with TFGMultiFIFO( AList[ I ]) do
          _ExecuteRejectTransaction( FGMulti_ID, Qty );
    finally
      ClearListOfObjects( AList );
      AList.Free;
    end;
  end;

// -----------------------------------------------------------------------------
// ExecuteComponentRejectTransaction
// -----------------------------------------------------------------------------
begin
  ANon_Conform_ID:= 0;

  AUserSelectedLocations:= SelectValueFmtAsFloat('select count(*) from work_opmat_rejects_loc where work_opmat_rejects_id = %f',
                                     [ AParam.WorkOpmatRejects_ID ]) > 0;
  if AUserSelectedLocations then
     _execute_based_on_selected
  else
     _execute_based_on_fifo;
end;


function get_assy1_backflush_each_process( AStandard_ID: Real ): Boolean;
begin
  // Result:= SelectValueFmtAsString('select assy1_backflush_each_process from standard where id = %f', [ AStandard_ID ]) = 'Y';
  // 10-14-2008 assy1_backflush_each_process is obsolete
  Result:= TRUE;
end;


function ExecuteBackflushedWIPTransaction( ATA_Labor_ID: Real;
                                           SrcArinvt: TDataSource;
                                           AFGLotNo: string = '';
                                           ATransDate: TDateTime = 0;
                                           ASubBatch: Real = 0;
                                           AMatReqBatch: Real = 0): Real;
var
  A: Variant;
  AConsumeMaterialByProcess: Boolean;
begin
  Result:= 0;
  IQAssert( SrcArinvt.DataSet <> nil, 'Error executing ExecuteBackflushedWIPTransaction: parameter SrcArinvt.DataSet is undefined');
  SrcArinvt.DataSet.Open;

  A:= SelectValueArrayFmt( 'select t.process_qty,                                        '+
                      '       w.standard_id,                                        '+
                      '       t.workorder_id,                                       '+
                      '       t.partno_id,                                          '+
                      '       assy1_sched.get_work_center_of_process( t.workorder_id, t.partno_id, t.ptoper_id ) as work_center_id, '+
                      '       t.sndop_id,                                           '+
                      '       t.ptoper_id                                           '+
                      '  from                                                       '+
                      '       ta_labor t,                                           '+
                      '       workorder w                                           '+
                      ' where t.id = %f                                             '+
                      '   and t.workorder_id = w.id(+)                                 ',
                      [ ATA_Labor_ID ]);
  IQAssert( VarArrayDimCount( A ) > 0, IQFormat('Error executing WIP transaction: unable to locate ta_labor_id = %f', [ ATA_Labor_ID ]));

  // 01-30-2014 backflush material when not using percent complete or percent complete with consume by process
  AConsumeMaterialByProcess:= SelectValueFmtAsFloat('select assy1_misc.consume_material_by_process( %f ) from dual', [ DtoF(A[ 2 ]) ]) = 1;

  (*with TFrmTranDialogSilentAutoBackflush_ExWIP.Create( SrcArinvt,              {TranDlg.pas}
                                                       A[ 0 ],                 // MainItemQty,
                                                       'Report Process WIP',
                                                       A[ 1 ],                 // STANDARD_ID
                                                       A[ 2 ],                 // WORKORDER_ID
                                                       A[ 3 ],                 // PARTNO_ID
                                                       A[ 4 ],                 // WORK_CENTER_ID
                                                       A[ 5 ],                 // sndop_id
                                                       A[ 6 ]) do              // ptoper_id
  try
    // 10-25-2013 we never backflush percent complete based. Note process_qty is now populated therefore we need to manually turn off the backflush
    // 01-30-2014 open it up
    if (SelectValueFmtAsFloat('select assy1_misc.use_percent_complete( %f ) from dual', [ DtoF(A[ 2 ]) ]) = 1)      // use percent complete
       and
       not AConsumeMaterialByProcess then // and not consume by process
    begin
      chkBackflush.Checked:= FALSE;
      NeedsMatReqCalc     := FALSE;
    end;

    // 01-28-2014 reassign batch based on passed AMatReqBatch. work_mat_req and work_mat_loc are preassigned.
    // if work_mat_loc is not assigned then system will designate location on-fly and even SIC will get auto consumed
    if (AMatReqBatch > 0) and AConsumeMaterialByProcess then
    begin
      ReAssignBatchID( AMatReqBatch );
      KeepExistingBackflushMaterials:= TRUE;
    end;

    // note if KeepExistingBackflushMaterials assigned above is true we will preserve work_mat_req (sic and non sic) and work_mat_loc
    AssignDefaultAutoDispoQtys( A[ 0 ] {MainQty}, A[ 4 ] {work_center}, AFGLotNo {lotno},  A[ 2 ] {workorder} );

    { Assy Data never writes labor/overhead when loggin out because user is supposed to post TA records
      that will create overhead and labor based on ta_labor entries.

      Assy Track does write labor/overhead after calling this function.
      So either way do not write labor/overhead to translog from here. }
    PostLaborOverhead:= FALSE;

    {Do on-fly phantom in/out transaction}
    ExecInOutOnFlyPhantom:= TRUE;

    {AssyData allows user to report production from the dispatch list - user can specify any prod date - make it trans date}
    if ATransDate > 0 then
       wwTmPkTranDate.DateTime:= ATransDate; // Trunc(ATransDate);

    {allow consumed SIC items labels to be consumed}
    AutoConsumeSICItemLabels:= TRUE;

    {10-08-2013 EIQ-1188: ASSY1 Actual Costing labor and OH with 0 good parts - PIT and Process Cost}
    TransComponent.AllowZeroQty:= TRUE;

    if ASubBatch <> 0 then
      TransComponent.Sub_Batch := ASubBatch;

    btnDisposition.Click;

    Result:= TransComponent.Sub_Batch;
  finally
    Free;
  end;*)
  // // 09-25-2008
  // if AMarkProcessed then
  //    ExecuteCommandFmt('update ta_labor set processed = ''Y'' where id = %f', [ ATA_Labor_ID ]);
end;


procedure UpdatePrevMaintCounter( ASndop_ID, ACycles: Real );
begin
  ExecuteCommandFmt('declare                                      '+
            '  v_sndop_id number::= %f;                   '+
            '  v_cycles   number::= %f;                   '+
            'begin                                        '+
            '  for v in ( select b.pmeqmt_id              '+
            '               from sndop_aux a,             '+
            '                    aux_pmeqmt b             '+
            '              where a.sndop_id = v_sndop_id  '+
            '                and a.aux_id = b.aux_id )    '+
            '  loop                                       '+
            '    prev_maint.update_counters( v.pmeqmt_id, '+
            '                                v_cycles,    '+
            '                                ''CYCLES'',  '+
            '                                sysdate);    '+
            '  end loop;                                  '+


            '  for v in ( select pmeqmt_id                '+
            '               from sndop_pmeqmt             '+
            '              where sndop_id = v_sndop_id )  '+
            '  loop                                       '+
            '    prev_maint.update_counters( v.pmeqmt_id, '+
            '                                v_cycles,    '+
            '                                ''CYCLES'',  '+
            '                                sysdate);    '+
            '  end loop;                                  '+

            'end;                                         ',
            [ ASndop_ID, ACycles ]);
end;


procedure UpdatePrevMaintCounterAllProcesses( APartno_ID, ACycles: Real );
begin
  with TFDQuery.Create(nil) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add(Format('select sndop_id from ptoper where partno_id = %.0f', [ APartno_ID ] ));
    Open;
    while not Eof do
    begin
      UpdatePrevMaintCounter( FieldByName('sndop_id').asFloat, ACycles );
      Next;
    end;
  finally
    Free;
  end;
end;

procedure UpdatePrevMaintCounterPickedAtLineClearance( ASndop_Clear_Line_ID, ACycles: Real );
begin
  ExecuteCommandFmt('declare                                      '+
            '  v_sndop_clear_line_id number::= %f;        '+
            '  v_cycles   number::= %f;                   '+
            'begin                                        '+
            '  for v in ( select pmeqmt_id                '+
            '               from sndop_clear_line_pmeqmt  '+
            '              where sndop_clear_line_id = v_sndop_clear_line_id ) '+
            '  loop                                       '+
            '    prev_maint.update_counters( v.pmeqmt_id, '+
            '                                v_cycles,    '+
            '                                ''CYCLES'',  '+
            '                                sysdate);    '+
            '  end loop;                                  '+
            'end;                                         ',
            [ ASndop_Clear_Line_ID, ACycles ]);
end;


procedure CheckUpdatePrevMaintCounterPickedAtLineClearance( ATALabor_ID, ACycles: Real );
var
  ASndop_ID: Real;
  ASndop_Clear_Line_ID: Real;
  A: Variant;
begin
  A:= SelectValueArrayFmt( 'select sndop_id, sndop_clear_line_id from ta_labor where id = %f', [ ATALabor_ID ]);
  if VarArrayDimCount( A ) = 0 then EXIT;

  ASndop_ID           := A[ 0 ];
  ASndop_Clear_Line_ID:= A[ 1 ];

  if (ASndop_Clear_Line_ID = 0) or (SelectValueFmtAsFloat( 'select count(*) from sndop_clear_line_pmeqmt where sndop_clear_line_id = %f', [ ASndop_Clear_Line_ID ]) = 0) then
     UpdatePrevMaintCounter( ASndop_ID, ACycles )
  else
     UpdatePrevMaintCounterPickedAtLineClearance( ASndop_Clear_Line_ID, ACycles );
end;



function IsProcessLinkedToPartno( APartno_ID, ASndop_ID: Real ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select 1 from ptoper where partno_id = %f and sndop_id = %f', [ APartno_ID, ASndop_ID ]) = 1;
end;


function get_process_total_good_and_rejected_parts( AWorkorder_ID, APtoper_ID: Real ): Real;
var
  AGoodParts: Real;
  ARejectedParts: Real;
begin
  AGoodParts:= get_process_total_good_parts( AWorkorder_ID, APtoper_ID );

  ARejectedParts:= SelectValueFmtAsFloat('select sum( r.rejects )                 '+
                             '   from                                 '+
                             '        ta_labor t, partno p, rejects r '+
                             '  where                                 '+
                             '        t.source in (''WO'', ''JS'')    '+
                             '    and t.ptoper_id = %f                '+
                             '    and t.workorder_id = %f             '+
                                  // link partno to get arinvt_id
                             '    and t.partno_id = p.id              '+
                                  // link all rejects belonging to this ta_labor
                             '    and t.id = r.ta_labor_id            '+
                                  // limit to mfg part
                             '    and r.arinvt_id = p.arinvt_id       ',
                             [ APtoper_ID, AWorkorder_ID ]);

  Result:= AGoodParts + ARejectedParts;
end;

function IsUsePercentComplete( AWorkorder_ID: Real ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select assy1_misc.use_percent_complete( %f ) from dual', [ AWorkorder_ID ]) = 1;
end;

function GetProcessPercentComplete( AWorkorder_ID, APtoper_ID: Real ): Real;
var
  A: Variant;
  APartno_ID: Real;
  APtOrder_ID: Real;
begin
  Result:= 0;

  A:= SelectValueArrayFmt( 'select id, partno_id from ptorder where workorder_id = %f', [ AWorkorder_ID ]);
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  APtOrder_ID:= A[ 0 ];
  APartno_ID := A[ 1 ];

  Result:= SelectValueFmtAsFloat('select complete from c_ta_labor where workorder_id = %f and partno_id = %f and ptoper_id = %f',
            [ AWorkorder_ID,
              APartno_ID,
              APtoper_ID ]);
end;

function get_process_total_good_parts( AWorkorder_ID, APtoper_ID: Real ): Real;
begin
  Result:= 0;

  if not IsUsePercentComplete( AWorkorder_ID ) then
     Result:= SelectValueFmtAsFloat('select sum(process_qty) from ta_labor '+
                        ' where source in (''WO'', ''JS'') and ptoper_id = %f and workorder_id = %f',
                        [ APtoper_ID, AWorkorder_ID ])
  else
     { TODO -oSanketG -cWC : Need to revisit, dependent on AssyTrack_Main }
     //Result:= TFrmAssyTrackMain.CalcWorkOrderOrigQtyEx( AWorkorder_ID ) * GetProcessPercentComplete( AWorkorder_ID, APtoper_ID ) / 100;
end;


function get_outstanding_workorder_parts( AWorkorder_ID, APartno_ID: Real ): Real;
begin
  Result:= SelectValueFmtAsFloat('select sum(ptorder_rel.rel_quan)           '+
                     '  from ptorder, ptorder_rel                '+
                     ' where ptorder.workorder_id = %f           '+
                     '   and ptorder.partno_id = %f              '+
                     '   and ptorder_rel.ptorder_id = ptorder.id '+
                     '   and ptorder_rel.rel_quan > 0            ',
                     [ AWorkorder_ID, APartno_ID ]);
end;


function get_total_final_assembly_qty( AWorkorder_ID, APartno_ID: Real ): Real;
var
  AArinvt_ID: Real;
begin
  Result:= 0;
  AArinvt_ID:= SelectValueByID('arinvt_id', 'partno', APartno_ID );
  if AArinvt_ID = 0 then
     EXIT;

  Result:= SelectValueFmtAsFloat('select sum(trans_quan) from translog                   '+
                     ' where workorder_id = %f                               '+
                     '   and arinvt_id = %f                                  '+
                     '   and trans_type = ''FINISH PROCESS WIP''             '+
                     '   and rtrim(trans_in_out) = ''IN''                    '+
                     '   and upper(rtrim(trans_reason)) = ''FINAL ASSEMBLY'' ',
                     [ AWorkorder_ID,
                       AArinvt_ID ]);
end;


procedure ExecuteCalcMatReq( ACargo: TCalcMatReq );
begin
  ExecuteCommandFmt('declare                                          '+
            '  v_arinvt_id     number:= %f;                   '+
            '  v_qty_req       number:= %.6f;                 '+
            '  v_batch_id      number:= %f;                   '+
            '  v_standard_id   number:= %f;                   '+
            '  v_workorder_id  number:= %f;                   '+
            '  v_ptoper_id     number:= %s;                   '+
            'begin                                            '+
            '  delete from work_mat_req where batch_id = v_batch_id; '+
            '  inventory_trans.calc_mat_req( v_arinvt_id,     '+
            '                                v_qty_req,       '+
            '                                v_batch_id,      '+
            '                                v_standard_id,   '+
            '                                v_workorder_id,  '+
            '                                v_ptoper_id );   '+
            'end;                                             ',
            [ ACargo.MainArinvt_ID,
              ACargo.Qty,
              ACargo.Batch,
              ACargo.Standard_ID,
              ACargo.Workorder_ID,
              IQMS.Common.StringUtils.FloatToStr0asNull( ACargo.PtOper_ID, 'null')]);
end;


procedure PopulateWorkOpMatRejectsEx( ABatchMatReq,
                                      ABatchRejects,
                                      AMainArinvt_ID,
                                      AQty,
                                      AStandard_ID,
                                      AWorkorder_ID,
                                      APtoper_ID: Real;
                                      ARejectMode: TRejectMode;
                                      AIncludePrevProcesses: Boolean;
                                      ASndop_Dispatch_ID: Real;
                                      AReject_Code_ID: Real );
var
  ACargo: TCalcMatReq;
  ARejectingMfgPartsIncludePrevProcesses: Boolean;
  ASeq: Real;
begin
  ARejectingMfgPartsIncludePrevProcesses:= (ARejectMode = rmMfgParts) and  AIncludePrevProcesses;

  ACargo:= TCalcMatReq.Create( ABatchMatReq );
  ACargo.MainArinvt_ID:= AMainArinvt_ID;
  ACargo.Qty:= AQty;
  ACargo.Standard_ID:= AStandard_ID;
  ACargo.Workorder_ID:= AWorkorder_ID;
  ACargo.PtOper_ID:= fIIf( ARejectingMfgPartsIncludePrevProcesses, 0, APtoper_ID );

  ExecuteCalcMatReq( ACargo );

  if ARejectingMfgPartsIncludePrevProcesses then
  begin
    ASeq:= SelectValueByID('opseq', 'sndop_dispatch', ASndop_Dispatch_ID );
    if ASeq > 0 then
       ExecuteCommandFmt('delete from work_mat_req where batch_id = %f and opseq > %f', [ ABatchMatReq, ASeq ]);
  end;

  ExecuteCommandFmt('delete from work_opmat_rejects where batch = %f', [ ABatchRejects ]);
  ExecuteCommandFmt('insert into work_opmat_rejects '+
            '     ( batch,                  '+
            '       work_mat_req_id,        '+
            '       opmat_id,               '+
            '       reject_code_id,         '+
            '       sndop_id,               '+
            '       ptoper_id,              '+
            '       qty )                   '+
            'select %f,                     '+
            '       a.id,                   '+
            '       a.opmat_id,             '+
            '       %s,                     '+
            '       b.sndop_id,             '+
            '       a.ptoper_id,            '+
            '       a.qty                   '+
            '  from work_mat_req a,         '+
            '       ptoper b                '+
            ' where a.batch_id = %f         '+
            '   and a.ptoper_id = b.id(+)   '+   // do I need outer join
            '   and nvl(a.qty,0) <> 0       '+
            'order by a.id                  ',
            [ ABatchRejects,
              FloatToStr0asNull( AReject_Code_ID, 'null'),
              ABatchMatReq ]);
end;

procedure PopulateWorkOpMatRejects( ABatch, AStandard_ID, APartno_ID, ASndop_ID, APtoper_ID, ACurrentOpSeq, ARejectMfgParts: Real; ARejectMode: TRejectMode; AReject_Code_ID: Real = 0);
var
  ACheckLimitToCurrentProcess: string;
begin
  ACheckLimitToCurrentProcess:= '';
  if (ARejectMode = rmMfgParts) and (ASndop_ID <> -1) then
      ACheckLimitToCurrentProcess:= IQFormat(' and s.id = %f', [ ASndOp_ID ]);

  if (ARejectMode = rmMfgParts) and (APtoper_ID <> -1) then
      ACheckLimitToCurrentProcess:= ACheckLimitToCurrentProcess + IQFormat(' and ptoper.id = %f', [ APtoper_ID ]);

  ExecuteCommandFmt('insert into work_opmat_rejects                                        '+
            '     ( batch,                                                         '+
            '       opmat_id,                                                      '+
            '       reject_code_id,                                                '+
            '       sndop_id,                                                      '+
            '       ptoper_id,                                                     '+
            '       qty )                                                          '+
            'select                                                                '+
            '       %f,                                                            '+  // batch
            '       o.id as opmat_id,                                              '+
            '       ''%s'',                                                        '+
            '       ptoper.sndop_id,                                               '+
            '       ptoper.id,                                                     '+
            '       %.6f * inv_cost.items_per( a.class, o.ptsper, decode( o.exclude_scrap_dispo, ''Y'', 0, o.scrap )) as qty '+  // mfg_parts * ptsper
            '  from                                                                '+
            '       partno p, ptoper, sndop s, opmat o, arinvt a                   '+
            ' where p.id = %f                                                      '+  // partno_id
            '   and p.id = ptoper.partno_id                                        '+
            '   and ptoper.sndop_id = s.id                                         '+
            '   and s.id = o.sndop_id                                              '+
            '   and o.arinvt_id = a.id                                             '+
            '   and nvl(o.exclude_backflush, ''N'') <> ''Y''                       '+
            '   and nvl(a.exclude_backflush, ''N'') <> ''Y''                       '+
            '   and nvl(a.non_material, ''N'') <> ''Y''                            '+
            '   and nvl(o.exclude_rejects_backflush, ''N'') <> ''Y''               '+
            '   and nvl(ptoper.opseq,0) <= %f                                      '+  // current sequence
              ACheckLimitToCurrentProcess,                                             // if we reject mfg parts and backflush is on - limit rejects to current process
            [ ABatch,
              FloatToStr0asNull( AReject_Code_ID ),
              ARejectMfgParts,
              APartno_ID,
              ACurrentOpSeq ]);
end;


procedure PopulateWorkOpMatRejects_HardAlloc( AWorkorder_ID, ABatch, AStandard_ID, APartno_ID, ASndop_ID, APtoper_ID, ACurrentOpSeq, ARejectMfgParts: Real; ARejectMode: TRejectMode; AReject_Code_ID: Real = 0);
var
  ACheckLimitToCurrentProcess: string;
begin
  ACheckLimitToCurrentProcess:= '';
  if (ARejectMode = rmMfgParts) and (ASndop_ID <> -1) then
      ACheckLimitToCurrentProcess:= IQFormat(' and s.id = %f', [ ASndOp_ID ]);

  if (ARejectMode = rmMfgParts) and (APtoper_ID <> -1) then
      ACheckLimitToCurrentProcess:= ACheckLimitToCurrentProcess + IQFormat(' and ptoper.id = %f', [ APtoper_ID ]);

  ExecuteCommandFmt('insert into work_opmat_rejects                                        '+
            '     ( batch,                                                         '+
            '       opmat_id,                                                      '+
            '       reject_code_id,                                                '+
            '       sndop_id,                                                      '+
            '       ptoper_id,                                                     '+
            '       qty )                                                          '+
            'select                                                                '+
            '       %f,                                                            '+  // batch
            '       nvl( o.opmat_id, -o.id) as opmat_id,                           '+
            '       ''%s'',                                                        '+
            '       ptoper.sndop_id,                                               '+
            '       ptoper.id,                                                     '+
            '       %.6f * decode( nvl(a.class, ''*''),                            '+
            '                      ''PK'', 1 / IQMS.Common.Miscellaneous.no_zero(o.ptsper_internal),  '+
            '                      o.ptsper_internal ) / (1 - nvl(o.scrap,0)/100)  as qty '+  // mfg_parts * ptsper
            '  from                                                                '+
            '       partno p, ptoper, sndop s, workorder_bom o, arinvt a, opmat    '+
            ' where p.id = %f                                                      '+  // partno_id
            '   and p.id = ptoper.partno_id                                        '+
            '   and ptoper.sndop_id = s.id                                         '+
            '   and s.id = o.sndop_id                                              '+
            '   and o.workorder_id = %f                                            '+
            '   and o.arinvt_id = a.id                                             '+
            '   and nvl(a.exclude_backflush, ''N'') <> ''Y''                       '+
            '   and nvl(a.non_material, ''N'') <> ''Y''                            '+
            '   and o.opmat_id = opmat.id(+)                                       '+
            '   and nvl(opmat.exclude_rejects_backflush, ''N'') <> ''Y''           '+
            '   and nvl(ptoper.opseq,0) <= %f                                      '+  // current sequence
              ACheckLimitToCurrentProcess,                                             // if we reject mfg parts and backflush is on - limit rejects to current process
            [ ABatch,
              FloatToStr0asNull( AReject_Code_ID ),
              ARejectMfgParts,
              APartno_ID,
              AWorkorder_ID,
              ACurrentOpSeq ]);
end;


function WriteRejectedMfgPartsToRejects( AParam: TRejectMfgPartCargo ): Real;
begin
  Result:= GetNextID('rejects');
  ExecuteCommandFmt('insert into rejects '+
            '       (  id, prod_date, shift, hist_illum_part_id, rejects, arinvt_id, source, ta_labor_id, workorder_id, trans_reason, reject_code, translog_sub_batch, kind, fg_lotno) ' +
            'values ( %f, To_Date(''%s'', ''MM/DD/RRRR''), NULL, NULL, %f, %f, ''AS'', %s, %f, ''Reject mfg parts'', ''%s'', %s, %d, ''%s'' )',
            [ Result,
              FormatDateTime('mm/dd/yyyy', Date ),
              AParam.RejectedMfgParts,
              AParam.Arinvt_ID,
              IQMS.Common.StringUtils.FloatToStr0asNull( AParam.TA_Labor_ID, 'NULL' ),
              AParam.Workorder_ID,
              SelectValueByID('reject_code', 'reject_code', AParam.Reject_Code_ID ),
              IQMS.Common.StringUtils.FloatToStr0asNull( AParam.Sub_Batch, 'NULL' ),
              Ord( AParam.MfgRejectKind ),
              AParam.FG_Lotno]);

  // update rejected mfg parts in ta_labor
  ExecuteCommandFmt('update ta_labor set reject_qty = nvl(reject_qty,0) + %.6f where id = %f', [ AParam.RejectedMfgParts, AParam.TA_Labor_ID ]);

  CheckUpdatePrevMaintCounterPickedAtLineClearance( AParam.TA_Labor_ID, AParam.RejectedMfgParts );
end;


function GetProcessRejectsEditKind( AStandard_ID: Real; ARejectMode: TRejectMode ): TProcessRejectsEditKind;
begin
  case ARejectMode of
    rmComponents:
       Result:= prekAllAbove;    // ALL ABOVE INCLUDING CURRENT
    rmMfgParts  :
       Result:= prekSelected;  //  'ONLY CURRENT';
  end;
end;


function IsSerialized( AArinvt_ID: Real ): Boolean;
begin
  Result:= SelectValueByID( 'is_linked_to_serial', 'arinvt', AArinvt_ID ) = 'Y';
end;

procedure update_ptorder_backflushed( AWorkorder_ID, APartno_ID, ASndop_ID, AArinvt_ID, AQty: Real );
begin
  // 03-14-2012  looks like obsolete

  if (AWorkorder_ID = 0) or (APartno_ID = 0) or (ASndop_ID = 0) or (AArinvt_ID = 0) or (AQty = 0) then
     EXIT;

  ExecuteCommandFmt('begin                                            '+
            '  assy1_misc.update_ptorder_backflushed( %f,     '+   // v_workorder_id
            '                                         %f,     '+   // v_partno_id
            '                                         %f,     '+   // v_sndop_id
            '                                         %f,     '+   // v_arinvt_id
            '                                         %.6f ); '+   // v_qty
            'end;',
            [ AWorkorder_ID, APartno_ID, ASndop_ID, AArinvt_ID, AQty ]);
end;


function GetQtyBasedOnTranslog( ASub_Batch, AArinvt_ID: Real; AIsMfgPart: Boolean; AVoidType: TVoidType ): Real;
begin
  if AIsMfgPart then
     begin
       if AVoidType = vtVoidMfgRejects then
          Result:= SelectValueFmtAsFloat('select sum(assy1_void_reject_quan) from translog where sub_batch = %f and arinvt_id = %f', [ ASub_Batch, AArinvt_ID ])
       else
          Result:= SelectValueFmtAsFloat('select sum(wip_quan) from translog where sub_batch = %f and arinvt_id = %f', [ ASub_Batch, AArinvt_ID ])
     end
  else
     Result:= SelectValueFmtAsFloat('select sum(trans_quan) from translog where sub_batch = %f and arinvt_id = %f', [ ASub_Batch, AArinvt_ID ]);
end;

function ReverseBackflushMfgPart( ACargo: TReverseBackflushCargo ): Real;
var
  ASub_Batch: Real;
  APartno_ID: Real;
  AWorkorder_ID: Real;
  ATransErrCode: Integer;
  ASndop_Dispatch_ID: Real;
  AReverseSub_Batch: Real;

  procedure Local_AdjustRejectedQuanBasedOnTranslog;
  begin
    if ACargo.VoidType in [vtVoidRejects, vtVoidMfgRejects] then
       // adjust children rejects
       with TFDQuery.Create(nil) do
       try
         Connection := UniMainModule.FDConnection1;
         SQL.Add(IQFormat('select id, arinvt_id from rejects where parent_id = %f', [ ACargo.Rejects_ID ]));
         Open;
         while not Eof do
         begin
           AdjustRejectedQuanBasedOnTranslog( ASub_Batch,
                                      FieldByName('arinvt_id').asFloat,  {component arinvt_id}
                                      FieldByName('id').asFloat,         {component rejects id}
                                      SelectValueFmtAsFloat('select ta_labor_id from rejects where id = %f', [ FieldByName('id').asFloat ]),
                                      ACargo.VoidType );
           Next;
         end;
       finally
         Free;
       end;

    // adjust parent (mfg item) reject or good parts in ta_labor
    AdjustRejectedQuanBasedOnTranslog( ASub_Batch,
                               ACargo.Arinvt_ID,
                               ACargo.Rejects_ID,
                               ACargo.TA_Labor_ID,  {ta_labor_id of the main mfg item}
                               ACargo.VoidType,
                               TRUE {mfg part});
  end;

begin
  Result:= -1;
  ASub_Batch   := ACargo.Sub_Batch;
  AWorkorder_ID:= SelectValueByID('workorder_id', 'ta_labor', ACargo.TA_Labor_ID);  // 03-06-2009 this will allow checking and moving components into hard allocated to the same wo fgmulti
  APartno_ID   := SelectValueByID('partno_id', 'ta_labor', ACargo.TA_Labor_ID);
  ASndop_Dispatch_ID:= SelectValueFmtAsFloat('select id from sndop_dispatch where workorder_id = %f and partno_id = %f and sndop_id = %f and ptoper_id = %f',
                                 [ AWorkorder_ID, APartno_ID, ACargo.Sndop_ID, ACargo.PtOper_ID ]);
  AReverseSub_Batch:= SelectValueByID('translog_sub_batch', 'rejects', ACargo.Rejects_ID );
  { TODO -oSanketG -cWC : Need to revisit, dependent on TranReverseBackflush }
  (*with TFrmTranDialogReverseBackfush.Create( Application,                       // AOwner,       TranReverseBackflush.pas
                                             ACargo.SrcArinvtForTrans,          // ADataSource
                                             ACargo.FGMulti_ID,                 // AFgmulti_ID
                                             ACargo.VoidQty,                    // AQty: mfg parts rejects or good parts void
                                             ACargo.SrcArinvtForTrans.DataSet.FieldByName('UNIT').asString,  // AUom
                                             ACargo.TA_Labor_ID ) do
  try
    FormStyle := fsNormal;
    edReason.Text:= ACargo.Reason;
    EnforceQtyLimit:= ACargo.VoidQty;

    TransComponent.Workorder_ID:= AWorkorder_ID;  // 03-06-2009 this will allow checking and moving components into hard allocated to the same wo fgmulti

    TransComponent.Trans_Batch := get_assy1_translog_batch( AWorkorder_ID, APartno_ID ); {assy_share.pas}
    TransComponent.TransBatchAutoInc:= TransComponent.Trans_Batch = 0;
    TransComponent.Sub_Batch:= ASub_Batch;

    if ACargo.VoidType = vtVoidMfgRejects then
       begin
         FTrans_Source   := 'REJECTS';
         FTrans_Source_ID:= ACargo.Rejects_ID;
         ReverseSub_Batch:= AReverseSub_Batch;
         TransComponent.Trans_Type:= IQMS.WebVcl.Trans.TRAN_TYPE_MANUAL; // to keep PIT happy
         TransComponent.AllowGoingNegative:= TRUE;            // we dont really take out anything (just writing WIP trans) so suppress the check
       end

    else if ACargo.VoidType = vtVoidRejects then              // 05-18-2009 when voiding mfg item rejected as existing do not allow backflush
       begin
         chkBackflush.Checked:= FALSE;
         chkBackflush.Visible:= FALSE;
         FTrans_Source   := 'REJECTS';
         FTrans_Source_ID:= ACargo.Rejects_ID;
         TransComponent.Trans_Type:= IQMS.WebVcl.Trans.TRAN_TYPE_MANUAL; // to keep PIT happy
       end

    else if (ACargo.Sndop_ID > 0) then
       begin
         FTrans_Source   := 'SNDOP';
         FTrans_Source_ID:= ACargo.Sndop_ID;
       end;

    // 06-12-2009 when voiding good parts include on-fly phantom records
    if ACargo.VoidType = vtVoidGoodParts then
    begin
       ExecInOutOnFlyPhantom:= TRUE;
       TransComponent.AllowGoingNegative:= TRUE;   // 08-09-2012 we dont take out anything from the fgmulti.onhand so no need to check the out transaction
    end;

    // force the OUT trans_quan to be moved to wip_quan column
    if ACargo.VoidType = vtVoidMfgRejects then
       TransComponent.Attribute:= 'VOID_MFG_REJECTS'
    else
       TransComponent.Attribute:= 'WIP';

    if ACargo.TransAttribute <> '' then
       TransComponent.Attribute:= IQMS.Common.StringUtils.AddToStrFmt( '%s;%s', TransComponent.Attribute, ACargo.TransAttribute );

    // 06-26-2009 when voiding mfg rejects or reverse backflush do not write labor and overhead
    if ACargo.VoidType in [vtVoidMfgRejects, vtVoidGoodParts]  then
    begin
       SkipLabor   := TRUE;
       SkipOverhead:= TRUE;
    end;

    // 04-02-2015 EIQ-5482: PIT Std - Assy1 Void MFG Part Rejects causing PIT Transaction to not balance
    if (ACargo.VoidType in [vtVoidRejects, vtVoidMfgRejects]) then
       HideUnrelatedToVoidPrompts;

    // 01-04-2012 Hughes Brothers - ASSY1 - ability to return material CRM# 584139
    if ACargo.VoidType in [vtVoidGoodParts]  then
    begin
       AllowZeroQtyOut:= TRUE;
    end;

    if ShowModal = mrOK then
    begin
      Result:= TransComponent.TransErrCode;

      if ASub_Batch = 0 then
         ASub_Batch:= TransComponent.Sub_Batch;

      {if this is the first trans for this workorder/partno - record batch in ptorder to keep all the future trans under the same batch}
      if TransComponent.TransBatchAutoInc then
        assign_assy1_translog_batch( AWorkorder_ID, APartno_ID, TransComponent.Trans_Batch );
    end;
  finally
    Free;
  end;*)

  // get rid of the rejects if any or update good parts in ta_labor
  if Result = 0 then
  begin
     Local_AdjustRejectedQuanBasedOnTranslog;
     CheckUpdatePrevMaintCounterPickedAtLineClearance( ACargo.TA_Labor_ID, - GetQtyBasedOnTranslog( ASub_Batch, ACargo.Arinvt_ID, TRUE {mfg_part}, ACargo.VoidType ));  // note we decrement counter by VoidQty
  end;

  // 10-18-2013 ASSY1 Reverse Backflush and FGMULTI act cost
  if (Result = 0) and (ASub_Batch > 0) and (ASndop_Dispatch_ID > 0) and (ACargo.VoidType = vtVoidGoodParts) then
    assy_share.UpdateProcessWipActCost( ASndop_Dispatch_ID, ASub_Batch );
end;

function GetFIFOMasterLabelForFgmulti( AFGMulti_ID: Real ): Real;
begin
  Result:= SelectValueFmtAsFloat('select id from master_label where fgmulti_id = %f order by id', [ AFGMulti_ID ]);
end;

procedure ReverseBackflushComponent( ACargo: TReverseBackflushCargo );
var
  ASub_Batch: Real;
  AMaster_Label_ID: Real;
  AIsSerialized: Boolean;
  ADB: TFDConnection;
  AFGMulti_ID: Real;
  AWasInTran: Boolean;
  AWorkorder_ID: Real;
  APartno_ID: Real;
begin
  ASub_Batch:= 0;
  AIsSerialized:= SelectValueByID('is_linked_to_serial', 'arinvt', ACargo.Arinvt_ID) = 'Y';

  AWorkorder_ID:= SelectValueByID('workorder_id', 'ta_labor', ACargo.TA_Labor_ID);
  APartno_ID   := SelectValueByID('partno_id', 'ta_labor', ACargo.TA_Labor_ID);

  ADB:= UniMainModule.FDConnection1;
  AWasInTran:= ADB.InTransaction;
  if not AWasInTran then
     ADB.StartTransaction;
  try
    // execute IN trans
    { TODO -oSanketG -cWC : Need to revisit,dependent on TranDlg }
    (*with TFrmTranDialog.Create( Application,                                                       // AOwner,       TranDlg.pas
                                ACargo.SrcArinvtForTrans,                                          // ADataSource
                                ACargo.FGMulti_ID,                                                 // AFgmulti_ID
                                ACargo.VoidQty,                                                    // AQty
                                0,                                                                 // ARG_Qty
                                ACargo.SrcArinvtForTrans.DataSet.FieldByName('UNIT').asString) do  // AUom
    try
      FormStyle := fsNormal;
      edReason.Text:= ACargo.Reason;
      EnforceQtyLimit:= ACargo.VoidQty;

      TransComponent.Workorder_ID:= SelectValueFmtAsFloat('select b.workorder_id from workorder_bom_mat_loc m, workorder_bom b where m.fgmulti_id = %f and m.workorder_bom_id = b.id',
                                              [ ACargo.FGMulti_ID ]);

      TransComponent.Trans_Batch := get_assy1_translog_batch( AWorkorder_ID, APartno_ID ); {assy_share.pas}
      TransComponent.TransBatchAutoInc:= TransComponent.Trans_Batch = 0;

      // 05-18-2009 when voiding mfg item reject do not allow backflush
      if (ACargo.VoidType = vtVoidRejects) and (SelectValueByID('standard_id', 'arinvt', ACargo.Arinvt_ID) > 0) then
         begin
           chkBackflush.Checked:= FALSE;
           chkBackflush.Visible:= FALSE;
           FTrans_Source   := 'REJECTS';
           FTrans_Source_ID:= ACargo.Rejects_ID;
           TransComponent.Trans_Type:= IQMS.WebVcl.Trans.TRAN_TYPE_MANUAL; // to keep PIT happy
         end

      else if (ACargo.Sndop_ID > 0) then
      begin
        FTrans_Source   := 'SNDOP';
        FTrans_Source_ID:= ACargo.Sndop_ID;
      end;

      // 04-02-2015 EIQ-5482: PIT Std - Assy1 Void MFG Part Rejects causing PIT Transaction to not balance
      if (ACargo.VoidType in [vtVoidRejects, vtVoidMfgRejects]) then
           HideUnrelatedToVoidPrompts;

      {execute}
      if ShowModal <> mrOK then
         EXIT;

      ASub_Batch:= TransComponent.Sub_Batch;

      {if this is the first trans for this workorder/partno - record batch in ptorder to keep all the future trans under the same batch}
      if TransComponent.TransBatchAutoInc then
        assign_assy1_translog_batch( AWorkorder_ID, APartno_ID, TransComponent.Trans_Batch );

    finally
      Free;
    end; *)

    // update master_label
    if AIsSerialized and (ASub_Batch > 0) then
    begin
      AFGMulti_ID:= SelectValueFmtAsFloat( 'select fgmulti_id from translog where sub_batch = %f and arinvt_id = %f', [ ASub_Batch, ACargo.Arinvt_ID ]);
      AMaster_Label_ID:= GetFIFOMasterLabelForFgmulti( AFGMulti_ID );
      IQAssert( AMaster_Label_ID > 0, Format('This is a serialized inventory. No associated labels found in location ''%s'' to be credited with requested qty. '#13+
                                             'Please have associated label(s) in the specified location and try again later.',
                                             [ SelectValueByID( 'rtrim(loc_desc)', 'v_fgmulti_locations', AFGMulti_ID ) ]));

      ExecuteCommandFmt('update master_label set qty = nvl(qty,0) + %.6f where id = %f',
                [ SelectValueFmtAsFloat( 'select sum(trans_quan) from translog where sub_batch = %f', [ ASub_Batch ]),
                  AMaster_Label_ID ]);
    end;

    // get rid of the reject
    if (ASub_Batch > 0) and (ACargo.Rejects_ID > 0) then
       AdjustRejectedQuanBasedOnTranslog( ASub_Batch, ACargo.Arinvt_ID, ACargo.Rejects_ID, ACargo.TA_Labor_ID{not needed but pass anyways}, ACargo.VoidType );

    if not AWasInTran then
       ADB.Commit;
  finally
    if ADB.InTransaction and not AWasInTran then
       ADB.Rollback;
  end
end;


procedure AdjustRejectedQuanBasedOnTranslog( ASub_Batch, AArinvt_ID, ARejects_ID, ATA_Labor_ID: Real; AVoidType: TVoidType; AIsMfgPart: Boolean = FALSE );
var
  AQty: Real;
begin
  // get what we put back as part of the void
  AQty:= GetQtyBasedOnTranslog( ASub_Batch, AArinvt_ID, AIsMfgPart, AVoidType );
  if AQty <= 0 then
     EXIT;

  // reduce reject_qty or good parts by that amount
  AdjustRejectedQuan( AQty, ASub_Batch, AArinvt_ID, ARejects_ID, ATA_Labor_ID, AVoidType, AIsMfgPart );
end;


procedure AdjustRejectedQuan( AQty, ASub_Batch, AArinvt_ID, ARejects_ID, ATA_Labor_ID: Real; AVoidType: TVoidType; AIsMfgPart: Boolean );
var
  AOldSub_Batch, Acct_id_reject:Real;
  procedure _AdjustRejectedPercentComplete;
  var
    AProcessQty: Real;
    APercentComplete: Real;
  begin
     AProcessQty:= SelectValueByID('process_qty', 'ta_labor', ATA_Labor_ID );
     if AProcessQty = 0 then
        AProcessQty:= AQty;
     if AProcessQty = 0 then
        AProcessQty:= 1;
     // prorated percent complete - normally we take it down all the way to 0. But just in case ...
     APercentComplete:= IQRound( SelectValueByID('complete', 'ta_labor', ATA_Labor_ID ) * AQty / AProcessQty, 2);
     ExecuteCommandFmt('update ta_labor set complete = greatest(0, nvl(complete,0) - %.6f) where id = %f and nvl(complete,0) > 0', [ APercentComplete, ATA_Labor_ID ]);
  end;

begin
  // reduce reject_qty or good parts by that amount
  if AIsMfgPart and (ATA_Labor_ID > 0) then
  begin
    if AVoidType in [vtVoidRejects, vtVoidMfgRejects] then
       ExecuteCommandFmt('update ta_labor set reject_qty = greatest( 0, nvl(reject_qty,0) - %.6f) where id = %f and nvl(reject_qty,0) > 0', [ AQty, ATA_Labor_ID ])
    else if AVoidType = vtVoidGoodParts then
       begin
         if IsUsePercentComplete( SelectValueByID('workorder_id', 'ta_labor', ATA_Labor_ID)) then
            _AdjustRejectedPercentComplete;
         ExecuteCommandFmt('update ta_labor set process_qty = greatest( 0, nvl(process_qty,0) - %.6f) where id = %f and nvl(process_qty,0) > 0', [ AQty, ATA_Labor_ID ]);
       end;
  end;

  // reduce the rejects by that amount
  if AVoidType in [vtVoidRejects, vtVoidMfgRejects] then
  begin
    ExecuteCommandFmt('update rejects set rejects = nvl(rejects,0) - %.6f where id = %f', [ AQty, ARejects_ID ]);

    // if zero then delete that reject
    if SelectValueByID('rejects', 'rejects', ARejects_ID) <= 0 then
    begin
       AOldSub_Batch := SelectValueFmtAsFloat('select translog_sub_batch from rejects where id = %f', [ARejects_ID]);
       Acct_id_reject := SelectValueFmtAsFloat('select acct_id_reject from translog where sub_batch = %f', [AOldSub_Batch]);
       if Acct_id_reject <> 0 then
         ExecuteCommandFmt('update translog set acct_id_reject = %f where sub_batch = %f', [Acct_id_reject, ASub_Batch]);
       ExecuteCommandFmt('delete from rejects where id = %f', [ ARejects_ID ]);
    end;
  end;
end;


procedure AdjustCompletedQuan( AQty, ATA_Labor_ID: Real; AVoidType: TVoidType; AIsMfgPart: Boolean );
begin
  if AIsMfgPart and (ATA_Labor_ID > 0) then
  begin
    if AVoidType = vtVoidMfgRejects then
       ExecuteCommandFmt('update ta_labor                                            '+
                 '   set process_qty = nvl(process_qty,0) + %.6f             '+
                 ' where id = %f                                             ',
                 [ AQty,
                   ATA_Labor_ID ])
  end;
end;


procedure EnsureFGMultiAssigned( AArinvt_ID: Real; var AFGMulti_ID: Real; APkFGMulti: TIQWebHPick = nil );
var
  ALoc_ID: Real;
begin
  if AFGMulti_ID > 0 then EXIT;

  if SelectValueByID( 'is_lot_mandatory', 'arinvt', AArinvt_ID ) = 'Y' then
     begin
       if Assigned(APkFGMulti) then with APkFGMulti do
          if Execute then
             AFGMulti_ID:= GetValue('FGMULTI_ID')
          else
             ABORT;
     end
  else
     // any valid fgmulti will do
     AFGMulti_ID:= IQMS.Common.Dispo.GetAutoDispo_Default_FGMultiID( AArinvt_ID,
                                                           SelectValueByID('standard_id', 'arinvt', AArinvt_ID), // AStandard_ID
                                                           'TEMPORARY',            // ADefaultLocation
                                                           '',                     // ALotNo
                                                           0 );                    // AWork_Center_ID
  if AFGMulti_ID > 0 then EXIT;

  ALoc_ID:= SelectValueAsFloat('select id from locations where upper(loc_desc) = ''TEMPORARY''');
  if ALoc_ID = 0 then
  begin
    ALoc_ID:= GetNextID( 'locations' );
    ExecuteCommandFmt('insert into locations (id, loc_desc, eplant_id) values( %f, ''%s'', 0)',
            [ ALoc_ID, 'TEMPORARY' ]);
  end;

  AFGMulti_ID:= GetNextID( 'fgmulti' );
  ExecuteCommandFmt('insert into fgmulti (id, arinvt_id, loc_id) values ( %f, %f, %f )',
            [ AFGMulti_ID,
              AArinvt_ID,
              ALoc_ID ]);
end;


procedure PrepareCreateAdjustWIPTransactions( ACargo: TAdjustWIPCargo );
var
  ABatch: Real;
  AOpSeq: Real;
  AQry  : TFDQuery;
  AParam: TAdjustWIPComponentsCargo;
  AParent_Arinvt_ID: Real;

  procedure CreateQuery;
  begin
    AQry:= nil;
    AQry:= TFDQuery.Create(nil);
    with AQry do
    begin
      Connection := UniMainModule.FDConnection1;
      SQL.Add(Format( 'select a.trans_reason,            '+
                      '       a.qty,                     '+
                      '       c.arinvt_id,               '+
                      '       c.sndop_id                 '+
                      '  from work_opmat_rejects a,      '+
                      '       reject_code b,             '+
                      '       opmat c                    '+
                      ' where a.batch = %.0f             '+
                      '   and a.reject_code_id = b.id(+) '+
                      '   and a.opmat_id = c.id          ',
                      [ ABatch ]));
    end;
  end;

begin
  {if we create ADJUST WIP for process A we want to create translog records as many as opmat records are there.

   In middle grid -> right click -> show details -> void -> report existing as rejects ->
   When a user selects this, the Rejects have already been put into the WIP GL as good parts but now they have turned bad.
   This requires that we do a translog Adjust WIP transaction on the components attached to the process at this level and All preceeding processes.

   In middle grid -> right click -> labor reporting -> report rejects  ->
   reject Mfg parts -> In this case the WIP item has not been put into the WIP GL so only Previous processes items are written to translog as Adjust WIP.
  }

  if ACargo.Ptoper_ID = 0 then
     AOpSeq:= SelectValueFmtAsFloat('select opseq from ptoper where partno_id = %f and sndop_id = %f', [ ACargo.Partno_ID, ACargo.Sndop_ID ])
  else
     AOpSeq:= SelectValueFmtAsFloat('select opseq from ptoper where id = %f', [ ACargo.Ptoper_ID  ]);

  if ACargo.Kind = prekAllAbove then
     AOpSeq:= AOpSeq - 1;
  if AOpSeq <= 0 then
     EXIT;

  AParent_Arinvt_ID:= SelectValueByID('arinvt_id', 'partno', ACargo.Partno_ID);

  ABatch:= GetNextID('work_opmat_rejects');
  try
    {populate work_opmat_rejects. Note - the result dataset will carry all the components belonging to processes above passed ACargo.Sndop_ID}
    assy_share.PopulateWorkOpMatRejects( ABatch, ACargo.Standard_ID, ACargo.Partno_ID, -1 {sndop_id}, -1 {ptoper_id}, AOpSeq, ACargo.MfgQty, ACargo.RejectMode );

    {adjust for phantom components - blow it down if needed}
    ExecuteCommandFmt('begin assy1_misc.prepare_phantom_rejects(%f); end;', [ ABatch ]);

    {prepare}
    CreateQuery;

    {process records}
    AQry.Open;
    while not AQry.Eof do
    begin
      AParam.Arinvt_ID       := AQry.FieldByName('arinvt_id').asFloat;
      AParam.Qty             := AQry.FieldByName('qty').asFloat;
      AParam.Sndop_ID        := AQry.FieldByName('sndop_id').asFloat;
      AParam.Workorder_ID    := ACargo.Workorder_ID;
      AParam.Trans_Reason    := IIf( ACargo.Reason = '', 'Process WIP Rejects', ACargo.Reason );
      AParam.Partno_ID       := ACargo.Partno_ID;
      AParam.Trans_Date      := ACargo.TransDate;
      AParam.Parent_Arinvt_ID:= AParent_Arinvt_ID;
      AParam.In_Out          := ACargo.In_Out;
      AParam.Sub_Batch       := ACargo.Sub_Batch;
      AParam.Ptoper_ID       := ACargo.Ptoper_ID;
      AParam.TransAttribute  := ACargo.TransAttribute;

      assy_share.ExecuteAdjustWIPTransaction( AParam );

      AQry.Next;
    end;

  finally
    if Assigned( AQry ) then
       AQry.Free;
    ExecuteCommandFmt('delete from work_opmat_rejects where batch = %f', [ ABatch ]);
  end;
end;


procedure ExecuteAdjustWIPTransaction( AParam: TAdjustWIPComponentsCargo );
var
  ATranAdjustWIP: TIQWebTranAdjustWIP;
begin
  ATranAdjustWIP:= TIQWebTranAdjustWIP.Create(nil);
  with ATranAdjustWIP do
  try
    Trans_In_Out    := AParam.In_Out;          // normally IQMS.WebVcl.Trans.TRAN_OUT. When voiding rejected mfg part - TRAN_IN
    Trans_Quan      := AParam.Qty;             {note backend will populate WIP_QUAN leaving trans_quan null}
    Trans_RG_Quan   := 0;
    Trans_Reason    := AParam.Trans_Reason;
    Trans_Date      := AParam.Trans_Date;
    Trans_Batch     := get_assy1_translog_batch( AParam.Workorder_ID, AParam.Partno_ID ); {assy_share.pas}
    Workorder_ID    := AParam.Workorder_ID;
    Trans_Source    := 'SNDOP';
    Trans_Source_ID := AParam.SndOp_ID;
    Parent_Arinvt_ID:= AParam.Parent_Arinvt_ID;
    Arinvt_ID       := AParam.Arinvt_ID;
    Sub_Batch       := AParam.Sub_Batch;
    Ptoper_ID       := AParam.Ptoper_ID;
    Attribute       := AParam.TransAttribute;

    {typecasted just in order to get to the TransBatchAutoInc property}
    TIQWebTransDispoBase(ATranAdjustWIP).TransBatchAutoInc:= Trans_Batch = 0;

    Execute;

    {if this is the first trans for this woorkorder/partno - record batch in ptorder to keep all the future trans under the same batch}
    if TIQWebTransDispoBase(ATranAdjustWIP).TransBatchAutoInc then
       assign_assy1_translog_batch( AParam.Workorder_ID, AParam.Partno_ID, Trans_Batch );
  finally
    Free;
  end;
end;

function GetProcessOverHeadRate(ASndop_ID: Real): Real;
begin
  Result:= SelectValueByID('assy1_oh_rate', 'sndop', ASndop_ID);
  if Result = 0 then
     Result:= SelectValueAsFloat('select labor_based_oh_rate from mfgtype where mfgtype = ''ASSY1''')
end;

procedure CheckAssignArinvtLotDocs( AWorkorder_ID, AArinvt_ID: Real; AFGLotNo: string );
var
  A                   : Variant;
  ACRM_Quote_Detail_ID: Real;
  AOrd_Detail_ID      : Real;
  AStandard_ID        : Real;
begin
  if Trim(AFGLotNo) = '' then
     EXIT;

  if SelectValueFmtAsFloat('select count(*) from arinvt_lot_docs            '+
               ' where arinvt_id = %f and lotno = upper(''%s'') '+
               '   and (nvl(config_cost,0) <> 0 or nvl(config_price,0) <> 0 or nvl(config_weight,0) <> 0) ',
               [ AArinvt_ID, AFGLotNo ]) > 0 then
     EXIT;

  A:= SelectValueArrayFmt( 'select d.crm_quote_detail_id, d.id, wo.standard_id from ord_detail d, workorder wo where wo.id = %f and wo.make_to_order_detail_id = d.id', [ AWorkorder_ID ]);
  if VarArrayDimCount( A ) = 0 then EXIT;

  ACRM_Quote_Detail_ID:= A[ 0 ];
  AOrd_Detail_ID      := A[ 1 ];
  AStandard_ID        := A[ 2 ];

  if (ACRM_Quote_Detail_ID = 0) or (SelectValueByID('1', 'crm_quote_detail', ACRM_Quote_Detail_ID) = 0) then
      EXIT;

  ExecuteCommandFmt('begin                                            '+
            '  crm_quote_misc.assign_arinvt_lot_docs( %f,     '+  // v_crm_quote_detail_id
            '                                         %f,     '+  // v_arinvt_id
            '                                         ''%s'', '+  // v_fg_lotno
            '                                         %f,     '+  // v_ord_detail_id
            '                                         %f  );  '+  // v_standard_id
            'end;                                             ',
            [ ACRM_Quote_Detail_ID,
              AArinvt_ID,
              AFGLotNo,
              AOrd_Detail_ID,
              AStandard_ID ]);
end;

function IsAssy3BackflushEachProcess( AMfgType: string ): Boolean;
begin
  Result:= SelectValueFmtAsString('select assy3_backflush_each_process from mfgtype where rtrim(mfgtype) = rtrim(''%s'')', [ AMfgtype ]) = 'Y'
end;

function IsProcessDesignatedToInvokeFinalAssy( APartno_ID, APtoper_ID: Real ): Boolean;
begin
  Result:= ( SelectValueFmtAsString('select assy1_final_assy_on_process                           '+
                          '  from standard s, mfgtype m                                 '+
                          ' where s.id = (select standard_id from partno where id = %f) '+
                          '   and rtrim(s.mfg_type) = rtrim(m.mfgtype)                  ',
                          [ APartno_ID ]) = 'Y')
           and
           ( SelectValueFmtAsString('select report_final_assy from ptoper where id = %f', [ APtoper_ID ]) = 'Y' );
end;


procedure UpdateProcessWipActCost( ASndop_Dispatch_ID,
                                   ASub_Batch: Real;
                                   ASource: string  = '';
                                   ASource_ID: Real = 0 );
begin
  if (ASub_Batch = 0) or (ASndop_Dispatch_ID = 0) then
     EXIT;

  ExecuteCommandFmt('begin inventory_trans.update_process_act_cost( %f, %f, ''%s'', %f ); end;',
            [ ASndop_Dispatch_ID,
              ASub_Batch,
              ASource,
              ASource_ID ]);
end;

function DeltaPercentCompleteToParts( APercentComplete, AWorkorder_ID, ASndop_ID, APartno_ID, APtoper_ID: Real ): Real;
var
  APercentSoFar: Real;
  ADeltaPercent: Real;
  A: Variant;
  APtorder_ID: Real;
  ASinceSched: Real;
  AWorkorderQty: Real;
begin
  APercentSoFar:= SelectValueFmtAsFloat('select complete from c_ta_labor where workorder_id = %f and sndop_id = %f and partno_id = %f and ptoper_id = %f',
                             [ AWorkorder_ID,
                               ASndop_ID,
                               APartno_ID,
                               APtoper_ID ]);
  ADeltaPercent:= fMax(0, APercentComplete - APercentSoFar);
  if ADeltaPercent = 0 then
     EXIT;

  A:= SelectValueArrayFmt('select id, nvl(qty_since_sched,0) from ptorder where workorder_id = %f and partno_id = %f',
                     [ AWorkorder_ID, APartno_ID ]);
  if VarArrayDimCount( A ) = 0 then
     EXIT (0);
  APtorder_ID:= A[0];
  ASinceSched:= A[1];

  AWorkorderQty:= SelectValueFmtAsFloat('select sum(rel_quan_disp) from ptorder_rel where ptorder_id = %f', [ APtorder_ID ]);

  Result:= fMax(0, (AWorkorderQty - ASinceSched) / 100 * ADeltaPercent);
end;


function ProcessBelongsArchivedJobShop( ASndOp_Dispatch_ID: Real ): Boolean;
begin
  Result:= SelectValueFmtAsString('select b.archived from jobshop_task a, jobshop_rfq b where a.sndop_dispatch_id = %f and a.jobshop_rfq_id = b.id',
                        [ ASndOp_Dispatch_ID ]) = 'Y'
end;

function WorkorderLinkedToArchivedJobShop( AWorkorder_ID: Real ): Boolean;
begin
  Result:= SelectValueFmtAsString('select archived from jobshop_rfq where workorder_id = %f',
                        [ AWorkorder_ID ]) = 'Y'
end;

function WorkorderLinkedToJobShop( AWorkorder_ID: Real ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select workorder_misc.is_jobshop_workorder( %f ) from dual', [ AWorkorder_ID ]) = 1;
end;

function RejectCodeNonConformLocations_ID( AReject_Code_ID: Real ): Real;
begin
  Result:= SelectValueFmtAsFloat('select non_conform_locations_id from reject_code where id = %f', [ AReject_Code_ID ]);
end;

function IsRejectCodeAssignedNonConformLocation( ARejectCode: string ): Boolean;
var
  AReject_Code_ID: Real;
begin
  AReject_Code_ID:= SelectValueFmtAsFloat('select id from reject_code where rtrim(reject_code) = upper(rtrim(''%s''))', [ ARejectCode ]);
  Result:= IsRejectCodeAssignedNonConformLocation( AReject_Code_ID );
end;

function IsRejectCodeAssignedNonConformLocation( AReject_Code_ID: Real ): Boolean;
begin
  Result:= RejectCodeNonConformLocations_ID( AReject_Code_ID ) > 0;
end;

function CurrentFG_LotNo( AWorkorder_ID: Real ): string;
begin
  Result:= Trim(SelectValueByID('assy_fg_lotno', 'workorder', AWorkorder_ID));
  if Result = '' then
     Result:= Trim(SelectValueByID( 'fg_lotno', 'standard', SelectValueByID('standard_id', 'workorder', AWorkorder_ID )));
end;



{ TRejectTransCargo }

constructor TRejectTransCargo.Create(AWorkorder_ID: Real);
begin
  Workorder_ID       := AWorkorder_ID;
  Partno_ID          := 0;
  TA_Labor_ID        := 0;
  Work_Center_ID     := 0;
  Trans_Reason       := '';
  Reject_Qty         := 0;
  Reject_Code        := '';
  Reject_Code_ID     := 0;
  Arinvt_ID          := 0;         // consumed:  opmat.arinvt_id
  Standard_ID        := 0;         // parent: partno.standard_id
  Trans_Date         := 0;
  Prod_Date          := 0;
  ParentRejects_ID   := 0;         // parent mfgpart rejects id
  FgLotNo            := '';        // assigned by the user and propgated to translog
  Sub_Batch          := 0;
  Ptoper_ID          := 0;
  Sndop_Dispatch_ID  := 0;
  WorkOpmatRejects_ID:= 0;         // work_opmat_rejects.id
  RejectMode         := TRejectMode.rmMfgParts;
  DayPartID          := 0;
  Source             := 'AS';
end;


{ TRejectModeParams }

constructor TRejectModeParams.Create( AMaster_Label_List: TStringList );
begin
  Master_Label_List       := AMaster_Label_List;
  Workorder_ID            := 0;
  Partno_ID               := 0;
  Arinvt_ID               := 0;
  Sndop_ID                := 0;
  Ptoper_ID               := 0;
  TargetUOM               := '';
  MfgTypeLookup           := '';
  FGLotNo                 := '';
  Non_Conform_Locations_ID:= 0;
  Non_Conform_ID          := 0;
  RejectMode              := rmComponents;
  MfgRejectedParts        := 0;
  Reject_Code_ID          := 0;
  Trans_Code_ID           := 0;
  TransDate               := SelectValueAsDateTime('select sysdate from dual');
end;

procedure TRejectModeParams.Assign(AParam: TRejectModeParams);
begin
  Master_Label_List       := AParam.Master_Label_List;           // editable
  Workorder_ID            := AParam.Workorder_ID;
  Partno_ID               := AParam.Partno_ID;
  Arinvt_ID               := AParam.Arinvt_ID;
  Sndop_ID                := AParam.Sndop_ID;
  Ptoper_ID               := AParam.Ptoper_ID;
  TargetUOM               := AParam.TargetUOM;
  MfgTypeLookup           := AParam.MfgTypeLookup;
  FGLotNo                 := AParam.FGLotNo;                     // editable
  Non_Conform_Locations_ID:= AParam.Non_Conform_Locations_ID;    // editable
  Non_Conform_ID          := AParam.Non_Conform_ID;              // editable
  RejectMode              := AParam.RejectMode;                  // editable
  MfgRejectedParts        := AParam.MfgRejectedParts;            // editable
  Reject_Code_ID          := AParam.Reject_Code_ID;              // editable
  Trans_Code_ID           := AParam.Trans_Code_ID;
end;


procedure TRejectModeParams.CheckMoveMfgRejectsToNonConform( AGenerateMRB: Boolean = FALSE );
var
  AFGMulti_ID: Real;
  AFind: TFindFGMultiUsingBusinessRules;
  ATransIN: TIQWebTransIn;
  I: Integer;
  ABatch: Real;
  ATranslog_ID: Real;

begin
  // if not ((RejectMode = rmMfgParts) and (Non_Conform_Locations_ID > 0)) then
  if not (Non_Conform_Locations_ID > 0) then
     EXIT;

  // get fgmulti_id
  AFind:= TFindFGMultiUsingBusinessRules.Create( Arinvt_ID, Non_Conform_Locations_ID, FGLotNo );    // dispo_misc.pas
  try
    AFind.Non_Conform_ID:= Non_Conform_ID;
    AFGMulti_ID:= AFind.Execute;
  finally
    AFind.Free;
  end;

  ensure_assy1_translog_batch_assigned( Workorder_ID, Partno_ID, ABatch );

  ATransIN:= TIQWebTransIn.Create(Application);
  try
    ATransIN.FGMulti_ID       := AFGMulti_ID;
    ATransIN.Trans_Quan       := MfgRejectedParts;
    ATransIN.Trans_RG_Quan    := 0;
    ATransIN.Trans_Reason     := 'Non Conform Mfg Rejects';
    ATransIN.Act_Cost         := 0;
    ATransIN.Trans_Date       := TransDate;  // SelectValueAsFloat('select sysdate from dual');
    ATransIN.Master_Label_List:= Master_Label_List;
    ATransIN.SkipTranslogMasterLabelUpdate:= TRUE;
    ATransIN.Trans_Batch      := get_assy1_translog_batch( Workorder_ID, Partno_ID );
    ATransIN.Trans_Note       := 'Non Conform Mfg Rejects';

    if Trans_Code_ID > 0 then
       ATransIN.Trans_Code_ID:= Trans_Code_ID;

    ATransIN.Trans_Type:= IQMS.WebVcl.Trans.TRAN_TYPE_DISPO;  // not sure is we need to make trans_type = DISPOSITION

    ATransIN.Execute;

    if ATransIN.TransErrCode = 0 then
       ATransIN.CheckAppendTo_Translog_Master_Label();

    if Assigned(Master_Label_List) and (Master_Label_List.Count > 0) then
       for I:= 0 to Master_Label_List.Count - 1 do
           UpdateMasterLabelLocDesc( StrToFloat( Master_Label_List[ I ]), AFGMulti_ID );

   if AGenerateMRB and (ATransIN.TransErrCode = 0) and not IsConsole then
    begin
      ATranslog_ID:= SelectValueFmtAsFloat('select id from translog where sub_batch = %f and fgmulti_id = %f', [ ATransIN.Sub_Batch, AFGMulti_ID ]);
      CheckCreateMRB( AFGMulti_ID, ATranslog_ID );
    end;
  finally
    ATransIN.Free;
  end;
end;


procedure TRejectModeParams.UpdateMasterLabelLocDesc( AMaster_Label_ID, AFGMulti_ID: Real );
var
  ALoc_ID   : Real;
  AIs_Pallet: Boolean;

  procedure _CheckPropogatePalletLocationToChildren;
  begin
    if SelectValueFmtAsFloat('select id from master_label where parent_id = %f and rownum < 2', [ AMaster_Label_ID ]) > 0 then
       ExecuteCommandFmt( 'begin RF.update_pallet_children( %f, %f ); end;', [ AMaster_Label_ID, AFGMulti_ID ]);
  end;

begin
  if (AMaster_Label_ID > 0) and (AFGMulti_ID > 0) then
  begin
     ALoc_ID   := SelectValueFmtAsFloat('select loc_id from fgmulti where id = %f', [ AFGMulti_ID ]);
     AIs_Pallet:= SelectValueFmtAsString('select is_pallet from master_label where id = %f', [ AMaster_Label_ID ]) = 'Y';

     // 04-15-2010 SCR #985  Clear Location in Master_Label for Pallet Children
     if ALoc_ID > 0 then
        ExecuteCommandFmt('update master_label set fgmulti_id = %f, loc_desc = (select loc_desc from locations where id = %f) where id = %f',
                 [ AFGMulti_ID, ALoc_ID, AMaster_Label_ID ])
     else
        ExecuteCommandFmt('update master_label set fgmulti_id = %f where id = %f',
                 [ AFGMulti_ID, AMaster_Label_ID ]);
     _CheckPropogatePalletLocationToChildren;

     {keep pallet fgmulti_id = NULL otherwise we get pallet + children in the serialized inventory popup screen}
     if AIs_Pallet then
        ExecuteCommandFmt('update master_label set fgmulti_id = NULL where id = %f', [ AMaster_Label_ID ]);
  end;
end;


procedure TRejectModeParams.CheckCreateMRB( AFGMulti_ID, ATranslog_ID: Real);
begin
  if SecurityManager.SetVisibleIfLicensed( nil {sbtn}, nil {menu option}, NIL, IQAppsNames[ apIQMRB   ], nil {SR} )  then
  begin
    { TODO -oSanketG -cWC : Need to revisit ,
    [dcc32 Error] assy_share.pas(1989): E2010 Incompatible types: 'TFormClass' and 'class of TFrmCheckMrb'}
    //if IQDialogChkEx( TFrmCheckMrb, 'Would you like to create an MRB?', 'Trans_ConfirmMRB' ) = 1 then     // IQMS.Common.Dialogs.pas, CheckMrb.pas
    try
       Com_Exec( 'IQQC', [ IQMS.Common.QC_Const.QC_MRB_INSERT_NEW_EX,                        { IQMS.Common.COMExe.pas }
                           0,                                                    { wf_header_id }
                           Arinvt_ID,                                            { arinvt_id    }
                           AFGMulti_ID,                                          { fgmulti_id   }
                           ATranslog_ID ]);                                      { translog_id (to update source & source_id)}
    except on E:Exception do                                                     // in case Cancel was clicked
       if not E.ClassNameIs( 'EAbort' ) and not E.ClassNameIs( 'EOleException' ) then
          raise;
    end;
  end;
end;



{ TAdjustWIPCargo }

constructor TAdjustWIPCargo.Create( ADummy: Real );
begin
  TransDate:= SelectValueAsDateTime('select sysdate from dual');
end;

{ TCalcMatReq }

constructor TCalcMatReq.Create(ABatch: Real);
begin
  Batch:= ABatch;
  MainArinvt_ID:= 0;
  Qty:= 0;
  Standard_ID:= 0;
  Workorder_ID:= 0;
  PtOper_ID:= 0;
end;

end.

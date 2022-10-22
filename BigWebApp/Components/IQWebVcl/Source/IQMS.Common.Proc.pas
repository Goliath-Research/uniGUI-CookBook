unit IQMS.Common.Proc;

interface

uses
  Vcl.Forms, Vcl.Controls, System.SysUtils, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, FireDAC.Phys;

function  RT_Is_Cntr_Down( nCntrID:Real ):Integer;
procedure Get_Prod_Date_Shift( var dDate:TDateTime; var nShift:Integer; MfgCell_ID: Real );
procedure Recalc_Center( nCntrID, nSchedID, nSeq :Real );
procedure Calc_Must_Start_Of_All_Depend( ALevel: Real = 0 );
procedure GetEndDate( v_cntr_id            : Real;
                      v_ini_start_time     : TDateTime;
                      v_hrs                : Real;
                      v_is_default_calendar: Real;
                      var v_end_time       : TDateTime;
                      v_mfgcell_id         : Real );

procedure GetStartDate( v_cntr_id            : Real;
                        v_ini_end_time       : TDateTime;
                        v_hrs                : Real;
                        v_is_default_calendar: Real;
                        var v_start_time     : TDateTime;
                        v_mfgcell_id         : Real );

function LikeGeneric( v_mfgtype: string ): Boolean;

procedure RT_Close_Setup( nCntrID:Real );
procedure RT_Setup( nCntrID:Real; nNextSchedID:Real; DeleteCurrent:Boolean );
procedure DoRT_Setup( nCntrID:Real; nNextSchedID:Real; DeleteCurrent:Boolean );
function ConnectedToDart( nCntrID: Real ): Boolean;

function Dispatch_Trans_Batch( nTrans_Batch:Real; ASub_Batch: Real = 0; ACOnnectionName: string = 'IQFD' ):Integer;
procedure RT_Reopen_Downtime_Interval( nCntrID : Real );
function Get_Center_Rate( AStandard_ID: Real; AFixed_Overhead: string = 'N' ):Real;
function Get_Std_Overhead( AStandard_ID, AArinvt_ID, APartsQty: Real ):Real;
function Get_Std_OverheadExA( AArinvt_ID, APartsQty: Real; AFixed_Overhead: string = 'N' ):Real;
function Get_Std_Labor( AStandard_ID, APartsQty: Real ):Real;
function Get_Std_LaborExA( AArinvt_ID, APartsQty: Real ):Real;
function Get_Cost_Rollup_Diff_Based_CostElemType( AArinvt_ID: Real; AElemType: string ): Real;

implementation

uses
  IQMS.Common.Dartwin,
  IQMS.Common.Applications,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Numbers,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.ResStrings,
  IQMS.Common.DataConst,
  Vcl.DBCtrls;

function RT_Is_Cntr_Down( nCntrID:Real ):Integer;
begin
  Result:= 1;
  with TFDStoredProc.Create(application) do
  try
    ConnectionName := cnstFDConnectionName;
    StoredProcName:= 'IQMS.RT_IS_CNTR_DOWN';
    //with Params.CreateParam( ftFloat, 'v_cntr_id', ptInput ) do Value:= nCntrID;
    //Params.CreateParam( ftFloat, 'v_crnt_down', ptInputOutput );
    Prepare;
    ParamByName('v_cntr_id').Value:= nCntrID;
    ExecProc;

    Result:= ParamByName('v_crnt_down').asInteger;
  finally
    Close; Free;
  end;
end;

procedure Get_Prod_Date_Shift( var dDate:TDateTime; var nShift:Integer; MfgCell_ID: Real );
begin
  with TFDStoredProc.Create(application) do
  try
    ConnectionName := cnstFDConnectionName;
    StoredProcName:= 'IQMS.GET_PROD_DATE_SHIFT';
    Prepare;

    //Params.CreateParam( ftDate,  'v_date',       ptInputOutput );
    //Params.CreateParam( ftFloat, 'v_shift',      ptInputOutput );
    //if Trunc(MfgCell_ID) > 0 then
    //   with Params.CreateParam( ftFloat, 'v_mfgcell_id', ptInput) do Value:= Trunc(MfgCell_ID)
    //else
    //   with Params.CreateParam( ftFloat, 'v_mfgcell_id', ptInput) do Clear;

    Prepare;
    if Trunc(MfgCell_ID) > 0 then
       ParamByName('v_mfgcell_id').Value:= Trunc(MfgCell_ID)
    else
       ParamByName('v_mfgcell_id').Clear;

    ExecProc;
    dDate := ParamByName('v_date').asDateTime;
    nShift:= ParamByName('v_shift').asInteger;
  finally
    Close; Free;
  end;
end;

procedure Recalc_Center( nCntrID, nSchedID, nSeq :Real );
begin
  // if nSchedID and nSeq are 0 - the stored procedure will just recalc the machine
  // otherwise it will put 'nSchedId' job into position 'nSeq' on press 'nCntrID'.
  // Examples: Recalc_Center( 7, 0, 0  )  - simple recalc
  //           Recalc_Center( 7, 55, 3 )  - puts job# 55 into position 3 on press 7
  //           Recalc_Center( 7, 55, 0 )  - sets job# 55 as last job on press 7
  //           Recalc_Center( 7, 55, 999) - same as prev
  with TFDStoredProc.Create(application) do
  try
    ConnectionName := cnstFDConnectionName;
    StoredProcName:= 'IQMS.RECALC_CENTER';
    Prepare;
    ParamByName('v_cntr_id').Value:= nCntrID;
    ParamByName('v_sched_id_ini').Value:= nSchedID;
    ParamByName('v_seq_ini').Value:= nSeq;
    ExecProc;
  finally
    Close; Free;
  end;
end;

procedure Calc_Must_Start_Of_All_Depend( ALevel: Real = 0 );
begin
  with TFDStoredProc.Create(application) do
  try
    ConnectionName := cnstFDConnectionName;
    // PackageName:= 'IRV32_MISC';
    StoredProcName:= 'IQMS.IRV32_MISC.CALC_MUST_START_OF_ALL_DEPEND';
    Prepare;
    ParamByName('v_level').Value:= ALevel;
    ExecProc;
  finally
    Close; Free;
  end;
end;

procedure RT_Setup( nCntrID:Real; nNextSchedID:Real; DeleteCurrent:Boolean );
begin
  try
     with SecurityManager do
       if ConnectedToDart( nCntrID ) and SetVisibleIfLicensed( NIL{speedbtn}, NIL{MenuOption}, NIL{Separator}, IQAppsNames[ apDartWin ], NIL) then
       try
          DoDartWinStopJob( nCntrID );
          DoDartWinStartJob( nCntrID, nNextSchedID );
       except on E:Exception do
          if IQWarningYN( E.Message + #13#13 + IQMS.Common.ResStrings.cTXT0000158 { 'Abort?' }) then
             ABORT;
       end;

     DoRT_Setup( nCntrID, nNextSchedID, DeleteCurrent );
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure DoRT_Setup( nCntrID:Real; nNextSchedID:Real; DeleteCurrent:Boolean );
begin
  with TFDStoredProc.Create(application) do
  try
    Screen.Cursor:= crHourGlass;
    ConnectionName := cnstFDConnectionName;
    StoredProcName:= 'IQMS.RT_SETUP';
    Prepare;
    ParamByName('v_cntr_id').Value:= nCntrID;
    ParamByName('v_sched_id').Value:= nNextSchedID;
    ParamByName('v_del_current').Value:= iIIf( DeleteCurrent, 1, 0 );
    ExecProc;
  finally
    Close; Free;
    Screen.Cursor:= crDefault;
  end;
end;

function ConnectedToDart( nCntrID: Real ): Boolean;
begin
  Result:= SelectValueFmtAsString('select is_dart from work_center where id = %f', [ nCntrID ]) = 'Y';
end;

procedure RT_Close_SetUp( nCntrID:Real );
begin
  try
     with SecurityManager do
       if ConnectedToDart( nCntrID ) and SetVisibleIfLicensed( NIL{speedbtn}, NIL{MenuOption}, NIL{Separator}, IQAppsNames[ apDartWin ], NIL{SR}) then
       try
          DoDartWinStopJob( nCntrID );
       except on E:Exception do
          if IQWarningYN( E.Message + #13#13 + IQMS.Common.ResStrings.cTXT0000158 { 'Abort?' }) then
             ABORT;
       end;

     with TFDStoredProc.Create(application) do
     try
       Screen.Cursor:= crHourGlass;
       ConnectionName := cnstFDConnectionName;
       StoredProcName:= 'IQMS.RT_CLOSE_SETUP';
       Prepare;
       ParamByName('v_cntr_id').Value:= nCntrID;
       ExecProc;

       Recalc_Center( nCntrID, 0, 0 );
     finally
       Close; Free;
     end;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

function Dispatch_Trans_Batch( nTrans_Batch:Real; ASub_Batch: Real = 0; ACOnnectionName: string = 'IQFD' ):Integer;
begin
  Result:= 2;
  with TFDStoredProc.Create(Application) do
  try
    ConnectionName := ACOnnectionName;
    // PackageName:= 'INVENTORY_TRANS';
    StoredProcName:= 'IQMS.INVENTORY_TRANS.DISPATCH_TRANS_BATCH';
    Prepare;

    ParamByName('v_trans_batch').Value:= nTrans_Batch;
    if ASub_Batch > 0 then
       ParamByName('v_sub_batch').Value:= ASub_Batch;

    ExecProc;

    Result:= Params[ 0 ].asInteger;
  finally
    Close; Free;
  end;
end;

procedure RT_Reopen_Downtime_Interval( nCntrID : Real );
var
  Prod_Date : TDateTime;
  Prod_Shift: Integer;
  MfgCell_ID: Real;
begin
  MfgCell_ID:= SelectValueFmtAsFloat('select mfgcell_id from work_center where id = %f', [ nCntrID ]);
  Get_Prod_Date_Shift( Prod_Date, Prod_Shift, MfgCell_ID );
  with TFDStoredProc.Create(application) do
  try
    Screen.Cursor:= crHourGlass;
    ConnectionName := cnstFDConnectionName;
    StoredProcName:= 'IQMS.RT_CLOSE_DOWNTIME';
    Prepare;
    ParamByName('v_cntr_id').Value:= nCntrID;
    ParamByName('v_end_date').asDateTime:= SelectValueAsFloat('select sysdate from dual'); // Now;
    ParamByName('v_date').asDateTime:= Prod_Date;
    ParamByName('v_shift').Value:= Prod_Shift;
    ParamByName('v_reopen').Value:= 1;
    ExecProc;
  finally
    Close; Free;
    Screen.Cursor:= crDefault;
  end;
end;

function Get_Center_Rate( AStandard_ID: Real; AFixed_Overhead: string = 'N' ):Real;
begin
  with TFDStoredProc.Create(application) do
  try
    ConnectionName := cnstFDConnectionName;
    // PackageName:= 'INV_COST';
    StoredProcName:= 'IQMS.INV_COST.GET_CENTER_COST';
    Prepare;
    ParamByNAme('v_standard_id').Value:= AStandard_ID;
    ParamByName('v_fixed_overhead').AsString:= AFixed_Overhead;
    ExecProc;
    Result:= ParamByName('result').asFloat;
  finally
    Close; Free;
  end;
end;

function Get_Std_Overhead( AStandard_ID, AArinvt_ID, APartsQty: Real ):Real;
begin
  with TFDStoredProc.Create(application) do
  try
    ConnectionName := cnstFDConnectionName;
    // PackageName:= 'INV_COST';
    StoredProcName:= 'IQMS.INV_COST.GET_STD_OVERHEAD';
    Prepare;
    ParamByName('v_standard_id').Value:= AStandard_ID;
    ParamByName('v_arinvt_id').Value:= AArinvt_ID;
    ExecProc;
    Result:= ParamByName('result').asFloat * APartsQty;
  finally
    Close; Free;
  end;
end;


function Get_Std_Labor( AStandard_ID, APartsQty: Real ):Real;
begin
  with TFDStoredProc.Create(application) do
  try
    ConnectionName := cnstFDConnectionName;
    // PackageName:= 'INV_COST';
    StoredProcName:= 'IQMS.INV_COST.GET_STD_LABOR';
    Prepare;
    ParamByName('v_standard_id').Value:= AStandard_ID;
    ExecProc;
    Result:= ParamByName('result').asFloat * APartsQty;
  finally
    Close; Free;
  end;
end;


function Get_Std_OverheadExA( AArinvt_ID, APartsQty: Real; AFixed_Overhead: string = 'N' ):Real;
var
  AElem_Type: string;
begin
  if AFixed_Overhead = 'N' then
     AElem_Type:= 'OVERHEAD'
  else
     AElem_Type:= 'OVERHEADF';

  Result:= Get_Cost_Rollup_Diff_Based_CostElemType( AArinvt_ID, AElem_Type ) * APartsQty;
end;


function Get_Std_LaborExA( AArinvt_ID, APartsQty: Real ):Real;
begin
  Result:= Get_Cost_Rollup_Diff_Based_CostElemType( AArinvt_ID, 'LABOR' ) * APartsQty;
end;


function Get_Cost_Rollup_Diff_Based_CostElemType( AArinvt_ID: Real; AElemType: string ): Real;
begin
  {Normally used to get diff between arinvt_cost and arinvt_rollup for OVERHEAD or LABOR type}
  Result:= SelectValueFmtAsFloat('select Sum(NVL(a.std_cost,0) - NVL(r.std_cost,0)) '+
                     '  from arinvt_elements a,                         '+
                     '       arinvt_rollup r,                           '+
                     '       elements e                                 '+
                     ' where                                            '+
                     '       a.arinvt_id = r.arinvt_id(+)               '+
                     '   and a.elements_id = r.elements_id(+)           '+
                     '   and NVL(a.std_cost,0) - NVL(r.std_cost,0) > 0  '+
                     '   and e.id = a.elements_id                       '+
                     '   and Upper(RTrim(e.elem_type)) = ''%s''         '+
                     '   and a.arinvt_id = %f                           ',  [ AElemType, AArinvt_ID ]);
end;

procedure GetEndDate( v_cntr_id            : Real;
                      v_ini_start_time     : TDateTime;
                      v_hrs                : Real;
                      v_is_default_calendar: Real;
                      var v_end_time       : TDateTime;
                      v_mfgcell_id         : Real );
begin
  with TFDStoredProc.Create(application) do
  try
    ConnectionName := cnstFDConnectionName;
    StoredprocName:= 'IQMS.ENDDATE';
    Prepare;

    ParamByName('v_cntr_id').Value  := v_cntr_id;
    ParamByName('v_ini_start_time').asDateTime:= v_ini_start_time;
    ParamByName('v_hrs').Value   := v_hrs;
    ParamByName('v_is_default_calendar').Value   := v_is_default_calendar;
    if v_mfgcell_id > 0 then
       ParamByName('v_mfgcell_id').Value:= v_mfgcell_id
    else
       ParamByName('v_mfgcell_id').Clear;

    ExecProc;

    v_end_time:= ParamByName('v_end_time').asDateTime;
  finally
    Close;
    Free;
  end;
end;

procedure GetStartDate( v_cntr_id            : Real;
                        v_ini_end_time       : TDateTime;
                        v_hrs                : Real;
                        v_is_default_calendar: Real;
                        var v_start_time     : TDateTime;
                        v_mfgcell_id         : Real );
begin
  with TFDStoredProc.Create(application) do
  try
    ConnectionName := cnstFDConnectionName;
    StoredProcName:= 'IQMS.STARTDATE';
    Prepare;
    ParamByName('v_cntr_id').Value:= v_cntr_id;
    ParamByName('v_ini_end_time').asDateTime:= v_ini_end_time;
    ParamByName('v_hrs').Value:= v_hrs;
    ParamByName('v_is_default_calendar').Value:= v_is_default_calendar;
    if v_mfgcell_id > 0 then
       ParamByName('v_mfgcell_id').Value:= v_mfgcell_id
    else
       ParamByName('v_mfgcell_id').Clear;

    ExecProc;

    v_start_time:= ParamByName('v_start_time').asDateTime;
  finally
    Close;
    Free;
  end;
end;

function LikeGeneric( v_mfgtype: string ): Boolean;
begin
  with TFDStoredProc.Create(application) do
  try
    ConnectionName := cnstFDConnectionName;
    // PackageName:= 'MFG';
    StoredProcName:= 'IQMS.MFG.LIKE_GENERIC_EXA';
    Prepare;
    ExecProc;
    ParamByName('v_mfgtype').asString:= v_mfgtype;

    Result:= (ParamByName('result').asInteger = 1);
  finally
    Close;
    Free;
  end;
end;


end.

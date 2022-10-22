unit inv_trans_alert_misc;

interface

uses
  System.SysUtils,
  Data.DB;

type
  TTransAlertParams = record
    ID: Real;
    Workorder_ID: Real;
    Sndop_dispatch_ID: Real;
    Locations_ID: Real;
    Inv_zone_ID: Real;
    Arinvt_ID: Real;
    Qty: Real;
    Start_time: TDateTime;
    Trans_in_out: string;
    Source_module: string;
    Source_ID: Real;
    Source: string;
    Trans_Priority: Real;
    Alert_Descrip: string;
    Inv_Trans_Plan_ID: Real;  {optional, normally assigned AFTER trans_alert is created}
    LotNo: string; {optional, used in IQRF BatchMove}
    Parent_Arinvt_ID: Real;
    constructor Create( AID: Real );
    function FindTransAlert_ID: Real;
  end;

  TTransAlertParamsDtl = record
    Trans_Alert_ID : Real;
    Fgmulti_ID     : Real;
    Master_label_ID: Real;
    constructor Create( ATrans_Alert_ID : Real );
  end;


procedure AppenToTransAlert( AParams: TTransAlertParams );
procedure AppenToTransAlertDetail( AParams: TTransAlertParamsDtl );

procedure AssignTransAlertInProcess( ATrans_Alert_ID: Real; AValue: Boolean );
procedure AssignTransAlertSuspended( ADataSet: TDataSet; AValue: Boolean ); overload;
procedure AssignTransAlertSuspended( ATrans_Alert_ID: Real; AValue: Boolean ); overload;


implementation

uses
  IQMS.Common.StringUtils,
  IQMS.Common.DataLib,
  IQMS.WebVcl.SecurityManager;

{ TTransAlertParams }

constructor TTransAlertParams.Create(AID: Real);
begin
  ID:= AID;
  Workorder_ID:= 0;
  Sndop_dispatch_ID:= 0;
  Locations_ID:= 0;
  Inv_zone_ID:= 0;
  Arinvt_ID:= 0;
  Qty:= 0;
  Start_time:= 0;
  Trans_in_out:= '';
  Source_module:= '';
  Source_ID:= 0;
  Trans_priority:= 99;
  Alert_descrip:= '';
  Inv_Trans_Plan_ID:= 0;
  LotNo:= '';
  Source:= '';
  Parent_Arinvt_ID:= 0;
end;

procedure AppenToTransAlert( AParams: TTransAlertParams );
begin
  ExecuteCommandFmt('insert into trans_alert   '+
            '     ( id,                '+
            '       workorder_id,      '+
            '       sndop_dispatch_id, '+
            '       locations_id,      '+
            '       inv_zone_id,       '+
            '       arinvt_id,         '+
            '       qty,               '+
            '       start_time,        '+
            '       trans_in_out,      '+
            '       source_module,     '+
            '       source_id,         '+
            '       trans_priority,    '+
            '       alert_descrip,     '+
            '       lotno,             '+
            '       inv_trans_plan_id, '+
            '       source,            '+
            '       parent_arinvt_id ) '+
            'values                    '+
            '      (%f,                '+   // id
            '       %s,                '+   // workorder_id
            '       %s,                '+   // sndop_dispatch_id
            '       %s,                '+   // locations_id
            '       %s,                '+   // inv_zone_id
            '       %s,                '+   // arinvt_id
            '       %.6f,              '+   // qty
            '       sysdate,           '+   // start_date
            '       ''%s'',            '+   // trans_in_out
            '       ''%s'',            '+   // source_module
            '       %s,                '+   // source_id
            '       %f,                '+   // trans_priority
            '       ''%s'',            '+   // alert_descrip
            '       ''%s'',            '+   // lotno
            '       %s,                '+   // inv_trans_plan_id
            '       ''%s'',            '+   // source
            '       %s )               ',   // parent_arinvt_id
            [ AParams.id,
              FloatToStr0asNull( AParams.workorder_id, 'null' ),
              FloatToStr0asNull( AParams.sndop_dispatch_id, 'null'),
              FloatToStr0asNull( AParams.locations_id, 'null'),
              FloatToStr0asNull( AParams.inv_zone_id, 'null'),
              FloatToStr0asNull( AParams.arinvt_id, 'null' ),
              AParams.qty,
              AParams.trans_in_out,
              AParams.source_module,
              FloatToStr0asNull( AParams.source_id, 'null'),
              AParams.Trans_priority,
              FixStr( AParams.alert_descrip ),
              FixStr( AParams.lotno ),
              FloatToStr0asNull( AParams.inv_trans_plan_id, 'null'),
              AParams.Source,
              FloatToStr0asNull( AParams.parent_arinvt_id, 'null')]);
end;


function TTransAlertParams.FindTransAlert_ID: Real;
begin
  if Source = '' then
     Result:= SelectValueFmtAsFloat('select id from trans_alert where source_module = ''%s'' and source_id = %f', [ Source_Module, Source_ID ])
  else
     Result:= SelectValueFmtAsFloat('select id from trans_alert where source_module = ''%s'' and source_id = %f and source = ''%s''', [ Source_Module, Source_ID, Source ])
end;

{ TTransAlertParamsDtl }

constructor TTransAlertParamsDtl.Create(ATrans_Alert_ID: Real);
begin
  Trans_Alert_ID := ATrans_Alert_ID;
  Fgmulti_ID     := 0;
  Master_label_ID:= 0;
end;

procedure AppenToTransAlertDetail( AParams: TTransAlertParamsDtl );
begin
  ExecuteCommandFmt('insert into trans_alert_detail '+
            '     ( trans_alert_id,         '+
            '       fgmulti_id,             '+
            '       master_label_id )       '+
            ' values                        '+
            '     ( %f,                     '+   // trans_alert_id,
            '       %f,                     '+   // fgmulti_id,
            '       %s )                    ',   // master_label_id
            [ AParams.Trans_Alert_ID,
              AParams.FgMulti_ID,
              FloatToStr0asNull( AParams.Master_Label_ID, 'null')]);
end;


procedure AssignTransAlertInProcess( ATrans_Alert_ID: Real; AValue: Boolean );
begin
  ExecuteCommandFmt('declare                                                                                                                      '+
            '  v_trans_alert_id number:= %f;                                                                                              '+
            '  v_in_process     varchar2(1):= ''%s'';                                                                                     '+
            '  v_result         number;                                                                                                   '+
            'begin                                                                                                                        '+
            '  v_result:= inv_trans_misc.set_trans_alert_in_process( v_trans_alert_id, v_in_process);                                     '+
               // check result
            '  if v_result = -54 then                                                                                                     '+
            '     raise_application_error( -20500, ''Unable to lock pending transaction record - operation aborted.'' );                  '+
            '  elsif v_result = 100 then                                                                                                  '+
            '     raise_application_error( -20500, ''Pending transaction record has been processed or not found - operation aborted.'' ); '+
            '  elsif v_result <> 0 then                                                                                                   '+
            '     raise_application_error( -20500, ''Unable to modify IN-PROCESS pending transaction record - operation aborted.'' );     '+
            '  end if;                                                                                                                    '+
            'end;                                                                                                                         ',
            [ ATrans_Alert_ID,
              IQMS.Common.StringUtils.BoolToYN( AValue )]);
end;

procedure AssignTransAlertSuspended( ADataSet: TDataSet; AValue: Boolean );
var
  AReadOnly1: Boolean;
  AReadOnly2: Boolean;
begin
  if not (Assigned(ADataSet.FindField('SUSPENDED_DATE')) and Assigned(ADataSet.FindField('SUSPENDED_BY_USERID')))  then
     EXIT;

  ADataSet.Edit;

  AReadOnly1:= ADataSet.FieldByName('SUSPENDED_DATE').ReadOnly;
  AReadOnly2:= ADataSet.FieldByName('SUSPENDED_BY_USERID').ReadOnly;
  try
    ADataSet.FieldByName('SUSPENDED_DATE').ReadOnly     := False;
    ADataSet.FieldByName('SUSPENDED_BY_USERID').ReadOnly:= False;

    if AValue then
       begin
         ADataSet.FieldByName('SUSPENDED_DATE').asDateTime   := SelectValueAsFloat('select sysdate from dual');
         ADataSet.FieldByName('SUSPENDED_BY_USERID').asString:= SecurityManager.UserName;
       end
    else
       begin
         ADataSet.FieldByName('SUSPENDED_DATE').Clear;
         ADataSet.FieldByName('SUSPENDED_BY_USERID').Clear;
       end;
  finally
    ADataSet.FieldByName('SUSPENDED_DATE').ReadOnly:= AReadOnly1;
    ADataSet.FieldByName('SUSPENDED_BY_USERID').ReadOnly:= AReadOnly2;
  end;

  ADataSet.Post;
end;


procedure AssignTransAlertSuspended( ATrans_Alert_ID: Real; AValue: Boolean );
begin
  if AValue then
     begin
       ExecuteCommandFmt('update trans_alert set suspended_date = sysdate, suspended_by_userid = ''%s'' where id = %f',
                 [ SecurityManager.UserName,
                   ATrans_Alert_ID ]);
     end
  else
     begin
       ExecuteCommandFmt('update trans_alert set suspended_date = null, suspended_by_userid = null where id = %f',
                 [ ATrans_Alert_ID ]);
     end;
end;


end.

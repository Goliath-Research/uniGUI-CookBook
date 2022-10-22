unit assy_data_sched_share;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule;

procedure RemoveJobCheckScheduleNextJob( ACntr_Sched_ID, AWork_Center_ID: Real );
procedure RemoveAssyWorkorderFromScheduling( AWorkorder_ID: Real );

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Proc,
  IQMS.Common.NLS;

procedure RemoveJobCheckScheduleNextJob( ACntr_Sched_ID, AWork_Center_ID: Real );
type
  TRemovedJob = ( rjFirst_ThereMoreJobs, rjFirst_NoMoreJobs, rj2ndOrGreater );
var
  ARemovedJob        : TRemovedJob;
  AWorkorder_ID      : Real;
  ACntr_Seq          : Real;
  ANext_Cntr_Sched_ID: Real;
begin
  ARemovedJob:= rj2ndOrGreater;
  AWorkorder_ID      := SelectValueByID( 'workorder_id', 'cntr_sched', ACntr_Sched_ID);
  ACntr_Seq          := SelectValueFmtAsFloat('select cntr_seq from cntr_sched where ID = %f', [ ACntr_Sched_ID ]);
  ANext_Cntr_Sched_ID:= SelectValueFmtAsFloat('select id from cntr_sched where work_center_id = %f and cntr_seq > %f order by cntr_seq',
                                  [ AWork_Center_ID,
                                    ACntr_Seq  ]);

  if ACntr_Seq = 1 then
  begin
     if SelectValueFmtAsFloat('select count(*) from cntr_sched where work_center_id = %f', [ AWork_Center_ID ]) > 1 then
        ARemovedJob:= rjFirst_ThereMoreJobs
     else
        ARemovedJob:= rjFirst_NoMoreJobs;
  end;

  case ARemovedJob of
    rjFirst_ThereMoreJobs:
       if IQMS.Common.Miscellaneous.Is_Center_RT( AWork_Center_ID ) then
          IQMS.Common.Proc.RT_Setup( AWork_Center_ID, ANext_Cntr_Sched_ID, FALSE );  {Close out existing run and startup a new one}

    rjFirst_NoMoreJobs:
       if IQMS.Common.Miscellaneous.Is_Center_RT( AWork_Center_ID ) then
          IQMS.Common.Proc.RT_Close_SetUp( AWork_Center_ID );

    rj2ndOrGreater: ;
  end;

  ExecuteCommandFmt('delete from cntr_sched where id = %f', [ ACntr_Sched_ID ]);
  IQMS.Common.Proc.Recalc_Center( AWork_Center_ID, 0, 0 );
end;


procedure RemoveAssyWorkorderFromScheduling( AWorkorder_ID: Real );
var
  A: Variant;
begin
  with TFDQuery.Create(nil) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add(IQFormat('select b.id as cntr_sched_id,          '+
                     '       b.work_center_id                '+
                     '  from sndop_dispatch a,               '+
                     '       cntr_sched b                    '+
                     ' where a.workorder_id = %f             '+
                     '   and a.workorder_id = b.workorder_id '+
                     '   and a.id = b.sndop_dispatch_id      '+
                     ' order by a.id desc                    ',
                     [ AWorkorder_ID ]));
    Open;
    while not Eof do
    begin
      RemoveJobCheckScheduleNextJob( FieldByName('cntr_sched_id').asFloat, FieldByName('work_center_id').asFloat );
      Next;
    end;
  finally
    Free;
  end;
end;


end.


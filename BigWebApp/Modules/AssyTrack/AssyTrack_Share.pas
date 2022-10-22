unit AssyTrack_Share;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  RTTypes,
  MainModule;

type
  TPrepareLabelsDlgCargo = record
    Batch: Real;           // Master_Label_Plan.Batch
    Workorder_ID: Real;
    Arinvt_ID: Real;
    Sndop_ID: Real;
    Qty: Real;
    LotNo: string;
  end;

procedure PostMessageToRecalcStartEndDate( AWorkorder_ID: Real );
procedure RecalcWorkorderStartEndTime( AWorkorder_ID: Real );
procedure RecalcAllWorkordersStartEndTime( AViewFilter: TCellMfgType ); overload; // RTTypes.pas;
procedure RecalcAllWorkordersStartEndTime( AAssy_Group_ID: Real ); overload;
procedure UpdateWorkorderFG_LotNo( AWorkorder_ID: Real; AFG_LotNo: string );


implementation

uses
  IQMS.Common.Controls,
  IQMS.Common.JumpConstants,
  AssyTrack_Const,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils;

procedure PostMessageToRecalcStartEndDate( AWorkorder_ID: Real );
begin
  IQMS.Common.Controls.PostMessageToForm( 'TFrmAssyTrackMain', iq_Notify, AssyTrack_Const.constRecalcWorkorder, Trunc(AWorkorder_ID));
end;

procedure RecalcWorkorderStartEndTime( AWorkorder_ID: Real );
begin
  ExecuteCommandFmt('begin                                                                   '+
            '  for v in (select distinct workorder_id, partno_id                     '+
            '              from sndop_dispatch where workorder_id = %f)              '+
            '  loop                                                                  '+
            '    assy1_sched.calc_processes_start_end( v.workorder_id, v.partno_id );'+
            '  end loop;                                                             '+
            'end;',
            [ AWorkorder_ID ]);
end;



procedure RecalcAllWorkordersStartEndTime( AViewFilter: TCellMfgType ); // RTTypes.pas;
begin
   ExecuteCommandFmt('declare                                                                  '+
             '  v_view_kind  number::= %f;                                             '+
             '  v_mfgcell_id number::= %f;                                             '+
             '  v_mfgtype    varchar2(10)::= ''%s'';                                   '+
             'begin                                                                    '+
             '  for v in (select distinct d.workorder_id, d.partno_id                  '+
             '              from sndop_dispatch d, workorder w, standard s             '+
             '             where d.workorder_id = w.id                                 '+
             '                and nvl(w.assy_complete, ''N'') <> ''Y''                 '+
             '                and w.standard_id = s.id                                 '+
             '                                                                         '+
             '                and (v_view_kind = 1 and rtrim(s.mfg_type) = v_mfgtype   '+
             '                     or                                                  '+
             '                     v_view_kind = 2 and s.mfgcell_id = v_mfgcell_id )   '+
             '                                                                         '+
             '             order by d.workorder_id )                                   '+
             '  loop                                                                   '+
             '    assy1_sched.calc_processes_start_end( v.workorder_id, v.partno_id ); '+
             '  end loop;                                                              '+
             'end;                                                                     ',
             [ fIIf( AViewFilter.CellOrMfgType = cmCell, 2, 1 ),
               AViewFilter.MfgCell_ID,
               Trim( AViewFilter.MfgType ) ]);
end;


procedure RecalcAllWorkordersStartEndTime( AAssy_Group_ID: Real );
begin
   ExecuteCommandFmt('declare                                                                  '+
             '  v_assy_group_id number::= %f;                                          '+
             'begin                                                                    '+
             '  for v in (select distinct d.workorder_id, d.partno_id                  '+
             '              from sndop_dispatch d, workorder w, standard s             '+
             '             where d.workorder_id = w.id                                 '+
             '                and nvl(w.assy_complete, ''N'') <> ''Y''                 '+
             '                and w.standard_id = s.id                                 '+
             '                and w.assy_group_id = v_assy_group_id                    '+
             '             order by d.workorder_id )                                   '+
             '  loop                                                                   '+
             '    assy1_sched.calc_processes_start_end( v.workorder_id, v.partno_id ); '+
             '  end loop;                                                              '+
             'end;                                                                     ',
             [ AAssy_Group_ID ]);
end;


procedure UpdateWorkorderFG_LotNo( AWorkorder_ID: Real; AFG_LotNo: string );
begin
  if Trim(AFG_LotNo) = '' then
     EXIT;

  if AWorkorder_ID = 0 then
     EXIT;

  ExecuteCommandFmt('update workorder set assy_fg_lotno = ''%s'' where id = %f',
            [ FixStr( AFG_LotNo ),
             AWorkorder_ID ]);
end;


end.

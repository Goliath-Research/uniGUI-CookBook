unit heijunka_share;

interface

uses
  System.SysUtils;

function BOMBelongsToHeijunka( AStandard_ID: Real ): Boolean;
function IsHeijunkaSchedEnabled: Boolean;

implementation

uses
  IQMS.Common.DataLib;

function BOMBelongsToHeijunka( AStandard_ID: Real ): Boolean;
var
  AMfgcell_ID: Real;
begin
  // check pacemaker is bom
  Result:= SelectValueFmtAsFloat('select 1                                  '+
                     '  from kb_control kb,                     '+
                     '       heijunka h                         '+
                     ' where kb.pacemaker_source_id = %f        '+
                     '   and kb.pacemaker_source = ''STANDARD'' '+
                     '   and kb.mfgcell_id = h.mfgcell_id       ',
                     [ AStandard_ID ]) = 1;
  if Result then
     EXIT;

  // check pacemaker is a sndop
  Result:= SelectValueFmtAsFloat('select 1                                  '+
                     '  from kb_control kb,                     '+
                     '       heijunka h,                        '+
                     '       ptoper p,                          '+
                     '       partno                             '+
                     ' where h.mfgcell_id = kb.mfgcell_id       '+
                     '   and kb.pacemaker_source = ''PTOPER''   '+
                     '   and kb.pacemaker_source_id = p.id      '+
                     '   and p.partno_id = partno.id            '+
                     '   and partno.standard_id = %f            ',
                     [ AStandard_ID ]) = 1;
end;

function IsHeijunkaSchedEnabled: Boolean;
begin
  Result:= SelectValueAsString('select enable_heijunka_sched from iqsys2') = 'Y';
end;


end.

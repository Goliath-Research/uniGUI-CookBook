unit WO_Share;

interface

procedure ToggleWorkOrderFirm( YN: string; AWorkOrder_ID: Real; ASkipCascade: string = 'N' );

implementation

uses
  IQMS.Common.DataLib,
  SysUtils;

procedure ToggleWorkOrderFirm( YN: string; AWorkOrder_ID: Real; ASkipCascade: string = 'N' );
var
  AMain_Workorder_ID: Real;
begin
  AMain_Workorder_ID:= SelectValueFmtAsFloat('select main_workorder_id from wo_depend_flat where workorder_id = %f and rownum < 2', [ AWorkOrder_ID ]);
  if AMain_Workorder_ID = 0 then
     EXIT;  {s/n happen}
                                            
  if YN = 'Y' then
     ExecuteCommandFmt('begin                                                '+
               '  for v in ( select distinct workorder_id from wo_depend_flat '+
               '              where main_workorder_id = %f )         '+
               '  loop                                               '+
               '    irv32.convert_to_firm( v.workorder_id, ''%s'' ); '+
               '  end loop;                                          '+
               'end;                                                 ',
               [ AMain_Workorder_ID,
                 ASkipCascade ])
  else
     ExecuteCommandFmt('update workorder set firm = ''N''                                                    '+
               ' where id in ( select workorder_id from wo_depend_flat where main_workorder_id = %f and rownum < 2)',
               [ AMain_Workorder_ID ]);
end;


end.

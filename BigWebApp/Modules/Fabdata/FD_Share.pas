unit FD_Share;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule;

procedure GetNextSndopForLogIn( AWorkorder_ID, AArinvt_ID, ALastOpSeq: Real; var ANextSndop_ID, ANextOpSeq: Real );
procedure GetNextSndopForLogOut( AWorkorder_ID, AArinvt_ID, ALastOpSeq: Real; var ANextSndop_ID, ANextOpSeq: Real );

procedure GetPriorSndOpForLogIn( AWorkorder_ID, AArinvt_ID, ALastOpSeq: Real; var APriorSndop_ID, APriorOpSeq: Real );
function GetPriorSndOpForLogOut( AWorkorder_ID, AArinvt_ID, ALastOpSeq: Real; var APriorSndop_ID, APriorOpSeq: Real ): Boolean;

procedure UpdateStartQtyOfProcessesOnLogIn( AFab_Lot_WO_ID, AWorkorder_ID, AArinvt_ID, ALogInOpSeq, AQty: Real );
procedure UpdateEndQtyOfProcessesOnLogOut( AFab_Lot_WO_ID, AWorkorder_ID, AArinvt_ID, ALogOutOpSeq, AQty: Real );

function EmployeeJobMatchExists( APR_Emp_ID, ASndop_ID: Real; ASupervisorRights: Boolean ): Boolean;

implementation

uses
  IQMS.Common.DataLib,
  Variants,
  IQMS.Common.Numbers,
  IQMS.Common.NLS;

procedure GetNextSndopForLogIn( AWorkorder_ID, AArinvt_ID, ALastOpSeq: Real; var ANextSndop_ID, ANextOpSeq: Real );
var
  A: Variant;
begin
  ANextSndop_ID:= 0;
  ANextOpSeq   := 0;

  A:= SelectValueArrayFmt('select ptoper.sndop_id, ptoper.opseq      '+
                     '  from                                    '+
                     '       workorder w,                       '+
                     '       partno,                            '+
                     '       ptoper                             '+
                     ' where                                    '+
                     '       w.id = %f                          '+
                     '   and partno.standard_id = w.standard_id '+
                     '   and partno.arinvt_id = %f              '+
                     '                                          '+
                     '   and ptoper.partno_id = partno.id       '+
                     '   and ptoper.opseq > %f                  '+
                     '   and ptoper.login_required = ''Y''      '+
                     ' order by ptoper.opseq',
                     [ AWorkorder_ID,
                       AArinvt_ID,
                       ALastOpSeq ]);

  if VarArrayDimCount( A ) > 0 then
  begin
    ANextSndop_ID:= A[ 0 ];
    ANextOpSeq   := A[ 1 ];
  end;
end;


procedure GetNextSndopForLogOut( AWorkorder_ID, AArinvt_ID, ALastOpSeq: Real; var ANextSndop_ID, ANextOpSeq: Real );
var
  A: Variant;
begin
  ANextSndop_ID:= 0;
  ANextOpSeq   := 0;

  A:= SelectValueArrayFmt('select ptoper.sndop_id, ptoper.opseq      '+
                     '  from                                    '+
                     '       workorder w,                       '+
                     '       partno,                            '+
                     '       ptoper                             '+
                     ' where                                    '+
                     '       w.id = %f                          '+
                     '   and partno.standard_id = w.standard_id '+
                     '   and partno.arinvt_id = %f              '+
                     '                                          '+
                     '   and ptoper.partno_id = partno.id       '+
                     '   and ptoper.opseq >= %f                 '+
                     '   and ptoper.logout_required = ''Y''     '+
                     ' order by ptoper.opseq',
                     [ AWorkorder_ID,
                       AArinvt_ID,
                       ALastOpSeq ]);

  if VarArrayDimCount( A ) > 0 then
  begin
    ANextSndop_ID:= A[ 0 ];
    ANextOpSeq   := A[ 1 ];
  end;
end;


procedure GetPriorSndOpForLogIn( AWorkorder_ID, AArinvt_ID, ALastOpSeq: Real; var APriorSndop_ID, APriorOpSeq: Real );
var
  A: Variant;
begin
  APriorSndop_ID:= 0;
  APriorOpSeq   := 0;

  A:= SelectValueArrayFmt('select ptoper.sndop_id, ptoper.opseq      '+
                     '  from                                    '+
                     '       workorder w,                       '+
                     '       partno,                            '+
                     '       ptoper                             '+
                     ' where                                    '+
                     '       w.id = %f                          '+
                     '   and partno.standard_id = w.standard_id '+
                     '   and partno.arinvt_id = %f              '+
                     '                                          '+
                     '   and ptoper.partno_id = partno.id       '+
                     '   and ptoper.opseq <= %f                 '+
                     '   and ptoper.login_required = ''Y''      '+
                     ' order by ptoper.opseq desc',
                     [ AWorkorder_ID,
                       AArinvt_ID,
                       ALastOpSeq ]);

  if VarArrayDimCount( A ) > 0 then
  begin
    APriorSndop_ID:= A[ 0 ];
    APriorOpSeq   := A[ 1 ];
  end;
end;

function GetPriorSndOpForLogOut( AWorkorder_ID, AArinvt_ID, ALastOpSeq: Real; var APriorSndop_ID, APriorOpSeq: Real ): Boolean;
var
  A: Variant;
begin
  Result        := FALSE;
  APriorSndop_ID:= 0;
  APriorOpSeq   := 0;

  A:= SelectValueArrayFmt('select ptoper.sndop_id, ptoper.opseq      '+
                     '  from                                    '+
                     '       workorder w,                       '+
                     '       partno,                            '+
                     '       ptoper                             '+
                     ' where                                    '+
                     '       w.id = %f                          '+
                     '   and partno.standard_id = w.standard_id '+
                     '   and partno.arinvt_id = %f              '+
                     '                                          '+
                     '   and ptoper.partno_id = partno.id       '+
                     '   and ptoper.opseq < %f                  '+
                     '   and ptoper.logout_required = ''Y''     '+
                     ' order by ptoper.opseq desc',
                     [ AWorkorder_ID,
                       AArinvt_ID,
                       ALastOpSeq ]);

  if VarArrayDimCount( A ) > 0 then
  begin
    APriorSndop_ID:= A[ 0 ];
    APriorOpSeq   := A[ 1 ];
    Result        := TRUE;
  end;
end;



procedure UpdateStartQtyOfProcessesOnLogIn( AFab_Lot_WO_ID, AWorkorder_ID, AArinvt_ID, ALogInOpSeq, AQty: Real );
var
  ANextSndop_ID,  ANextOpSeq : Real;
  APriorSndop_ID, APriorOpSeq: Real;
begin
  {update start_qty of all processes starting with current login and finishing with future logout}
  // GetNextSndopForLogOut( AWorkorder_ID, AArinvt_ID, ALogInOpSeq, ANextSndop_ID, ANextOpSeq );
  // if ANextOpSeq = 0 then
  //    ANextOpSeq:= 999;
  //
  // ExecuteCommandFmt('update fab_lot_process      '+
  //           '   set start_qty = %f       '+
  //           ' where fab_lot_wo_id = %f   '+
  //           '   and seq between %f and %f',
  //           [ AQty,
  //             AFab_Lot_WO_ID,
  //             ALogInOpSeq,
  //             ANextOpSeq ]);

  ExecuteCommandFmt('update fab_lot_process      '+
            '   set start_qty = %f       '+
            ' where fab_lot_wo_id = %f   '+
            '   and seq >= %f            ',
            [ AQty,
              AFab_Lot_WO_ID,
              ALogInOpSeq ]);


  {Find last operation seq we logged out and if any operations are between then and now that are not login/out type - assign the start and end qty}
  if GetPriorSndOpForLogOut( AWorkorder_ID, AArinvt_ID, ALogInOpSeq, APriorSndop_ID, APriorOpSeq ) then
  begin
    if APriorOpSeq > 0 then
       APriorOpSeq:= APriorOpSeq + 1;
    if APriorOpSeq < ALogInOpSeq then
       ExecuteCommandFmt('update fab_lot_process      '+
                 '   set start_qty = %f,      '+
                 '      end_qty = %f          '+
                 ' where fab_lot_wo_id = %f   '+
                 '   and seq between %f and %f',
                 [ AQty,
                   AQty,
                   AFab_Lot_WO_ID,
                   APriorOpSeq,
                   ALogInOpSeq - 1 ]);
  end;
end;

procedure UpdateEndQtyOfProcessesOnLogOut( AFab_Lot_WO_ID, AWorkorder_ID, AArinvt_ID, ALogOutOpSeq, AQty: Real );
var
  APriorSndop_ID, APriorOpSeq: Real;
  ANextSndop_ID,  ANextOpSeq : Real;
begin
  {update end_qty of all processes starting with past login and finishing with current logout}
  GetPriorSndOpForLogIn( AWorkorder_ID, AArinvt_ID, ALogOutOpSeq, APriorSndop_ID, APriorOpSeq );

  ExecuteCommandFmt('update fab_lot_process      '+
            '   set end_qty = %f         '+
            ' where fab_lot_wo_id = %f   '+
            '   and seq between %f and %f',
            [ AQty,
              AFab_Lot_WO_ID,
              APriorOpSeq,
              ALogOutOpSeq ]);

  {Find next operation seq we will log in. If found - do nothing as the login above will take care of any processes in between.
   But if we loggin out and we have a bunch of processes after that with no log in/out - assign them all with start & end qty}
  GetNextSndOpForLogIn( AWorkorder_ID, AArinvt_ID, ALogOutOpSeq, ANextSndop_ID, ANextOpSeq );
  if ANextOpSeq = 0 then
  begin
     ANextOpSeq:= SelectValueFmtAsFloat('select max(seq) from fab_lot_process where fab_lot_wo_id = %f', [ AFab_Lot_WO_ID ]);
     if ANextOpSeq > ALogOutOpSeq then
        ExecuteCommandFmt('update fab_lot_process      '+
                  '   set start_qty = %f,      '+
                  '      end_qty = %f          '+
                  ' where fab_lot_wo_id = %f   '+
                  '   and seq between %f and %f',
                  [ AQty,
                    AQty,
                    AFab_Lot_WO_ID,
                    ALogOutOpSeq + 1,
                    ANextOpSeq ]);
  end;
end;


function EmployeeJobMatchExists( APR_Emp_ID, ASndop_ID: Real; ASupervisorRights: Boolean ): Boolean;
var
  ASndopCert: Real;
  APrEmpCert: Real;
begin
  with TFDQuery.Create(nil) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add(IQFormat( 'select hr_job_descrip_id                             '+
                    '  from pr_emp_job                                    '+
                    ' where                                               '+
                    '       pr_emp_id = %f                                '+
                    '   and NVL(cert_expire_date, sysdate + 1) >= sysdate '+
                    'INTERSECT                                            '+
                    'select hr_job_descrip_id                             '+
                    '  from sndop_job_descrip                             '+
                    ' where                                               '+
                    '       sndop_id = %f                                 '+
                    '   and NVL(supervisor_rights, ''N'') = ''%s''        ',
                    [ APR_Emp_ID,
                      ASndop_ID,
                      IIf(ASupervisorRights, 'Y', 'N') ]));
    Open;
    while not Eof do
    begin
      ASndopCert:= SelectValueFmtAsFloat('select NVL(cert_level,0) from sndop_job_descrip where sndop_id = %f and hr_job_descrip_id = %f', [ ASndop_ID,  FieldByName('hr_job_descrip_id').asFloat ]);
      APrEmpCert:= SelectValueFmtAsFloat('select NVL(cert_level,0) from pr_emp_job where pr_emp_id = %f and hr_job_descrip_id = %f',       [ APR_Emp_ID, FieldByName('hr_job_descrip_id').asFloat ]);

      {compare cert levels}
      if ASndopCert <= APrEmpCert then
      begin
        Result:= TRUE;
        EXIT;
      end;
      Next;
    end;

    Result:= FALSE;
  finally
    Free;
  end;
end;


end.

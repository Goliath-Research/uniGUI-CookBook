unit WC_7802;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  MainModule,
  pm_schedmsg;

procedure Test1;
var
  APMEqmtID : Real;
begin
  APMEqmtID := UniMainModule.FDConnection1.ExecSQLScalar('SELECT max(e.id) ' +
                                                         '  FROM cntr_sched a, workorder b, standard_pmeqmt c, work_center d, pmeqmt e, standard f ' +
                                                         ' WHERE a.workorder_id = b.id AND ' +
                                                         '       b.standard_id = c.standard_id AND ' +
                                                         '       d.id = a.work_center_id AND ' +
                                                         '       c.pmeqmt_id = e.id AND ' +
                                                         '       f.id = c.standard_id AND ' +
                                                         '       (a.prod_start_time BETWEEN sysdate-10000 AND sysdate OR ' +
                                                         '       a.prod_end_time BETWEEN sysdate-10000 AND sysdate OR ' +
                                                         '       a.prod_start_time <= sysdate-10000 AND a.prod_end_time >= sysdate)');
  DoShowSchedulingConflict(APMEqmtID, now-10000, now);
end;

initialization

  TTestRepo.RegisterTest('WC-7802', 'Pm', 'FrmPMScheduleWarning', 'DoShowSchedulingConflict', Test1);

end.

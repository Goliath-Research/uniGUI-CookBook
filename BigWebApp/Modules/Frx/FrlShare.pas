unit FrlShare;

interface

uses
  IQMS.Common.DataConst;

procedure Populate_c_glacct_ybb_all_periods_cumm(db:String = cnstFDConnectionName);

implementation
uses
  IQMS.Common.DataLib;

procedure Populate_c_glacct_ybb_all_periods_cumm(db:String = cnstFDConnectionName);
begin

  //changed the 'drop table' to 'truncate table' to avoid invalidating the FRX_* procedures

  try
    ExecuteCommand('truncate table c_glacct_ybb_all_periods_cumm', db);
  except
  end;
  try
    ExecuteCommand('truncate table c_glacct_ybb_all_per_cumm1', db);
  except
  end;

  try
    ExecuteCommand('drop index ix_ybb_glacct1', db);
  except
  end;
  try
    ExecuteCommand('drop index ix_ybb_glacct ', db);
  except
  end;
  try
    ExecuteCommand('drop index ix_ybb_glyear ', db);
  except
  end;

  ExecuteCommand('insert into c_glacct_ybb_all_per_cumm1 ' +
         ' (glacct_id,                                           ' +
         ' glperiods_start_date,                                ' +
         ' ytd_beginning,                                       ' +
         ' glyear_id,                                           ' +
         ' eplant_id,                                           ' +
         ' glyear_end_date,                                     ' +
         ' period,                                              ' +
         ' period_debit,                                        ' +
         ' period_credit,                                       ' +
         ' period_balance,                                      ' +
         ' frl_fiscal_year,                                     ' +
         ' cumm_period_balance)                                 ' +
         'select ' +
         ' glacct_id,                                           ' +
         ' glperiods_start_date,                                ' +
         ' ytd_beginning,                                       ' +
         ' glyear_id,                                           ' +
         ' eplant_id,                                           ' +
         ' glyear_end_date,                                     ' +
         ' period,                                              ' +
         ' period_debit,                                        ' +
         ' period_credit,                                       ' +
         ' period_balance,                                      ' +
         ' frl_fiscal_year,                                     ' +
         ' cumm_period_balance                                  ' +
         ' from v_glacct_ybb_all_periods_cumm                   ', db);


  ExecuteCommand('insert into c_glacct_ybb_all_periods_cumm                           ' +
         '(       ytd_beginning,                                                    ' +
         '        glyear_id,                                                        ' +
         '        glacct_id )                                                       ' +
         ' select ytd_beginning,                                                  ' +
         '        glyear_id,                                                        ' +
         '        glacct_id                                                         ' +
         '   from c_glacct_ybb_all_per_cumm1 v                                  ' +
         ' where (glperiods_start_date,                                             ' +
         '        glyear_id,                                                        ' +
         '        glacct_id) in (select min(glperiods_start_date),                  ' +
         '                              glyear_id,                                  ' +
         '                              glacct_id                                   ' +
         '                         from c_glacct_ybb_all_per_cumm1              ' +
         '                     group by                                             ' +
         '                              glyear_id,                                  ' +
         '                              glacct_id )                                 ');

  try
    ExecuteCommand('create index ix_ybb_glacct1 on c_glacct_ybb_all_per_cumm1 (GLACCT_ID)', db);
  except
  end;
  try
    ExecuteCommand('create index ix_ybb_glacct on c_glacct_ybb_all_periods_cumm (GLACCT_ID)', db);
  except
  end;
  try
    ExecuteCommand('create index ix_ybb_glyear on c_glacct_ybb_all_periods_cumm (GLYEAR_ID)', db);
  except
  end;



{*

  ExecuteCommand('drop table c_glacct_ybb_all_periods_cumm', db);
  ExecuteCommand('drop table c_glacct_ybb_all_per_cumm1', db);
  ExecuteCommand('create table c_glacct_ybb_all_per_cumm1 as select ' +
         ' glacct_id,                                           ' +
         ' glperiods_start_date,                                ' +
         ' ytd_beginning,                                       ' +
         ' glyear_id,                                           ' +
         ' eplant_id,                                           ' +
         ' glyear_end_date,                                     ' +
         ' period,                                              ' +
         ' period_debit,                                        ' +
         ' period_credit,                                       ' +
         ' period_balance,                                      ' +
         ' cumm_period_balance                                  ' +
         ' from v_glacct_ybb_all_periods_cumm                   ', db);
  ExecuteCommand('create table c_glacct_ybb_all_periods_cumm                                ' +
         'as select ytd_beginning,                                                  ' +
         '        glyear_id,                                                        ' +
         '        glacct_id                                                         ' +
         '   from c_glacct_ybb_all_per_cumm1 v                                  ' +
         ' where (glperiods_start_date,                                             ' +
         '        glyear_id,                                                        ' +
         '        glacct_id) in (select min(glperiods_start_date),                  ' +
         '                              glyear_id,                                  ' +
         '                              glacct_id                                   ' +
         '                         from c_glacct_ybb_all_per_cumm1              ' +
         '                     group by                                             ' +
         '                              glyear_id,                                  ' +
         '                              glacct_id )                                 ');
  ExecuteCommand('create index ix_ybb_glacct1 on c_glacct_ybb_all_per_cumm1 (GLACCT_ID)', db);
  ExecuteCommand('create index ix_ybb_glacct on c_glacct_ybb_all_periods_cumm (GLACCT_ID)', db);
  ExecuteCommand('create index ix_ybb_glyear on c_glacct_ybb_all_periods_cumm (GLYEAR_ID)', db);


*}
end;


end.

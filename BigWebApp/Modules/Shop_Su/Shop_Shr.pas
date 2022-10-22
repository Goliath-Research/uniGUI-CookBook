unit Shop_Shr;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  MainModule;

const
  {day off types}
  WEEKEND_OFF = 1;
  SHIFT_OFF   = 2;
  IDLE_TIME   = 4;

  PARAMS = 'PARAMS';
  MFGCELL_PARAM = 'MFGCELL_PARAM';
  WORK_CENTER = 'WORK_CENTER';
  TOOL_PARAMS = 'TOOL_PARAMS';

type
  TCalendarSetupType = (stDefault, stMfgCells, stBoth);

  {shop_calendar}
  TShopCalendarDay = record
    Mfg1: Boolean;
    Mfg2: Boolean;
    Mfg3: Boolean;
    Mfg4: Boolean;
  end;
  TShopCalendarWeek = array [1..7] of TShopCalendarDay;


procedure IQSetDurations( var Duration1,
                              Duration2,
                              Duration3,
                              Duration4: Real );
procedure IQSetDurationsEx( var Duration1,
                                Duration2,
                                Duration3,
                                Duration4: Real;
                                Shifts: Real;
                                const AShiftStart1,
                                      AShiftStart2,
                                      AShiftStart3,
                                      AShiftStart4: string;
                                AHrsDay: Real );

procedure CheckCreateTimeOff( ADay                           : TDateTime;
                              nDays_Week                     : Integer;
                              nShifts                        : Integer;
                              Work1, Work2, Work3, Work4     : Boolean;
                              const AWorkCenter_ID           : string;
                              Duration1, Duration2, Duration3, Duration4: Real;
                              AMfgCell_ID                    : Real );

function IQGetParamFromMfgCell( AMfgCell_ID: Real;
                                var AShifts: Real;
                                var AShiftStart1,
                                    AShiftStart2,
                                    AShiftStart3,
                                    AShiftStart4: string;
                                    var AHrsDay: Real ): Boolean;


implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  Variants,
  IQMS.Common.StringUtils;

// procedure CreateOffInterval( AWorkCenter_ID:string; StartTime, EndTime:TDateTime; nDay_Off_type: Integer; AMfgCell_ID: Real ); forward;

procedure IQSetDurations( var Duration1,
                              Duration2,
                              Duration3,
                              Duration4: Real );
var
  A: Variant;
begin
  A:= SelectValueArray( 'select shifts, shift_start1, shift_start2, shift_start3, shift_start4, hrs_day from params');
  if VarArrayDimCount( A ) = 0 then
     raise Exception.Create('Please assign how many shifts, start / end of every shift etc in the Shop Setup');
  IQSetDurationsEx( Duration1, Duration2, Duration3, Duration4, A[ 0 ], A[ 1 ], A[ 2 ], A[ 3 ], A[ 4 ], A[ 5 ]);
end;

procedure IQSetDurationsEx( var Duration1,
                                Duration2,
                                Duration3,
                                Duration4: Real;
                                Shifts: Real;
                                const AShiftStart1,
                                      AShiftStart2,
                                      AShiftStart3,
                                      AShiftStart4: string;
                                AHrsDay: Real );
var
  I: Integer;
  ADuration: Real;

  Time1, Time2, Time3, Time4: TDateTime;
begin
  Duration1:= 0; Duration2:= 0; Duration3:= 0; Duration4:= 0;
  if AHrsDay = 0 then  // since we introduced AHrsDay later in game lets prevent from it croaking.
     AHrsDay:= 24
  else if AHrsDay > 24 then
     AHrsDay:= 24;

  for I:= 1 to Trunc(Shifts) do
  begin
    ADuration:= SelectValueFmtAsFloat('select IQCalendar.shift_length_of( %d,    '+    // v_shift
                          '                                   %f,     '+   // v_shifts_count
                          '                                   %.12f,  '+   // v_start1
                          '                                   %.12f,  '+   // v_start2
                          '                                   %.12f,  '+   // v_start3
                          '                                   %.12f,  '+   // v_start4
                          '                                   %.12f ) '+   // v_hrs_day
                          '  from dual',
                          [ I,
                            Shifts,
                            StrToTime( nz( AShiftStart1, '00:00:00')),
                            StrToTime( nz( AShiftStart2, '00:00:00')),
                            StrToTime( nz( AShiftStart3, '00:00:00')),
                            StrToTime( nz( AShiftStart4, '00:00:00')),
                            AHrsDay ]);

    ADuration:= IQRound( ADuration, 6 );

    case I of
      1: Duration1:= ADuration;
      2: Duration2:= ADuration;
      3: Duration3:= ADuration;
      4: Duration4:= ADuration;
    end;
  end;

(*
  if Shifts = 1 then  // 1 shift
     begin
       Duration1:= AHrsDay;
       Duration2:= 0;
       Duration3:= 0;
       Duration4:= 0;
     end
  else if Shifts = 2 then  // 2 shifts
     begin
       {duration of shift 1}
       time1:= StrToTime( AShiftStart1 );
       time2:= StrToTime( AShiftStart2 );
       if time2 > time1 then
          Duration1:= (time2 - time1) * 24
       else
          Duration1:= (1 - time1 + time2) * 24;

       Duration1:= fMin( Duration1, AHrsDay );

       {duration of shift 2}
       Duration2:= AHrsDay - Duration1;

       {duration of shift 3 & 4}
       Duration3:= 0;
       Duration3:= 4;
     end
  else if Shifts = 3 then   // 3 shifts
     begin
       {duration of shift 1}
       time1:= StrToTime( AShiftStart1 );
       time2:= StrToTime( AShiftStart2 );
       if time2 > time1 then
          Duration1:= (time2 - time1) * 24
       else
          Duration1:= (1 - time1 + time2) * 24;

       Duration1:= fMin( Duration1, AHrsDay );

       {duration of shift 2}
       time3:= StrToTime( AShiftStart3 );
       if time3 > time2 then
          Duration2:= (time3 - time2) * 24
       else
          Duration2:= (1 - time2 + time3) * 24;

       Duration2:= fMin( Duration2, AHrsDay - Duration1 );

       {duration of shift 3}
       Duration3:= AHrsDay - Duration1 - Duration2;
     end;
*)
end;

{ ------------------------------------------------------------------------------ }

{passed ADay represents production date starting with the time of shift# 1}
procedure CheckCreateTimeOff( ADay                           : TDateTime;
                              nDays_Week                     : Integer;
                              nShifts                        : Integer;
                              Work1, Work2, Work3, Work4     : Boolean;
                              const AWorkCenter_ID           : string;
                              Duration1, Duration2, Duration3, Duration4: Real;
                              AMfgCell_ID                    : Real );
var
  StartTime: TDateTime;
  EndTime  : TDateTime;
  I        : Integer;
begin
  ExecuteCommandFmt('begin                                                 '+
            '  IQCalendar.check_working_create_time_off( to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''), '+  // v_prod_date_1st_shift date,
            '                                            ''%s'',   '+                                      // v_work_center_id varchar2,
            '                                            %s,       '+                                      // v_mfgcell_id
            '                                            %d,       '+                                      // v_day_off_type
            '                                            %d,       '+                                      // v_shifts_count
            '                                            %.12f,    '+                                      // v_duration1
            '                                            %.12f,    '+                                      // v_duration2
            '                                            %.12f,    '+                                      // v_duration3
            '                                            %.12f,    '+                                      // v_duration4
            '                                            ''%s'',   '+                                      // v_work1
            '                                            ''%s'',   '+                                      // v_work2
            '                                            ''%s'',   '+                                      // v_work3
            '                                            ''%s'' ); '+                                      // v_work4
            'end;                                                  ',
            [ FormatDateTime('mm/dd/yyyy hh:nn:ss', ADay),
              AWorkCenter_ID,
              FloatToStr0asNull(AMfgCell_ID, 'null'),
              SHIFT_OFF,
              nShifts,
              Duration1, Duration2, Duration3, Duration4,
              BoolToYN(Work1), BoolToYN(Work2), BoolToYN(Work3), BoolToYN(Work4) ]);
end;


function IQGetParamFromMfgCell( AMfgCell_ID: Real;
                                var AShifts: Real;
                                var AShiftStart1,
                                    AShiftStart2,
                                    AShiftStart3,
                                    AShiftStart4: string;
                                    var AHrsDay: Real ): Boolean;
label
  next_step;
var
  AMfgCellParam_ID: Real;
  A: Variant;
begin
  if AMfgCell_ID > 0 then
     AMfgCellParam_ID:= SelectValueFmtAsFloat('select iqcalendar.get_mfgcell_param_id( %f ) from dual', [ AMfgCell_ID ]);

  if (AMfgCell_ID > 0) and (AMfgCellParam_ID > 0) then
    A:= SelectValueArrayFmt( 'select shifts, shift_start1, shift_start2, shift_start3, shift_start4, hrs_day from mfgcell_param where id = %f', [ AMfgCellParam_ID ])
  else
    A:= SelectValueArray( 'select shifts, shift_start1, shift_start2, shift_start3, shift_start4, hrs_day from params');

  Result:= VarArrayDimCount( A ) > 0;
  if Result then
  begin
     AShifts     := A[ 0 ];
     AShiftStart1:= A[ 1 ];
     AShiftStart2:= A[ 2 ];
     AShiftStart3:= A[ 3 ];
     AShiftStart4:= A[ 4 ];
     AHrsDay     := A[ 5 ];
  end
end;


end.


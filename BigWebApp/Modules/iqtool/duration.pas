unit duration;

interface

uses
  System.SysUtils;

  {Conversion routines}

  {Duration Display Unit, i.e., Minutes, Hours, Days, Weeks}
  function GetDurationDisplayUnit( Value: Integer ): String;
  function SetDurationDisplayUnit( Value: String ): Integer;
  {Duration}
  function GetDuration( Value: Real; AUnit: Integer ): Real;
  function SetDuration( Value: Real; AUnit: Integer ): Real;

  // function GetDurationAsDateTime( Value: Real; AUnit: Integer ): Real;

  {returns TDateTime plus number of weeks}
  function AddWeeks( ADate: TDateTime; ANumWeeks: Integer ): TDateTime;
  function NextWeek( ACurrentDate: TDateTime; ANumWeeks: Integer ): TDateTime;

  {returns next date with the additional duration}
  function GetNextDate( AStartDate: TDateTime; ANewDuration: Real;
    ADurationUnit: Integer; AEPlantID: Int64): TDateTime;


const
     { ** Duration Unit ** }

     // Duration Unit constants
     DURATION_MIN   = 3;
     DURATION_HOUR  = 5;
     DURATION_DAY   = 7;
     DURATION_WEEK  = 9;

     // Divisor for duration value
     DIVISOR_MIN    = 10;
     DIVISOR_HOUR   = 600;
     DIVISOR_DAY    = 4800;
     DIVISOR_WEEK   = 24000;

implementation

uses
  IQMS.Common.DataLib;

function GetDurationDisplayUnit( Value: Integer ): String;
begin
     { TASK_INFORMATION.DURATION_DISP_UNITS is an Integer value representing
       the unit of measure for duration.  Here is how it works:
       Value       Meaning     Each       Example
       -----------------------------------------------
       3           Minutes     10         40 3 = 4 minutes
       5           Hours       600        600 5 = 1 hour
       7           Days        4800       4800 7 = 1 day
       9           Weeks       24000      24000 9 = 1 week
     }

     {Get the string value for the UOM}
     case Value of
      DURATION_MIN: Result := 'Minutes';
      DURATION_HOUR: Result := 'Hours';
      DURATION_DAY: Result := 'Days';
      DURATION_WEEK: Result := 'Weeks';
     else Result := 'Days';
     end;
end;

function SetDurationDisplayUnit( Value: String ): Integer;
begin
     { TASK_INFORMATION.DURATION_DISP_UNITS is an Integer value representing
       the unit of measure for duration.  Here is how it works:
       Value       Meaning     Each       Example
       -----------------------------------------------
       3           Minutes     10         40 3 = 4 minutes
       5           Hours       600        600 5 = 1 hour
       7           Days        4800       4800 7 = 1 day
       9           Weeks       24000      24000 9 = 1 week
     }
     {Trim excess spaces}
     Value := Trim( Value );
     {Get the numeric value for the UOM}
     if      ( UpperCase( Value ) = 'M' ) or            {Minutes}
             ( UpperCase( Value ) = 'MN' ) or
             ( UpperCase( Value ) = 'MIN' ) or
             ( UpperCase( Value ) = 'MINS' ) or
             ( UpperCase( Value ) = 'MINUTE' ) or
             ( UpperCase( Value ) = 'MINUTES' )  then
               Result := DURATION_MIN
     else if ( UpperCase( Value ) = 'H' ) or            {Hours}
             ( UpperCase( Value ) = 'HR' ) or
             ( UpperCase( Value ) = 'HOUR' ) or
             ( UpperCase( Value ) = 'HOURS' ) then
               Result := DURATION_HOUR
     else if ( UpperCase( Value ) = 'D' ) or            {Days}
             ( UpperCase( Value ) = 'DY' ) or
             ( UpperCase( Value ) = 'DAY' ) or
             ( UpperCase( Value ) = 'DAYS' ) then
               Result := DURATION_DAY
     else if ( UpperCase( Value ) = 'W' ) or            {Weeks}
             ( UpperCase( Value ) = 'WK' ) or
             ( UpperCase( Value ) = 'WEEK' ) or
             ( UpperCase( Value ) = 'WEEKS' ) then
               Result := DURATION_WEEK
     else Result := DURATION_DAY;                       {Default to Days}

end;

function GetDuration( Value: Real; AUnit: Integer ): Real;
begin
  { TASK_INFORMATION.DURATION_DISP_UNITS is an Integer value representing
    the unit of measure for duration.  Here is how it works:
    Value       Meaning     Each       Example
    -----------------------------------------------
    3           Minutes     10         40 3 = 4 minutes
    5           Hours       600        600 5 = 1 hour
    7           Days        4800       4800 7 = 1 day
    9           Weeks       24000      24000 9 = 1 week
  }
  Result := 0; // initial
  try
      case AUnit of
        DURATION_MIN: Result := Value / DIVISOR_MIN;
        DURATION_HOUR: Result := Value / DIVISOR_HOUR;
        DURATION_DAY: Result := Value / DIVISOR_DAY;
        DURATION_WEEK: Result := Value / DIVISOR_WEEK;
      else Result := Value / DIVISOR_DAY;
      end;
  finally
    if Result <= 0 then Result := 0;
  end;
end;

{function GetDurationAsDateTime( Value: Real; AUnit: Integer ): Real;
var
   tmp: Real;
begin
  Result := 0; // initial
  try
      case AUnit of
        DURATION_MIN:
         begin
           tmp := Value / DIVISOR_MIN;
           Result := tmp * IQMS.Dates.TIME_OneMinute;
         end;
        DURATION_HOUR:
         begin
           tmp := Value / DIVISOR_HOUR;
           Result := tmp * IQMS.Dates.TIME_OneHour;
         end;
        DURATION_DAY:
         begin
           tmp := Value / DIVISOR_DAY;
           Result := tmp * IQMS.Dates.TIME_OneDay;
         end;
        DURATION_WEEK:
         begin
           tmp := Value / DIVISOR_WEEK;
           Result := tmp * IQMS.Dates.TIME_OneWeek;
         end;
      else Result := 0;
      end;
  finally
    if Result <= 0 then Result := 0;
  end;
end;}

function SetDuration( Value: Real; AUnit: Integer ): Real;
begin
  { TASK_INFORMATION.DURATION_DISP_UNITS is an Integer value representing
    the unit of measure for duration.  Here is how it works:
    Value       Meaning     Each       Example
    -----------------------------------------------
    3           Minutes     10         40 3 = 4 minutes
    5           Hours       600        600 5 = 1 hour
    7           Days        4800       4800 7 = 1 day
    9           Weeks       24000      24000 9 = 1 week
  }
  try
     case AUnit of
      DURATION_MIN: Result := Value * DIVISOR_MIN;
      DURATION_HOUR: Result := Value * DIVISOR_HOUR;
      DURATION_DAY: Result := Value * DIVISOR_DAY;
      DURATION_WEEK: Result := Value * DIVISOR_WEEK;
     else Result := Value * DIVISOR_DAY;
     end;
  finally
     if Result <= 0 then Result := 0;
  end;
end;

{returns TDateTime plus number of weeks}
function AddWeeks( ADate: TDateTime; ANumWeeks: Integer ): TDateTime;
begin
     Result := ADate + ( ANumWeeks * 7 );
end;

function GetNextDate( AStartDate: TDateTime; ANewDuration: Real;
  ADurationUnit: Integer; AEPlantID: Int64): TDateTime;
begin
  // Returns a new finish date.
  Result := SelectValueFmtAsDateTime(
    'SELECT '#13 +
    '  project_calendar.get_finish_date(' +
    'TO_DATE(''%s'', ''MM/DD/RRRR HH24:MI:SS''), %.15f, %d, %d) '#13 +
    'FROM DUAL',
    [FormatDateTime('mm/dd/yyyy hh:nn:ss', AStartDate),
     ANewDuration, ADurationUnit, AEPlantID]);
end;

function NextWeek( ACurrentDate: TDateTime; ANumWeeks: Integer ): TDateTime;
var
   AFinishDate : TDateTime;

   i          : Integer;
   ADay       : Word;
   AMonth     : Word;
   AYear      : Word;

   zDay       : Word;
   zMonth     : Word;
   zYear      : Word;

begin

     i := 0;

     AFinishDate := ACurrentDate; {initialize}

     DecodeDate( ACurrentDate, AYear, AMonth, ADay );

     while i <= ANumWeeks do
           begin
                DecodeDate( AFinishDate, zYear, zMonth, zDay );
                if DayOfWeek( AFinishDate ) = DayOfWeek( ACurrentDate ) then
                   Inc( i );
                AFinishDate := AFinishDate + 1;
           end;
     Result := AFinishDate - 1;

end;

end.

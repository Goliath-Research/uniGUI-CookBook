unit IQMS.Common.Dates;

interface

uses
  Winapi.Windows, Vcl.Forms, Vcl.Dialogs, System.Classes, System.SysUtils,
  Data.DB, System.Math, Vcl.Controls, System.DateUtils, StrUtils,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Stan.Param, FireDAC.Phys, FireDAC.Phys.Intf,
  FireDAC.DatS, FireDAC.DApt, FireDAC.DApt.Intf, FireDAC.UI.Intf,
  System.Variants;
//  db_dm;

function IQEoY( dDate:TDateTime ):TDateTime;
function IQBoY( dDate:TDateTime ):TDateTime;
function IQBoM( dDate:TDateTime ):TDateTime;
function IQEoM( dDate:TDateTime ):TDateTime;
function IQDoW( dDate:TDateTime ):Integer;
function IQDay( dDate:TDateTime ):Integer;
function IQBoW( dDate:TDateTime ):TDateTime;

// Returns the date of the last occurance of the day specified by ADayNumber (1..7) in the month of ADate
function LastWeekDay( ADate: TDateTime; ADayNumber: Integer ): TDateTime;
function NextWeekDay(ADate: TDateTime): TDateTime;
// Returns the week number of the specified date within the month (not year)
function WeekNumberInMonth( ADate: TDateTime ): Integer;
// Returns date of the first day of next month, compared with ADate
function FirstDayOfNextMonth( ADate: TDateTime ): TDateTime;

function TimeLenSec( dStart, dEnd:TDateTime  ):Integer;
function TimeLenSecOfShift( dStart, dEnd:TDateTime  ):Integer;

{ 04/05/2007 Elapsed returns the elapsed time between 2 date/time values.
  The Word var params return incremental values per unit, not total values
  per unit (i.e., '2 Years, 4 Months, 6 Days, 5 Hours, 32 Minutes, 47 Seconds').
  For total elapsed for any given duration unit, instead please use the
  DateUtils methods YearSpan, MonthSpan, WeekSpan, DaySpan, etc.}
procedure TimeElapsed(const ANow, AThen: TDateTime;
 var AYears, AMonths, ADays, AHours, AMinutes, ASeconds, AMilliseconds: Word);
procedure TimeElapsedA(const ANow, AThen: TDateTime;
 var ADays, AHours, AMinutes, ASeconds: Word);
procedure TimeElapsedB(const ANow, AThen: TDateTime;
 var AYears, AMonths, ADays: Word);
function SameDay(ADate1, ADate2: TDateTime): Boolean;

  // Duration
  procedure DecodeDuration(ADuration: Real; var AYears, AMonths, ADays,
   AHours, AMinutes, ASeconds, AMilliSeconds: Word);
  procedure GetDurationLongDisplay(ADuration: Real; var ADisplayText: String);
  procedure GetDurationShortDisplayA(ADuration: Real; var ADisplayText: String);
  procedure GetDurationShortDisplayB(ADuration: Real; var ADisplayText: String);

function MonthShort(nMonth:Integer): string;
function MonthLong(nMonth:Integer): string;
function DayShort(nDay: Integer): string;
function DayLong(nDay: Integer): string;
function ShortMonthToInt( S: string ): Integer;
function SecsToDaysTimeStr( Secs : Integer ):string;
function FullYear(nYear: Integer): Integer; // in 05; out 2005
function PriorDayOfWeek(dow: Integer; out dateResult: TDateTime): Boolean;
function GetDayOfWeek(shortDayAbbreviation: string; out dow: Integer): Boolean;

procedure IQSetLocalTime( ADateTime: TDateTime );
procedure SyncTimeWithOracle( var OldTime, NewTime: TDateTime; ATimeDiff: Real;  DB: string = 'IQFD' );
function StrToDateY2K( S: string ): TDateTime;

function TZI_LongToShort( S: string; ASuppressWarning: Boolean = FALSE ): string;
function TZI_ShortStandardToDayLight( S: string ): string;
function TZI_ShortDayLightToStandard( S: string ): string;

function GetTermsBasedOnDate(ATable:String; ATableId, ATermsId:Real; ADate:TDateTime):TDateTime;

function IQOracleAdjustedDateTime: TDateTime;
function IQOracleAdjustedDate: TDateTime;
function IQOracleAdjustedTime: TDateTime;
procedure IQCalculateTimeZoneDiff;
function IQFormatDate(const AFormat:String; AReplStr:String):String;

function IsStringValidDate( AStringIN: String; var ADateTimeOUT: TDateTime ): Boolean;
function ValidDate(const ADateTime: TDateTime): Boolean;
function IQTryStrToDateTime(const S: string; out ADateTime: TDateTime): Boolean;

procedure RoundTime30(const ACurTime: TTime; var ANewTime: TTime);
procedure RoundTime15(const ACurTime: TTime; var ANewTime: TTime);
procedure RoundDateTime30(const ACurDateTime: TDateTime; var ANewDateTime: TDateTime);
procedure RoundDateTime15(const ACurDateTime: TDateTime; var ANewDateTime: TDateTime);

function ReplaceDay(ADate: TDateTime; NewDay: integer): TDateTime;
function ReplaceMonth(ADate: TDateTime; NewMonth: integer): TDateTime;
function ReplaceYear(ADate: TDateTime; NewYear: integer): TDateTime;
function IncYear(const ADate: TDateTime; NumberOfYears: Integer): TDateTime;

{ Some XML files use a non-standard date/time format:
   Format:  'YYYY-MM-DDTHH:MM:SS'
   Example:  '2006-10-10T00:21:45'
  The following methods take the string representation of the date,
  and convert it to a standard date. }
function XMLDateStrToDateTimeStr(const AValue: String; const ADefault: String = ''): String;
function XMLDateStrToDateTime(const AValue: String; const ADefault: TDateTime): TDateTime;
function TryXMLDateStrToDateTime(const AValue: String; var AResult: TDateTime): Boolean;
function XMLDateTimeStr(const ADateTime: TDateTime): String;

/// <summary>Returns the UTC/GMT date time.</summary>
function GetUTCDateTime: TDateTime; overload;
/// <summary>Returns the UTC/GMT date time for a given date and time.</summary>
function GetUTCDateTime(const ADateTime: TDateTime): TDateTime; overload;

function StrMMDDYYYToDate(S: string ): TDateTime;

const
    // NOTE: For additional constants, see SysUtils and DateUtils
    MinutesPerDay  = 1440;
    SecondsPerDay  = 86400;
    SecondsPerHour = 3600;

    TIME_OneSecond = 1.15740740740741E-5; // 0.000012;
    TIME_OneMinute = 0.000694444444444444;
    TIME_15Mins    = 0.0104166666666667;
    TIME_30Mins    = 0.0208333333333333;
    TIME_45Mins    = 0.03125;
    TIME_OneHour   = 0.0416666666666667;
    TIME_OneDay    = 1;
    TIME_OneWeek   = 7;
    TIME_0030      = 0.0208333333333333;
    TIME_0130      = 0.0625;
    TIME_800       = 0.333333333333333;
    TIME_830       = 0.354166666666667;
    TIME_900       = 0.375;
    TIME_930       = 0.395833333333333;
    TIME_1000      = 0.416666666666667;
    TIME_1030      = 0.4375;
    TIME_1100      = 0.458333333333333;
    TIME_1130      = 0.479166666666667;
    TIME_12        = 0.5;
    TIME_1230      = 0.520833333333333;
    TIME_1300      = 0.541666666666667;
    TIME_1330      = 0.5625;
    TIME_1400      = 0.583333333333333;
    TIME_1430      = 0.604166666666667;
    TIME_1500      = 0.625;
    TIME_1530      = 0.645833333333333;
    TIME_1600      = 0.666666666666667;
    TIME_1630      = 0.6875;
    TIME_1700      = 0.708333333333333;
    TIME_1730      = 0.729166666666667;
    TIME_1800      = 0.75;
    TIME_1830      = 0.770833333333333;
    TIME_1900      = 0.791666666666667;
    TIME_1930      = 0.8125;
    TIME_2000      = 0.833333333333333;
    TIME_2030      = 0.854166666666667;
    TIME_2100      = 0.875;
    TIME_2130      = 0.895833333333333;
    TIME_2200      = 0.916666666666667;
    TIME_2230      = 0.9375;
    TIME_2300      = 0.958333333333333;
    TIME_2330      = 0.979166666666667;
    TIME_2400      = 2.92823824565858e-06;

    MinValue       = 0;
    MaxValue       = 2958465.99998843;
var
   TimeZoneDiff: Real;

function TzSpecificLocalTimeToSystemTime(lpTimeZoneInformation
  : PTimeZoneInformation; var lpLocalTime, lpUniversalTime: TSystemTime)
  : BOOL; stdcall;
function SystemTimeToTzSpecificLocalTime(lpTimeZoneInformation
  : PTimeZoneInformation; var lpUniversalTime, lpLocalTime: TSystemTime)
  : BOOL; stdcall;

implementation

uses
//  IQAppSet,
//  IQMesg,
//  IQMsgFrm,
//  IQMsgFrmTm,
//  iqnumber,
//  TimeDiffDlg,
  IQMS.Common.NLS,
  IQMS.Common.StringUtils,
  IQMS.Common.DataLib,
  IQMS.Common.ResStrings;

const
  TimeZonesRows = 15;
  TimeZones: array [1..TimeZonesRows, 1..4] of string =
            (('AST',  'Atlantic Standard Time'     ,   'ADT',   'Atlantic Daylight Time'     ),
             ('BST',  'Bering Standard Time'       ,   'BDT',   'Bering Daylight Time'       ),
             ('CST',  'Central Standard Time'      ,   'CDT',   'Central Daylight Time'      ),
             ('EST',  'Eastern Standard Time'      ,   'EDT',   'Eastern Daylight Time'      ),
             ('GMT',  'Greenwich Mean Time'        ,   'GMT',   'Greenwich Mean Time'        ),
             ('HST',  'Alaska-Hawaii Standard Time',   'HDT',   'Alaska-Hawaii Daylight Time'),
             ('MST',  'Mountain Standard Time'     ,   'MDT',   'Mountain Daylight Time'     ),
             ('NST',  'Newfoundland Standard Time' ,   'NST',   'Newfoundland Standard Time' ),
             ('PST',  'Pacific Standard Time'      ,   'PDT',   'Pacific Daylight Time'      ),
             ('HAST',  'Hawaiian Standard Time'    ,   'HAST',  'Hawaiian Standard Time'     ),
             ('AKST', 'Alaskan Standard Time'      ,   'AKDT',  'Alaskan Daylight Time'      ),
             ('MST',  'Mountain Standard Time'     ,   'MST',   'Mountain Standard Time'     ),
             ('MST',  'US Mountain Std Time (AZ)'  ,   'MST',   'US Mountain Std Time (AZ)'  ),
             ('EST',  'US Eastern Std Time (IN)'   ,   'EST',   'US Eastern Std Time (IN)'   ),
             ('YST',  'Yukon Standard Time'        ,   'YDT',   'Yukon Daylight Time'        ));

function TzSpecificLocalTimeToSystemTime;
  external kernel32 name 'TzSpecificLocalTimeToSystemTime';
function SystemTimeToTzSpecificLocalTime;
  external kernel32 name 'SystemTimeToTzSpecificLocalTime';

function TimeLenSec( dStart, dEnd:TDateTime  ):Integer;
//var
  // d:TDateTime;
begin
  if System.DateUtils.SameDateTime(dStart, dEnd) or (dEnd < dStart) then
    Result := 0
  else
    try
      Result := System.DateUtils.SecondsBetween(dStart, dEnd);
    except
      Result := 0;
    end;

//  d:= Frac(dEnd) - Frac( dStart );
//  if d < 0 then
//     d:= d + 1;
//
//  Result:= Round(d * System.SysUtils.HoursPerDay * SecondsPerHour) ;
end;


// 10-15-2014 Used in RTSERVER!
function TimeLenSecOfShift( dStart, dEnd:TDateTime  ):Integer;
var
  d:TDateTime;
begin
  d:= Frac(dEnd) - Frac( dStart );
  if d < 0 then
     d:= d + 1;

  Result:= Round(d * System.SysUtils.HoursPerDay * SecondsPerHour) ;
end;

procedure TimeElapsed(const ANow, AThen: TDateTime;
 var AYears, AMonths, ADays, AHours, AMinutes, ASeconds, AMilliseconds: Word);
begin
  // Initialization
  AYears := 0;
  AMonths := 0;
  ADays := 0;
  AHours := 0;
  AMinutes := 0;
  ASeconds := 0;
  AMilliseconds := 0;

  if Trunc(AThen) > Trunc(ANow) then
     Exit;

  DecodeDuration(ANow - AThen, AYears, AMonths, ADays,
    AHours, AMinutes, ASeconds, AMilliSeconds);

end;

procedure TimeElapsedA(const ANow, AThen: TDateTime;
 var ADays, AHours, AMinutes, ASeconds: Word);
var
  ATmpNow: TDateTime;
begin
  // Initialization
  ADays := 0;
  AHours := 0;
  AMinutes := 0;
  ASeconds := 0;

  if Trunc(AThen) > Trunc(ANow) then
    Exit;

  ATmpNow := ANow;
  ADays := DaysBetween(ATmpNow, AThen);
  if ADays > 0 then
    ATmpNow := System.DateUtils.IncDay(ATmpNow, -ADays);

  AHours := HoursBetween(ATmpNow, AThen);
  if AHours > 0 then
    ATmpNow := ATmpNow - (AHours * TIME_OneHour);
  if ATmpNow < 0 then ATmpNow := 0;

  if ATmpNow > 0 then
  begin
    AMinutes := MinutesBetween(ATmpNow, AThen);
    if AMinutes > 0 then
      ATmpNow := ATmpNow - (AMinutes * TIME_OneMinute);
    if ATmpNow < 0 then ATmpNow := 0;
  end;

  if ATmpNow > 0 then
  begin
    ASeconds := SecondsBetween(ATmpNow, AThen);
//    if ASeconds > 0 then
//      ATmpNow := ATmpNow - (ASeconds * TIME_OneSecond);
//    if ATmpNow < 0 then ATmpNow := 0;
  end;

end;

procedure TimeElapsedB(const ANow, AThen: TDateTime;
 var AYears, AMonths, ADays: Word);
var
  AHours, AMinutes, ASeconds, AMilliSeconds: Word;
begin
  TimeElapsed(ANow, AThen, AYears, AMonths, ADays,
    AHours, AMinutes, ASeconds, AMilliSeconds);
end;

function SameDay(ADate1, ADate2: TDateTime): Boolean;
begin
  Result := Trunc(ADate1) = Trunc(ADate2);
end;

procedure DecodeDuration(ADuration: Real; var AYears, AMonths, ADays,
 AHours, AMinutes, ASeconds, AMilliSeconds: Word);
begin
  // initialize
  AYears    := 0;
  AMonths   := 0;
  ADays     := 0;
  AHours    := 0;
  AMinutes  := 0;
  ASeconds  := 0;
  AMilliSeconds := 0;

  AYears := YearsBetween(ADuration, 0);
  if AYears > 0 then
     ADuration := System.DateUtils.IncYear(ADuration, -AYears);

  AMonths := MonthsBetween(ADuration, 0);
  if AMonths > 0 then
     ADuration := System.SysUtils.IncMonth(ADuration, -AMonths);

  ADays := DaysBetween(ADuration, 0);
  if ADays > 0 then
     ADuration := System.DateUtils.IncDay(ADuration, -ADays);

  AHours := HoursBetween(ADuration, 0);
  if AHours > 0 then
     ADuration := Abs(ADuration - (AHours * IQMS.Common.Dates.TIME_OneHour));

  if ADuration > 0 then
     begin
       AMinutes := MinutesBetween(ADuration, 0);
       if AMinutes > 0 then
          ADuration := Abs(ADuration - (AMinutes * IQMS.Common.Dates.TIME_OneMinute));
     end;

  if ADuration > 0 then
     begin
       ASeconds := SecondsBetween(ADuration, 0);
       if ASeconds > 0 then
          ADuration := Abs(ADuration - (ASeconds * IQMS.Common.Dates.TIME_OneSecond));
     end;

  if ADuration > 0 then
     AMilliSeconds := MilliSecondsBetween(ADuration, 0);

end;

procedure GetDurationLongDisplay(ADuration: Real; var ADisplayText: String);
var
   AYears, AMonths, ADays, AHours, AMinutes, ASeconds, AMilliSeconds: Word;
   AYearsLongStr,
   AMonthsLongStr,
   ADaysLongStr,
   AHoursLongStr,
   AMinutesLongStr,
   ASecondsLongStr,
   ATemp: String;
   ArrayLong: array of String;
   i: Integer;
begin

  // initialize
  ADisplayText := '';

  // get values; see above.
  DecodeDuration(ADuration,AYears, AMonths, ADays, AHours, AMinutes, ASeconds, AMilliSeconds);

  // get text sections
  if AYears >= 1 then
     AYearsLongStr := IfThen(AYears > 1,
      Format(IQMS.Common.ResStrings.cTXT0000356{'%d years'}, [AYears]),
       IQMS.Common.ResStrings.cTXT0000357{'1 year'});
  if AMonths >= 1 then
     AMonthsLongStr := IfThen(AMonths > 1,
      Format(IQMS.Common.ResStrings.cTXT0000358 {'%d months'}, [AMonths]),
       IQMS.Common.ResStrings.cTXT0000359 {'1 month'});
  if ADays >= 1 then
     ADaysLongStr := IfThen(ADays > 1,
      Format(IQMS.Common.ResStrings.cTXT0000360 {'%d days'}, [ADays]),
       IQMS.Common.ResStrings.cTXT0000361 {'1 day'});
  if AHours >= 1 then
     AHoursLongStr := IfThen(AHours > 1,
      Format(IQMS.Common.ResStrings.cTXT0000362 {'%d hours'}, [AHours]),
       IQMS.Common.ResStrings.cTXT0000363 {'1 hour'});
  if AMinutes >= 1 then
     AMinutesLongStr := IfThen(AMinutes > 1,
      Format(IQMS.Common.ResStrings.cTXT0000364 {'%d minutes'}, [AMinutes]),
       IQMS.Common.ResStrings.cTXT0000365 {'1 minute'});
  if ASeconds >= 1 then
     ASecondsLongStr := IfThen(ASeconds > 1,
      Format(IQMS.Common.ResStrings.cTXT0000366 {'%d seconds'}, [ASeconds]),
       IQMS.Common.ResStrings.cTXT0000367 {'1 second'});

  // Build array
  if (AYears > 0) then
     begin
       SetLength(ArrayLong, High(ArrayLong) + 2);
       ArrayLong[High(ArrayLong)] := AYearsLongStr;
     end;
  if (AMonths > 0) then
     begin
       SetLength(ArrayLong, High(ArrayLong) + 2);
       ArrayLong[High(ArrayLong)] := AMonthsLongStr;
     end;
  if (ADays > 0) then
     begin
       SetLength(ArrayLong, High(ArrayLong) + 2);
       ArrayLong[High(ArrayLong)] := ADaysLongStr;
     end;
  if (AHours > 0) then
     begin
       SetLength(ArrayLong, High(ArrayLong) + 2);
       ArrayLong[High(ArrayLong)] := AHoursLongStr;
     end;
  if (AMinutes > 0) then
     begin
       SetLength(ArrayLong, High(ArrayLong) + 2);
       ArrayLong[High(ArrayLong)] := AMinutesLongStr;
     end;
  if (ASeconds > 0) then
     begin
       SetLength(ArrayLong, High(ArrayLong) + 2);
       ArrayLong[High(ArrayLong)] := ASecondsLongStr;
     end;

  // Build long string
  ATemp := '';
  if High(ArrayLong) = 0 then
     ADisplayText := ArrayLong[0]
  else if High(ArrayLong) > 0 then
    for i := 0 to High(ArrayLong) do
     begin
       ATemp := '';
       if (i = High(ArrayLong)) and (i > 0) then
          ATemp := IQMS.Common.ResStrings.cTXT0000368 // ', and '
       else if (i < High(ArrayLong)) and (i > 0) then
          ATemp := ', ';
       ADisplayText := ADisplayText + ATemp + ArrayLong[i];
     end;

end;

procedure GetDurationShortDisplayA(ADuration: Real; var ADisplayText: String);
var
   AYears, AMonths, ADays, AHours, AMinutes, ASeconds, AMilliSeconds: Word;
   AYearsShortStr,
   AMonthsShortStr,
   ADaysShortStr,
   AHoursShortStr,
   AMinutesShortStr,
   ASecondsShortStr,
   ATemp: String;
   ArrayShort: array of String;
   i: Integer;
begin

  // initialize
  ADisplayText := '';

  // get values; see above.
  DecodeDuration(ADuration,AYears, AMonths, ADays, AHours, AMinutes, ASeconds, AMilliSeconds);

  // get text sections
//  if AYears >= 1 then
//     AYearsShortStr := iqnumber.sIIf(AYears > 1,
//      Format(IQMS.Common.ResStrings.cTXT0000369{'%d yrs'}, [AYears]),
//       IQMS.Common.ResStrings.cTXT0000370{'1 yr'});
//  if AMonths >= 1 then
//     AMonthsShortStr := iqnumber.sIIf(AMonths > 1,
//      Format(IQMS.Common.ResStrings.cTXT0000371{'%d mos'}, [AMonths]),
//       IQMS.Common.ResStrings.cTXT0000372{'1 mo'});
//  if ADays >= 1 then
//     ADaysShortStr := iqnumber.sIIf(ADays > 1,
//      Format(IQMS.Common.ResStrings.cTXT0000373{'%d days'}, [ADays]),
//       IQMS.Common.ResStrings.cTXT0000374{'1 day'});
//  if AHours >= 1 then
//     AHoursShortStr := iqnumber.sIIf(AHours > 1,
//      Format(IQMS.Common.ResStrings.cTXT0000375{'%d hrs'}, [AHours]),
//       IQMS.Common.ResStrings.cTXT0000376{'1 hr'});
//  if AMinutes >= 1 then
//     AMinutesShortStr := iqnumber.sIIf(AMinutes > 1,
//      Format(IQMS.Common.ResStrings.cTXT0000377{'%d mins'}, [AMinutes]),
//       IQMS.Common.ResStrings.cTXT0000378{'1 min'});
//  if ASeconds >= 1 then
//     ASecondsShortStr := iqnumber.sIIf(ASeconds > 1,
//      Format(IQMS.Common.ResStrings.cTXT0000379{'%d secs'}, [ASeconds]),
//       IQMS.Common.ResStrings.cTXT0000380{'1 sec'});

  // Build array
  if (AYears > 0) then
     begin
       SetLength(ArrayShort, High(ArrayShort) + 2);
       ArrayShort[High(ArrayShort)] := AYearsShortStr;
     end;
  if (AMonths > 0) then
     begin
       SetLength(ArrayShort, High(ArrayShort) + 2);
       ArrayShort[High(ArrayShort)] := AMonthsShortStr;
     end;
  if (ADays > 0) then
     begin
       SetLength(ArrayShort, High(ArrayShort) + 2);
       ArrayShort[High(ArrayShort)] := ADaysShortStr;
     end;
  if (AHours > 0) then
     begin
       SetLength(ArrayShort, High(ArrayShort) + 2);
       ArrayShort[High(ArrayShort)] := AHoursShortStr;
     end;
  if (AMinutes > 0) then
     begin
       SetLength(ArrayShort, High(ArrayShort) + 2);
       ArrayShort[High(ArrayShort)] := AMinutesShortStr;
     end;
  if (ASeconds > 0) then
     begin
       SetLength(ArrayShort, High(ArrayShort) + 2);
       ArrayShort[High(ArrayShort)] := ASecondsShortStr;
     end;

  // Build short string
  ATemp := '';
  if High(ArrayShort) = 0 then
     ADisplayText := ArrayShort[0]
  else if High(ArrayShort) > 0 then
    for i := 0 to High(ArrayShort) do
     begin
       ATemp := '';
       if (i = High(ArrayShort)) and (i > 0) then
          ATemp := IQMS.Common.ResStrings.cTXT0000368 // ', and '
       else if (i < High(ArrayShort)) and (i > 0) then
          ATemp := ', ';
       ADisplayText := ADisplayText + ATemp + ArrayShort[i];
     end;

end;

procedure GetDurationShortDisplayB(ADuration: Real; var ADisplayText: String);
var
   AYears, AMonths, ADays, AHours, AMinutes, ASeconds, AMilliSeconds: Word;
   AYearsShortStr,
   AMonthsShortStr,
   ADaysShortStr,
   AHoursShortStr,
   AMinutesShortStr,
   ASecondsShortStr,
   ATemp: String;
   ArrayShort: array of String;
   i: Integer;
begin

  // initialize
  ADisplayText := '';

  // get values; see above.
  DecodeDuration(ADuration,AYears, AMonths, ADays, AHours, AMinutes, ASeconds, AMilliSeconds);

  // get text sections
  if AYears >= 1 then
     AYearsShortStr := IfThen(AYears > 1,
      Format(IQMS.Common.ResStrings.cTXT0000369{'%d yrs'}, [AYears]),
       IQMS.Common.ResStrings.cTXT0000370{'1 yr'});
  if AMonths >= 1 then
     AMonthsShortStr := IfThen(AMonths > 1,
      Format(IQMS.Common.ResStrings.cTXT0000371{'%d mos'}, [AMonths]),
       IQMS.Common.ResStrings.cTXT0000372{'1 mo'});
  if ADays >= 1 then
     ADaysShortStr := IfThen(ADays > 1,
      Format(IQMS.Common.ResStrings.cTXT0000373{'%d days'}, [ADays]),
       IQMS.Common.ResStrings.cTXT0000374{'1 day'});

//  AHoursShortStr   := iqstring.LPadZero(IntToStr(AHours),2);
//  AMinutesShortStr := iqstring.LPadZero(IntToStr(AMinutes),2);
//  ASecondsShortStr := iqstring.LPadZero(IntToStr(ASeconds),2);

  // If we are dealing with an interval of less than a day, then keep
  // it simple (00:00:00)
  if ((AYears + AMonths + ADays) = 0) then
     begin
       ADisplayText := Format('%s:%s:%s',
        [AHoursShortStr, AMinutesShortStr, ASecondsShortStr]);
       Exit;
     end;

  // Build array
  if (AYears > 0) then
     begin
       SetLength(ArrayShort, High(ArrayShort) + 2);
       ArrayShort[High(ArrayShort)] := AYearsShortStr;
     end;
  if (AMonths > 0) then
     begin
       SetLength(ArrayShort, High(ArrayShort) + 2);
       ArrayShort[High(ArrayShort)] := AMonthsShortStr;
     end;
  if (ADays > 0) then
     begin
       SetLength(ArrayShort, High(ArrayShort) + 2);
       ArrayShort[High(ArrayShort)] := ADaysShortStr;
     end;

  // Build short string
  ATemp := '';
  if High(ArrayShort) = 0 then
     ADisplayText := ArrayShort[0]
  else if High(ArrayShort) > 0 then
    for i := 0 to High(ArrayShort) do
     begin
       ATemp := '';
       if (i <= High(ArrayShort)) and (i > 0) then
          ATemp := ', ';
       ADisplayText := ADisplayText + ATemp + ArrayShort[i];
     end;

   if ADisplayText > '' then
       ADisplayText := Format('%s, %s:%s:%s',
        [ADisplayText, AHoursShortStr, AMinutesShortStr, ASecondsShortStr])
   else
       ADisplayText := Format('%s:%s:%s',
        [AHoursShortStr, AMinutesShortStr, ASecondsShortStr]);

end;

function IQEoY( dDate:TDateTime ): TDateTime;
var
  Year, dummy:Word;
begin
  DecodeDate( dDate, Year, dummy, dummy );
  result:= EncodeDate( Year, 12, 31 );  // EoY
end;


function IQBoY( dDate:TDateTime ): TDateTime;
var
  Year, dummy:Word;
begin
  DecodeDate( dDate, Year, dummy, dummy );
  result:= EncodeDate( Year, 1, 1);    // BoY
end;

function IQBoM( dDate:TDateTime ):TDateTime;
var
  YY, MM, DD: word;
begin
  DecodeDate( dDate, YY, MM, DD );
  Result:= EncodeDate( YY, MM, 1);    // BoM
end;

function IQEoM( dDate:TDateTime ):TDateTime;
var
  YY, MM, DD: word;
begin
  DecodeDate( dDate, YY, MM, DD );
  Result := IncMonth(EncodeDate(YY, MM, 1), 1) - 1;  //EoM
end;


function MonthShort(nMonth:Integer): string;
begin
  if (nMonth in [1..12]) then
     Result := FormatSettings.ShortMonthNames[nMonth]; // System.SysUtils.pas
end;

function MonthLong(nMonth:Integer): string;
begin
  // 04/05/2007 (Byron) Return month names for current locale
  if (nMonth in [1..12]) then
     Result := FormatSettings.LongMonthNames[nMonth]; // System.SysUtils.pas
end;

function ShortMonthToInt( S: string ): Integer;
begin
  Result:= (Pos( UpperCase(S), 'JAN_FEB_MAR_APR_MAY_JUN_JUL_AUG_SEP_OCT_NOV_DEC_' ) - 1) div 4 + 1;
end;

function DayShort(nDay: Integer): string;
begin
  // 04/05/2007 (Byron)
  if (nDay in [1..7]) then
     Result := FormatSettings.ShortDayNames[nDay]; // System.SysUtils.pas
end;

function DayLong(nDay: Integer): string;
begin
  // 04/05/2007 (Byron)
  if (nDay in [1..7]) then
     Result := FormatSettings.LongDayNames[nDay]; // System.SysUtils.pas
end;

function SecsToDaysTimeStr( Secs : Integer ):string;
begin
  {Outputs "12 days, 10:50:01" }
  if Secs div SecondsPerDay > 0 then
     Result:= Format( IQMS.Common.ResStrings.cTXT0000091 {'%d day, '}, [ Secs div SecondsPerDay ]) +  FormatDateTime('hh:nn:ss', Secs / SecondsPerDay )
  else
     Result:= FormatDateTime('hh:nn:ss', Secs / SecondsPerDay );
end;

procedure IQSetLocalTime( ADateTime: TDateTime );
//var
//  ATime: TSystemTime;
begin
//  DateTimeToSystemTime( ADateTime, ATime );
//  if not SetLocalTime( ATime ) then
//     // 'Unable to set local time. Error Code = %d.'
//     IQShowStr( Format( IQMS.Common.ResStrings.cTXT0000090, [ GetLastError ]) );  {IQMsgFrm.pas}
end;

procedure SyncTimeWithOracle( var OldTime, NewTime: TDateTime; ATimeDiff: Real;  DB: string = 'IQFD' );
begin
  with TFDQuery.Create(nil) do
  try
    ConnectionName:= DB;
    SQL.Add('select sysdate from dual');
    Open;
    NewTime:= Fields[ 0 ].asDateTime - ATimeDiff;
  finally
    Free;
  end;

  OldTime:= Now;

  IQSetLocalTime( NewTime );
end;

function GetTermsBasedOnDate(ATable:String; ATableId, ATermsId:Real; ADate:TDateTime):TDateTime;
var
  AStDay:Integer;
  Year, Month, Day, ADays: Word;
begin
  AStDay := Trunc(SelectValueFmtAsFloat('select statement_date from %s where id = %f', [ATable, ATableId]));
  if AStDay = 0 then AStDay := 31;
//  if AStDay = 31 then
//  begin
//    DecodeDate((IncMonth(IQBoM(ADate), 1) - 1), Year, Month, Day);
//    AStDay := Day;
//  end;
  ADays := Trunc(SelectValueFmtAsFloat('select days from terms where id = %f', [ATermsId]));
  if ADays < 1 then
    // 'The Days field is empty for the Terms Code used.  Please correct and retry.';
    raise Exception.Create(   IQMS.Common.ResStrings.cTXT0000092 );
  DecodeDate(ADate, Year, Month, Day);
//  Result := EncodeDate(Year, Month, ADays);
  Result := IncMonth(EncodeDate(Year, Month, 1), 1) - 1;

  if ADays < IqDay(Result) then
    Result := EncodeDate(Year, Month, ADays);

  if Day > AStDay then
    Result := IncMonth(Result, 2)
  else
    Result := IncMonth(Result, 1);
end;

function TZI_LongToShort( S: string; ASuppressWarning: Boolean = FALSE ): string;
var
  I: Integer;
begin
  { TimeZones is 10x4 array of strings like: 'EST', 'Eastern Standard Time', 'EDT', 'Eastern Daylight Time'
    Ex:
    TZI_LongToShort( 'Eastern Standard Time' ) returns 'EST' }
  S:= Trim( S );
  for I:= 1 to TimeZonesRows do
    if CompareText( S, TimeZones[ I, 2 ]) = 0 then
      begin
         Result:= TimeZones[ I, 1 ];
         EXIT;
      end
    else if CompareText( S, TimeZones[ I, 4 ]) = 0 then
      begin
         Result:= TimeZones[ I, 3 ];
         EXIT;
      end;

//  if not ASuppressWarning then
//     { 'Your time zone %s could not be located in the Oracle Time Zone list. '  +
//       'Your local date and time will be used for all changes to the database. '+
//       'Processes will now continue normally.'  }
//      IQWarning( Format( IQMS.Common.ResStrings.cTXT0000093, [ S ]));
//     IQShowStrTimedChk( 'Warning!', Format( IQMS.Common.ResStrings.cTXT0000093, [ S ]),
//      'Time_Zone_Warning', mtWarning );      {IQMsgFrmTm.pas}

  Result:= '';
end;

function TZI_ShortStandardToDayLight( S: string ): string;
var
  I: Integer;
begin
  S:= Trim( S );
  for I:= 1 to TimeZonesRows do
    if CompareText( S, TimeZones[ I, 1 ]) = 0 then
      begin
         Result:= TimeZones[ I, 3 ];
         EXIT;
      end;
  Result:= S;
end;

function TZI_ShortDayLightToStandard( S: string ): string;
var
  I: Integer;
begin
  S:= Trim( S );
  for I:= 1 to TimeZonesRows do
    if CompareText( S, TimeZones[ I, 3 ]) = 0 then
      begin
         Result:= TimeZones[ I, 1 ];
         EXIT;
      end;
  Result:= S;
end;

function StrToDateY2K( S: string ): TDateTime;
var
  YY: Integer;
begin
  if Length( S ) = Length( 'MM/DD/YY' ) then
  begin
     YY:= StrToInt( Copy( S, 7, 2 ));
     if YY < 50 then
        YY:= 2000 + YY
     else
        YY:= 1900 + YY;
     S:= Format('%s%d', [ Copy( S, 1, 6 ), YY  ]);
  end;
  Result:= IQStrToDate( S );
end;

function IQDoW( dDate:TDateTime ):Integer;
begin
  //S:= UpperCase( FormatDateTime( 'ddd', dDate ));
  //Result:= (Pos(S, 'SUN_MON_TUE_WED_THU_FRI_SAT') - 1) div 4 + 1;
  Result:= IQDayStrToDay( FormatDateTime( 'ddd', dDate ));
end;

function IQDay( dDate:TDateTime ):Integer;
var
  YY, MM, DD: word;
begin
  DecodeDate( dDate, YY, MM, DD );
  Result := DD;
end;


function IQBoW( dDate:TDateTime ):TDateTime;
begin
  Result := 0;
//  if not IQAppSet.IsNonIQMSSchema then
//    Result := SelectValueFmtAsFloat('select IQCalendar.SundayOf( to_date(''%s'', ''mm/dd/rrrr'')) from dual', [ FormatDateTime('mm/dd/yyyy', dDate )]);
end;


function LastWeekDay(ADate: TDateTime; ADayNumber: Integer): TDateTime;
var
  ALastDate: TDateTime;
  AFound: Boolean;
begin
  // Returns the last ADayNumber for the month of ADate
  Result := 0;

  ALastDate := IQEoM( ADate );
  AFound := FALSE;
  while AFound = FALSE do
  begin
    if ALastDate = 0 then BREAK;
    if DayOfWeek( ALastDate ) = ADayNumber then
    begin
      Result := ALastDate;
      AFound := TRUE;
    end;
    ALastDate := ALastDate - 1;
  end;
end;

function NextWeekDay(ADate: TDateTime): TDateTime;
var
  d: TDateTime;
begin
  d := ADate;
  repeat
    d := d + 1;
  until (IQDoW(d) in [2..6]);
  Result := d;
end;

function WeekNumberInMonth( ADate: TDateTime ): Integer;
//var
//   AValue : Real;
begin
  Result := 0;
//  if not IQAppSet.IsNonIQMSSchema then
//  begin
//    AValue := SelectValueFmtAsFloat( 'select to_char( to_date( ''%s'', ''mm/dd/rrrr'' ), ''w'' ) as week_number from dual',
//                          [ FormatDateTime( 'mm/dd/yyyy', ADate ) ] );
//    Result := Round( AValue );
//  end;
end;

function FirstDayOfNextMonth( ADate: TDateTime ): TDateTime;
var
    AYear, AMonth, ADay: Word;
begin
     DecodeDate( ADate, AYear, AMonth, ADay );
     Result := IncMonth(EncodeDate(AYear, AMonth, 1), 1);
     {
     Inc( AMonth );
     if AMonth > 12 then
        begin
             Inc( AYear );
             AMonth := 1;
        end;
     Result := EncodeDate( AYear, AMonth, 1 ); }


end;

function IQOracleAdjustedDateTime: TDateTime;
begin
  with TFDQuery.Create(nil) do
    try
       ConnectionName:= 'IQFD';
       SQL.Add( 'select sysdate as value from dual' );
       Open;
       Result := FieldByName( 'value' ).AsDateTime - TimeZoneDiff;
    finally
       Free;
    end;
end;

function IQOracleAdjustedDate: TDateTime;
begin
  Result:= Trunc( IQOracleAdjustedDateTime );
end;

function IQOracleAdjustedTime: TDateTime;
begin
  Result:= Frac( IQOracleAdjustedDateTime );
end;

procedure IQCalculateTimeZoneDiff;
var
  lpTimeZoneInformation: TTimeZoneInformation;
  LocalTimeZone, OracleTimeZone:String;
begin
//  if IQAppSet.IsNonIQMSSchema then
//    Exit;

  TimeZoneDiff     := 0;
  LocalTimeZone:= 'N/A';

  {Get Time Zone from IQsys}
  OracleTimeZone:= SelectValueAsString('select time_zone from iqsys');
  if OracleTimeZone = '' then
    EXIT;

  {if user check Force Offset Time - get it from registry}
//  if TTimeDiff.IsOffsetTimeForced then
//  begin
//    TTimeDiff.GetDiffFromReg( TimeZoneDiff );
//    EXIT;
//  end;

  try
    {Get Time zone of this computer}
    case GetTimeZoneInformation( lpTimeZoneInformation ) of
      TIME_ZONE_ID_STANDARD:
        begin
          LocalTimeZone := TZI_LongToShort( lpTimeZoneInformation.StandardName );  {IQMS.Common.Dates.pas}
          OracleTimeZone:= TZI_ShortDaylightToStandard( OracleTimeZone );          {IQMS.Common.Dates.pas}
        end;

      TIME_ZONE_ID_DAYLIGHT:
        begin
          LocalTimeZone := TZI_LongToShort( lpTimeZoneInformation.DaylightName );  {IQMS.Common.Dates.pas}
          OracleTimeZone:= TZI_ShortStandardToDaylight( OracleTimeZone );          {IQMS.Common.Dates.pas}
        end;

      TIME_ZONE_ID_INVALID, TIME_ZONE_ID_UNKNOWN:
        begin
           // 'Unable to determine Time Zone Information. Error Code = %d'
           raise Exception.CreateFmt( IQMS.Common.ResStrings.cTXT0000094, [ GetLastError ]);
           // IQWarning(Format('Unable to determine Time Zone Information. Error Code = %d'#13#13+
           //                  'Program execution will continue normally with time difference between '+
           //                  'workstation and Oracle server set to 0', [ GetLastError ]));
           // EXIT;
        end;
    end;

    TimeZoneDiff:= SelectValueFmtAsFloat( 'select sysdate - new_time(sysdate, ''%s'', ''%s'') from dual', [ OracleTimeZone, LocalTimeZone ]);

  except
    raise;
//    on E: Exception do
//    {TimeDiffDlg.pas}
//    if not TTimeDiff.GetDiffFromReg( TimeZoneDiff ) then
//       TTimeDiff.Execute( E.Message, TimeZoneDiff );
  end;
end;

function IQFormatDate(const AFormat:String; AReplStr:String):String;
var
  AChr:String;
  Apos1, Apos2:Integer;
begin
  AReplStr := Uppercase(AReplStr);
  AChr := AReplStr[1];

  Result := Uppercase(AFormat);
  APos1 := Pos(AChr, Result) - 1;
  APos2 := RPos(AChr, Result) + 1;

  Result := Copy(Result, 1, APos1) + AReplStr + Copy(Result, APos2, Length(Result));

end;

function IsStringValidDate( AStringIN: String; var ADateTimeOUT: TDateTime ): Boolean;
begin
  // Returns TRUE if the AStringIN value is a valid datetime, and
  // ADateTimeOUT will contain the datetime value.  But FALSE is returned if
  // AStringIN is not a valid datetime. (08/19/2003)
  ADateTimeOUT := 0; // initialize
  try
    ADateTimeOUT := StrToDateTime( AStringIN );
    Result := True;
  except
    Result := False; // the calling screen will raise the appropriate error, if any
  end;
end;

function ValidDate(const ADateTime: TDateTime): Boolean;
begin
  Result := (Trunc(ADateTime) > MinValue) and (Trunc(ADateTime) < MaxValue);
end;

function IQTryStrToDateTime(const S: string; out ADateTime: TDateTime): Boolean;
var
  i: Integer;
  s_mod: string;

  procedure _TrimDayName(const ADayName: string);
  var
    n, len: Integer;
  begin
    len := 0;
    n := Pos(ADayName + ',', s_mod);
    if n > 0 then
      len := Length(ADayName + ',');

    if n = 0 then
    begin
      n := Pos(ADayName + ' ', s_mod);
      if n > 0 then
        len := Length(ADayName + ' ');
    end;

    if n > 0 then
    begin
      s_mod := Trim(Copy(s_mod, len + 1, Length(s_mod)));
    end;

  end;

begin
  // Initialize
  Result := False;
  ADateTime := MinValue;
  s_mod := UpperCase(s);

  for i := low(FormatSettings.ShortDayNames) to high(FormatSettings.ShortDayNames) do
    _TrimDayName(UpperCase(FormatSettings.ShortDayNames[i]));
  for i := low(FormatSettings.LongDayNames) to high(FormatSettings.LongDayNames) do
    _TrimDayName(UpperCase(FormatSettings.LongDayNames[i]));

  if not IsStringValidDate(s_mod, ADateTime) then
  try
    ADateTime := System.Variants.VarToDateTime(s_mod);
    Result := True;
  except
    Result := False;
  end;
end;

function FullYear(nYear: Integer): Integer; // in 05; out 2005
begin
  if (nYear < 0) then
  begin
    Result := 0;
    Exit;
  end;

  if InRange(nYear, 50, 99) then
    Result := nYear + 1900 // assume the 1900s
  else if InRange(nYear, 0, 49) then
    Result := nYear + 2000 // assume the 2000s
  else
    Result := nYear;
end;

function GetDayOfWeek(shortDayAbbreviation: string; out dow: Integer): Boolean;
var
  i: Integer;
begin
  Result := False;
  dow := Low(FormatSettings.ShortDayNames);
  for i := 1 to High(FormatSettings.ShortDayNames) do
    if (shortDayAbbreviation = FormatSettings.ShortDayNames[i]) then
    begin
      dow := i;
      Result := True;
      Break;
    end;
end;

function PriorDayOfWeek(dow: Integer; out dateResult: TDateTime): Boolean;
var
   i: Integer;
   cur, tempDate: TDateTime;
begin
  // Initialize variables
  Result := False;
  dateResult := Now();
  cur := Now();

  if (dow in [1..7]) then
    for i := 1 to 7 do
    begin
      tempDate := cur - i;

      if (IQDoW(tempDate) = dow) then
      begin
          dateResult := tempDate;
          Result := true;
          Break;
      end;
    end;
end;

procedure RoundTime30(const ACurTime: TTime; var ANewTime: TTime);
var
   AHour, AMinute, ADummy, ANewMinute: Word;
begin
     DecodeTime(ACurTime, AHour, AMinute, ADummy, ADummy);
     if AMinute < 30 then ANewMinute := 0
     else ANewMinute := 30;
     ANewTime := EncodeTime( AHour, ANewMinute, 0, 0 );
end;


procedure RoundTime15(const ACurTime: TTime; var ANewTime: TTime);
var
   AHour, AMinute, ADummy, ANewMinute: Word;
begin
   DecodeTime(ACurTime, AHour, AMinute, ADummy, ADummy);

   if InRange(AMinute, 0, 14 ) then
     ANewMinute := 0
   else if InRange(AMinute, 15, 29 ) then
     ANewMinute := 15
   else if InRange(AMinute, 30, 44 ) then
     ANewMinute := 30
   else // then the range must be 45-59
     ANewMinute := 45;

   ANewTime := EncodeTime( AHour, ANewMinute, 0, 0 );
end;

procedure RoundDateTime30(const ACurDateTime: TDateTime; var ANewDateTime: TDateTime);
var
   ADatePart: TDateTime;
   ATimePart, ANewTime: TTime;
begin
     ADatePart := Trunc(ACurDateTime);
     ATimePart := Frac(ACurDateTime);
     RoundTime30(ATimePart, ANewTime);
     ANewDateTime := ADatePart + ANewTime;
end;

procedure RoundDateTime15(const ACurDateTime: TDateTime; var ANewDateTime: TDateTime);
var
   ADatePart: TDateTime;
   ATimePart, ANewTime: TTime;
begin
     ADatePart := Trunc(ACurDateTime);
     ATimePart := Frac(ACurDateTime);
     RoundTime15(ATimePart, ANewTime);
     ANewDateTime := ADatePart + ANewTime;
end;

function ReplaceDay(ADate: TDateTime; NewDay: integer): TDateTime;
var
  m,y,d: word;
  MaxDay: integer;
begin
   DecodeDate(ADate,y,m,d);
   MaxDay:= System.DateUtils.DaysInMonth(ADate);
   if NewDay > MaxDay then NewDay := MaxDay;
   Result:= EncodeDate(y,m,NewDay);
end;

function ReplaceMonth(ADate: TDateTime; NewMonth: integer): TDateTime;
var
  m,y,d: word;
  MaxDay: integer;
begin
   DecodeDate(ADate,y,m,d);
   if NewMonth >= 12 then NewMonth := 12; // fix month
   MaxDay:= System.DateUtils.DaysInMonth(EncodeDate(y,NewMonth,1));
   if d > MaxDay then d := MaxDay;
   Result:= EncodeDate(y,NewMonth,d);
end;

function ReplaceYear(ADate: TDateTime; NewYear: integer): TDateTime;
var
  m,y,d: Word;
  MaxDay: Integer;
begin
   DecodeDate(ADate,y,m,d);
   MaxDay := System.DateUtils.DaysInMonth(EncodeDate(NewYear,m,1));
   if d > MaxDay then d := MaxDay;
   result:= EncodeDate(NewYear,m,d);
end;

function IncYear(const ADate: TDateTime; NumberOfYears: Integer): TDateTime;
var
  m,y,d: Word;
  MaxDay: Integer;
begin
   DecodeDate(ADate,y,m,d);
   MaxDay := System.DateUtils.DaysInMonth(EncodeDate(y+NumberOfYears,m,1));
   if d > MaxDay then d := MaxDay;
   Result:= EncodeDate(y+NumberOfYears,m,d);
end;

function XMLDateStrToDateTimeStr(const AValue, ADefault: String): String;
var
   d: TDateTime;
begin
  Result := ADefault;
  if TryXMLDateStrToDateTime(AValue, d) then
     Result := FormatDateTime('ddddd tt', d);
end;

function XMLDateStrToDateTime(const AValue: String; const ADefault: TDateTime): TDateTime;
begin
  if not TryXMLDateStrToDateTime(AValue, Result) then
     Result := ADefault;
end;

function TryXMLDateStrToDateTime(const AValue: String; var AResult: TDateTime): Boolean;
const
  VALID_CHAR = ['0'..'9'];
  VALID_DELIM = ['-','/','.'];
var
   s: String;
   sYear, sMonth, sDay, sHour, sMin, sSec: String;
   wYear, wMonth, wDay, wHour, wMin, wSec: Integer;
begin
  {XML sometimes uses the XSD date format ('YYYY-MM-DDTHH:MM:SS') to allow
   formatting the date correctly in certain conditions.  To convert a
   string from the XML format to the standard format, we divide the date/time
   into its parts and reconstruct it. }

  Result := False;
  AResult := 0;

  s := AValue;

  sYear   := Copy(s, 1, 4);
  sMonth  := Copy(s, 6, 2);
  sDay    := Copy(s, 9, 2);

  sHour   := Copy(s, 12, 2);
  sMin    := Copy(s, 15, 2);
  sSec    := Copy(s, 18, 2);

  if not TryStrToInt(sYear, wYear) then Exit;
  if not TryStrToInt(sMonth, wMonth) then Exit;
  if not TryStrToInt(sDay, wDay) then Exit;

  if not TryStrToInt(sHour, wHour) then Exit;
  if not TryStrToInt(sMin, wMin) then Exit;
  if not TryStrToInt(sSec, wSec) then Exit;

  try
     AResult := EncodeDateTime(wYear, wMonth, wDay, wHour, wMin, wSec, 0); // System.DateUtils.pas
     Result := True;
  except // suppress, and just return default
  end;
end;

function XMLDateTimeStr(const ADateTime: TDateTime): String;
var
   ADatePart, ATimePart: String;
begin
  ADatePart := FormatDateTime('yyyy-mm-dd', ADateTime);
  ATimePart := FormatDateTime('hh:nn:ss', ADateTime);
  Result := Format('%sT%s',[ADatePart,ATimePart]);
end;

function GetUTCDateTime: TDateTime;
begin
  Result := GetUTCDateTime(Now);
end;

function GetUTCDateTime(const ADateTime: TDateTime): TDateTime;
var
  ATimeZone: TTimeZoneInformation;
  ALocalTime, AUniversalTime: TSystemTime;
begin
  GetTimeZoneInformation(ATimeZone);
  DateTimeToSystemTime(ADateTime, ALocalTime);
  TzSpecificLocalTimeToSystemTime(@ATimeZone, ALocalTime, AUniversalTime);
  Result := SystemTimeToDateTime(AUniversalTime);
end;

function StrMMDDYYYToDate(S: string ): TDateTime;
var
  YY, MM,DD: Integer;
begin
  S:= StrTran(S, '/', '');
  // MMDDYYYY
  MM:= StrToInt(Copy( S, 1, 2));
  DD:= StrToInt(Copy( S, 3, 2));
  YY:= StrToInt(Copy( S, 5, 4));
  Result:= EncodeDate( YY, MM, DD );  // Year, Month, Day
end;

end.

unit crm_recur_types;

{ ** Type declarations used by CRM Recurrence **

  For development, declare unit, crm_recurrence, and use its methods.

}

interface

uses
  System.SysUtils,
  crm_rscstr;

type
  // Recurrence Pattern
  TRecurPattern = (rpDaily, rpWeekly, rpMonthly, rpYearly);
  TRecurRule = (rcNone, rcByPosition, rcByDay, rcByMonth, rcWeekday);

  TRecurEndType = (etCount, etDate);
  TPatternDay = (pdDay, pdWeekDay, pdWeekendDay, pdSunday, pdMonday,
    pdTuesday, pdWednesday, pdThursday, pdFriday, pdSaturday);
  TPatternDayPos = (pdcFirst, pdcSecond, pdcThird, pdcFourth, pdcLast);

const
  PatternDayPosName: array [TPatternDayPos] of String =
    (crm_rscstr.cTXT0001456, // 'first'
    crm_rscstr.cTXT0001457, // 'second'
    crm_rscstr.cTXT0001458, // 'third'
    crm_rscstr.cTXT0001459, // 'fourth'
    crm_rscstr.cTXT0001460); // 'last'

  PatternDayName: array [TPatternDay] of String =
    (crm_rscstr.cTXT0001461, // 'day';
    crm_rscstr.cTXT0001462, // 'weekday';
    crm_rscstr.cTXT0001463, // 'weekendday';
    crm_rscstr.cTXT0001464, // 'Sunday';
    crm_rscstr.cTXT0001465, // 'Monday';
    crm_rscstr.cTXT0001466, // 'Tuesday';
    crm_rscstr.cTXT0001467, // 'Wednesday';
    crm_rscstr.cTXT0001468, // 'Thursday';
    crm_rscstr.cTXT0001469, // 'Friday';
    crm_rscstr.cTXT0001470); // 'Saturday';

type
  TRecurrenceRec = packed record
    // Appointment information
    ApptStart: TDateTime; // start for recurrence
    ApptEnd: TDateTime; // end for recurrence
    ApptDur: Real; // duration for the appointment
    AllDay: Boolean; // all-day event

    // Core Recurrence information
    RecurStart: TDateTime; // appointment start time
    RecurEnd: TDateTime; // appointment end time
    EndType: TRecurEndType; // end type (count or date)
    EndAfterCount: Integer; // recurrence count (if value = -1 then use ApptEnd)

    // Recurrence Options
    Pattern: TRecurPattern; // Recurrence pattern
    Rule: TRecurRule; // Rule relevant to pattern
    Occur: Integer;
    // For Monthly or Yearly (i.e, first, second, third, fourth or fifth)
    Interval: Integer; // Some numeric relevant to the pattern
    Days: String; // Day list (integers)
  end;

  // Helper methods
procedure ClearRecurrenceRec(var Rec: TRecurrenceRec);
procedure CopyRecurrenceRec(ASource: TRecurrenceRec;
  var ATarget: TRecurrenceRec);
// 09/20/2007 Populates rec with default values
procedure DefaultRecurrenceRec(var Rec: TRecurrenceRec);

type
  TRecurCargo = class
    StartDateTime: TDateTime;
    EndDateTime: TDateTime;
    constructor Create(AStartDateTime, AEndDateTime: TDateTime);
  end;

type
  TRecordCargo = class
    ID: Real;
    constructor Create(AID: Real);
  end;

implementation

uses
  IQMS.Common.Dates;

{ ---------------------------------------------------------------------------- }
procedure ClearRecurrenceRec(var Rec: TRecurrenceRec);
begin
  // Appointment information
  with Rec do
    begin
      ApptStart := 0;
      ApptEnd := 0;
      ApptDur := 0;
      AllDay := FALSE;
      RecurStart := 0;
      RecurEnd := 0;
      EndType := TRecurEndType(0);
      EndAfterCount := 0;
      Pattern := TRecurPattern(0);
      Rule := TRecurRule(0);
      Occur := 0;
      Interval := 0;
      Days := '';
    end;
end;

{ ---------------------------------------------------------------------------- }
procedure CopyRecurrenceRec(ASource: TRecurrenceRec;
  var ATarget: TRecurrenceRec);
begin
  ATarget.ApptStart := ASource.ApptStart;
  ATarget.ApptEnd := ASource.ApptEnd;
  ATarget.ApptDur := ASource.ApptDur;
  ATarget.AllDay := ASource.AllDay;
  ATarget.RecurStart := ASource.RecurStart;
  ATarget.RecurEnd := ASource.RecurEnd;
  ATarget.EndType := ASource.EndType;
  ATarget.EndAfterCount := ASource.EndAfterCount;
  ATarget.Pattern := ASource.Pattern;
  ATarget.Rule := ASource.Rule;
  ATarget.Occur := ASource.Occur;
  ATarget.Interval := ASource.Interval;
  ATarget.Days := ASource.Days;
end;

procedure DefaultRecurrenceRec(var Rec: TRecurrenceRec);
begin
  with Rec do
    begin
      ApptStart := Frac(Now);
      ApptEnd := Frac(Now) + (IQMS.Common.Dates.TIME_OneMinute * 5);
      ApptDur := IQMS.Common.Dates.TIME_OneMinute * 5;
      AllDay := FALSE;
      RecurStart := Date;
      RecurEnd := Date + 90;
      EndType := etCount;
      EndAfterCount := 10;
      Pattern := rpWeekly;
      Rule := rcByDay;
      Occur := 1;
      Interval := 1;
      Days := Format('_%d_', [IQMS.Common.Dates.IQDoW(RecurStart)]);
    end;
end;

{ ---------------------------------------------------------------------------- }
{ TRecurCargo }
{ ---------------------------------------------------------------------------- }

constructor TRecurCargo.Create(AStartDateTime, AEndDateTime: TDateTime);
begin
  StartDateTime := AStartDateTime;
  EndDateTime := AEndDateTime;
end;

{ ---------------------------------------------------------------------------- }
{ TRecordCargo }
{ ---------------------------------------------------------------------------- }

constructor TRecordCargo.Create(AID: Real);
begin
  ID := AID;
end;

end.

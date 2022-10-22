unit crm_recurrence;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  System.DateUtils,
  System.Math,
  crm_recur_types,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule;

// Checks the "recurrence" status of a CRM Activity
// Parameters:
// SelectedID = CRM_ACTIVITY.ID of the record the user wants to open
// OpenThisID = CRM_ACTIVITY.ID of the record you should open
// Function Result
// TRUE = User has selected an option; open value of variable, OpenThisID.
// FALSE = User has not selected an option; do not open any records.
function CheckRecurrenceStatus(SelectedID: Real; var OpenThisID: Real;
  var AOpenedSeries: Boolean): Boolean;

// Returns TRUE/FALSE whether this CRM Activity can have it's recurrence
// settings modified
function CanEditRecurrenceOptions(AID: Real): Boolean;

// Returns TRUE/FALSE whether this CRM Activity has recurrence settings
function HasRecurrenceSettings(AID: Real): Boolean;
// Returns TRUE/FALSE if current activity (AID) or parent has recurrence
// settings.  If this item has a parent with recurrence settings, then
// the AParentID is also returned.
function HasRecurrence(const AID: Real; var AParentID: Real): Boolean;

// Returns TRUE/FALSE if this CRM Activity's children have links
// This is used to prevent links and data from being destroyed
function CheckedRecurrentItemsChanged(AID: Real): Boolean;

// Edits "recurrence" values for the current record
// If Result = TRUE, then new settings have been created in table,
// CRM_RECURRENCE, where CRM_ACTIVITY_ID = AID.
//
// NOTE: This does NOT create recurrent records
//
function EditRecurrenceOptions( AID: Real;
  var ARemove: Boolean): Boolean;
function GetRecurrenceParentDates( AID: Real;
  var AStartDateTime, AEndDateTime: TDateTime; var AAllDay: Boolean): Boolean;
function GetRecurrenceSummaryText( AID: Real): String;

// Creates the recurrences for the parent CRM activity
function CreateRecurrentActivities( AID: Real): Boolean;
// Updates the basic fields on recurrences
procedure UpdateRecurrences(AID: Real);

// Removes recurrences
procedure RemoveRecurrences(AID: Real);

// Summary text
procedure UpdateSummaryText(AParentID: Real; ASummaryText: string);

type
  TRecurrence = class(TComponent)
  private
    { Private declarations }
    FRemoveRecurrence: Boolean;
    FParentID: Real;
    FCRM_RECURRENCE_ID: Real; // populated by GetPreviousSettings, below
    FRec: TRecurrenceRec;
    FRecurList: TList;
    FOrigStartDateTime: TDateTime;
    FOrigAllDay: Boolean;
    FOrigEndDateTime: TDateTime;
    procedure Initialize;
    function DateByPos(ADate: TDateTime; APosition: TPatternDayPos;
      APatternDay: TPatternDay;
      AStartOfWeek: Integer): TDateTime;
    procedure SetParentID(const Value: Real);
    procedure SetOrigAllDay(const Value: Boolean);
    procedure SetOrigEndDateTime(const Value: TDateTime);
    procedure SetOrigStartDateTime(const Value: TDateTime);
  protected
    { Protected declarations }
    procedure GetPreviousSettings; // gets previous settings

    procedure CalcRecurrences;
    // Gets recurrence dates (fills FRec and FRecurList with dates)

    procedure SaveCurrentSettings; // saves recurrence settings

    function DurationText: String;
  public
    { Public declarations }
    constructor Create( AParentID: Real);
    destructor Destroy; override;
    function Edit: Boolean;
    function CreateRecurrences: Boolean;
    // creates (clones) CRM_ACTIVITY records
    procedure GetActivityDates(var AStartDateTime, AEndDateTime: TDateTime;
      var AAllDay: Boolean);
    function Summary: String;
  published
    { Published declarations }
    property RemoveRecurrence: Boolean read FRemoveRecurrence;
    property ParentID: Real read FParentID write SetParentID;
    property StartDateTime: TDateTime read FOrigStartDateTime
      write SetOrigStartDateTime;
    property EndDateTime: TDateTime read FOrigEndDateTime
      write SetOrigEndDateTime;
    property AllDay: Boolean read FOrigAllDay write SetOrigAllDay;
  end;

implementation

uses
  crm_activity_dblib,
  crm_recur_dlg,
  crm_recur_open,
  crm_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.Dates,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication;

{ ---------------------------------------------------------------------------- }
function CheckRecurrenceStatus(SelectedID: Real; var OpenThisID: Real;
  var AOpenedSeries: Boolean): Boolean;
var
  A: Variant;
  AResParentID: Variant;
  AParentID: Real;
  ASubject: String;
  IsRecurrent: Boolean;
begin
  if (SelectedID = 0) then
    Exit;

  // By default, pass the selected ID as the one to open
  OpenThisID := SelectedID;

  // Get some information about the current record
  A := SelectValueArrayFmt('SELECT subject, parent_id '#13 +
    'FROM crm_activity '#13 +
    'WHERE id = %.0f',
    [SelectedID]);
  if VarArrayDimCount(A) > 0 then
    begin
      ASubject := A[0];
      AParentID := A[1];
    end
  else
    Exit;

  // Is this a recurrent activity?
  IsRecurrent := (AParentID > 0) or
    (SelectValueFmtAsFloat('SELECT id '#13 +
    'FROM crm_activity '#13 +
    'WHERE parent_id = %.0f AND'#13 +
    '      ROWNUM < 2',
    [SelectedID]) > 0);

  // Populate the parent ID
  // 1.) this activity is the parent
  if IsRecurrent and (AParentID = 0) then
    AParentID := SelectedID
    // 2.) we need to get the next future activity in the series as the new parent
  else
    begin
      { AParentID := SelectValueFmtAsFloat('SELECT id '#13 +
        'FROM crm_activity '#13 +
        'WHERE parent_id = %.0f AND' +
        '      TRUNC(startdate) >= TO_DATE(''%s'', ''MM/DD/RRRR'') AND'#13 +
        '      ROWNUM < 2',
        [AParentID,
        FormatDateTime('mm/dd/yyyy',
        IQMS.Common.Dates.IQOracleAdjustedDate)]); }
      if AParentID > 0 then
        AResParentID := SelectValueParam(
          'SELECT id '#13 +
          'FROM crm_activity '#13 +
          'WHERE TRUNC(startdate) >= TRUNC(SYSDATE) AND ' +
          '      parent_id = :PARENT_ID AND'#13 +
          '      ROWNUM < 2',
          ['PARENT_ID;F'],
          [AParentID]);
      if not (VarIsNull(AResParentID)) then
        AParentID := AResParentID;
    end;

  // Pass TRUE if this is NOT a recurrent activity
  Result := not IsRecurrent or (AParentID = 0);

  // ** Very old recurrent activities **
  // If this is recurrent and the parent ID is zero (0), then that means this
  // recurrent activity is so old, there are no future activities; we cannot
  // edit this as a recurrence.  We can only edit the individual activity.

  if not Result then
    with TFrmCRMOpenRecurrencePrompt.Create(UniApplication) do // crm_recur_dlg.pas
      try
        // '"%s" is a recurring item.  Do you want to open only this occurrence or the series?'
        lblPrompt.Caption := Format(crm_rscstr.cTXT0001443, [ASubject]);
        Result := ShowModal = mrOk;
        if Result then
          begin
            AOpenedSeries := SelectedIndex = 1;
            case SelectedIndex of
              0:
                OpenThisID := SelectedID; // this occurrence
              1:
                OpenThisID := AParentID; // the series
            end; // end case
          end;
      finally
        Free;
      end;

end;

{ ---------------------------------------------------------------------------- }
function CanEditRecurrenceOptions(AID: Real): Boolean;
begin
  Result := SelectValueFmtAsFloat
    ('select parent_id from crm_activity where id = %.0f', [AID]) = 0;
end;

{ ---------------------------------------------------------------------------- }
function HasRecurrenceSettings(AID: Real): Boolean;
begin
  Result := SelectValueFmtAsFloat('select id from crm_recurrence ' +
    'where crm_activity_id = %.0f and rownum < 2', [AID]) > 0;
end;

{ ---------------------------------------------------------------------------- }
function HasRecurrence(const AID: Real; var AParentID: Real): Boolean;
begin
  // 1.) Does activity have recurrences?  If so, then this is the parent
  // for recurrences.  Delete this activity, and you must delete
  // all recurrences.
  Result := HasRecurrenceSettings(AID); // see above

  // 2.) Does this activity have a parent with recurrences?  If so, this
  // is a recurrence, and may be deleted individually.
  if not Result then
    begin
      AParentID := SelectValueFmtAsFloat
        ('select parent_id from crm_activity ' +
        'where id = %.0f', [AID]);
      Result := HasRecurrenceSettings(AParentID);
    end;
end;

{ ---------------------------------------------------------------------------- }
function CheckedRecurrentItemsChanged(AID: Real): Boolean;
begin
  { This SQL checks to see if any "child" recurrence items have been linked
    to a Support Issue, or a Campaign, Service record, Opportunity or Sales
    Order. }

  Result := SelectValueFmtAsFloat
    ('select iqcrm_recur.items_have_links(%.0f) from dual', [AID]) > 0;
end;

{ ---------------------------------------------------------------------------- }
function EditRecurrenceOptions( AID: Real;
  var ARemove: Boolean): Boolean;
begin
  with TRecurrence.Create(AID) do
    try
      Result := Edit;
      if Result then
        ARemove := RemoveRecurrence;
    finally
      Free;
    end;
end;

{ ---------------------------------------------------------------------------- }
function GetRecurrenceParentDates( AID: Real;
  var AStartDateTime, AEndDateTime: TDateTime; var AAllDay: Boolean): Boolean;
begin
  // Returns the Start Date/Time and End Date/Time for the parent record
  // This is checked after the user sets recurrence settings
  // Exit early if we cannot edit recurrence options
  // if not CanEditRecurrenceOptions(AID) then Exit;

  with TRecurrence.Create(AID) do
    try
      GetActivityDates(AStartDateTime, AEndDateTime, AAllDay);
      Result := TRUE;
    finally
      Free;
    end;

end;

{ ---------------------------------------------------------------------------- }
function GetRecurrenceSummaryText( AID: Real): String;
begin
  Result := '';
  // Returns the summary text
  with TRecurrence.Create(AID) do
    try
      Result := Summary;
    finally
      Free;
    end;
end;

{ ---------------------------------------------------------------------------- }
function CreateRecurrentActivities( AID: Real): Boolean;
begin
  // Exit early if we cannot edit recurrence options
  // if not CanEditRecurrenceOptions(AID) then Exit;

  with TRecurrence.Create(AID) do
    try
      Result := CreateRecurrences;
    finally
      Free;
    end;
end;

{ ---------------------------------------------------------------------------- }
procedure UpdateRecurrences(AID: Real);
begin
  if AID = 0 then
    Exit;
  ExecuteCommandFmt('BEGIN iqcrm_recur.update_basic_fields(%.0f); END;', [AID]);
  ExecuteCommandFmt
    ('BEGIN iqms.iqcrm.register_notification(%.0f); END;', [AID]);
end;

{ ---------------------------------------------------------------------------- }
procedure RemoveRecurrences(AID: Real);
begin
  // Delete the settings from the parent record
  ExecuteCommandFmt
    ('delete from crm_recurrence where crm_activity_id = %.0f', [AID]);
  // Delete child records
  ExecuteCommandFmt('delete from crm_activity where parent_id = %.0f', [AID]);
end;

procedure UpdateSummaryText(AParentID: Real; ASummaryText: string);
begin
  ExecuteCommandParam('UPDATE crm_recurrence SET summary = :SUMMARY ' +
    'WHERE crm_activity_id = :ID',
    ['SUMMARY;S', 'ID;F'],
    [ASummaryText, AParentID]);
end;

{ ---------------------------------------------------------------------------- }
{ TRecurrence }
{ ---------------------------------------------------------------------------- }

constructor TRecurrence.Create( AParentID: Real);
begin
  inherited Create(uniGUIApplication.UniApplication);
  FParentID := AParentID;
  FRecurList := TList.Create;
  Initialize;
end;

destructor TRecurrence.Destroy;
begin
  IQMS.Common.Controls.ClearListOfObjects(FRecurList);
  if Assigned(FRecurList) then
    FreeAndNil(FRecurList);
  inherited Destroy;
end;

procedure TRecurrence.Initialize;
begin
  // Initial
  FRemoveRecurrence := FALSE;

  // Fill record with current options
  GetPreviousSettings;

end;

function TRecurrence.Edit: Boolean;
begin
  // Exit early if we cannot edit recurrence options
  // Result := CanEditRecurrenceOptions(FParentID);
  // if not Result then Exit;

  // Display form to edit record
  with TFrmCRMRecurrence.Create(uniGUIApplication.UniApplication) do
    try
      // Apply current options to the screen
      CopyAndApplyOptions(FRec);

      Result := ShowModal = mrOk;

      // Get the changed options
      if Result then
        begin
          FRemoveRecurrence := RemoveRecurrence;
          SaveAndCopyOptions(FRec);
        end;

    finally
      Free; // free the dlg
    end;

  // Exit early if user cancelled
  if not Result then
    Exit;

  // Save record to database and create recurrent activities
  if not FRemoveRecurrence then
    SaveCurrentSettings;
end;

procedure TRecurrence.CalcRecurrences;
var
  nSpan: Real;
  dOrigStart, dOrigEnd, dRecEnd, dActiveDate, dTempDate, dTempFirstDate,
    dTempNextDate: TDateTime;
  iLoopCount, iItemCount, iSkip, iMonthOffset, iRecurMonth: Integer;
  EndType: TRecurEndType;
  bDone, bFirstInterval: Boolean;

  // ---------------------------------------------------------------------------
  procedure _AddOccurrance(ADate: TDateTime);
  var
    AStartDateTime, AEndDateTime: TDateTime;
    Data: Pointer;
  begin
    if Trunc(ADate) < 60 then
      Exit;

    AStartDateTime := Trunc(ADate) + Frac(FRec.ApptStart);
    // Get the end date - we have to adjust for "all day"
    if FRec.AllDay then
      AEndDateTime := AStartDateTime + (FRec.ApptDur - 1)
    else
      AEndDateTime := AStartDateTime + FRec.ApptDur;

    Data := TRecurCargo.Create(AStartDateTime, AEndDateTime);
    if FRecurList.IndexOf(Data) = - 1 then
      FRecurList.Add(Data);

    iItemCount := iItemCount + 1;
  end;
// ---------------------------------------------------------------------------

{ Oracle Example: SQL to return Day of the Week:
  begin
  Result := Trunc(SelectValueFmtAsFloat('select to_number(to_char(to_date(''%s'', ''MM/DD/RRRR''), ''D'')) from dual',
  [FormatDateTime('mm/dd/yyyy', ADate)]));
  end;
}

  function _Done(ACheckDate: TDateTime): Boolean;
  begin
    // Failsafe - if date is decremented less than 25 years, stop now
    if (ACheckDate < (Date - 25)) then
      Exit(TRUE); // Done!!!
    // Checks if date is >
    if FRec.EndType = etCount then
      bDone := iItemCount >= FRec.EndAfterCount
    else
      bDone := (Trunc(ACheckDate) > Trunc(dRecEnd));
    Result := bDone;
  end;

begin
  FRecurList.Clear;

  dOrigStart := Trunc(FRec.RecurStart) + Frac(FRec.ApptStart);
  dOrigEnd := dOrigStart + FRec.ApptDur;
  dRecEnd := Trunc(FRec.RecurEnd) + Frac(FRec.ApptEnd);

  dActiveDate := dOrigStart;
  nSpan := dOrigEnd - dOrigStart;
  bDone := FALSE;
  bFirstInterval := TRUE;
  iLoopCount := 0;
  iItemCount := 0;
  iSkip := 0;
  iMonthOffset := 0;
  iRecurMonth := 0;

  case FRec.Pattern of
    rpDaily:
      begin
        // Begin looping for daily
        while not bDone do
          begin
            // increment the date
            dActiveDate := dActiveDate + iSkip;

            // are we done yet?
            if _Done(dActiveDate) then
              BREAK;

            // depending on the rule (by day or weekday), increment date and add items
            if FRec.Rule = rcByDay then
              begin
                iSkip := FRec.Interval; // increment date by the interval
                _AddOccurrance(dActiveDate); // add the date
              end
            else if FRec.Rule = rcWeekday then
              begin
                iSkip := 1; // increment by 1
                // Add the date only if it falls on a weekday; otherwise,
                // we continue looping
                if (IQMS.Common.Dates.IQDoW(dActiveDate) in [2 .. 6]) then
                  _AddOccurrance(dActiveDate);
              end;
          end;
      end;

    rpWeekly:
      begin
        // Begin looping for weekly
        while not bDone do
          begin
            // increment the date
            dActiveDate := dActiveDate + iSkip;
            iSkip := 1;

            // are we done yet?
            if _Done(dActiveDate) then
              BREAK;

            // Oracle:
            // if InStr(to_char(to_date('01/30/2007', 'MM/DD/RRRR'), 'D'), '_' || '1_2_3_4_5' || '_' ) > 0 then
            // ...
            // Is the date's weekday in the list?
            if Pos(IntToStr(IQMS.Common.Dates.IQDoW(dActiveDate)), FRec.Days) > 0 then
              begin
                dTempDate := dActiveDate;
                if _Done(dTempDate) then
                  BREAK;

                if dTempDate >= dOrigStart then
                  _AddOccurrance(dTempDate);

                for iLoopCount := 1 to 7 do
                  begin
                    dTempDate := dTempDate + 1;
                    if _Done(dTempDate) then
                      BREAK;

                    if (Pos(IntToStr(IQMS.Common.Dates.IQDoW(dTempDate)), FRec.Days) > 0)
                    then
                      _AddOccurrance(dTempDate);

                    // end of the week
                    if IQMS.Common.Dates.IQDoW(dTempDate) = 7 then
                      begin
                        // Oracle:
                        // select IQCalendar.SundayOf( to_date(''%s'', ''mm/dd/rrrr'')) from dual
                        // set to beginning of the week
                        dActiveDate := IQMS.Common.Dates.IQBoW(dTempDate);
                        BREAK;
                      end;
                  end;

                dActiveDate := dActiveDate + (FRec.Interval * 7) - 1;
              end;
          end; // end loop
      end;

    rpMonthly:
      begin
        dTempFirstDate := 0;
        dTempNextDate := 0;

        // Adjust the starting date
        if (FRec.Rule = rcByDay) and (DayOf(dActiveDate) > StrToInt(FRec.Days))
        then
          begin
            dActiveDate := IQMS.Common.Dates.IQBoM(dActiveDate);
            dActiveDate := System.SysUtils.IncMonth(dActiveDate, 1);
          end;

        // Begin looping for weekly
        while not bDone do
          begin
            // increment the date
            dActiveDate := dActiveDate + iSkip;

            if _Done(dActiveDate) then
              BREAK;

            // The X day of every X month
            if FRec.Rule = rcByDay then
              begin
                if bFirstInterval then
                  begin
                    dActiveDate :=
                      Trunc(ReplaceDay(dActiveDate, StrToInt(FRec.Days))) +
                      Frac(FRec.ApptStart);
                    dTempFirstDate := dActiveDate;
                    bFirstInterval := FALSE;
                  end;

                if Trunc(dActiveDate) >= Trunc(dOrigStart) then
                  _AddOccurrance(dActiveDate);

                dTempNextDate := System.SysUtils.IncMonth(dActiveDate,
                  FRec.Interval);
                iMonthOffset := 0;
                // get the next offset
                if (System.DateUtils.DayOf(dTempNextDate) <
                  System.DateUtils.DaysInMonth(dTempNextDate)) and
                  (System.DateUtils.DayOf(dTempFirstDate) <>
                  System.DateUtils.DayOf(dTempNextDate)) then
                  iMonthOffset := System.DateUtils.DayOf(dTempFirstDate) -
                    System.DateUtils.DayOf(dTempNextDate);
                iSkip := Trunc(dTempNextDate - dActiveDate) + iMonthOffset;
              end
            else if FRec.Rule = rcByPosition then
              begin
                if bFirstInterval then
                  begin
                    dActiveDate := Trunc(IQMS.Common.Dates.IQBoM(dActiveDate)) +
                      Frac(FRec.ApptStart);
                    dTempNextDate := dActiveDate;
                    bFirstInterval := FALSE;
                  end
                else
                  begin
                    if Trunc(dActiveDate) >= Trunc(dOrigStart) then
                      _AddOccurrance(dActiveDate);
                    dTempNextDate := System.SysUtils.IncMonth(dActiveDate,
                      FRec.Interval);
                  end;
                // set up the next date
                dTempNextDate := DateByPos(dTempNextDate,
                  TPatternDayPos(FRec.Occur),
                  TPatternDay(StrToInt(FRec.Days)), DayOfWeek(dActiveDate));
                iSkip := Abs(Trunc(dTempNextDate) - Trunc(dActiveDate));
              end;
          end;
      end;

    rpYearly:
      begin

        // Initialize variable to Interval
        if FRec.Rule = rcByPosition then
          iRecurMonth := FRec.Interval;
        if iRecurMonth = 0 then
          iRecurMonth := 1;

        // Begin looping for weekly
        while not bDone do
          begin
            // increment the date
            dActiveDate := dActiveDate + iSkip;

            if _Done(dActiveDate) then
              BREAK;

            if FRec.Rule = rcByMonth then
              begin
                if bFirstInterval then
                  begin
                    dActiveDate := ReplaceDay(dActiveDate { dOrigStart } ,
                      FRec.Interval);
                    dActiveDate := ReplaceMonth(dActiveDate { dOrigStart } ,
                      FRec.Occur);
                    dTempFirstDate := dActiveDate;
                    bFirstInterval := FALSE;
                  end;

                if Trunc(dActiveDate) >= Trunc(dOrigStart) then
                  _AddOccurrance(Trunc(dActiveDate) + Frac(FRec.ApptStart));

                dTempNextDate := IncYear(dActiveDate, 1 { FRec.Interval } );
                iMonthOffset := 0;
                if (System.DateUtils.DayOf(dTempNextDate) <
                  System.DateUtils.DaysInMonth(dTempNextDate)) and
                  (System.DateUtils.DayOf(dTempFirstDate) <>
                  System.DateUtils.DayOf(dTempNextDate)) then
                  iMonthOffset := System.DateUtils.DayOf(dTempFirstDate) -
                    System.DateUtils.DayOf(dTempFirstDate);
                iSkip := Abs(Trunc(dTempNextDate - dActiveDate)) + iMonthOffset;
              end
            else if FRec.Rule = rcByPosition then
              begin
                if bFirstInterval then
                  begin
                    dActiveDate :=
                      EncodeDate(System.DateUtils.YearOf(dActiveDate),
                      iRecurMonth, 1);
                    dActiveDate := DateByPos(dActiveDate,
                      TPatternDayPos(FRec.Occur),
                      TPatternDay(StrToInt(FRec.Days)), DayOfWeek(dActiveDate));
                    bFirstInterval := FALSE;
                  end;

                if Trunc(dActiveDate) >= Trunc(dOrigStart) then
                  _AddOccurrance(Trunc(dActiveDate) + Frac(FRec.ApptStart));

                dTempNextDate := IncYear(dActiveDate, 1);
                dTempNextDate := DateByPos(dTempNextDate,
                  TPatternDayPos(FRec.Occur),
                  TPatternDay(StrToInt(FRec.Days)), DayOfWeek(dActiveDate));
                iSkip := Abs(Trunc(dTempNextDate) - Trunc(dActiveDate));
              end;
          end;
      end;
  end; // end case
end;

function TRecurrence.DateByPos(ADate: TDateTime; APosition: TPatternDayPos;
  APatternDay: TPatternDay; AStartOfWeek: Integer): TDateTime;
var
  i, iDayCount, d, m, y: Word;
  ADayOfWeek: Integer;
  dEndOfMonth, dBegOfMonth, dFirstOccurDate: TDateTime;
  ADatesArray: array of TDateTime;

  // ---------------------------------------------------------------------------
  procedure _GetWeekDays;
  var
    i, j, iDaysInTheMonth: Integer;
    d, m, y: Word;
    dFirstDate: TDateTime;
  begin
    DecodeDate(ADate, y, m, d);
    iDaysInTheMonth := System.DateUtils.DaysInMonth(ADate);
    dFirstDate := IQMS.Common.Dates.IQBoM(ADate);
    j := 0;
    for i := 0 to iDaysInTheMonth - 1 do
      if (DayOfWeek(dFirstDate + i) in [2 .. 6]) then
        begin
          SetLength(ADatesArray, j + 1);
          ADatesArray[j] := dFirstDate + i;
          inc(j);
        end;
  end;
// ---------------------------------------------------------------------------
  procedure _GetWeekEnds;
  var
    i, j, iDaysInTheMonth: Integer;
    d, m, y: Word;
    dFirstDate: TDateTime;
    iStartOfWeekEndIndex, iEndofWeekEndIndex: Integer;
  begin
    iStartOfWeekEndIndex := 7;
    iEndofWeekEndIndex := 1;
    DecodeDate(ADate, y, m, d);
    iDaysInTheMonth := System.DateUtils.DaysInMonth(ADate);
    dFirstDate := EncodeDate(y, m, 1);
    j := 0;
    for i := 0 to iDaysInTheMonth - 1 do
      if (DayOfWeek(dFirstDate + i) = iStartOfWeekEndIndex) or
        (DayOfWeek(dFirstDate + i) = iEndofWeekEndIndex) then
        begin
          SetLength(ADatesArray, j + 1);
          ADatesArray[j] := dFirstDate + i;
          inc(j);
        end;
  end;
// ---------------------------------------------------------------------------

begin
  dFirstOccurDate := 0;
  Result := 0;
  DecodeDate(ADate, y, m, d);
  iDayCount := System.DateUtils.DaysInMonth(ADate);

  { TPatternDay = (pdDay, pdWeekDay, pdWeekendDay, pdSunday, pdMonday,
    pdTuesday, pdWednesday, pdThursday, pdFriday, pdSaturday); }
  ADayOfWeek := Ord(APatternDay) - 2;
  if ADayOfWeek < 0 then
    ADayOfWeek := 0;

  if APosition <> pdcLast then
    begin
      dBegOfMonth := EncodeDate(y, m, 1);
      if APatternDay = pdDay then
        begin // First Nth day of the month
          Result := dBegOfMonth + Ord(APosition);
          Exit;
        end;
      if APatternDay = pdWeekDay then // A WeekDay
        begin
          _GetWeekDays;
          if (VarArrayDimCount(ADatesArray) > 0) and
            (High(ADatesArray) >= Ord(APosition)) then
            Result := ADatesArray[Ord(APosition)];
        end
      else if APatternDay = pdWeekendDay then // WeekEnd
        begin
          _GetWeekEnds;
          if (VarArrayDimCount(ADatesArray) > 0) and
            (High(ADatesArray) >= Ord(APosition)) then
            Result := ADatesArray[Ord(APosition)];
        end
      else
        begin
          for i := 0 to 6 do
            if System.SysUtils.DayOfWeek(dBegOfMonth + i) = ADayOfWeek then
              begin
                dFirstOccurDate := dBegOfMonth + i;
                BREAK;
              end;
          Result := dFirstOccurDate + (7 * (Ord(APosition)));
        end;
    end
  else
    begin
      dEndOfMonth := EncodeDate(y, m, iDayCount);
      if APatternDay = pdDay then
        begin
          Result := dEndOfMonth;
          Exit;
        end;
      if APatternDay = pdWeekDay then // A WeekDay
        begin
          _GetWeekDays;
          if (VarArrayDimCount(ADatesArray) > 0) and
            (High(ADatesArray) >= Ord(APosition)) then
            Result := ADatesArray[High(ADatesArray)];
        end
      else if APatternDay = pdWeekendDay then // WeekEnd
        begin
          _GetWeekEnds;
          if (VarArrayDimCount(ADatesArray) > 0) and
            (High(ADatesArray) >= Ord(APosition)) then
            Result := ADatesArray[High(ADatesArray)];
        end
      else
        begin
          for i := 0 to 6 do
            if (System.SysUtils.DayOfWeek(dEndOfMonth - i)) = ADayOfWeek then
              begin
                Result := dEndOfMonth - i;
                BREAK;
              end;
        end;
    end;
end;

procedure TRecurrence.SetParentID(const Value: Real);
begin
  FParentID := Value;
end;

procedure TRecurrence.GetPreviousSettings;
// ---------------------------------------------------------------------------
  procedure _ApplyDateToRec(Value: TDate; var AField: TDateTime);
  begin
    if Trunc(Value) < 60 then
      Value := Date;
    AField := Value;
  end;
// ---------------------------------------------------------------------------
  procedure _ApplyTimeToRec(Value: TTime; var AField: TDateTime;
    ADefault: TTime = IQMS.Common.Dates.TIME_800);
  begin
    if Frac(Value) < 0 then
      Value := ADefault;
    AField := Frac(Value);
  end;
// ---------------------------------------------------------------------------
  procedure _ApplyIntegerToRec(Value: Integer; var AField: Integer;
    ADefault: Integer = 0);
  begin

  end;
// ---------------------------------------------------------------------------

var
  ADiff: Real;
  A: Variant;
begin
  // Ensure we have a clean record
  ClearRecurrenceRec(FRec); // crm_recur_types.pas
  DefaultRecurrenceRec(FRec);

  // Get the basic values from the activity
  A := SelectValueArrayFmt
    ('select allday, startdate, finishdate from crm_activity where id = %.0f',
    [FParentID]);
  if System.Variants.VarArrayDimCount(A) > 0 then
    begin
      AllDay := A[0] = 'Y';
      if not (A[1] = NULL) then
        StartDateTime := VarToDateTime(A[1])
      else
        StartDateTime := Now;
      if not (A[2] = NULL) then
        EndDateTime := VarToDateTime(A[2])
      else
        EndDateTime := StartDateTime;
    end;

  // modify dates for "all day"
  if AllDay then
    begin
      if Trunc(StartDateTime) > Trunc(EndDateTime) then
        EndDateTime := StartDateTime;
      StartDateTime := Trunc(StartDateTime);
      EndDateTime := Trunc(StartDateTime);
    end;

  // initialize these record based on the activity
  FRec.AllDay := AllDay;
  FRec.ApptDur := EndDateTime - StartDateTime;
  FRec.ApptStart := Frac(StartDateTime);
  FRec.ApptEnd := Frac(EndDateTime);
  FRec.RecurStart := StartDateTime;

  // populate the recurrence settings
  with TFDQuery.Create(NIL) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add('SELECT id, crm_activity_id, appt_start, appt_end,');
      SQL.Add('       appt_duration, recur_start, recur_end, end_type,');
      SQL.Add('       end_after, pattern, rule, occur, interval, days,');
      SQL.Add('       allday');
      SQL.Add('FROM crm_recurrence');
      SQL.Add(Format('WHERE crm_activity_id = %.0f', [FParentID]));
      SQL.Add(' and rownum < 2');
      Open;
      if not (BOF and EOF) then
        begin
          FCRM_RECURRENCE_ID := FieldByName('ID').AsFloat;
          with FRec do
            begin
              AllDay := FieldByName('allday').AsString = 'Y';
              _ApplyTimeToRec(FieldByName('appt_start').AsDateTime, ApptStart);
              _ApplyTimeToRec(FieldByName('appt_end').AsDateTime, ApptEnd);

              if AllDay then
                begin
                  ApptStart := 0;
                  ApptEnd := 0;
                end;

              ApptDur := fIIf(FieldByName('appt_duration').AsFloat > 0,
                FieldByName('appt_duration').AsFloat,
                IQMS.Common.Dates.TIME_OneMinute * 5);

              // Ensure that recurrence is always today (sysdate) or greater
              ADiff := Trunc(FieldByName('recur_end').AsDateTime) -
                Trunc(FieldByName('recur_start').AsDateTime);
              if Trunc(FieldByName('recur_start').AsDateTime) < IQMS.Common.Dates.IQOracleAdjustedDate
              then
                begin
                  _ApplyDateToRec(IQMS.Common.Dates.IQOracleAdjustedDate, RecurStart);
                  _ApplyDateToRec(IQMS.Common.Dates.IQOracleAdjustedDate + ADiff,
                    RecurEnd);
                end
              else
                begin
                  _ApplyDateToRec(FieldByName('recur_start').AsDateTime,
                    RecurStart);
                  _ApplyDateToRec(FieldByName('recur_end').AsDateTime,
                    RecurEnd);
                end;

              EndType := TRecurEndType(FieldByName('end_type').AsInteger);
              EndAfterCount := iIIf(FieldByName('end_after').AsInteger > 0,
                FieldByName('end_after').AsInteger, - 1 { Required } );
              Pattern := TRecurPattern(FieldByName('pattern').AsInteger);
              Rule := TRecurRule(FieldByName('rule').AsInteger);
              Occur := FieldByName('occur').AsInteger;
              Interval := FieldByName('interval').AsInteger;
              Days := FieldByName('days').AsString;
            end;
        end
        // no records found; add default values
      else
        with FRec do
          begin
            ApptStart := Frac(StartDateTime);
            ApptEnd := EndDateTime;
            ApptDur := EndDateTime - StartDateTime; // IQMS.Common.Dates.TIME_30Mins;
            AllDay := AllDay;

            if (ApptStart = 0) and (ApptEnd = 0) and (ApptDur = 0) then
              begin
                ApptDur := 1;
                AllDay := TRUE;
              end;

            if Trunc(StartDateTime) > 60 then
              RecurStart := Trunc(StartDateTime)
            else
              RecurStart := Date;
            // RecurEnd      := RecurStart + 90; // add 3 months
            // EndType       := etCount;
            // EndAfterCount := 10;
            // Pattern       := rpWeekly;
            // Rule          := rcByDay;
            // Occur         := 1;
            // Interval      := 1;
            Days := Format('_%d_', [IQMS.Common.Dates.IQDoW(RecurStart)]);
          end;
    finally
      Free; // free TFDQuery
    end;

end;

procedure TRecurrence.SaveCurrentSettings;
var
  ARecurID: Real;
begin
  // ** Update or create Recurrence record **
  ARecurID := SelectValueFmtAsFloat
    ('select id from CRM_RECURRENCE where crm_activity_id = %.0f',
    [FParentID]);

  // Create
  if ARecurID = 0 then
    begin
      ARecurID := GetNextID('CRM_RECURRENCE');
      ExecuteCommandFmt('insert into crm_recurrence'#13 +
        '( id, crm_activity_id, appt_start, appt_end,'#13 +
        '  appt_duration, recur_start, recur_end, end_type,'#13 +
        '  end_after, pattern, rule, occur, interval, days, '#13 +
        '  allday )'#13 +
        'values'#13 +
        '( %.0f, %.0f, to_date( ''%s'', ''hh24:mi'' ), to_date( ''%s'', ''hh24:mi'' ),'#13
        +
        '  %.15f, to_date( ''%s'', ''mm/dd/rrrr'' ), to_date( ''%s'', ''mm/dd/rrrr'' ), %d,'#13
        +
        '  %d, %d, %d, %d, %d, ''%s'', ''%s'' )',
        [ARecurID, // id
        FParentID, // crm_activity_id
        FormatDateTime('hh:nn', FRec.ApptStart), // appt_start
        FormatDateTime('hh:nn', FRec.ApptEnd), // appt_end
        FRec.ApptDur, // appt_duration
        FormatDateTime('mm/dd/yyyy', FRec.RecurStart), // recur_start
        FormatDateTime('mm/dd/yyyy', FRec.RecurEnd), // recur_end
        Ord(FRec.EndType), // end_type
        FRec.EndAfterCount, // end_after
        Ord(FRec.Pattern), // pattern
        Ord(FRec.Rule), // rule
        FRec.Occur, // occur
        FRec.Interval, // interval
        FRec.Days,
        sIIf(FRec.AllDay, 'Y', 'N')]); // days
    end
    // Update
  else
    begin
      ExecuteCommandFmt('update crm_recurrence set'#13 +
        ' appt_start = to_date( ''%s'', ''hh24:mi'' ),'#13 +
        ' appt_end = to_date( ''%s'', ''hh24:mi'' ),'#13 +
        ' appt_duration = %.15f,'#13 +
        ' recur_start = to_date( ''%s'', ''mm/dd/rrrr'' ),'#13 +
        ' recur_end = to_date( ''%s'', ''mm/dd/rrrr'' ),'#13 +
        ' end_type = %d,'#13 +
        ' end_after = %d,'#13 +
        ' pattern = %d,'#13 +
        ' rule = %d,'#13 +
        ' occur = %d,'#13 +
        ' interval = %d,'#13 +
        ' days = ''%s'','#13 +
        ' allday = ''%s'''#13 +
        'where id = %.0f',
        [FormatDateTime('hh:nn', FRec.ApptStart), // appt_start
        FormatDateTime('hh:nn', FRec.ApptEnd), // appt_end
        FRec.ApptDur, // appt_duration
        FormatDateTime('mm/dd/yyyy', FRec.RecurStart), // recur_start
        FormatDateTime('mm/dd/yyyy', FRec.RecurEnd), // recur_end
        Ord(FRec.EndType), // end_type
        FRec.EndAfterCount, // end_after
        Ord(FRec.Pattern), // pattern
        Ord(FRec.Rule), // rule
        FRec.Occur, // occur
        FRec.Interval, // interval
        FRec.Days, // days
        sIIf(FRec.AllDay, 'Y', 'N'),
        ARecurID]); // id
    end;
end;

function TRecurrence.CreateRecurrences: Boolean;
var
  i: Integer;
  AID, AQueryID: Real;
  AStartDate, AEndDate, AAlertDate: TDateTime;
  AAllDay: Boolean;
  ALeadUnits: Integer;
  AToday: TDateTime;
  AQuery: TFDQuery;
  ADoneWithQuery: Boolean;
  ASubject: String;

  // --------------------------------------------------------------------------
  procedure _MoveQueryNext;
  begin
    // Get the ID in the query
    if not (AQuery.BOF and AQuery.EOF) and not ADoneWithQuery then
      begin
        // Current ID value
        AQueryID := AQuery.FieldByName('ID').AsFloat;
        // Now, move to the next record
        ADoneWithQuery := AQuery.EOF;
        AQuery.Next;

        // This should never occur
        if not ADoneWithQuery and (AQueryID = FParentID) then
          begin
            // we are already on the next record; get the ID value
            AQueryID := AQuery.FieldByName('ID').AsFloat;
            // now again move to the next record
            ADoneWithQuery := AQuery.EOF;
            AQuery.Next;
          end;
      end
    else
      begin
        AQueryID := 0;
        ADoneWithQuery := TRUE;
      end;
  end;
// --------------------------------------------------------------------------

begin

  Result := FALSE; // initial

  // Exit early if we cannot edit recurrence options
  if not CanEditRecurrenceOptions(FParentID) then
    Exit;

  // ** Remove Status from Previous Items ** //
  // Remove recurrence from items that are prior to the current date
  AID := 0;
  if SelectValueFmtAsInteger(
    'SELECT 1                                                             '#13 +
    '  FROM crm_activity                                                  '#13 +
    ' WHERE TRUNC(startdate) < TRUNC(TO_DATE(''%s'', ''MM/DD/RRRR'')) AND '#13 +
    '       parent_id = %.0f AND                                          '#13 +
    '       ROWNUM < 2',
    [FormatDateTime('mm/dd/yyyy', Trunc(FRec.RecurStart)),
    FParentID]) = 1 then
    begin
      ExecuteCommandFmt('update crm_activity set parent_id = NULL '#13 +
        'where trunc(startdate) < trunc(to_date(''%s'', ''MM/DD/RRRR'')) and parent_id = %.0f',
        [FormatDateTime('mm/dd/yyyy', Trunc(FRec.RecurStart)), FParentID]);
      // Get the first child; it will be the new parent
      AID := SelectValueFmtAsFloat
        ('select id from crm_activity where parent_id = %.0f order by startdate',
        [FParentID]);
    end;
  // Update the recurrence settings record
  if AID > 0 then
    begin
      // Set the new parent_id
      ExecuteCommandFmt
        ('update crm_activity set parent_id = %.0f where parent_id = %.0f',
        [AID, FParentID]);
      ExecuteCommandFmt
        ('update crm_activity set parent_id = NULL where id = %.0f', [AID]);
      ExecuteCommandFmt
        ('update crm_recurrence set CRM_ACTIVITY_ID = %.0f where CRM_ACTIVITY_ID = %.0f',
        [AID, FParentID]);
      // This is the new parent
      FParentID := AID;
    end;

  // reset
  AID := 0;

  // Get a list of recurrences
  CalcRecurrences;

  // Make sure we have a list
  if FRecurList.Count <= 1 then
    Exit;

  AToday := IQMS.Common.Dates.IQOracleAdjustedDate;
  ASubject := SelectValueFmtAsString
    ('select subject from crm_activity where id = %.0f', [FParentID]);

  try

    // Get remaining recurrent items
    AQuery := TFDQuery.Create(NIL);
    // Get a list of current recurrent items from > sysdate
    with AQuery do
      begin
        Connection := UniMainModule.FDConnection1;
        SQL.Add('select id, startdate ');
        SQL.Add('from crm_activity ');
        SQL.Add(Format('where parent_id = %.0f ', [FParentID]));
        // SQL.Add(' and trunc(startdate) >= trunc(sysdate)');
        SQL.Add('order by startdate');
        Open;
        ADoneWithQuery := (BOF and EOF);
      end;

    // Create new activity records
    with TFDStoredProc.Create(NIL) do
      try
        // Initialize the stored procedure
        Connection := UniMainModule.FDConnection1;
        StoredProcName := 'IQMS.IQCRM.CLONE_ACTIVITY';
        Prepare;
        ParamByName('v_crm_activity_id').Value := FParentID;
        // ** Loop the List ** //
        for i := 0 to FRecurList.Count - 1 do
          begin
            AStartDate := TRecurCargo(FRecurList.Items[i]).StartDateTime;
            AEndDate := TRecurCargo(FRecurList.Items[i]).EndDateTime;
            AAllDay := SelectValueFmtAsString
              ('SELECT allday FROM crm_activity ' +
              'WHERE id = %.0f', [FParentID]) = 'Y';
            ALeadUnits := SelectValueFmtAsInteger
              ('SELECT leaddisplayunits FROM crm_activity ' +
              'WHERE id = %.0f', [FParentID]);
            // Adjust the start and end dates of the parent activity to match this first item
            if i = 0 then
              begin
                AAlertDate := crm_activity_dblib.GetAlertDateTime(
                  AStartDate, AAllDay, TLeadTimeUnit(ALeadUnits));
                ExecuteCommandFmt('update crm_activity set '#13 +
                  ' startdate = to_date(''%s'', ''mm/dd/rrrr hh24:mi''), '#13 +
                  ' finishdate = to_date(''%s'', ''mm/dd/rrrr hh24:mi''), '#13 +
                  ' alert_datetime = to_date(''%s'', ''mm/dd/rrrr hh24:mi'') '#13
                  +
                  'where id = %.0f',
                  [FormatDateTime('mm/dd/yyyy hh:nn', AStartDate),
                  FormatDateTime('mm/dd/yyyy hh:nn', AEndDate),
                  FormatDateTime('mm/dd/yyyy hh:nn', AAlertDate),
                  FParentID]);
                CONTINUE;
              end
              // Update existing record (if applicable)
            else if not ADoneWithQuery then
              begin
                _MoveQueryNext;
                if not ADoneWithQuery then
                  begin
                    AAlertDate := crm_activity_dblib.GetAlertDateTime(
                      AStartDate, AAllDay, TLeadTimeUnit(ALeadUnits));
                    // Change existing record
                    ExecuteCommandFmt(
                      'update crm_activity set '#13 +
                      ' startdate = to_date(''%s'', ''mm/dd/rrrr hh24:mi''), '#13
                      +
                      ' finishdate = to_date(''%s'', ''mm/dd/rrrr hh24:mi''), '#13
                      +
                      ' alert_datetime = to_date(''%s'', ''mm/dd/rrrr hh24:mi''), '#13
                      +
                      ' subject = ''%s'' '#13 +
                      'where id = %.0f',
                      [FormatDateTime('mm/dd/yyyy hh:nn', AStartDate),
                      FormatDateTime('mm/dd/yyyy hh:nn', AEndDate),
                      FormatDateTime('mm/dd/yyyy hh:nn', AAlertDate),
                      FixStr(ASubject),
                      AQueryID]); // iqlib
                    CONTINUE;
                  end;
              end;

            // Clone
            ExecProc;
            AID := ParamByName('v_new_id').AsLargeInt;
            AAlertDate := crm_activity_dblib.GetAlertDateTime(
              AStartDate, AAllDay, TLeadTimeUnit(ALeadUnits));
            ExecuteCommandFmt('update crm_activity set '#13 +
              ' parent_id = %.0f, '#13 +
              ' startdate = to_date(''%s'', ''mm/dd/rrrr hh24:mi''), '#13 +
              ' finishdate = to_date(''%s'', ''mm/dd/rrrr hh24:mi''), '#13 +
              ' alert_datetime = to_date(''%s'', ''mm/dd/rrrr hh24:mi'') '#13 +
              'where id = %.0f',
              [FParentID,
              FormatDateTime('mm/dd/yyyy hh:nn', AStartDate),
              FormatDateTime('mm/dd/yyyy hh:nn', AEndDate),
              FormatDateTime('mm/dd/yyyy hh:nn', AAlertDate),
              AID]);

          end; // end "for" loop

      finally
        Free; // free the TFDStoredProc
      end;

    // if at this point, we are not done with the query, then there are
    // still existing CRM_ACTIVITY records that do not conform to the
    // recurrence scheme.  We need to delete them.
    if not ADoneWithQuery then
      begin
        // AQueryID is our last ID value used
        ExecuteCommandFmt
          ('delete from crm_activity where id > %.0f and parent_id = %.0f',
          [AQueryID, FParentID]);
      end;

    // Ensure basic fields are updated on all recurrences after the current date
    UpdateRecurrences(FParentID);

  finally
    if Assigned(AQuery) then
      FreeAndNil(AQuery);
  end;

  Result := TRUE;

end;

procedure TRecurrence.GetActivityDates(var AStartDateTime,
  AEndDateTime: TDateTime; var AAllDay: Boolean);
begin
  AAllDay := FRec.AllDay;
  AStartDateTime := Trunc(FRec.RecurStart) + Frac(FRec.ApptStart);
  if AAllDay then
    AEndDateTime := AStartDateTime + (FRec.ApptDur - 1)
  else
    AEndDateTime := AStartDateTime + FRec.ApptDur;
end;

function TRecurrence.Summary: String;
// ---------------------------------------------------------------------------
  function _WeekDaysStr: String;
  var
    S, sComma, sAnd: String;
    i, x: Integer;
    b: Boolean;
  begin
    Result := '';
    if FRec.Pattern <> rpWeekly then
      Exit;
    S := StringReplace(FRec.Days, '_', '', [rfReplaceAll, rfIgnoreCase]);
    b := FALSE;
    for i := 1 to Length(S) do
      begin
        if IQMS.Common.Numbers.IsStringValidInteger(S[i], x) and (x in [1 .. 7]) then
          begin
            sComma := sIIf(b, ', ', '');
            sAnd := sIIf(b and (i = Length(S)), crm_rscstr.cTXT0001450 { 'and' }
              + ' ', '');
            Result := Result + sIIf(i < Length(S), sComma, ' ') + sAnd +
              FormatSettings.LongDayNames[x];
            b := TRUE;
          end;
      end;
    Result := Trim(Result);
  end;

// ---------------------------------------------------------------------------
var
  AActualStartDate, AActualEndDate: TDateTime;
  AOccurEvery: String;
  AEffective: String;
begin
  Result := '';
  if FCRM_RECURRENCE_ID > 0 then
    begin
      // * Returns the summary of the recurrence * //
      try
        // Get the string components
        case FRec.Pattern of
          rpDaily:
            begin
              if FRec.Rule = rcByDay then
                // crm_rscstr.cTXT0001451 = 'Occurs every %d days(s)'
                AOccurEvery := Format(crm_rscstr.cTXT0001451,
                  [FRec.Interval])
              else if FRec.Rule = rcWeekday then
                AOccurEvery := crm_rscstr.cTXT0001452; // 'Occurs every weekday'
            end;
          rpWeekly:
            begin
              // crm_rscstr.cTXT0001453 = 'Occurs every %d week(s) on'
              AOccurEvery := Format(crm_rscstr.cTXT0001453,
                [FRec.Interval]) + ' ' + _WeekDaysStr;
            end;
          rpMonthly:
            begin
              if FRec.Rule = rcByDay then
                // crm_rscstr.cTXT0001454 = 'Occurs day %s of every %d month(s)'
                AOccurEvery := Format(crm_rscstr.cTXT0001454,
                  [FRec.Days, FRec.Interval])
              else if FRec.Rule = rcByPosition then
                // crm_rscstr.cTXT0001455 =
                // 'Occurs the %s %s of every %d month(s)'
                AOccurEvery := Format(crm_rscstr.cTXT0001455,
                  [PatternDayPosName[TPatternDayPos(FRec.Occur)],
                  PatternDayName[TPatternDay(StrToInt(FRec.Days))],
                  FRec.Interval]);
            end;
          rpYearly:
            begin
              if FRec.Rule = rcByDay then
                // crm_rscstr.cTXT0001471 = 'Occurs every %s %d'
                AOccurEvery := Format(crm_rscstr.cTXT0001471,
                  [FormatSettings.LongMonthNames[FRec.Occur - 1],
                  FRec.Interval])
              else if FRec.Rule = rcByPosition then
                AOccurEvery :=
                  Format(crm_rscstr.cTXT0001472 { 'Occurs the %s %s of %s' } ,
                  [PatternDayPosName[TPatternDayPos(FRec.Occur)],
                  PatternDayName[TPatternDay(StrToInt(FRec.Days))],
                  FormatSettings.LongMonthNames[FRec.Interval - 1]]);
            end;
        end; // end case

        // Get the actual start and end dates
        if FRecurList.Count = 0 then
          CalcRecurrences;
        if FRecurList.Count > 0 then
          begin
            AActualStartDate := Trunc(TRecurCargo(FRecurList.Items[0])
              .StartDateTime);
            AActualEndDate :=
              Trunc(TRecurCargo(FRecurList.Items[FRecurList.Count - 1])
              .EndDateTime);
          end
        else
          begin
            AActualStartDate := FRec.RecurStart;
            AActualEndDate := FRec.RecurEnd;
          end;

        { cTXT0001473 = 'effective %s until %s from %s to %s.';
          cTXT0001474 = 'effective %s until %s';
          cTXT0001475 = 'effective %s until %s from %s for %d day(s).';
        }
        if (FRec.ApptStart = 0) and (FRec.ApptEnd = 0) then
          // crm_rscstr.cTXT0001474 = 'effective %s until %s'
          AEffective := Format(crm_rscstr.cTXT0001474,
            [FormatDateTime('ddddd', AActualStartDate), FormatDateTime('ddddd',
            AActualEndDate)])
          // else if (FRec.ApptStart > 0) and (DurationText
        else
          // crm_rscstr.cTXT0001473 = 'effective %s until %s from %s to %s.'
          AEffective := Format(crm_rscstr.cTXT0001473,
            [FormatDateTime('ddddd', AActualStartDate), FormatDateTime('ddddd',
            AActualEndDate),
            FormatDateTime('tt', FRec.ApptStart), FormatDateTime('tt',
            FRec.ApptEnd)]);

        Result := Trim(AOccurEvery) + ' ' + Trim(AEffective);

      except
        // Default result:
        // 'Recurrence settings have been applied.'
        Result := crm_rscstr.cTXT0001449;
      end;
    end;
end;

function TRecurrence.DurationText: String;
// ---------------------------------------------------------------------------
  function GetDisplayText(AValue: Real; AText: String): String;
  var
    R: Real;
  begin
    R := System.Math.RoundTo(AValue, - 2);
    if Frac(R) = 0 then
      Result := Format('%d %s', [Round(AValue), AText])
    else
      Result := Format('%s %s', [FormatFloat('#0.0#', R), AText]);

  end;
// ---------------------------------------------------------------------------
  function _N(ADouble: Double): Real;
  var
    S: String;
  begin
    S := Format('%.2f', [ADouble]);
    Result := StrToFloat(S);
  end;

// ---------------------------------------------------------------------------
var
  AValue, iWeeks, iDays, iHours, iMinutes: Real;
  S: String;
begin
  AValue := FRec.ApptDur;
  iMinutes := _N(AValue / IQMS.Common.Dates.TIME_OneMinute);
  iHours := _N(AValue / IQMS.Common.Dates.TIME_OneHour);
  iDays := _N(AValue / IQMS.Common.Dates.TIME_OneDay);
  iWeeks := _N(AValue / IQMS.Common.Dates.TIME_OneWeek);

  if iWeeks >= 1 then
    S := GetDisplayText(iWeeks, crm_rscstr.cTXT0001476) // 'weeks'
  else if iDays >= 1 then
    S := GetDisplayText(iDays, crm_rscstr.cTXT0001477) // 'days'
  else if iHours >= 1 then
    S := GetDisplayText(iHours, crm_rscstr.cTXT0001478) // 'hours'
  else if iMinutes >= 1 then
    S := GetDisplayText(iMinutes, crm_rscstr.cTXT0001479) // 'minutes'
  else
    S := Format('0 %s', [crm_rscstr.cTXT0001479]); // 'minutes'

  Result := S;

end;

procedure TRecurrence.SetOrigAllDay(const Value: Boolean);
begin
  FOrigAllDay := Value;
  FRec.AllDay := Value;
  FRec.ApptDur := Trunc(FRec.ApptDur);
  if FRec.ApptDur < 1 then
    FRec.ApptDur := 1;
end;

procedure TRecurrence.SetOrigEndDateTime(const Value: TDateTime);
begin
  FOrigEndDateTime := Value;
  FRec.ApptEnd := Frac(Value);
end;

procedure TRecurrence.SetOrigStartDateTime(const Value: TDateTime);
begin
  FOrigStartDateTime := Value;
  FRec.ApptStart := Frac(Value);
  FRec.RecurStart := Trunc(Value);
end;

end.

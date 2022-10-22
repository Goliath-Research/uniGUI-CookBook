unit IQMS.Common.Rep_Releases;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  System.Generics.Collections,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniRadioButton,
  uniEdit,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  UniRadioGroup,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  uniPageControl;

type

  TRecurrenceType = (rtOld, rtDaily, rtWeekly, rtMonthly, rtYearly);
  TDailyOption    = (doEverySomeDays, doEveryWeekday);
  TDayOfTheWeek   = (dSunday = 0, dMonday, dTuesday, dWednesday, dThursday, dFriday, dSaturday);
  TDaysSelection  = set of TDayOfTheWeek;
  TMonthlyOption  = (moDayEverySomeMonths, moDayPosWeekdayEverySomeMonths);
  TMonthlyDayPos  = (mdFirst = 0, mdSecond, mdThird, mdFourth, mdLast);
  TYearlyOption   = (yoOnSomeMonthDay, yoDayPosWeekdayOfSomeMonth);

  TReleases       = TList<TDate>;

  TRepeatingReleases = record

    function GetReleaseType: string;
    function GetReleases(ADate: TDateTime; ACount: integer): TReleases;

    case recType: TRecurrenceType of
      rtOld:
        (
          oldInterval: integer;
        );
      rtDaily:
        (
          dailyOption: TDailyOption;      // Every some days or weekdays
          dailyEveryDays: integer;        // Right now we are using everySomeDays by default
        );
      rtWeekly:
        (
          weeklyEveryWeeks: integer;      // Every some weeks
          weeklyEveryDays: TDaysSelection;      // on the selected days
        );
      rtMonthly:
        (
          monthlyOption: TMonthlyOption;    // Day 6th or First Thursday
          monthlyDay: integer;              // Day 6th
          monthlyDayPos: TMonthlyDayPos;    // First
          monthlyDayOfWeek: TDayOfTheWeek; // Thursday
          monthlyEveryMonths: integer;      // every 3 months
        );
      rtYearly:
        (
          yearlyEveryYears: integer;        // Every 2 years
          yearlyOption: TYearlyOption;      // On August the 6th or On the first Thursday of August
          yearlyMonth: integer;             // Month = August = 8
          yearlyDay: integer;               // 6
          yearlyDayPos: TMonthlyDayPos;     // First
          yearlyDayOfWeek: TDayOfTheWeek;  // Thursday
        );
  end;

  TFrmRepeatingReleases = class(TUniForm)
    pnlButtons: TUniPanel;
    btnCancel: TUniButton;
    btnOK: TUniButton;
    pnlBody: TUniPanel;
    pnlRadioButtons: TUniPanel;
    pc: TUniPageControl;
    rgRecurrence: TUniRadioGroup;
    tsDaily: TUniTabSheet;
    tsWeekly: TUniTabSheet;
    tsMonthly: TUniTabSheet;
    tsYearly: TUniTabSheet;
    rbtnEverySomeDays: TUniRadioButton;
    rbtnEveryWeekday: TUniRadioButton;
    edtDays: TUniEdit;
    lblDays: TUniLabel;
    pnlWeekly: TUniPanel;
    lblRecurEvery: TUniLabel;
    edtWeeks: TUniEdit;
    lblWeeksOn: TUniLabel;
    GroupBox1: TUniGroupBox;
    cboxSunday: TUniCheckBox;
    cboxMonday: TUniCheckBox;
    cboxTuesday: TUniCheckBox;
    cboxWednesday: TUniCheckBox;
    cboxThursday: TUniCheckBox;
    cboxFriday: TUniCheckBox;
    cboxSaturday: TUniCheckBox;
    pnlMonthly: TUniPanel;
    rbtnMonthlyDay: TUniRadioButton;
    edtMonthlyDay: TUniEdit;
    edtMonthlyEveryMonths: TUniEdit;
    lblMonths: TUniLabel;
    rbtnMonthlyThe: TUniRadioButton;
    cboxMonthlyDayPos: TUniComboBox;
    cboxMonthlyDayOfWeek: TUniComboBox;
    pnlYearly: TUniPanel;
    lblRecurEveryYears: TUniLabel;
    edtYears: TUniEdit;
    lblYears: TUniLabel;
    rbtnYearlyOnMonth: TUniRadioButton;
    cboxYearlyMonth: TUniComboBox;
    edtYearDayOfMonth: TUniEdit;
    rbtnYearlyOnThe: TUniRadioButton;
    cboxYearlyDayPos: TUniComboBox;
    cboxYearlyDayOfWeek: TUniComboBox;
    lblOf: TUniLabel;
    cboxYearlyMonth2: TUniComboBox;
    pnlDaily: TUniPanel;
    lblRecurEveryMonths: TUniLabel;
    procedure FormCreate(Sender: TObject);
    procedure rgRecurrenceClick(Sender: TObject);
    procedure rbtnEverySomeDaysClick(Sender: TObject);
    procedure rbtnEveryWeekdayClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure rbtnMonthlyDayClick(Sender: TObject);
    procedure rbtnMonthlyTheClick(Sender: TObject);
    procedure rbtnYearlyOnMonthClick(Sender: TObject);
    procedure rbtnYearlyOnTheClick(Sender: TObject);
  private
    { Private declarations }
    FRS: TRepeatingReleases;
    errMsg: string;

    procedure ConvertRecord2Form;
    function  ConvertForm2Record : boolean;
  public
    { Public declarations }

    class function DoShowModal(var rs: TRepeatingReleases): boolean;

    property RepReleases : TRepeatingReleases read FRS;
  end;


implementation

uses
  IQMS.Common.Controls,
  IQMS.Common.Dialogs,
  System.DateUtils;

resourcestring
  cTXT0000001 = 'Days to recur must be greater than zero';
  cTXT0000002 = 'Weeks to recur must be greater than zero';
  cTXT0000003 = 'No days selected for weekly recurring interval';
  cTXT0000004 = 'Day of the month must be between 1 and 31';
  cTXT0000005 = 'Months to recur must be greater than zero';
  cTXT0000006 = 'Years to recur must be greater than zero';
  cTXT0000007 = 'Day of the month must be between 1 and %d';

{$R *.dfm}

procedure TFrmRepeatingReleases.FormCreate(Sender: TObject);
begin
  AdjustPageControlToParent(pc);
end;

class function TFrmRepeatingReleases.DoShowModal(var rs: TRepeatingReleases): boolean;
var
  FrmRepeatingReleases: TFrmRepeatingReleases;
begin
  FrmRepeatingReleases:=TFrmRepeatingReleases.Create(uniGUIApplication.UniApplication);
  with FrmRepeatingReleases do
  begin
    FRS := rs;
    ConvertRecord2Form;
    Result := ShowModal = mrOK;
    if Result then
      rs := FRS;
  end;
end;

procedure TFrmRepeatingReleases.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := (ModalResult = mrCancel) or ConvertForm2Record;

  if not CanClose then
    IQError(errMsg);
end;

function TRepeatingReleases.GetReleaseType: string;
begin
  case recType of
    rtDaily:
      begin
        // Default is every 7 days, but we can show something similar to
        // the previous version by showing the days
        if dailyOption = doEverySomeDays then
          result := IntToStr( dailyEveryDays )
        else
          result := 'Daily';
      end;
    rtWeekly:   result := 'Weekly';
    rtMonthly:  result := 'Monthly';
    rtYearly:   result := 'Yearly';
  end;
end;

function TRepeatingReleases.GetReleases(ADate: TDateTime; ACount: integer): TReleases;
var
  l : TReleases;
  startDate: TDateTime;

  function OurDayOfTheWeek(ADate: TDateTime): integer;
  var
    delphiDayOfTheWeek: integer;
  begin
    // Delphi uses Sunday = 7
    delphiDayOfTheWeek := DayOfTheWeek(ADate);

    // We need Sunday = 0
    if delphiDayOfTheWeek = 7 then
      result := 0
    else
      result := delphiDayOfTheWeek;
  end;

  procedure GenDailyReleasesEverySomeDays(days: integer);
  begin
    while ACount > 0 do
      begin
        if ADate >= startDate then
          begin
            l.Add(ADate);
            Dec(ACount);
          end;

        ADate := ADate + days;
      end;
  end;

  procedure GenDailyReleasesEveryWeekday;
  var
    dayOfWeek: integer;
  begin
    while ACount > 0 do
      begin
        dayOfWeek := OurDayOfTheWeek(ADate);

        if (dayOfWeek in [1..5]) and (ADate >= startDate) then
          begin
            l.Add(ADate);
            Dec(ACount);
          end;

        ADate := ADate + 1;
      end;
  end;

  procedure GenWeeklyReleases(weeks: integer; onDays: TDaysSelection);
  var
    dayOfWeek: integer;
    startOfWeek: TDateTime;
  begin
    // Day of week for the provided start date (ADate) - Sunday will be zero
    dayOfWeek := OurDayOfTheWeek(ADate);

    // Day of week for counting the weeks (Sunday of the first week)
    startOfWeek := ADate - dayOfWeek;

    while ACount > 0 do
      begin
        if (TDayOfTheWeek(dayOfWeek) in onDays) and (startOfWeek + dayOfWeek >= startDate) then
          begin
            // Day was selected
            l.Add(startOfWeek + dayOfWeek);
            Dec(ACount);
          end;

        dayOfWeek := (dayOfWeek + 1) mod 7;

        if dayOfWeek = 0 then
          begin
            // Calculate Sunday of next week
            startOfWeek := startOfWeek + 7 * weeks;
          end;
      end;
  end;

  procedure GenMonthlyReleasesEverySomeMonths(day, everyMonths: integer);
  var
    dayOfTheMonth: TDateTime;
  begin
    // Day of current month, ready to be increased by everyMonths
    dayOfTheMonth := ADate - DayOf(ADate) + day;

    while ACount > 0 do
      begin
        if dayOfTheMonth >= startDate then
          begin
            l.Add(dayOfTheMonth);
            Dec(ACount);
          end;

        dayOfTheMonth := IncMonth(dayOfTheMonth, everyMonths);
      end;
  end;

  procedure GenMonthlyReleasesTheDayPosDayOfWeekEverySomeMonths(
    dayPos       : TMonthlyDayPos;
    dayOfWeek    : TDayOfTheWeek;
    everyMonths  : integer);
  var
    firstDayOfTheMonth: TDateTime;
    lastDayOfTheMonth: TDateTime;
    reqDay: integer;
    calcDay: TDateTime;
    dayOfWeekDiff: integer;
  begin
    // Day of current month, ready to be increased by everyMonths
    firstDayOfTheMonth := ADate - DayOf(ADate) + 1;
    lastDayOfTheMonth  := EndOfAMonth(YearOf(firstDayOfTheMonth), MonthOf(firstDayOfTheMonth));

    while ACount > 0 do
      begin
        if dayPos = mdLast then
          begin
            calcDay := lastDayOfTheMonth;

            reqDay := OurDayOfTheWeek(lastDayOfTheMonth);

            // Adjust the day to be dayOfWeek
            dayOfWeekDiff := ord(dayOfWeek) - reqDay;
            if dayOfWeekDiff > 0 then
              calcDay := calcDay - 7;
            calcDay := calcDay + dayOfWeekDiff;
          end
        else
          begin
            calcDay := firstDayOfTheMonth;

            // Locate the first dayOfWeek from firstDayOfTheMonth (zero-based)
            reqDay := OurDayOfTheWeek(firstDayOfTheMonth);

            // Adjust the day to be dayOfWeek
            dayOfWeekDiff := ord(dayOfWeek) - reqDay;
            if dayOfWeekDiff < 0 then
              calcDay := calcDay + 7;
            calcDay := calcDay + dayOfWeekDiff;

            // Use dayPos (first, second, third, fourth) to calculate the day
            calcDay := calcDay + ord(dayPos) * 7;
          end;

        ADate := calcDay;

        if ADate >= startDate then
        begin
          l.Add(ADate);
          Dec(ACount);
        end;

        firstDayOfTheMonth := IncMonth(firstDayOfTheMonth, everyMonths);
        lastDayOfTheMonth  := EndOfAMonth(YearOf(firstDayOfTheMonth), MonthOf(firstDayOfTheMonth));
      end;
  end;

  procedure GenYearlyReleasesEverySomeYears(month, day, everyYears: integer);
  var
    dayOfTheYear: TDateTime;
  begin
    dayOfTheYear := EncodeDate(YearOf(ADate), month, day);

    while ACount > 0 do
      begin
        if dayOfTheYear >= startDate then
          begin
            l.Add(dayOfTheYear);
            Dec(ACount);
          end;

        dayOfTheYear := IncYear(dayOfTheYear, everyYears);
      end;
  end;

  procedure GenYearlyReleasesTheDayPosDayOfWeekEverySomeYears(
    dayPos       : TMonthlyDayPos;
    dayOfWeek    : TDayOfTheWeek;
    month        : integer;
    everyYears   : integer);
  var
    firstDayOfTheMonth: TDateTime;
    lastDayOfTheMonth: TDateTime;
    reqDay: integer;
    calcDay: TDateTime;
    dayOfWeekDiff: integer;
  begin
    // first day of requested month, ready to be increased by everyYears
    firstDayOfTheMonth := EncodeDate(YearOf(ADate), month, 1);
    lastDayOfTheMonth  := EndOfAMonth(YearOf(firstDayOfTheMonth), month);

    while ACount > 0 do
      begin
        if dayPos = mdLast then
          begin
            calcDay := lastDayOfTheMonth;

            reqDay := OurDayOfTheWeek(lastDayOfTheMonth);

            // Adjust the day to be dayOfWeek
            dayOfWeekDiff := ord(dayOfWeek) - reqDay;
            if dayOfWeekDiff > 0 then
              calcDay := calcDay - 7;
            calcDay := calcDay - dayOfWeekDiff;
          end
        else
          begin
            calcDay := firstDayOfTheMonth;

            // Locate the first dayOfWeek from firstDayOfTheMonth (zero-based)
            reqDay := OurDayOfTheWeek(firstDayOfTheMonth);

            // Adjust the day to be dayOfWeek
            dayOfWeekDiff := ord(dayOfWeek) - reqDay;
            if dayOfWeekDiff < 0 then
              calcDay := calcDay + 7;
            calcDay := calcDay + dayOfWeekDiff;

            // Use dayPos (first, second, third, fourth) to calculate the day
            calcDay := calcDay + ord(dayPos) * 7;
          end;

        ADate := calcDay;

        if ADate >= startDate then
        begin
          l.Add(ADate);
          Dec(ACount);
        end;

        firstDayOfTheMonth := IncYear(firstDayOfTheMonth, everyYears);
        lastDayOfTheMonth  := EndOfAMonth(YearOf(firstDayOfTheMonth), month);
      end;
  end;

begin
  startDate := ADate;

  l := TReleases.Create;
  try
    if ACount = 0 then
      Exit;

    case recType of
      rtOld:
        begin
          GenDailyReleasesEverySomeDays(oldInterval);
        end;
      rtDaily:
        begin
          if dailyOption = doEverySomeDays then
            GenDailyReleasesEverySomeDays(dailyEveryDays)
          else
            GenDailyReleasesEveryWeekday;
        end;
      rtWeekly:
        begin
          GenWeeklyReleases(weeklyEveryWeeks, weeklyEveryDays);
        end;
      rtMonthly:
        begin
          if monthlyOption = moDayEverySomeMonths then
            GenMonthlyReleasesEverySomeMonths(monthlyDay, monthlyEveryMonths)
          else
            GenMonthlyReleasesTheDayPosDayOfWeekEverySomeMonths(
              monthlyDayPos,
              monthlyDayOfWeek,
              monthlyEveryMonths);
        end;
      rtYearly:
        begin
          if yearlyOption = yoOnSomeMonthDay then
            GenYearlyReleasesEverySomeYears(yearlyMonth, yearlyDay, yearlyEveryYears)
          else
            GenYearlyReleasesTheDayPosDayOfWeekEverySomeYears(
              yearlyDayPos,
              yearlyDayOfWeek,
              yearlyMonth,
              yearlyEveryYears);
        end;
    end;
  finally
    result := l;
  end;
end;

procedure TFrmRepeatingReleases.ConvertRecord2Form;
begin
  case FRS.recType of
    rtOld:
      begin
        rgRecurrence.ItemIndex := 0;
        pc.ActivePage := tsDaily;

        rbtnEverySomeDays.Checked := true;
        rbtnEveryWeekday.Checked  := false;
        edtDays.Text := IntToStr(FRS.oldInterval);
      end;
    rtDaily:
      begin
        rgRecurrence.ItemIndex := 0;
        pc.ActivePage := tsDaily;

        if FRS.dailyOption = doEverySomeDays then
          begin
            rbtnEverySomeDays.Checked := true;
            rbtnEveryWeekday.Checked  := false;
            edtDays.Text := IntToStr(FRS.dailyEveryDays);
          end
        else
          begin
            rbtnEverySomeDays.Checked := false;
            rbtnEveryWeekday.Checked  := true;
          end;
      end;
    rtWeekly:
      begin
        rgRecurrence.ItemIndex := 1;
        pc.ActivePage := tsWeekly;

        edtWeeks.Text := IntToStr(FRS.weeklyEveryWeeks);

        cboxSunday.Checked    := dSunday    in FRS.weeklyEveryDays;
        cboxMonday.Checked    := dMonday    in FRS.weeklyEveryDays;
        cboxTuesday.Checked   := dTuesday   in FRS.weeklyEveryDays;
        cboxWednesday.Checked := dWednesday in FRS.weeklyEveryDays;
        cboxThursday.Checked  := dThursday  in FRS.weeklyEveryDays;
        cboxFriday.Checked    := dFriday    in FRS.weeklyEveryDays;
        cboxSaturday.Checked  := dSaturday  in FRS.weeklyEveryDays;
      end;
    rtMonthly:
      begin
        rgRecurrence.ItemIndex := 2;
        pc.ActivePage := tsMonthly;

        edtMonthlyEveryMonths.Text := IntToStr(FRS.monthlyEveryMonths);

        if FRS.monthlyOption = moDayEverySomeMonths then
          begin
            rbtnMonthlyDay.Checked := true;
            rbtnMonthlyThe.Checked := false;

            edtMonthlyDay.Text := IntToStr(FRS.monthlyDay);
          end
        else
          begin
            rbtnMonthlyDay.Checked := false;
            rbtnMonthlyThe.Checked := true;

            cboxMonthlyDayPos.ItemIndex     := ord(FRS.monthlyDayPos);
            cboxMonthlyDayOfWeek.ItemIndex  := ord(FRS.monthlyDayOfWeek);
           end;
      end;
    rtYearly:
      begin
        rgRecurrence.ItemIndex := 3;
        pc.ActivePage := tsYearly;

        edtYears.Text := IntToStr(FRS.yearlyEveryYears);

        if FRS.yearlyOption = yoOnSomeMonthDay then
          begin
            rbtnYearlyOnMonth.Checked := true;
            rbtnYearlyOnThe.Checked   := false;

            cboxYearlyMonth.ItemIndex := FRS.yearlyMonth - 1;
            edtYearDayOfMonth.Text    := IntToStr(FRS.yearlyDay);
          end
        else
          begin
            rbtnYearlyOnMonth.Checked := false;
            rbtnYearlyOnThe.Checked   := true;

            cboxYearlyDayPos.ItemIndex    := ord(FRS.yearlyDayPos);
            cboxYearlyDayOfWeek.ItemIndex := ord(FRS.yearlyDayOfWeek);
            cboxYearlyMonth2.ItemIndex    := FRS.yearlyMonth - 1;
          end;
      end;
  end;
end;

function TFrmRepeatingReleases.ConvertForm2Record : boolean;

  function MonthLastDay(AMonth : integer) : integer;
  begin
    case AMonth of
      2 : result := 28;
      1, 3, 5, 7, 8, 10, 12 : result := 31;
      else
        result := 30;
    end;
  end;

var
  lastValidDay: integer;
begin
  result := true;

  case rgRecurrence.ItemIndex of
    0: // Daily
      begin
        FRS.recType := rtDaily;

        if rbtnEverySomeDays.Checked then
          begin
            FRS.dailyOption   := doEverySomeDays;

            FRS.dailyEveryDays := StrToInt(edtDays.Text);
            result := FRS.dailyEveryDays > 0;
            if not result then
              begin
                errMsg := cTXT0000001;
                edtDays.SetFocus;
              end;
          end
        else
          FRS.dailyOption := doEveryWeekday;
      end;
    1: // Weekly
      begin
        FRS.recType := rtWeekly;

        FRS.weeklyEveryWeeks := StrToInt(edtWeeks.Text);
        result := FRS.weeklyEveryWeeks > 0;
        if not result then
          begin
            errMsg := cTXT0000002;
            edtWeeks.SetFocus;
            Exit;
          end;

        FRS.weeklyEveryDays := [];

        if cboxSunday.Checked then
          Include(FRS.weeklyEveryDays, dSunday);
        if cboxMonday.Checked then
          Include(FRS.weeklyEveryDays, dMonday);
        if cboxTuesday.Checked then
          Include(FRS.weeklyEveryDays, dTuesday);
        if cboxWednesday.Checked then
          Include(FRS.weeklyEveryDays, dWednesday);
        if cboxThursday.Checked then
          Include(FRS.weeklyEveryDays, dThursday);
        if cboxFriday.Checked then
          Include(FRS.weeklyEveryDays, dFriday);
        if cboxSaturday.Checked then
          Include(FRS.weeklyEveryDays, dSaturday);

        result := FRS.weeklyEveryDays <> [];
        if not result then
        begin
          errMsg := cTXT0000003;
          cboxSunday.SetFocus;
        end;
      end;
    2: // Monthly
      begin
        FRS.recType := rtMonthly;

        FRS.monthlyEveryMonths  := StrToInt(edtMonthlyEveryMonths.Text);
        result := FRS.monthlyEveryMonths > 0;
        if not result then
          begin
            errMsg := cTXT0000005;
            edtMonthlyEveryMonths.SetFocus;
            Exit;
          end;

        if rbtnMonthlyDay.Checked then
          begin
            FRS.monthlyOption := moDayEverySomeMonths;

            FRS.monthlyDay        := StrToInt(edtMonthlyDay.Text);
            result := FRS.monthlyDay in [1..31];
            if not result then
              begin
                errMsg := cTXT0000004;
                edtMonthlyDay.SetFocus;
                Exit;
              end;
          end
        else
          begin
            FRS.monthlyOption := moDayPosWeekdayEverySomeMonths;

            FRS.monthlyDayPos     := TMonthlyDayPos(cboxMonthlyDayPos.ItemIndex);
            FRS.monthlyDayOfWeek  := TDayOfTheWeek(cboxMonthlyDayOfWeek.ItemIndex);
          end;
      end;
    3: // Yearly
      begin
        FRS.recType := rtYearly;

        FRS.yearlyEveryYears := StrToInt(edtYears.Text);
        result := FRS.yearlyEveryYears > 0;
        if not result then
          begin
            errMsg := cTXT0000006;
            edtYears.SetFocus;
            Exit;
          end;

        if rbtnYearlyOnMonth.Checked then
          begin
            FRS.yearlyOption        := yoOnSomeMonthDay;

            FRS.yearlyMonth         := cboxYearlyMonth.ItemIndex + 1;
            FRS.yearlyDay           := StrToInt(edtYearDayOfMonth.Text);

            lastValidDay := MonthLastDay(FRS.yearlyMonth);
            result := FRS.yearlyDay in [1..lastValidDay];
            if not result then
              begin
                errMsg := Format(cTXT0000007, [lastValidDay]);
                edtYearDayOfMonth.SetFocus;
              end;
          end
        else
          begin
            FRS.yearlyOption        := yoDayPosWeekdayOfSomeMonth;

            FRS.yearlyDayPos        := TMonthlyDayPos(cboxYearlyDayPos.ItemIndex);
            FRS.yearlyDayOfWeek     := TDayOfTheWeek(cboxYearlyDayOfWeek.ItemIndex);
            FRS.yearlyMonth         := cboxYearlyMonth2.ItemIndex + 1;
          end;
      end;
  end;
end;

procedure TFrmRepeatingReleases.rbtnEverySomeDaysClick(Sender: TObject);
begin
  rbtnEveryWeekday.Checked := not rbtnEverySomeDays.Checked;
end;

procedure TFrmRepeatingReleases.rbtnEveryWeekdayClick(Sender: TObject);
begin
  rbtnEverySomeDays.Checked := not rbtnEveryWeekday.Checked;
end;

procedure TFrmRepeatingReleases.rbtnMonthlyDayClick(Sender: TObject);
begin
  rbtnMonthlyThe.Checked := not rbtnMonthlyDay.Checked;
end;

procedure TFrmRepeatingReleases.rbtnMonthlyTheClick(Sender: TObject);
begin
  rbtnMonthlyDay.Checked := not rbtnMonthlyThe.Checked;
end;

procedure TFrmRepeatingReleases.rbtnYearlyOnMonthClick(Sender: TObject);
begin
  rbtnYearlyOnThe.Checked := not rbtnYearlyOnMonth.Checked;
end;

procedure TFrmRepeatingReleases.rbtnYearlyOnTheClick(Sender: TObject);
begin
  rbtnYearlyOnMonth.Checked := not rbtnYearlyOnThe.Checked;
end;

procedure TFrmRepeatingReleases.rgRecurrenceClick(Sender: TObject);
begin
  pc.ActivePageIndex := rgRecurrence.ItemIndex;
end;

end.

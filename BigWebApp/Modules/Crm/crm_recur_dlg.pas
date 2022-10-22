unit crm_recur_dlg;

{ ** Recurrence Dialog **

  This allows user to edit recurrence settings.  Do not call this directly.
  Please use the TRecurrence object declared in crm_recurrence.

}
interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  System.DateUtils,
  System.Math,
  IQMS.WebVcl.DateControls,
  crm_recur_types,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniRadioButton,
  uniButton,
  uniBitBtn,
  uniEdit,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniDateTimePicker,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel,
  uniPageControl;

type
  TFrmCRMRecurrence = class(TUniForm)
    PnlAppointment: TUniPanel;
    PnlPattern: TUniPanel;
    PnlRange: TUniPanel;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    gbAppointment: TUniGroupBox;
    gbPattern: TUniGroupBox;
    gbRange: TUniGroupBox;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    btnRemove: TUniBitBtn;
    lblStartTime: TUniLabel;
    lblEndTime: TUniLabel;
    PnlPatternClient1: TUniPanel;
    PnlPatternOption: TUniPanel;
    bvPatternOption: TUniPanel;
    rbDaily: TUniRadioButton;
    rbWeekly: TUniRadioButton;
    rbMonthly: TUniRadioButton;
    rbYearly: TUniRadioButton;
    PnlPatternPageCarrier: TUniPanel;
    pcPattern: TUniPageControl;
    TabPatternDaily: TUniTabSheet;
    TabPatternWeekly: TUniTabSheet;
    TabPatternMonthly: TUniTabSheet;
    TabPatternYearly: TUniTabSheet;
    lblStartDate: TUniLabel;
    cmbStartDate: TUniDateTimePicker;
    rbRangeEndAfter: TUniRadioButton;
    edtEndAfterCount: TUniEdit;
    Label7: TUniLabel;
    rbRangeEndBy: TUniRadioButton;
    cmbEndByDate: TUniDateTimePicker;
    lblDuration: TUniLabel;
    cmbStartTime: TIQWebTimeComboBox;
    cmbEndTime: TIQWebTimeComboBox;
    cmbDuration: TIQWebDurationComboBox;
    chkAllDay: TUniCheckBox;
    lblAllDayMsg: TUniLabel;
    Panel1: TUniPanel;
    rbEveryXDay: TUniRadioButton;
    edtEveryXDay: TUniEdit;
    lblEveryXDay: TUniLabel;
    rbPatternDailyEveryWeekday: TUniRadioButton;
    PnlWeekly: TUniPanel;
    lblRecurPatternWeekly: TUniLabel;
    edtRecurEveryXWeek: TUniEdit;
    Label1: TUniLabel;
    chkSunday: TUniCheckBox;
    chkThursday: TUniCheckBox;
    chkMonday: TUniCheckBox;
    chkFriday: TUniCheckBox;
    chkTuesday: TUniCheckBox;
    chkSaturday: TUniCheckBox;
    chkWednesday: TUniCheckBox;
    Panel3: TUniPanel;
    rbPatternMonthlyDayXOf1: TUniRadioButton;
    edtPatternMonthlyDayXOf: TUniEdit;
    Label2: TUniLabel;
    edtPatternMonthlyEveryXMonth1: TUniEdit;
    Label3: TUniLabel;
    rbPatternMonthlyDayXOf2: TUniRadioButton;
    cmbPatternMonthlyCount: TUniComboBox;
    cmbPatternMonthlyDay: TUniComboBox;
    Label4: TUniLabel;
    edtPatternMonthlyEveryXMonth2: TUniEdit;
    Label5: TUniLabel;
    Panel4: TUniPanel;
    rbPatternYearlyEvery: TUniRadioButton;
    cmbPatternYearlyMonth1: TUniComboBox;
    edtPatternYearlyMonthDay: TUniEdit;
    rbPatternYearlyInterval: TUniRadioButton;
    cmbPatternYearlyCount: TUniComboBox;
    cmbPatternYearlyDay: TUniComboBox;
    Label6: TUniLabel;
    cmbPatternYearlyMonth2: TUniComboBox;
    procedure DoPatternChoiceRadioBtnClick(Sender: TObject);
    procedure DoEditBoxExit(Sender: TObject);
    procedure DoEditChange_Day(Sender: TObject);
    procedure DoEditChange_Month1(Sender: TObject);
    procedure DoEditChange_Month2(Sender: TObject);
    procedure DoEditChange_Year1(Sender: TObject);
    procedure DoEditChange_Year2(Sender: TObject);
    procedure DoEditChange_Range1(Sender: TObject);
    procedure DoEditChange_Range2(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure DoDurationChange(Sender: TObject);
    procedure DoApptTimeChange(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edtPatternYearlyMonthDayExit(Sender: TObject);
    procedure edtPatternMonthlyDayXOfExit(Sender: TObject);
    procedure chkAllDayClick(Sender: TObject);
  private
    { Private declarations }
    FRecurrenceRec: TRecurrenceRec;

    procedure SaveSelection;
    procedure ApplySelection;

    procedure ValidateOptions;

    procedure Validate_DailyPattern;
    procedure Validate_WeekPattern;
    procedure Validate_MonthlyPattern;
    procedure Validate_YearlyPattern;

    procedure ForceValue(AEditBox: TUniEdit; AText: String); overload;
    procedure ForceValue(ADateTimePicker: TUniDateTimePicker;
      ADate: TDateTime); overload;

    procedure AdjustDates;
    procedure AdjustDuration;

    procedure UpdateComboBox_MonthNames(AComboBox: TUniComboBox);
    procedure UpdateComboBox_DayNames(AComboBox: TUniComboBox);
    procedure CheckValueFor_PatternYearlyMonthDay;
    procedure UpdateApptTimeControls;

  public
    { Public declarations }
    RemoveRecurrence: Boolean;

    //constructor Create(AOwner: TComponent);

    procedure CopyAndApplyOptions(Rec: TRecurrenceRec);
    procedure SaveAndCopyOptions(var Rec: TRecurrenceRec);
  end;

function DoCRMRecurrence( var ARec: TRecurrenceRec ): Boolean;


implementation

{$R *.dfm}


uses
  crm_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.Dates,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Numbers;

function DoCRMRecurrence( var ARec: TRecurrenceRec ): Boolean;
var
  FrmCRMRecurrence: TFrmCRMRecurrence;
begin
  FrmCRMRecurrence := TFrmCRMRecurrence.Create(uniGUIApplication.UniApplication);

  with FrmCRMRecurrence do
  begin
    //Controls
    IQMS.Common.Controls.AdjustPageControlToParent(pcPattern);

    // Default data
    cmbStartTime.Time := IQMS.Common.Dates.TIME_800;
    cmbEndTime.Time := IQMS.Common.Dates.TIME_1700;
    cmbDuration.Duration := 1;
    chkAllDay.Checked := TRUE;

    // Data
    UpdateComboBox_MonthNames(cmbPatternYearlyMonth1);
    UpdateComboBox_MonthNames(cmbPatternYearlyMonth2);
    UpdateComboBox_DayNames(cmbPatternMonthlyDay);
    UpdateComboBox_DayNames(cmbPatternYearlyDay);

    // Form
    //IQMS.Common.Controls.CenterForm(FrmCRMRecurrence);

    CopyAndApplyOptions(ARec);
    Result := ShowModal = mrOk;
    if Result then
       SaveAndCopyOptions(ARec);
  end;
end;

procedure TFrmCRMRecurrence.DoPatternChoiceRadioBtnClick(Sender: TObject);
begin
  // Handles RadioButton click for Recurrence Pattern
  if (TComponent(Sender) is TUniRadioButton) then
    // Select tab sheet
    pcPattern.ActivePageIndex := TUniRadioButton(Sender).Tag;
end;

procedure TFrmCRMRecurrence.DoEditBoxExit(Sender: TObject);
begin
  // Ensures the value of the edit box is an integer
  FormatEditTextAsInteger(TUniEdit(Sender));
end;

{ ---------------------------------------------------------------------------- }
{ **                       Apply Previous Values                            ** }
{ ---------------------------------------------------------------------------- }

procedure TFrmCRMRecurrence.ApplySelection;
// ---------------------------------------------------------------------------
  procedure _CheckVal(AVal: String; ACheckBox: TUniCheckBox);
  begin
    ACheckBox.Checked := Pos(AVal, FRecurrenceRec.Days) > 0;
    // if (FRecurrenceRec.Days and AVal) = AVal then ACheckBox.Checked := TRUE
    // else ACheckBox.Checked := FALSE;
  end;
// ---------------------------------------------------------------------------
  procedure _ApplyDateToControl(DateTimePicker: TUniDateTimePicker; Value: TDate;
    AMinDate: TDate);
  begin
    if (Value < AMinDate) then
      Value := AMinDate;
    ForceValue(DateTimePicker, Value);
  end;
// ---------------------------------------------------------------------------
  procedure _ApplyTimeToControl(TimeComboBox: TIQWebTimeComboBox; Value: TTime;
    ADefault: TTime = IQMS.Common.Dates.TIME_800);
  begin
    if Frac(Value) < 0 then
      Value := ADefault;
    TimeComboBox.Time := Value;
  end;
// ---------------------------------------------------------------------------
  procedure _ApplyItemIndexControl(AComboBox: TUniComboBox; AItemIndex: Integer);
  begin
    if (AItemIndex >= 0) and (AItemIndex < AComboBox.Items.Count) then
      AComboBox.ItemIndex := AItemIndex;
  end;

// ---------------------------------------------------------------------------
begin

  // Appointment Time
  _ApplyTimeToControl(cmbStartTime, FRecurrenceRec.ApptStart, IQMS.Common.Dates.TIME_800);
  _ApplyTimeToControl(cmbEndTime, FRecurrenceRec.ApptEnd, IQMS.Common.Dates.TIME_1700);

  if (FRecurrenceRec.ApptDur = 0) and FRecurrenceRec.AllDay then
    FRecurrenceRec.ApptDur := 1
  else if (FRecurrenceRec.ApptDur = 0) and not FRecurrenceRec.AllDay then
    FRecurrenceRec.ApptDur := IQMS.Common.Dates.TIME_OneMinute * 5;
  cmbDuration.Duration := FRecurrenceRec.ApptDur;
  chkAllDay.Checked := FRecurrenceRec.AllDay;

  // 01/04/2009 Ensure the current date is applied to the Vcl.Controls.
  // This can be overwritten below by saved settings.
  // Reported by Tina.
  _ApplyItemIndexControl(cmbPatternYearlyMonth1,
    System.DateUtils.MonthOf(FRecurrenceRec.RecurStart) - 1);
  _ApplyItemIndexControl(cmbPatternYearlyMonth2,
    cmbPatternYearlyMonth1.ItemIndex);
  _ApplyItemIndexControl(cmbPatternMonthlyDay,
    System.DateUtils.DayOfTheWeek(FRecurrenceRec.RecurStart) + 3);
  _ApplyItemIndexControl(cmbPatternYearlyDay, cmbPatternMonthlyDay.ItemIndex);
  edtPatternYearlyMonthDay.Text :=
    IntToStr(System.DateUtils.DayOfTheMonth(FRecurrenceRec.RecurStart));
  edtPatternMonthlyDayXOf.Text := edtPatternYearlyMonthDay.Text;

  // Range of Recurrence
  // Set the minimum date for the start date; this is essential.  We always look
  // forward; never backward.  Recurrence for all past, recurrent events will be
  // cleared; that is, the link is cleared.  The reason is, we don't mess with
  // history.
  cmbStartDate.MinDate := Trunc(IQMS.Common.Dates.IQOracleAdjustedDate);

  // 05/25/2007 Must be called after setting duration control values
  UpdateApptTimeControls;

  // Apply dates
  _ApplyDateToControl(cmbStartDate, FRecurrenceRec.RecurStart,
    IQMS.Common.Dates.IQOracleAdjustedDate);
  _ApplyDateToControl(cmbEndByDate, FRecurrenceRec.RecurEnd,
    cmbStartDate.Datetime + 1);
  if FRecurrenceRec.EndAfterCount > 0 then
    edtEndAfterCount.Text := IntToStr(FRecurrenceRec.EndAfterCount);
  rbRangeEndAfter.Checked := FRecurrenceRec.EndAfterCount > 0;
  rbRangeEndBy.Checked := FRecurrenceRec.EndAfterCount <= 0;

  // Recurrence Pattern
  rbDaily.Checked := FRecurrenceRec.Pattern = rpDaily;
  rbWeekly.Checked := FRecurrenceRec.Pattern = rpWeekly;
  rbMonthly.Checked := FRecurrenceRec.Pattern = rpMonthly;
  rbYearly.Checked := FRecurrenceRec.Pattern = rpYearly;

  // Recurrence Pattern options
  case FRecurrenceRec.Pattern of
    rpDaily:
      begin
        rbEveryXDay.Checked := FRecurrenceRec.Rule = rcByDay;
        rbPatternDailyEveryWeekday.Checked := not rbEveryXDay.Checked;
        edtEveryXDay.Text := IQMS.Common.Numbers.sIIf(FRecurrenceRec.Rule = rcByDay,
          IntToStr(FRecurrenceRec.Interval), '1');
      end;
    rpWeekly:
      begin
        edtRecurEveryXWeek.Text := IntToStr(FRecurrenceRec.Interval);

        _CheckVal('1', chkSunday); // iqfile
        _CheckVal('2', chkMonday);
        _CheckVal('3', chkTuesday);
        _CheckVal('4', chkWednesday);
        _CheckVal('5', chkThursday);
        _CheckVal('6', chkFriday);
        _CheckVal('7', chkSaturday);

      end;
    rpMonthly:
      begin
        rbPatternMonthlyDayXOf1.Checked := FRecurrenceRec.Rule = rcByDay;
        rbPatternMonthlyDayXOf2.Checked := not rbPatternMonthlyDayXOf1.Checked;

        case FRecurrenceRec.Rule of
          rcByDay:
            begin
              // X of every ...
              edtPatternMonthlyDayXOf.Text := FRecurrenceRec.Days;
              // X month
              edtPatternMonthlyEveryXMonth1.Text :=
                IntToStr(FRecurrenceRec.Interval);
            end;
          rcByPosition:
            begin
              // Occurrance
              _ApplyItemIndexControl(cmbPatternMonthlyCount,
                FRecurrenceRec.Occur);
              // WeekDay
              _ApplyItemIndexControl(cmbPatternMonthlyDay,
                StrToInt(FRecurrenceRec.Days));
              // X month
              edtPatternMonthlyEveryXMonth2.Text :=
                IntToStr(FRecurrenceRec.Interval);
            end;
        end; // end case

      end;
    rpYearly:
      begin
        rbPatternYearlyEvery.Checked := FRecurrenceRec.Rule = rcByMonth;
        rbPatternYearlyInterval.Checked := not rbPatternYearlyEvery.Checked;

        case FRecurrenceRec.Rule of
          rcByMonth:
            begin
              // X of every ...
              _ApplyItemIndexControl(cmbPatternYearlyMonth1,
                FRecurrenceRec.Occur - 1);
              // X month
              edtPatternYearlyMonthDay.Text :=
                IntToStr(FRecurrenceRec.Interval);
            end;
          rcByPosition:
            begin
              // Occurrance
              _ApplyItemIndexControl(cmbPatternYearlyCount,
                FRecurrenceRec.Occur);
              // WeekDay
              _ApplyItemIndexControl(cmbPatternYearlyDay,
                StrToInt(FRecurrenceRec.Days));
              // X month
              _ApplyItemIndexControl(cmbPatternYearlyMonth2,
                FRecurrenceRec.Interval - 1);
            end;
        end; // end case

      end;
  end; // end case
end;

{ ---------------------------------------------------------------------------- }
{ **                        Save Current Options                            ** }
{ ---------------------------------------------------------------------------- }

procedure TFrmCRMRecurrence.SaveSelection;
// --------------------------------------------------------------------------
  function _GetIntFromEditBox(AEditBox: TUniEdit): Integer;
  var
    AValue: Integer;
  begin
    if not IQMS.Common.Numbers.IsStringValidInteger(AEditBox.Text, AValue) then
      begin
        AValue := 1;
        AEditBox.Text := '1';
      end;
    Result := AValue;
  end;
// --------------------------------------------------------------------------
  function _GetIntAsStrFromEditBox(AEditBox: TUniEdit): String;
  var
    AValue: Integer;
  begin
    if not IQMS.Common.Numbers.IsStringValidInteger(AEditBox.Text, AValue) then
      begin
        AValue := 1;
        AEditBox.Text := '1';
      end;
    Result := IntToStr(AValue);
  end;
// --------------------------------------------------------------------------
  function _GetItemIndexFromComboBox(AComboBox: TUniComboBox): Integer;
  var
    AValue: Integer;
  begin
    AValue := AComboBox.ItemIndex;
    if AValue = - 1 then
      AValue := 0;
    AComboBox.ItemIndex := AValue;
    Result := AValue;
  end;
// --------------------------------------------------------------------------

var
  i: Integer;
begin
  // Clear the private record
  ClearRecurrenceRec(FRecurrenceRec); // crm_recurrence.pas

  // Range of Recurrence
  FRecurrenceRec.RecurStart := Trunc(cmbStartDate.DateTime);
  FRecurrenceRec.RecurEnd := Trunc(cmbEndByDate.DateTime);

  // Appointment Time
  FRecurrenceRec.ApptDur := cmbDuration.Duration;
  FRecurrenceRec.ApptStart := Trunc(FRecurrenceRec.RecurStart) +
    Frac(cmbStartTime.Time);
  FRecurrenceRec.ApptEnd := FRecurrenceRec.ApptStart + FRecurrenceRec.ApptDur;
  FRecurrenceRec.AllDay := chkAllDay.Checked;

  // If All-Day, then clear the times
  if FRecurrenceRec.AllDay then
    begin
      FRecurrenceRec.ApptStart := 0;
      FRecurrenceRec.ApptEnd := 0;
    end;

  FRecurrenceRec.EndType := TRecurEndType(iIIf(rbRangeEndAfter.Checked,
    Ord(etCount), Ord(etDate)));
  if rbRangeEndAfter.Checked then
    FRecurrenceRec.EndAfterCount := StrToInt(edtEndAfterCount.Text)
  else
    FRecurrenceRec.EndAfterCount := - 1;

  // Recurrence Pattern
  if rbDaily.Checked then
    FRecurrenceRec.Pattern := rpDaily
  else if rbWeekly.Checked then
    FRecurrenceRec.Pattern := rpWeekly
  else if rbMonthly.Checked then
    FRecurrenceRec.Pattern := rpMonthly
  else if rbYearly.Checked then
    FRecurrenceRec.Pattern := rpYearly;

  // Recurrence Pattern options
  case FRecurrenceRec.Pattern of
    rpDaily:
      begin
        FRecurrenceRec.Rule := TRecurRule(IQMS.Common.Numbers.iIIf(rbEveryXDay.Checked,
          Ord(rcByDay), Ord(rcWeekday)));
        FRecurrenceRec.Days := ''; // no option values for Daily
        FRecurrenceRec.Interval := _GetIntFromEditBox(edtEveryXDay);
      end;
    rpWeekly:
      begin
        FRecurrenceRec.Rule := rcByDay; // default rule for Weekly
        FRecurrenceRec.Interval := _GetIntFromEditBox(edtRecurEveryXWeek);
        FRecurrenceRec.Days := '_'; // initial
        // Cycle checkboxes on this tab, and fill the AOption value toolmain
        with PnlWeekly do
          for i := 0 to ControlCount - 1 do
            if (Controls[i] is TUniCheckBox) then
              with (Controls[i] as TUniCheckBox) do
                begin
                  if Checked then
                    FRecurrenceRec.Days := FRecurrenceRec.Days +
                      IntToStr(Tag) + '_';
                end;
      end;
    rpMonthly:
      begin
        FRecurrenceRec.Rule :=
          TRecurRule(IQMS.Common.Numbers.iIIf(rbPatternMonthlyDayXOf1.Checked,
          Ord(rcByDay), Ord(rcByPosition)));
        case FRecurrenceRec.Rule of
          rcByDay:
            begin
              // X of every ...
              FRecurrenceRec.Days := _GetIntAsStrFromEditBox
                (edtPatternMonthlyDayXOf);

              // X month
              FRecurrenceRec.Interval :=
                _GetIntFromEditBox(edtPatternMonthlyEveryXMonth1);
            end;
          rcByPosition:
            begin
              // Occurrance
              FRecurrenceRec.Occur := _GetItemIndexFromComboBox
                (cmbPatternMonthlyCount);
              // WeekDay
              FRecurrenceRec.Days :=
                IntToStr(_GetItemIndexFromComboBox(cmbPatternMonthlyDay));
              // X month
              FRecurrenceRec.Interval :=
                _GetIntFromEditBox(edtPatternMonthlyEveryXMonth2);
            end;
        end; // end case
      end;
    rpYearly:
      begin
        // last second fix up
        CheckValueFor_PatternYearlyMonthDay;

        FRecurrenceRec.Rule :=
          TRecurRule(IQMS.Common.Numbers.iIIf(rbPatternYearlyEvery.Checked,
          Ord(rcByMonth), Ord(rcByPosition)));

        case FRecurrenceRec.Rule of
          rcByMonth:
            begin
              // X of every ...
              FRecurrenceRec.Occur := _GetItemIndexFromComboBox
                (cmbPatternYearlyMonth1) + 1;
              // X month
              FRecurrenceRec.Interval :=
                _GetIntFromEditBox(edtPatternYearlyMonthDay);
            end;
          rcByPosition:
            begin
              // Occurrance
              FRecurrenceRec.Occur := _GetItemIndexFromComboBox
                (cmbPatternYearlyCount);
              // WeekDay
              FRecurrenceRec.Days :=
                IntToStr(_GetItemIndexFromComboBox(cmbPatternYearlyDay));
              // X month
              FRecurrenceRec.Interval := _GetItemIndexFromComboBox
                (cmbPatternYearlyMonth2) + 1;
            end;
        end; // end case
      end;
  end; // end case

end;

{ ---------------------------------------------------------------------------- }

procedure TFrmCRMRecurrence.CopyAndApplyOptions(Rec: TRecurrenceRec);
begin
  CopyRecurrenceRec(Rec, FRecurrenceRec); // crm_recurrence.pas
  ApplySelection;
end;

procedure TFrmCRMRecurrence.SaveAndCopyOptions(var Rec: TRecurrenceRec);
begin
  SaveSelection;
  CopyRecurrenceRec(FRecurrenceRec, Rec); // crm_recurrence.pas
end;

procedure TFrmCRMRecurrence.DoEditChange_Day(Sender: TObject);
begin
  rbEveryXDay.Checked := TRUE;
end;

procedure TFrmCRMRecurrence.DoEditChange_Month1(Sender: TObject);
begin
  rbPatternMonthlyDayXOf1.Checked := TRUE;
  ForceValue(edtPatternMonthlyEveryXMonth2, edtPatternMonthlyEveryXMonth1.Text);
end;

procedure TFrmCRMRecurrence.DoEditChange_Month2(
  Sender: TObject);
begin
  rbPatternMonthlyDayXOf2.Checked := TRUE;
  ForceValue(edtPatternMonthlyEveryXMonth1, edtPatternMonthlyEveryXMonth2.Text);
end;

procedure TFrmCRMRecurrence.DoEditChange_Year1(Sender: TObject);
begin
  rbPatternYearlyEvery.Checked := TRUE;
  CheckValueFor_PatternYearlyMonthDay;
end;

procedure TFrmCRMRecurrence.DoEditChange_Year2(Sender: TObject);
begin
  rbPatternYearlyInterval.Checked := TRUE;
end;

procedure TFrmCRMRecurrence.DoEditChange_Range1(Sender: TObject);
begin
  rbRangeEndAfter.Checked := TRUE;
end;

procedure TFrmCRMRecurrence.DoEditChange_Range2(Sender: TObject);
begin
  rbRangeEndBy.Checked := TRUE;
end;

procedure TFrmCRMRecurrence.btnRemoveClick(Sender: TObject);
begin
  if IQConfirmYN(crm_rscstr.cTXT0001445 { 'Remove all recurrent items?' } ) then
    RemoveRecurrence := TRUE
  else
    ModalResult := mrNone;
end;

procedure TFrmCRMRecurrence.Validate_DailyPattern;
begin
  if (FRecurrenceRec.Rule = rcByDay) then
    begin
      if (FRecurrenceRec.Interval <= 0) then
        // 'The recurrence pattern is invalid.'
        raise Exception.Create(crm_rscstr.cTXT0001483);

      if FRecurrenceRec.Interval < FRecurrenceRec.ApptDur then
        { 'The duration of the activity must be shorter than how ' +
          'frequently it occurs.  Shorten the duration, or change the recurrence pattern.' }
        raise Exception.Create(crm_rscstr.cTXT0001500);
    end;

end;

procedure TFrmCRMRecurrence.Validate_WeekPattern;
// --------------------------------------------------------------------------
  function _HasContiguousNumbers(const ANumbers: array of Integer;
    const AInterval: Integer): Boolean;
  var
    i, x: Integer;
  begin

    if AInterval < 1 then
      Exit;

    for i := Low(ANumbers) to High(ANumbers) do
      begin

        // set last number
        if i > Low(ANumbers) then
          begin
            Result := (ANumbers[i] - x) < AInterval;
            if Result then
              BREAK;
          end;

        x := ANumbers[i];
      end;
  end;

// --------------------------------------------------------------------------
var
  i: Integer;
  D: TDateTime;
  S: String;
  ANumbers: array of Integer;
begin
  if not (FRecurrenceRec.Pattern = rpWeekly) then
    Exit;

  if FRecurrenceRec.Interval <= 0 then
    raise Exception.Create
      (crm_rscstr.
      cTXT0001567 { 'Please enter a value for weekly recurrence.' } );

  if (FRecurrenceRec.Days = '_') or
    (FRecurrenceRec.Days = '') then
    raise Exception.Create
      (crm_rscstr.cTXT0001568 { 'Please select days for weekly recurrence.' } );

  // get just a string of numbers (i.e., '1234567')
  S := StringReplace(FRecurrenceRec.Days, '_', '', [rfReplaceAll, rfIgnoreCase]
    ); // System.SysUtils

  { if _FirstSelectedDay > 0 then
    begin

    end; }

  // If our duration is greater than 1 day, then we cannot allow 1-day intervals
  if (FRecurrenceRec.ApptDur > 1) and (S > '') then
    begin
      // get an array of numbers
      SetLength(ANumbers, 0);
      for i := 1 to Length(S) do
        begin
          SetLength(ANumbers, i);
          ANumbers[i - 1] := StrToInt(S[i]);
        end;

      // check days to find contiguous numbers
      if _HasContiguousNumbers(ANumbers, Ceil(FRecurrenceRec.ApptDur)) then
        { 'The duration of the activity must be shorter than how ' +
          'frequently it occurs.  Shorten the duration, or change the recurrence pattern.' }
        raise Exception.Create(crm_rscstr.cTXT0001500);
    end;
end;

procedure TFrmCRMRecurrence.Validate_MonthlyPattern;
begin
  if not (FRecurrenceRec.Pattern = rpMonthly) then
    Exit;

  case FRecurrenceRec.Rule of
    rcByDay:
      begin
        // X of every ...
        if (FRecurrenceRec.Days = '') or (FRecurrenceRec.Days = '0') then
          raise Exception.Create
            (crm_rscstr.cTXT0001446 { 'Please enter a value for day.' } );

        // X month
        if FRecurrenceRec.Interval <= 0 then
          raise Exception.Create
            (crm_rscstr.cTXT0001447 { 'Please enter a value for month.' } );
      end;
    rcByPosition:
      begin
        // X month
        if FRecurrenceRec.Interval <= 0 then
          raise Exception.Create
            (crm_rscstr.cTXT0001447 { 'Please enter a value for month.' } );
      end;
  end; // end case

  if not (FRecurrenceRec.Interval in [1 .. 31]) then
    // 'The recurrence pattern is invalid.'
    raise Exception.Create(crm_rscstr.cTXT0001483);

  if (StrToInt(FRecurrenceRec.Days) > 28) then
    // 'Some months have fewer than %s days.  For these months, ' +
    // 'the occurrence will fall on the last day of the month.'
    IQInformation(Format(crm_rscstr.cTXT0001484, [FRecurrenceRec.Days]));

end;

procedure TFrmCRMRecurrence.Validate_YearlyPattern;
begin
  if not (FRecurrenceRec.Pattern = rpYearly) then
    Exit;

  case FRecurrenceRec.Rule of
    rcByMonth:
      begin
        // X month
        if FRecurrenceRec.Interval <= 0 then
          raise Exception.Create
            (crm_rscstr.cTXT0001446 { 'Please enter a value for day.' } );
      end;
    rcByPosition:
      begin
        // Occurrance
        if FRecurrenceRec.Occur < 0 then
          raise Exception.Create
            (crm_rscstr.
            cTXT0001448 { 'Please enter a value for occurrance.' } );
        // WeekDay
        if (FRecurrenceRec.Days = '') then
          raise Exception.Create
            (crm_rscstr.cTXT0001446 { 'Please enter a value for day.' } );
        // X month
        if FRecurrenceRec.Interval <= 0 then
          raise Exception.Create
            (crm_rscstr.cTXT0001447 { 'Please enter a value for month.' } );
      end;
  end; // end case
end;

procedure TFrmCRMRecurrence.DoDurationChange(Sender: TObject);
begin
  // ** Executes when user changes Duration value
  AdjustDates;
end;

procedure TFrmCRMRecurrence.DoApptTimeChange(Sender: TObject);
begin
  // ** Executes when the user changes the appointment start/end time
  AdjustDuration;
end;

procedure TFrmCRMRecurrence.AdjustDates;
begin
  // Adjust the new End Time
  cmbEndTime.Time := cmbStartTime.Time + cmbDuration.Duration;

  // If AllDay was checked, but the user changed it to something that
  // doesn't support AllDay, then uncheck the check box
  if chkAllDay.Checked and (Frac(cmbDuration.Duration) <> 0) then
    chkAllDay.Checked := FALSE
  else if not chkAllDay.Checked and (Frac(cmbDuration.Duration) = 0) then
    chkAllDay.Checked := TRUE
  else
    UpdateApptTimeControls;
end;

procedure TFrmCRMRecurrence.AdjustDuration;
var
  AStartDateTime, AEndDateTime: TDateTime;
begin

  // Get full date/time values
  AStartDateTime := Trunc(FRecurrenceRec.RecurStart) + cmbStartTime.Time;
  // Frac(FRecurrenceRec.ApptStart);
  AEndDateTime := Trunc(FRecurrenceRec.RecurStart) + cmbEndTime.Time;
  // FRecurrenceRec.ApptDur; //Frac(FRec.ApptEnd);

  // Check dates
  if AStartDateTime > AEndDateTime then
    Exit;

  // Now update duration
  cmbDuration.Duration := AEndDateTime - AStartDateTime;

end;

procedure TFrmCRMRecurrence.btnOkClick(Sender: TObject);
begin
  // Check the user's selections
  try
    SaveSelection;
    ValidateOptions;
  except
    on E: Exception do
      begin
        ModalResult := mrNone;
        raise;
      end;
  end;
end;

procedure TFrmCRMRecurrence.ValidateOptions;
var
  AStartDateTime, AEndDateTime: TDateTime;
  iValue: Integer;
begin
  // ** Validates the combined settings ** //

  AStartDateTime := Trunc(FRecurrenceRec.RecurStart) +
    Frac(FRecurrenceRec.ApptStart);
  AEndDateTime := AStartDateTime + FRecurrenceRec.ApptDur;

  // 02/06/2007 As part if the initial design, the recurrence must begin either
  // on today or in some future date.  Very important:  we leave all past
  // recurrence alone.  Past recurrences lose their recurrence settings so that
  // we avoid removing history.
  if Trunc(AStartDateTime) < Trunc(IQMS.Common.Dates.IQOracleAdjustedDate) then
    // 'The recurrence start date must greater than or equal to today.'
    raise Exception.Create(crm_rscstr.cTXT0001485);

  if FRecurrenceRec.ApptDur <= 0 then
    // 'The Start time must precede the End time.  Please check your time values.';
    raise Exception.Create(crm_rscstr.cTXT0000299);

  // End by date ...
  if (FRecurrenceRec.EndType = etDate) and
    (Trunc(cmbEndByDate.DateTime) <= Trunc(AStartDateTime)) then
    // 'The recurrence must end either on today or in some future date.  ' +
    // 'Please specify a valid end date.'
    raise Exception.Create(crm_rscstr.cTXT0001501);

  case FRecurrenceRec.Pattern of
    rpDaily: // Daily
      Validate_DailyPattern;
    rpWeekly: // Weekly
      Validate_WeekPattern;
    rpMonthly: // Monthly
      Validate_MonthlyPattern;
    rpYearly: // Yearly
      begin
        Validate_YearlyPattern;
      end;
  end; // end case
end;

procedure TFrmCRMRecurrence.UpdateComboBox_MonthNames(
  AComboBox: TUniComboBox);
var
  i, x, AItemIndex: Integer;
begin
  if AComboBox = NIL then
    Exit;
  AItemIndex := AComboBox.ItemIndex;
  try
    AComboBox.Items.BeginUpdate;
    AComboBox.Items.Clear;
    for i := 1 to High(FormatSettings.LongMonthNames) do
      begin
        x := AComboBox.Items.Add(FormatSettings.LongMonthNames[i]);
        if (AItemIndex = - 1) and (Trunc(FRecurrenceRec.RecurStart) > 0) and
          (i = System.DateUtils.MonthOf(FRecurrenceRec.RecurStart)) then
          AItemIndex := x;
      end;
    AComboBox.ItemIndex := AItemIndex;
  finally
    AComboBox.Items.EndUpdate;
  end;
end;

procedure TFrmCRMRecurrence.UpdateComboBox_DayNames(AComboBox: TUniComboBox);
var
  i, x, AItemIndex: Integer;
begin
  if AComboBox = NIL then
    Exit;
  AItemIndex := AComboBox.ItemIndex;
  try
    AComboBox.Items.BeginUpdate;
    AComboBox.Items.Clear;
    AComboBox.Items.Add(crm_rscstr.cTXT0001480); // 'day';
    AComboBox.Items.Add(crm_rscstr.cTXT0001481); // 'week day';
    AComboBox.Items.Add(crm_rscstr.cTXT0001482); // 'weekend day';
    for i := 1 to High(FormatSettings.LongDayNames) do
      begin
        x := AComboBox.Items.Add(FormatSettings.LongDayNames[i]);
        if (AItemIndex = - 1) and (Trunc(FRecurrenceRec.RecurStart) > 0) and
          (i = System.DateUtils.DayOfTheWeek(FRecurrenceRec.RecurStart)) then
          AItemIndex := x;
      end;
    AComboBox.ItemIndex := AItemIndex;
  finally
    AComboBox.Items.EndUpdate;
  end;
end;

procedure TFrmCRMRecurrence.edtPatternYearlyMonthDayExit(Sender: TObject);
var
  i, m: Integer;
  D: TDateTime;
begin
  DoEditBoxExit(Sender);
  // Ensure the days value does not exceed the max days in the month
  CheckValueFor_PatternYearlyMonthDay;
end;

procedure TFrmCRMRecurrence.CheckValueFor_PatternYearlyMonthDay;
var
  i, m: Integer;
  D: TDateTime;
begin
  // Ensure the days value does not exceed the max days in the month
  i := StrToInt(edtPatternYearlyMonthDay.Text);
  D := EncodeDate(YearOf(Date), cmbPatternYearlyMonth1.ItemIndex + 1, 1);
  m := System.DateUtils.DaysInMonth(D);
  if i > m then
    edtPatternYearlyMonthDay.Text := IntToStr(m);
end;

procedure TFrmCRMRecurrence.edtPatternMonthlyDayXOfExit(Sender: TObject);
var
  n: Integer;
begin
  DoEditBoxExit(Sender);
  IQMS.Common.Numbers.IsStringValidInteger(edtPatternMonthlyDayXOf.Text, n);
  if n > 31 then
    ForceValue(edtPatternMonthlyDayXOf, '31');
end;

procedure TFrmCRMRecurrence.ForceValue(AEditBox: TUniEdit; AText: String);
var
  AOnChange: TNotifyEvent;
  AOnExit: TNotifyEvent;
begin
  if Assigned(AEditBox) then
    try
      AOnChange := AEditBox.OnChange;
      AOnExit := AEditBox.OnExit;

      AEditBox.OnChange := NIL;
      AEditBox.OnExit := NIL;

      AEditBox.Text := AText;

    finally
      AEditBox.OnChange := AOnChange;
      AEditBox.OnExit := AOnExit;
    end;
end;

procedure TFrmCRMRecurrence.ForceValue(ADateTimePicker: TUniDateTimePicker;
  ADate: TDateTime);
var
  AOnChange: TNotifyEvent;
  AOnExit: TNotifyEvent;
begin
  if Assigned(ADateTimePicker) then
    try
      AOnChange := ADateTimePicker.OnChange;
      AOnExit := ADateTimePicker.OnExit;

      ADateTimePicker.OnChange := NIL;
      ADateTimePicker.OnExit := NIL;

      ADateTimePicker.DateTime := ADate;

    finally
      ADateTimePicker.OnChange := AOnChange;
      ADateTimePicker.OnExit := AOnExit;
    end;
end;

procedure TFrmCRMRecurrence.chkAllDayClick(Sender: TObject);
begin
  Application.ProcessMessages; // allow click to finish
  UpdateApptTimeControls;
end;

procedure TFrmCRMRecurrence.UpdateApptTimeControls;
begin
  // All-Day vs. Time
  if chkAllDay.Checked then
    begin
      cmbStartTime.Time := 0;
      cmbEndTime.Time := 0;
      if Trunc(cmbDuration.Duration) < 1 then
        cmbDuration.Duration := 1;
    end;
  IQMS.Common.Controls.IQShowControl([cmbStartTime, cmbEndTime, lblStartTime, lblEndTime],
    not chkAllDay.Checked);
  lblAllDayMsg.Visible := chkAllDay.Checked;
  lblAllDayMsg.Caption :=
    Format(crm_rscstr.cTXT0001499 { 'Occurs all day for %d days(s).' } ,
    [Trunc(cmbDuration.Duration)]);

end;

end.

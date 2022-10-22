unit WC_5676;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  crm_recur_dlg,
  crm_recur_types,
  IQMS.Common.Dates,
  IQMS.WebVcl.Time;

procedure Test1;
var
  Rec:  TRecurrenceRec;
begin
  with Rec do
    begin
      ApptStart := Frac(Now);
      ApptEnd := Frac(Now) + (60 * 5);
      ApptDur := 60 * 5;
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
    DoCRMRecurrence( Rec );
end;

initialization

  TTestRepo.RegisterTest('WC-5676', 'CRM', 'crm_recur_dlg', 'DoCRMRecurrence', Test1);

end.

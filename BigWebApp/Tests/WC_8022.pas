unit WC_8022;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  QC_WF_Calendar;

procedure TestDoShow;
begin
  TFrmQCWorkflowCalendar.DoShow;
end;

initialization
  TTestRepo.RegisterTest('WC-8022', 'Qc',  'QC_WF_Calendar', 'DoShow', TestDoShow);
end.

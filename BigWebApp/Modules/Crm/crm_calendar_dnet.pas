unit crm_calendar_dnet;

interface

uses
  Winapi.Windows,
  Vcl.Forms,
  System.Classes,
  System.SysUtils;

  procedure DoCRMCalendarDNet(AOwner: TComponent);
  procedure DoScheduleCoordinatorDNet;
  procedure DoCRMHolidaysDNet;

implementation

uses
  IQMS.Common.Miscellaneous,
  IQMS.Common.JumpConstants;

procedure DoCRMCalendarDNet(AOwner: TComponent);
begin
  //TDNetCRMCalendar.Show; // in DNetComShr.pas
  try
     PostMessage(Application.MainForm.Handle,       // Main Window Handle
                 IQMS.Common.JumpConstants.iq_JumpToCRMCalendar,          // Message ID, declared in IQMS.Common.JumpConstants.pas
                 0, 0 )     // ID
  except on E:Exception do // in case Cancel was clicked
     if not IQMS.Common.Miscellaneous.IgnoreCOMRaisedEAbort(E) then raise;
  end;
end;

procedure DoScheduleCoordinatorDNet;
begin
  //TDNetCRMCalendar.ShowScheduleCoordinator; // in DNetComShr.pas
  try
     PostMessage(Application.MainForm.Handle,       // Main Window Handle
                 IQMS.Common.JumpConstants.iq_JumpToCRMScheduleCoordinator,          // Message ID, declared in IQMS.Common.JumpConstants.pas
                 0, 0 )     // ID
  except on E:Exception do // in case Cancel was clicked
     if not IQMS.Common.Miscellaneous.IgnoreCOMRaisedEAbort(E) then raise;
  end;
end;

procedure DoCRMHolidaysDNet;
begin
  //TDNetCRMCalendar.ShowScheduleCoordinator; // in DNetComShr.pas
  try
     PostMessage(Application.MainForm.Handle,       // Main Window Handle
                 IQMS.Common.JumpConstants.iq_JumpToCRMHolidays,          // Message ID, declared in IQMS.Common.JumpConstants.pas
                 0, 0 )     // ID
  except on E:Exception do // in case Cancel was clicked
     if not IQMS.Common.Miscellaneous.IgnoreCOMRaisedEAbort(E) then raise;
  end;
end;

end.

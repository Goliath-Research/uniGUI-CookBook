unit WC_5604;

interface

implementation

uses
  TestReg,
  SysUtils,
  System.StrUtils,
  uniGUIDialogs,
  crm_activity_reminder_dlg;

procedure Test1;
begin
  ShowMessage(IfThen( TFrmCRMActivityReminderDlg.DoShowModal(327), 'OK', 'Cancel'));
end;

initialization

  TTestRepo.RegisterTest('WC-5604', 'Crm', 'crm_activity_reminder_dlg', 'DoShowModal', Test1);

end.

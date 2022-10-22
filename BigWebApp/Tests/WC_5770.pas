unit WC_5770;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  crm_mail_resume_dlg, uniGUIDialogs;

procedure Test1;
var
   IQMS : boolean;
begin
  TFrmCRMMailResumeDlg.DoShowModal(IQMS);
  if IQMS then
     ShowMessage('True')
  else
     ShowMessage('False');
end;

initialization

  TTestRepo.RegisterTest('WC-5770', 'Crm_Mail', 'crm_mail_resume_dlg', 'DoShowModal', Test1);
end.

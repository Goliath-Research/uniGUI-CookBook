unit WC_5768;

interface

implementation

uses
  TestReg,
  crm_mail_preview,
  System.Classes,
  MainModule,
  IQMS.Common.DataLib;

procedure Test1;
var
  LFrom, LTo, LSubject, LContentType: string;
  LBody: TStringList;
  CRM_MAILING_ID, CRM_MAILING_RECIPIENT_ID :Real;
begin
  LBody := TStringList.Create;
  CRM_MAILING_ID := 151;
  CRM_MAILING_RECIPIENT_ID := 163;
  LTo := SelectValueFmtAsString('select PRINCIPLE_FIRST_NAME from CRM_MAILING_RECIPIENT where id = %f',[CRM_MAILING_RECIPIENT_ID]);
  LSubject := SelectValueFmtAsString('select Description from CRM_MAILING where id = %f',[CRM_MAILING_ID]);
  LBody.Text := SelectValueFmtAsString('select message_text from CRM_MAILING where id = %f',[CRM_MAILING_ID]);
  LContentType := SelectValueFmtAsString('select message_format from CRM_MAILING where id = %f',[CRM_MAILING_ID]);
  DoCRMMassMailerPreviewEMail(LFrom, LTo, LSubject, LBody, LContentType);
end;

initialization

  TTestRepo.RegisterTest('WC-5768', 'Crm_Mail', 'crm_mail_preview', 'DoCRMMassMailerPreviewEMail', Test1);

end.

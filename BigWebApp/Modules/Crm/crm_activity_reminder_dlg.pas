unit crm_activity_reminder_dlg;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  MainModule,
  FireDAC.UI.Intf,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.Graphics,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, uniImage;

type
  TFrmCRMActivityReminderDlg = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    SrcMembers: TDataSource;
    QryMembers: TFDQuery;
    QryMembersID: TBCDField;
    QryMembersCRM_ACTIVITY_ID: TBCDField;
    QryMembersSETALARM: TStringField;
    QryMembersLEADDURATION: TBCDField;
    QryMembersLEADDISPLAYUNITS: TBCDField;
    QryMembersALERT_DATETIME: TDateTimeField;
    QryMembersSEND_MAIL: TStringField;
    QryMembersEMAIL: TStringField;
    QryMembersMAIL_SENT_DATE: TDateTimeField;
    FDUpdateSQL1: TFDUpdateSQL;
    PnlReminder: TUniPanel;
    Splitter12: TUniSplitter;
    Bevel3: TUniPanel;
    PnlReminderLeft02: TUniPanel;
    Splitter13: TUniSplitter;
    PnlReminderLeft01: TUniPanel;
    chkSetAlarm: TUniDBCheckBox;
    PnlReminderComboBox: TUniPanel;
    cmbLeadTime: TUniDBComboBox;
    PnlSendMail: TUniPanel;
    Splitter15: TUniSplitter;
    PnlSendMailInner: TUniPanel;
    chkSendEmail: TUniDBCheckBox;
    PnlSendMailControls: TUniPanel;
    sbtnEMail: TUniSpeedButton;
    dbeAlertEMail: TUniDBEdit;
    PnlAlarmImg: TUniPanel;
    imgBellColor: TUniImage;
    imgBell: TUniImage;
    QryMembersSTARTDATE: TDateTimeField;
    QryMembersALLDAY: TStringField;
    QryMembersSOURCE_DISP: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkSetAlarmClick(Sender: TObject);
    procedure chkSendEmailClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QryMembersBeforeOpen(DataSet: TDataSet);
    procedure sbtnEMailClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure QryMembersBeforePost(DataSet: TDataSet);
    procedure QryMembersAfterPost(DataSet: TDataSet);
    procedure SrcMembersDataChange(Sender: TObject; Field: TField);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FCRMActivityMembersID: Real;
    procedure SetControls;
    procedure SetCaption;
    procedure SetCRMActivityMembersID(const Value: Real);
  public
    { Public declarations }
    property CRMActivityMembersID:Real read FCRMActivityMembersID write SetCRMActivityMembersID;
    class function DoShowModal(ACRMActivityMembersID: Real): Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils,
  { TODO -oathite -cWebConvert : Dependent on mailto_pick
  mailto_pick, }
  crm_activity_dblib;

{ TFrmCRMActivityReminderDlg }

class function TFrmCRMActivityReminderDlg.DoShowModal(ACRMActivityMembersID: Real): Boolean;
var
  LFrmCRMActivityReminderDlg : TFrmCRMActivityReminderDlg;
begin
  LFrmCRMActivityReminderDlg := TFrmCRMActivityReminderDlg.Create(uniGUIApplication.UniApplication);
  LFrmCRMActivityReminderDlg.CRMActivityMembersID := ACRMActivityMembersID;
  Result := LFrmCRMActivityReminderDlg.ShowModal = mrOk;
end;

procedure TFrmCRMActivityReminderDlg.FormShow(Sender: TObject);
begin
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlReminderLeft01);
  PnlReminderLeft01.Width := chkSetAlarm.Left + chkSetAlarm.Width + 4;
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlSendMailInner);
  PnlSendMailInner.Width := chkSendEmail.Left + chkSendEmail.Width + 4;

  SetControls;
  SetCaption;
end;

procedure TFrmCRMActivityReminderDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (QryMembers.State in [dsEdit]) then
    QryMembers.Cancel;
end;

procedure TFrmCRMActivityReminderDlg.QryMembersAfterPost(DataSet: TDataSet);
var
  sl: TStringList;
begin
  sl := TStringList.Create;
  try
    sl.Add('DECLARE                                                         ');
    sl.Add(Format('   l_crm_activity_members_id   NUMBER := %.0f;           ',
      [QryMembersID.AsFloat]));
    sl.Add('   l_alert_datetime            DATE;                            ');
    sl.Add('   l_email_address             crm_activity_members.email%TYPE; ');
    sl.Add('BEGIN                                                           ');
    sl.Add('   SELECT alert_datetime,                                       ');
    sl.Add('          email                                                 ');
    sl.Add('     INTO l_alert_datetime,                                     ');
    sl.Add('          l_email_address                                       ');
    sl.Add('     FROM crm_activity_members                                  ');
    sl.Add('    WHERE id = l_crm_activity_members_id;                       ');
    sl.Add('                                                                ');
    sl.Add('   iqms.iqcrm.set_member_reminder(l_crm_activity_members_id,    ');
    sl.Add('                                  l_alert_datetime,             ');
    sl.Add('                                  l_email_address);             ');
    sl.Add('                                                                ');
    sl.Add('   UPDATE crm_activity_members                                  ');
    sl.Add('      SET reminder_modified_by_user = ''Y''                     ');
    sl.Add('    WHERE id = l_crm_activity_members_id;                       ');
    sl.Add('                                                                ');
    sl.Add('   COMMIT;                                                      ');
    sl.Add('EXCEPTION                                                       ');
    sl.Add('   WHEN NO_DATA_FOUND THEN                                      ');
    sl.Add('      RETURN;                                                   ');
    sl.Add('END;                                                            ');
    ExecuteCommand(sl.Text);
  finally
    sl.Free;
  end;
end;

procedure TFrmCRMActivityReminderDlg.QryMembersBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', FCRMActivityMembersID);
end;

procedure TFrmCRMActivityReminderDlg.QryMembersBeforePost(DataSet: TDataSet);
begin
  QryMembersALERT_DATETIME.AsDateTime := crm_activity_dblib.GetAlertDateTime(
    QryMembersSTARTDATE.AsDateTime, QryMembersALLDAY.AsString = 'Y',
    TLeadTimeUnit(cmbLeadTime.ItemIndex));
//  if chkSetAlarm.Checked and not  then
//  QryMembersTOSCREEN.AsString := 'Y';
end;

procedure TFrmCRMActivityReminderDlg.SetCaption;
begin
  if QryMembersSOURCE_DISP.AsString > '' then
    Caption := Format('Reminder - %s',
      [IQMS.Common.StringUtils.FixStr(QryMembersSOURCE_DISP.AsString)]);
end;

procedure TFrmCRMActivityReminderDlg.SetControls;
begin
  cmbLeadTime.Enabled := chkSetAlarm.Checked;
  chkSendEmail.Enabled := chkSetAlarm.Checked;

  dbeAlertEMail.Enabled := chkSetAlarm.Checked and chkSendEmail.Checked;
  sbtnEMail.Enabled := chkSetAlarm.Checked and chkSendEmail.Checked;

  btnOk.Enabled := QryMembers.State in [dsEdit];
end;

procedure TFrmCRMActivityReminderDlg.SetCRMActivityMembersID(const Value: Real);
begin
  FCRMActivityMembersID := Value;
end;

procedure TFrmCRMActivityReminderDlg.SrcMembersDataChange(Sender: TObject;
  Field: TField);
begin
  SetControls;
end;

procedure TFrmCRMActivityReminderDlg.UniFormCreate(Sender: TObject);
begin
  QryMembers.Open;
  { TODO -oathite -cWebConvert : Procedure CenterForm having it's first parameter is Tform
  IQMS.Common.Controls.CenterForm(Self, True); }
end;

procedure TFrmCRMActivityReminderDlg.chkSetAlarmClick(Sender: TObject);
begin
  Application.ProcessMessages;
  SetControls;
end;

procedure TFrmCRMActivityReminderDlg.btnCancelClick(Sender: TObject);
begin
  if (QryMembers.State in [dsEdit]) then
    QryMembers.Cancel;
  ModalResult := mrCancel;
end;

procedure TFrmCRMActivityReminderDlg.btnOkClick(Sender: TObject);
begin
  if (QryMembers.State in [dsEdit]) then
    QryMembers.Post;
  ModalResult := mrOk;
end;

procedure TFrmCRMActivityReminderDlg.chkSendEmailClick(Sender: TObject);
begin
  Application.ProcessMessages;
  SetControls;
end;

procedure TFrmCRMActivityReminderDlg.sbtnEMailClick(Sender: TObject);
var
  S: string;
begin
  S := dbeAlertEMail.Text; // needs to be the edit box in case user changes text
  { TODO -oathite -cWebConvert : Dependent on mailto_pick
  if GetMailToString(Self, S) then // in mailto_pick.pas
    begin
      if not(QryMembers.State in [dsEdit]) then
        QryMembers.Edit;
      QryMembersEMAIL.AsString := S;
    end; }
end;

end.

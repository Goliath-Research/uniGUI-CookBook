unit IQMS.Payroll.ViewSentMessages;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.About,
  Vcl.Menus,
  IQMS.Common.Controls,
  IQMS.WebVcl.Hpick,
  Vcl.Buttons,
  Mask,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniMemo,
  uniPanel,
  uniSplitter,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniPageControl, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmViewSentMsgs = class(TUniForm)
    SrcPR_EMP_MESSAGE: TDataSource;
    QryPR_EMP_MESSAGE: TFDQuery;
    pcMain: TUniPageControl;
    tabAllMessages: TUniTabSheet;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Exit1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    pnlTop: TUniPanel;
    Splitter1: TUniSplitter;
    RecallMessage1: TUniMenuItem;
    pnlMid: TUniPanel;
    pnlBottom: TUniPanel;
    Splitter2: TUniSplitter;
    pnlBody: TUniPanel;
    memMsgBody: TUniMemo;
    pnlAttachments: TUniPanel;
    wwdbGridMsg: TIQUniGridControl;
    Panel1: TUniPanel;
    navEmp: TUniDBNavigator;
    PickMsg: TUniSpeedButton;
    PkMsg: TIQWebHPick;
    QryPR_EMP_MESSAGEID: TBCDField;
    QryPR_EMP_MESSAGESENT_TO: TStringField;
    QryPR_EMP_MESSAGESENT_DATE: TDateTimeField;
    QryPR_EMP_MESSAGESUBJECT: TStringField;
    QryPR_EMP_MESSAGEMESSAGE: TStringField;
    QryPR_EMP_MESSAGEOPENED: TStringField;
    QryPR_EMP_MESSAGEATTACHMENTS: TStringField;
    PkMsgID: TBCDField;
    PkMsgSENT_TO: TStringField;
    PkMsgSENT_DATE: TDateTimeField;
    PkMsgSUBJECT: TStringField;
    PkMsgOPENED: TStringField;
    PkMsgATTACHMENTS: TStringField;
    Options1: TUniMenuItem;
    ViewArchived1: TUniMenuItem;
    PkMsgARCHIVED: TStringField;
    QryPR_EMP_MESSAGEARCHIVED: TStringField;
    grpAttachments: TUniGroupBox;
    wwgridAttach: TIQUniGridControl;
    SrcPR_EMP_MESSAGE_ATTACH: TDataSource;
    QryPR_EMP_MESSAGE_ATTACH: TFDQuery;
    QryPR_EMP_MESSAGE_ATTACHID: TBCDField;
    QryPR_EMP_MESSAGE_ATTACHPR_EMP_MESSAGE_ID: TBCDField;
    QryPR_EMP_MESSAGE_ATTACHFILE_NAME: TStringField;
    Panel2: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    sbtnOpenAttachment: TUniSpeedButton;
    QryPR_EMP_MESSAGENUMATTACHMENTS: TFMTBCDField;
    QryPR_EMP_MESSAGE_ATTACHFILE_DATA: TBlobField;
    wwDBComboDlg1: TUniEdit;
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure QryPR_EMP_MESSAGEBeforeOpen(DataSet: TDataSet);
    procedure SrcPR_EMP_MESSAGEDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RecallMessage1Click(Sender: TObject);
    procedure PickMsgClick(Sender: TObject);
    procedure ViewArchived1Click(Sender: TObject);
    procedure RefreshQueries;
    procedure SrcPR_EMP_MESSAGE_ATTACHDataChange(Sender: TObject;
      Field: TField);
    procedure sbtnOpenAttachmentClick(Sender: TObject);
    procedure wwDBComboDlg1Click(Sender: TObject);
  private
    { Private declarations }
    FCurrentUser : string;
    FViewArchived : string;
    FCurrentPr_Emp_Message_ID : real;
    FAttachmentsCount : real;
    function AssignBLOBTempFileName( AFileName : string; AExt : string ) : string;
  public
    { Public declarations }
  end;

procedure DoSentPortalMessages;

var
  FrmViewSentMsgs: TFrmViewSentMsgs;

implementation

{$R *.dfm}

uses
  IQMS.Common.HrRscstr,
  IQMS.WebVcl.Blob,
  IQMS.Common.FileUtils,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils;

{ TFrmViewSentMsgs }

procedure TFrmViewSentMsgs.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

function TFrmViewSentMsgs.AssignBLOBTempFileName( AFileName : string; AExt : string) : string;
var AFolder : string;
begin
  AFolder := IncludeTrailingPathDelimiter(IQGetLocalHomePath) + 'Temp';
  IQAssert(ForceDirectories(AFolder),
    Format('Unable to create temp directory %s', [AFolder]));
  Result := IncludeTrailingPathDelimiter(AFolder) +
    ChangeFileExt(AFileName, AExt);
end;

procedure TFrmViewSentMsgs.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmViewSentMsgs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, pcMain, pnlBody, pnlTop, wwdbGridMsg]);
end;

procedure TFrmViewSentMsgs.FormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [self, pcMain, pnlBody, pnlTop, wwdbGridMsg]);
end;

procedure TFrmViewSentMsgs.PickMsgClick(Sender: TObject);
var
  nID : real;
begin
with PkMsg do
    if Execute then
    if not QryPR_EMP_MESSAGE.Locate('ID', GetValue('ID'), []) then
          IQConfirm(Format(IQMS.Common.HrRscstr.cTXT0000036,[ FloatToStr( GetValue('ID') )]));

end;

procedure TFrmViewSentMsgs.QryPR_EMP_MESSAGEBeforeOpen(DataSet: TDataSet);
begin
  {Be aware that Picker & Grid affected by Options menu}
  with TFDQuery(Dataset) do
  begin
    ParamByName('currentuser').Value := FCurrentUser;
    ParamByName('archived').Value := FViewArchived;
  end;
end;

procedure TFrmViewSentMsgs.RecallMessage1Click(Sender: TObject);
begin
  if SelectValueFmtAsString('select OPENED from PR_EMP_MESSAGE where id = %.0f', [QryPR_EMP_MESSAGE.FieldByName('ID').asFloat]) = 'Y' then
  begin
    IQWarning(IQMS.Common.HrRscstr.cTXT0000034); //Unable to recall message; message has been marked 'Read' by recipient.
    RefreshQueries;
    Exit;
  end;

  if SelectValueFmtAsString('select ARCHIVED from PR_EMP_MESSAGE WHERE ID = %.0f', [QryPR_EMP_MESSAGE.FieldByName('ID').asFloat ]) = 'Y' then
  begin
    IQWarning(IQMS.Common.HrRscstr.cTXT0000035); //Unable to recall message; message has been marked 'Archived' by recipient.
    RefreshQueries;
    Exit;
  end;

  if QryPR_EMP_MESSAGEOPENED.asString = 'N' then
  ExecuteCommandFmt('begin payroll_misc.Recall_Emp_Portal_Msg(%.0f); end;', [ QryPR_EMP_MESSAGEID.asFloat ]);

  if  (SelectValueFmtAsFloat('select count(id) from pr_emp_message_attach where pr_emp_message_id = %.0f', [ QryPR_EMP_MESSAGEID.asFloat ]) = 0)
  and (SelectValueFmtAsFloat('select count(id) from pr_emp_message where id = %.0f', [ QryPR_EMP_MESSAGEID.asFloat ] ) = 0)

  then
  begin
    IQInformation(IQMS.Common.HrRscstr.cTXT0000037);  //Message Recalled!
    RefreshQueries;
  end
  else
    IQError(IQMS.Common.HrRscstr.cTXT0000038); // Message Recall Failed!


end;

procedure TFrmViewSentMsgs.RefreshQueries;
begin
  QryPR_EMP_MESSAGE_ATTACH.Close;
  QryPR_EMP_MESSAGE.Close;
  QryPR_EMP_MESSAGE.Open;
  QryPR_EMP_MESSAGE_ATTACH.Open;
end;

procedure TFrmViewSentMsgs.sbtnOpenAttachmentClick(Sender: TObject);
var
  AMemoryStream : TMemoryStream;
  ATmpFileName, ATmpFileNoExt, AFileExt : string;
begin
    try
      AMemoryStream := TMemoryStream.Create;
      ATmpFileName := QryPR_EMP_MESSAGE_ATTACHFILE_NAME.asString;
      AFileExt := ExtractFileExt(ATmpFileName);

      if not IQMS.WebVcl.Blob.TIQWebBlob.GetBlob( 'FILE_DATA',                          {column name}
                              'PR_EMP_MESSAGE_ATTACH',              {table name}
                               QryPR_EMP_MESSAGE_ATTACHID.asFloat,  {PR_EMP_MESSAGE_ATTACH.ID}
                               AMemoryStream ) then EXIT;

      {create unique temp file name, and bolt on the correct file extension}
      ATmpFileName := AssignBLOBTempFileName( ATmpFileName, AFileExt );

      {Save blob to this unique temp file}
      TBlobField(QryPR_EMP_MESSAGE_ATTACHFILE_DATA).SaveToFile( ATmpFileName );
  finally
      AMemoryStream.Free;
  end;

  {Open the file}
  IQMS.Common.Miscellaneous.ExecuteProgram( ATmpFileName );

  Application.ProcessMessages; {let big file load}

  {Delete old files from Temp dir in localhome, call is in IQMS.Common.FileUtils.pas}
  DeleteFilesOlderThan( IncludeTrailingPathDelimiter(IQGetLocalHomePath) +
    'Temp\*.*', 1);
end;

procedure TFrmViewSentMsgs.SrcPR_EMP_MESSAGEDataChange(Sender: TObject;
  Field: TField);
begin
    FCurrentPr_Emp_Message_ID := QryPR_EMP_MESSAGE.FieldByName('ID').asFloat;

    if QryPR_EMP_MESSAGE.FieldByName('SENT_DATE').asString = '' then
    begin
      memMsgBody.Text := '';
      Exit;
    end;
    memMsgBody.Lines.Text := 'From: ' + FCurrentUser + #13;
    memMsgBody.Lines.Text :=  memMsgBody.Lines.Text + 'Sent: '    + QryPR_EMP_MESSAGE.FieldByName('SENT_DATE').asString + #13;
    memMsgBody.Lines.Text :=  memMsgBody.Lines.Text + 'To: '      + QryPR_EMP_MESSAGE.FieldByName('SENT_TO').asString +#13;
    memMsgBody.Lines.Text :=  memMsgBody.Lines.Text + 'Subject: ' + QryPR_EMP_MESSAGE.FieldByName('SUBJECT').asString + #13#13;
    memMsgBody.Lines.Text :=  memMsgBody.Lines.Text + QryPR_EMP_MESSAGE.FieldByName('MESSAGE').asString;

    QryPR_EMP_MESSAGE_ATTACH.Open;
end;

procedure TFrmViewSentMsgs.SrcPR_EMP_MESSAGE_ATTACHDataChange(Sender: TObject;
  Field: TField);
begin

FAttachmentsCount := 0;
FAttachmentsCount := QryPR_EMP_MESSAGENUMATTACHMENTS.asFloat;
sbtnOpenAttachment.Enabled := FAttachmentsCount <> 0;

end;

procedure TFrmViewSentMsgs.ViewArchived1Click(Sender: TObject);
begin
  if ViewArchived1.Checked then
  begin
    ViewArchived1.Checked := False;
    FViewArchived := 'N';
    QryPR_EMP_MESSAGE.Close;
    QryPR_EMP_MESSAGE.Open;
    RecallMessage1.Enabled := True;
  end
    else
    begin
    ViewArchived1.Checked := True;
    FViewArchived := 'Y';
    QryPR_EMP_MESSAGE.Close;
    QryPR_EMP_MESSAGE.Open;
    RecallMessage1.Enabled := False;
    end;
end;

procedure TFrmViewSentMsgs.wwDBComboDlg1Click(Sender: TObject);
begin
  if FAttachmentsCount <> 0 then
    sbtnOpenAttachmentClick(nil);
end;

procedure DoSentPortalMessages;
begin
 with TFrmViewSentMsgs.Create(uniGUIApplication.UniApplication) do
  begin
    FCurrentUser := SelectValueAsString('select misc.getusername from dual');
    FViewArchived := 'N';
    AdjustPageControlToParent( pcMain );
    pcMain.ActivePage := tabAllMessages;
    QryPR_EMP_MESSAGE.Open;
    Show;
  end;
end;

end.

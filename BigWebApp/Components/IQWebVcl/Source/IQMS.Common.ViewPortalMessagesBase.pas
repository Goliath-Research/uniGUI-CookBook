unit IQMS.Common.ViewPortalMessagesBase;

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
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniMemo,
  uniPanel,
  uniSplitter,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, IQUniGrid, uniGUIFrame,
  Vcl.Controls;

type TUserMessageType = ( mtReceived, mtSent );

type
  TFrmViewPortalMsgBase = class(TUniForm)
    Src_Msg: TDataSource;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Exit1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    RecallMessage1: TUniMenuItem;
    Options1: TUniMenuItem;
    ViewArchived1: TUniMenuItem;
    Src_MsgAttach: TDataSource;
    QryUSER_MESSAGE: TFDQuery;
    QryUSER_MESSAGEID: TBCDField;
    QryUSER_MESSAGESENT_TO: TStringField;
    QryUSER_MESSAGESENT_DATE: TDateTimeField;
    QryUSER_MESSAGESUBJECT: TStringField;
    QryUSER_MESSAGEMESSAGE: TStringField;
    QryUSER_MESSAGEOPENED: TStringField;
    QryUSER_MESSAGEATTACHMENTS: TStringField;
    QryUSER_MESSAGEARCHIVED: TStringField;
    QryUSER_MESSAGENUMATTACHMENTS: TFMTBCDField;
    PkReceivedMsg: TIQWebHPick;
    Qry_USER_MESSAGE_ATTACH: TFDQuery;
    StringField11: TStringField;
    FloatField4: TBCDField;
    BlobField1: TBlobField;
    Panel1: TUniPanel;
    sbtnNewMessage: TUniSpeedButton;
    pcMain: TUniPageControl;
    tabReceived: TUniTabSheet;
    Panel5: TUniPanel;
    Panel8: TUniPanel;
    dbgridReceivedMsg: TIQUniGridControl;
    Panel9: TUniPanel;
    sbtnPkReceived: TUniSpeedButton;
    DBNavigator3: TUniDBNavigator;
    tabSent: TUniTabSheet;
    Splitter1: TUniSplitter;
    pnlTop: TUniPanel;
    wwdbGridSentMsg: TIQUniGridControl;
    Panel2: TUniPanel;
    sbtnPkSent: TUniSpeedButton;
    navEmp: TUniDBNavigator;
    pnlMid: TUniPanel;
    pnlBody: TUniPanel;
    memSentBody: TUniMemo;
    pnlBottom: TUniPanel;
    Splitter2: TUniSplitter;
    pnlAttachments: TUniPanel;
    grpAttachments: TUniGroupBox;
    wwgridSentAttach: TIQUniGridControl;
    Panel13: TUniPanel;
    sbtnOpenAttachment: TUniSpeedButton;
    DBNavigator1: TUniDBNavigator;
    Splitter3: TUniSplitter;
    memReceivedBody: TUniMemo;
    PkReceivedMsgID: TBCDField;
    PkReceivedMsgSENT_TO: TStringField;
    PkReceivedMsgSENT_DATE: TDateTimeField;
    PkReceivedMsgSUBJECT: TStringField;
    PkReceivedMsgOPENED: TStringField;
    PkReceivedMsgARCHIVED: TStringField;
    PkReceivedMsgNUMATTACHMENTS: TFMTBCDField;
    PkReceivedMsgATTACHMENTS: TStringField;
    PkSentMsg: TIQWebHPick;
    PkSentMsgID: TBCDField;
    PkSentMsgSENT_TO: TStringField;
    PkSentMsgSENT_DATE: TDateTimeField;
    PkSentMsgSUBJECT: TStringField;
    PkSentMsgOPENED: TStringField;
    PkSentMsgARCHIVED: TStringField;
    PkSentMsgNUMATTACHMENTS: TFMTBCDField;
    PkSentMsgATTACHMENTS: TStringField;
    ArchiveMessage1: TUniMenuItem;
    N1: TUniMenuItem;
    QryUSER_MESSAGESENT_FROM: TStringField;
    sbtnRefreshReceived: TUniSpeedButton;
    sbtnRefreshSent: TUniSpeedButton;
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure QryPR_EMP_MESSAGEBeforeOpen(DataSet: TDataSet);
    procedure Src_MsgDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RecallMessage1Click(Sender: TObject);
    procedure sbtnSearchMessagesClick(Sender: TObject);
    procedure ViewArchived1Click(Sender: TObject);
    procedure sbtnOpenAttachmentClick(Sender: TObject);
    procedure wwDBComboDlg1Click(Sender: TObject);
    procedure sbtnNewMessageClick(Sender: TObject);
    procedure pcMainChange(Sender: TObject);
    procedure Qry_USER_MESSAGE_ATTACHBeforeOpen(DataSet: TDataSet);
    procedure Src_MsgAttachDataChange(Sender: TObject; Field: TField);
    procedure wwgridSentAttachDblClick(Sender: TObject);
    procedure ArchiveMessage1Click(Sender: TObject);
    procedure QryUSER_MESSAGEBeforeScroll(DataSet: TDataSet);
    procedure sbtnRefreshReceivedClick(Sender: TObject);
  private
    { Private declarations }
    FCurrentUser : string;
    FViewArchived : string;
    FCurrentMessage_ID : real;
    FAttachmentsCount : real;
    FActiveViewType : TUserMessageType;
    FActiveMsgDataSet : TDataSet;
    FActiveAttachDataSet : TDataSet;
    FActiveMemo : TUniMemo;

    //Passed to constuctor
    FSource     : string;  //VENDOR_RMA
    FSourceID   : real;    //VENDOR_RMA.ID value
    FToPicker   : TIQWebHPick;
    FCloseAfterSend : Boolean;
    FToID       : real;    //VENDOR.ID < who the message is going to, field must be in picker!
    FToName     : string;  //VENDOR.VENDORNO < name corresponding to ID
    FMesgIDFieldName : string; //'SOURCE_ID';
    FMesgTableName   : string; //'USER_MESSAGE'
    FAttachementsFKFieldName : string; //USER_MESSAGE_ID
    FAttachmentsTableName : string; //USER_MESSAGE
    FAttachmentFileNameCol : string; //FILE_NAME
    FAttachmentFileDataCol : string; //FILE_DATA
    function AssignBLOBTempFileName( AFileName : string; AExt : string ) : string;
    procedure SwitchMessageViewTo( const AType : TUserMessageType);
    procedure DisplayMessageBody;
    function TabSheettoUserMessageType : TUserMessageType;
  public
    procedure RefreshDatasets;
    constructor Create (
                         ASource     : string; //VENDOR_RMA
                         ASourceID   : real;   //VENDOR_RMA.ID value
                         AToID       : real = 0;   //VENDOR.ID < who the message is going to, field must be in picker!
                         AToName     : string = '';//VENDOR.VENDORNO < name corresponding to ID
                         AMesgIDFieldName : string = 'SOURCE_ID';
                         AMesgTableName   : string = 'USER_MESSAGE';
                         AAttachmentsIDFKFieldName : string = 'USER_MESSAGE_ID';
                         AAttachmentsTableName   : string = 'USER_MESSAGE_ATTACH';
                         AAttachmentsFileNameCol : string = 'FILE_NAME';
                         AAttachmentsFileDataCol : string = 'FILE_DATA' );
  end;

  procedure DoPortalMessages(
                              ASource     : string; //VENDOR_RMA
                              ASourceID   : real;   //VENDOR_RMA.ID value
                              AToID       : real = 0;   //VENDOR.ID < who the message is going to, field must be in picker!
                              AToName     : string = '';//VENDOR.VENDORNO < name corresponding to ID
                              AMesgIDFieldName : string = 'SOURCE_ID';
                              AMesgTableName   : string = 'USER_MESSAGE';
                              AAttachmentsIDFKFieldName : string = 'USER_MESSAGE_ID';
                              AAttachmentsTableName   : string = 'USER_MESSAGE_ATTACH';
                              AAttachmentsFileNameCol : string = 'FILE_NAME';
                              AAttachmentsFileDataCol : string = 'FILE_DATA'  );


implementation

{$R *.dfm}

uses
  IQMS.Common.HrRscstr,
  IQMS.WebVcl.Blob,
  IQMS.Common.FileUtils,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  IQMS.Payroll.NewPortalMessage,
  IQMS.Common.NewPortalMessageBase;

{ TFrmViewSentMsgs }

procedure TFrmViewPortalMsgBase.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmViewPortalMsgBase.ArchiveMessage1Click(Sender: TObject);
begin
  ExecuteCommandFmt('update user_message set archived = ''Y'' where id = %f', [ FActiveMsgDataSet.FieldByName('id').asFloat ]);
  RefreshDatasets;
end;

function TFrmViewPortalMsgBase.AssignBLOBTempFileName( AFileName : string; AExt : string) : string;
var AFolder : string;
begin
  AFolder := IncludeTrailingPathDelimiter(IQGetLocalHomePath) + 'Temp';
  IQAssert(ForceDirectories(AFolder),
    Format('Unable to create temp directory %s', [AFolder]));
  Result := IncludeTrailingPathDelimiter(AFolder) +
    ChangeFileExt(AFileName, AExt);
end;

procedure TFrmViewPortalMsgBase.sbtnRefreshReceivedClick(Sender: TObject);
var
  aCurrentID: Real;
begin
  aCurrentID:= QryUSER_MESSAGEID.AsFloat;
  RefreshDatasets;
  QryUSER_MESSAGE.Locate('ID', aCurrentID, [] );
end;

procedure TFrmViewPortalMsgBase.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmViewPortalMsgBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ( FActiveViewType = mtReceived ) and
     ( QryUSER_MESSAGEOPENED.asString <> 'Y' ) then
    ExecuteCommandFmt('update user_message set opened = ''Y'' where id = %f', [QryUSER_MESSAGEID.asFloat]);

  IQRegFormWrite(self, [self, pcMain, pnlBody, pnlTop, wwdbGridSentMsg]);
end;

procedure TFrmViewPortalMsgBase.FormCreate(Sender: TObject);
begin
//  IQRegFormRead(self, [self, pcMain, pnlBody, pnlTop, wwdbGridMsg]);
end;

procedure TFrmViewPortalMsgBase.pcMainChange(Sender: TObject);
begin
  SwitchMessageViewTo( TabSheettoUserMessageType );
end;

procedure TFrmViewPortalMsgBase.sbtnSearchMessagesClick(Sender: TObject);
var
  nID : real;
begin
  if Sender = sbtnPkReceived then
  begin
    with PkReceivedMsg do
      if Execute then
        if not FActiveMsgDataSet.Locate('ID', GetValue('ID'), []) then
          IQConfirm(Format(IQMS.Common.HrRscstr.cTXT0000036, [FloatToStr(GetValue('ID'))]))
  end

  else if Sender = sbtnPkSent then
  begin
    with PkSentMsg do
      if Execute then
        if not FActiveMsgDataSet.Locate('ID', GetValue('ID'), []) then
          IQConfirm(Format(IQMS.Common.HrRscstr.cTXT0000036, [FloatToStr(GetValue('ID'))]));
  end;

end;

procedure TFrmViewPortalMsgBase.QryPR_EMP_MESSAGEBeforeOpen(DataSet: TDataSet);
begin
  {Be aware that Picker & Grid affected by Options menu}
  if FSource = 'VENDOR_RMA' then
    AssignQueryParamValue(DataSet, 'source_id', FSourceID);
  AssignQueryParamValue(DataSet, 'currentuser', FCurrentUser);
  AssignQueryParamValue(DataSet, 'archived', FViewArchived);
  AssignQueryParamValue(DataSet, 'receivedflag', IQMS.Common.Numbers.IIIF( pcMain.ActivePage = tabReceived, 1, 0 ));
  AssignQueryParamValue(DataSet, 'sentflag', IQMS.Common.Numbers.IIIF( pcMain.ActivePage = tabSent, 1, 0 ));
end;

procedure TFrmViewPortalMsgBase.QryUSER_MESSAGEBeforeScroll(DataSet: TDataSet);
begin
  if ( FActiveViewType = mtReceived ) and ( QryUSER_MESSAGEOPENED.asString <> 'Y' ) then
    ExecuteCommandFmt('update user_message set opened = ''Y'' where id = %f', [QryUSER_MESSAGEID.asFloat]);
end;

procedure TFrmViewPortalMsgBase.Qry_USER_MESSAGE_ATTACHBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'id', Src_Msg.DataSet.FieldByName('id').AsLargeInt);
end;

procedure TFrmViewPortalMsgBase.RecallMessage1Click(Sender: TObject);
var
  aYN_Opened,
  aYN_Archived,
  aYN_Recalled : string;
begin
  aYN_Opened:= '';
  aYN_Archived:= '';
  aYN_Recalled:= '';

{Package: WEB_DIRECT_SHARE
 Signature:
  procedure Recall_User_Msg( p_user_message_id         number,
                             p_YN_is_opened        OUT varchar2,
                             p_YN_is_archived      OUT varchar2,
                             p_YN_recall_succeeded OUT varchar2 );
}
  with TFDStoredProc.Create(nil) do
  try
    ConnectionName:= 'IQFD';
    StoredProcName:= 'IQMS.WEB_DIRECT_SHARE.RECALL_USER_MSG';
    Params.CreateParam( ftFMTBcd, 'p_user_message_id', ptInput ).AsFMTBCD:=
      Src_Msg.DataSet.FieldByName('id').AsBCD;
    Params.CreateParam( ftString, 'p_YN_is_opened', ptInput ).asString:=
      aYN_Opened;
    Params.CreateParam( ftString, 'p_YN_is_archived', ptInput ).asString:=
      aYN_Archived;
    Params.CreateParam( ftString, 'p_YN_recall_succeeded', ptInput ).asString:=
      aYN_Recalled;
    Prepare;
    Execute;
    aYN_Opened  := ParamByName('p_YN_is_opened').asString;
    aYN_Archived:= ParamByName('p_YN_is_archived').asString;
    aYN_Recalled:= ParamByName('p_YN_recall_succeeded').asString;
  finally
    Free;
  end;

  if aYN_Opened = 'Y' then
    IQWarning(IQMS.Common.HrRscstr.cTXT0000034) //Unable to recall message; message has been marked 'Read' by recipient.

  else if aYN_Archived = 'Y' then
    IQWarning(IQMS.Common.HrRscstr.cTXT0000035) //Unable to recall message; message has been marked 'Archived' by recipient.

  else if aYN_Recalled = 'Y' then
    IQInformation(IQMS.Common.HrRscstr.cTXT0000037)  //Message Recalled!

  else
    IQError(IQMS.Common.HrRscstr.cTXT0000038); // Message Recall Failed!

  RefreshDatasets;
end;

procedure TFrmViewPortalMsgBase.RefreshDatasets;
begin
  Reopen(FActiveMsgDataSet);
  Reopen(FActiveAttachDataSet);
end;

procedure TFrmViewPortalMsgBase.sbtnNewMessageClick(Sender: TObject);
begin
  (*NewPortalMessage.pas*) // only used for Payroll/Emp maintenance
  if FSource = 'PR_EMP_MESSAGE' then
   IQMS.Payroll.NewPortalMessage.DoNewPortalMessage( FSourceID )

  else
    (*IQMS.Common.NewPortalMessageBase.pas*)
    IQMS.Common.NewPortalMessageBase.DoNewPortalMessage(
                                             FSource,
                                             FSourceID, //VENDOR_RMA.ID value
                                             nil, //Picker to choose more To's
                                             True, //Close after send
                                             FToID,   //VENDOR.ID < who the message is going to, field must be in picker!
                                             FToName ) //VENDOR.VENDORNO < name corresponding to ID
end;

procedure TFrmViewPortalMsgBase.sbtnOpenAttachmentClick(Sender: TObject);
var
  AMemoryStream: TMemoryStream;
  ATmpFileName, ATmpFileNoExt, AFileExt: string;
begin
  try
    AMemoryStream := TMemoryStream.Create;
    ATmpFileName := Src_MsgAttach.DataSet.FieldByName('FILE_NAME').asString;
    AFileExt := ExtractFileExt(ATmpFileName);

    if not IQMS.WebVcl.Blob.TIQWebBlob.GetBlob('FILE_DATA', { column name }
                           Format('%s_ATTACH', [FMesgTableName]), { table name }
                           Src_MsgAttach.DataSet.FieldByName('ID').asFloat, { PR_EMP_MESSAGE_ATTACH.ID }
                           AMemoryStream) then EXIT;

    { create unique temp file name, and bolt on the correct file extension }
    ATmpFileName := AssignBLOBTempFileName(ATmpFileName, AFileExt);

    { Save blob to this unique temp file }
    TBlobField(Src_MsgAttach.DataSet.FieldByName('FILE_DATA'))
      .SaveToFile(ATmpFileName);
  finally
    AMemoryStream.Free;
  end;

  { Open the file }
  IQMS.Common.Miscellaneous.ExecuteProgram(ATmpFileName);

  { Delete old files from Temp dir in localhome, call is in IQMS.Common.FileUtils.pas }
  DeleteFilesOlderThan(IncludeTrailingPathDelimiter(IQGetLocalHomePath) +
    'Temp\*.*', 1);
end;

procedure TFrmViewPortalMsgBase.Src_MsgAttachDataChange(Sender: TObject;
  Field: TField);
begin
  sbtnOpenAttachment.Enabled:= QryUSER_MESSAGENUMATTACHMENTS.asFloat > 0;
end;

procedure TFrmViewPortalMsgBase.Src_MsgDataChange(Sender: TObject;
  Field: TField);
begin
  DisplayMessageBody;
end;

procedure TFrmViewPortalMsgBase.SwitchMessageViewTo(const AType: TUserMessageType);
begin
  Src_Msg.DataSet.Close;

  case AType of
    mtReceived :
      begin
        AssignQueryParamValue(Src_Msg.DataSet, 'receivedflag', 1);
        AssignQueryParamValue(Src_Msg.DataSet, 'sentflag', 0);
        FActiveMemo:= memReceivedBody;
        FActiveViewType:= mtReceived;
      end;

    mtSent :
      begin
        AssignQueryParamValue(Src_Msg.DataSet, 'receivedflag', 0);
        AssignQueryParamValue(Src_Msg.DataSet, 'sentflag', 1);
        FActiveMemo:= memSentBody;
        FActiveViewType:= mtSent;
      end;
  end;

  FActiveMsgDataSet:= Src_Msg.DataSet;
  FActiveAttachDataSet:= Src_MsgAttach.DataSet;
  DisplayMessageBody;
  ArchiveMessage1.Enabled:= FActiveViewType = mtReceived;

  RefreshDatasets;
end;

function TFrmViewPortalMsgBase.TabSheettoUserMessageType: TUserMessageType;
begin
  if pcMain.ActivePage = tabReceived then
    Result:= mtReceived
  else if pcMain.ActivePage = tabSent then
    Result:= mtSent;
end;

procedure TFrmViewPortalMsgBase.ViewArchived1Click(Sender: TObject);
begin
  if ViewArchived1.Checked then
  begin
    ViewArchived1.Checked := False;
    FViewArchived := 'N';
    FActiveMsgDataSet.Close;
    FActiveMsgDataSet.Open;
    RecallMessage1.Enabled := True;
  end
  else
  begin
    ViewArchived1.Checked := True;
    FViewArchived := 'Y';
    FActiveMsgDataSet.Close;
    FActiveMsgDataSet.Open;
    RecallMessage1.Enabled := False;
  end;
end;

constructor TFrmViewPortalMsgBase.Create(
                                      ASource     : string; //VENDOR_RMA
                                      ASourceID   : real;   //VENDOR_RMA.ID value
                                      AToID       : real = 0;   //VENDOR.ID < who the message is going to, field must be in picker!
                                      AToName     : string = '';//VENDOR.VENDORNO < name corresponding to ID
                                      AMesgIDFieldName : string = 'SOURCE_ID';
                                      AMesgTableName   : string = 'USER_MESSAGE';
                                      AAttachmentsIDFKFieldName : string = 'USER_MESSAGE_ID';
                                      AAttachmentsTableName   : string = 'USER_MESSAGE_ATTACH';
                                      AAttachmentsFileNameCol : string = 'FILE_NAME';
                                      AAttachmentsFileDataCol : string = 'FILE_DATA' );
begin
  inherited Create(uniGUIApplication.UniApplication); {nothing}
  FCurrentUser := SecurityManager.UserName;
  FViewArchived := 'N';
  FSource     := ASource;     //VENDOR_RMA
  FSourceID   := ASourceID;   //VENDOR_RMA.ID value
  FToID       := AToID;       //VENDOR.ID < who the message is going to, field must be in picker!
  FToName     := AToName;     //VENDOR.VENDORNO < name corresponding to ID
  FMesgIDFieldName := AMesgIDFieldName; //'SOURCE_ID';
  FMesgTableName   := AMesgTableName;   //'USER_MESSAGE'
  FAttachementsFKFieldName:= AAttachmentsIDFKFieldName;
  FAttachmentsTableName:= AAttachmentsTableName;
  FAttachmentFileNameCol:= AAttachmentsFileNameCol;
  FAttachmentFileDataCol:= AAttachmentsFileDataCol;
  if FSource = 'PR_EMP' then
    IQMS.Common.Controls.AdjustPageControlToParent( pcMain );
  pcMain.ActivePage := tabReceived;

  if FSource = 'VENDOR_RMA' then
  begin
    Src_Msg.DataSet:= QryUSER_MESSAGE;
    Src_MsgAttach.DataSet:= Qry_USER_MESSAGE_ATTACH;
  end;
//  else begin
//    (*original source*)
//    Src_Msg.DataSet:= QryPR_EMP_MESSAGE;
//    Src_MsgAttach.DataSet:= QryPR_EMP_MESSAGE_ATTACH;
//  end;

  FActiveMsgDataSet:= Src_Msg.DataSet;
  FActiveAttachDataSet:= Src_MsgAttach.DataSet;
  FActiveMemo:= memReceivedBody;

  (*Link up Received Message DataSource*)
  dbgridReceivedMsg.DataSource:= Src_Msg;
  //dbgridRecvdAttach.DataSource:= Src_MsgAttach; //If we can attach from portal eventually, we will bring this back, but for now just sent Winapi.Messages have attachments.

  (*Link up Sent Message DataSource*)
  wwdbGridSentMsg.DataSource := Src_Msg;
  wwgridSentAttach.DataSource:= Src_MsgAttach;

  Src_Msg.DataSet.Open;
  Src_MsgAttach.DataSet.Open;
end;

procedure TFrmViewPortalMsgBase.DisplayMessageBody;
begin
  FActiveMemo.Clear;

  with FActiveMsgDataSet do
  begin
    FCurrentMessage_ID := FieldByName('ID').asFloat;

    if ( FindField('SENT_DATE') <> nil ) and
       ( FieldByName('SENT_DATE').asString = '' ) then
    begin
      FActiveMemo.Text := '';
      Exit; //prevent lines being written when no Winapi.Messages found
    end;

    with FActiveMemo do begin
      if FActiveViewType = mtReceived then
        Lines.Text := 'From: ' + FieldByName('SENT_FROM').asString + #13
      else if FActiveViewType = mtSent then begin
        Lines.Text := 'To: '   + FToName + #13;
        Lines.Text :=  Lines.Text + 'Sent: '    + FieldByName('SENT_DATE').asString + #13;
      end;

      Lines.Text :=  Lines.Text + 'Subject: ' + FieldByName('SUBJECT').asString + #13#13;
      Lines.Text :=  Lines.Text + FieldByName('MESSAGE').asString;
    end;
  end;
end;

procedure TFrmViewPortalMsgBase.wwDBComboDlg1Click(Sender: TObject);
begin
  if ( FAttachmentsCount <> 0 ) and ( sbtnOpenAttachment.Enabled ) then
    sbtnOpenAttachmentClick(nil);
end;

procedure TFrmViewPortalMsgBase.wwgridSentAttachDblClick(Sender: TObject);
begin
  if sbtnOpenAttachment.Enabled then
    sbtnOpenAttachmentClick(nil);
end;

procedure DoPortalMessages(
                            ASource     : string; //VENDOR_RMA
                            ASourceID   : real;   //VENDOR_RMA.ID value
                            AToID       : real = 0;   //VENDOR.ID < who the message is going to, field must be in picker!
                            AToName     : string = '';//VENDOR.VENDORNO < name corresponding to ID
                            AMesgIDFieldName : string = 'SOURCE_ID';
                            AMesgTableName   : string = 'USER_MESSAGE';
                            AAttachmentsIDFKFieldName : string = 'USER_MESSAGE_ID';
                            AAttachmentsTableName   : string = 'USER_MESSAGE_ATTACH';
                            AAttachmentsFileNameCol : string = 'FILE_NAME';
                            AAttachmentsFileDataCol : string = 'FILE_DATA' );
begin
  TFrmViewPortalMsgBase.Create(
                                      ASource,     //VENDOR_RMA
                                      ASourceID,   //VENDOR_RMA.ID value
                                      AToID,       //VENDOR.ID < who the message is going to, field must be in picker!
                                      AToName,     //VENDOR.VENDORNO < name corresponding to ID
                                      AMesgIDFieldName, //'SOURCE_ID';
                                      AMesgTableName,   //'USER_MESSAGE';
                                      AAttachmentsIDFKFieldName, //'USER_MESSAGE_ID';
                                      AAttachmentsTableName,   //'USER_MESSAGE_ATTACH';
                                      AAttachmentsFileNameCol, //'FILE_NAME';
                                      AAttachmentsFileDataCol ).Show; // 'FILE_DATA'

end;

end.

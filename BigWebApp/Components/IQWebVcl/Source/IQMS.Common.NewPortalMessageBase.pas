unit IQMS.Common.NewPortalMessageBase;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.Menus,
  IQMS.WebVcl.About,
  Data.DB,
  IQMS.WebVcl.Hpick,
  IQMS.Common.Controls,
  Datasnap.DBClient,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniMemo,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, Vcl.Controls, uniFileUpload;

type
  TfrmNewPortalMsgBase = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Help1: TUniMenuItem;
    ViewSentMessages1: TUniMenuItem;
    Exit1: TUniMenuItem;
    About1: TUniMenuItem;
    pcMain: TUniPageControl;
    pnlSpeed: TUniPanel;
    sbtSendMesg: TUniSpeedButton;
    tabNewMsg: TUniTabSheet;
    IQAbout1: TIQWebAbout;
    PkTo: TIQWebHPick;
    pnlLeft: TUniPanel;
    pnlMain: TUniPanel;
    pnlParams: TUniPanel;
    pnlEmailParams: TUniPanel;
    sbtnAssignEmailTo: TUniSpeedButton;
    edtTo: TUniEdit;
    edtSubject: TUniEdit;
    MemMessage: TUniMemo;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    sbtAttachments: TUniSpeedButton;
    Bevel1: TUniPanel;
    Bevel2: TUniPanel;
    memAttachFiles: TUniMemo;
    PkToID: TBCDField;
    PkToEMPNO: TStringField;
    PkToFULL_NAME: TStringField;
    PkToFIRST_NAME: TStringField;
    PkToMIDDLE_NAME: TStringField;
    PkToLAST_NAME: TStringField;
    PkToADDR1: TStringField;
    PkToADDR2: TStringField;
    PkToSTATE: TStringField;
    PkToCOUNTRY: TStringField;
    PkToZIP: TStringField;
    PkToPHONE_NUMBER: TStringField;
    PkToCITY: TStringField;
    PkToCHARGE_RATE: TBCDField;
    PkToSTATUS_CODE: TStringField;
    PkToDATE_HIRED: TDateTimeField;
    PkToTERMINATION_DATE: TDateTimeField;
    PkToLAST_REVIEW_DATE: TDateTimeField;
    PkToNEXT_REVIEW_DATE: TDateTimeField;
    PkToPK_HIDE: TStringField;
    PkToSSNMBR: TStringField;
    hiddenlists: TUniTabSheet;
    pnlTo: TUniPanel;
    GroupBox1: TUniGroupBox;
    F_To_List: TUniMemo;
    pnlAttach: TUniPanel;
    GroupBox2: TUniGroupBox;
    F_Attach_list: TUniMemo;
    UniFileUpload1: TUniFileUpload;
    procedure About1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtSendMesgClick(Sender: TObject);
    procedure sbtnAssignEmailToClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure sbtAttachmentsClick(Sender: TObject);
    procedure ViewSentMessages1Click(Sender: TObject);
    procedure UniFileUpload1Completed(Sender: TObject; AStream: TFileStream);
  private
    { Private declarations }
    FDefaultToID : real; //passed from Emp Maint
    F_Current_User : string;
    FNumAttachments : integer;
    F_SentAttachments_Count : integer;

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

    function CheckReadiness : boolean;
    function GetEmpNamebyPrEmpID(APR_EMP_ID : real) : string;
    function MessageinProgress : boolean;
    function CanClose : boolean;
    procedure DoFormClose;
    function ConfirmSubmission(AMesgID : real) : boolean;
    procedure ClearFieldsandLists;
    procedure AttachFilestoMessage( ARecipients : integer; ASourceMessageID :real; APR_EMP_ID : real = 0);
    procedure BuildAttachedFilesList;
    procedure BuildAppendToList( ASourceID : real; ATo_List : TUniMemo);
    procedure BuildAppendAttachList( AFile : string; AAttach_List : TUniMemo);
    procedure SaveFiletoBlob( ATableName, AColumnName : string; AID : real; AFileName : string);
  public
    { Public declarations }
    constructor CreateNewPortalMessage(
                                        ASource     : string; //VENDOR_RMA
                                        ASourceID   : real;   //VENDOR_RMA.ID value
                                        AToPicker   : TIQWebHPick = nil;
                                        ACloseAfterSend : boolean = false;
                                        AToID       : real = 0;   //VENDOR.ID < who the message is going to, field must be in picker!
                                        AToName     : string = '';//VENDOR.VENDORNO < name corresponding to ID
                                        AMesgIDFieldName : string = 'SOURCE_ID';
                                        AMesgTableName   : string = 'USER_MESSAGE';
                                        AAttachmentsIDFKFieldName : string = 'USER_MESSAGE_ID';
                                        AAttachmentsTableName   : string = 'USER_MESSAGE_ATTACH';
                                        AAttachmentsFileNameCol : string = 'FILE_NAME';
                                        AAttachmentsFileDataCol : string = 'FILE_DATA' );
  end;

  procedure DoNewPortalMessage(
                                ASource     : string; //VENDOR_RMA
                                ASourceID   : real;   //VENDOR_RMA.ID value
                                AToPicker   : TIQWebHPick = nil;
                                ACloseAfterSend : boolean = false;
                                AToID       : real = 0;   //VENDOR.ID < who the message is going to, field must be in picker!
                                AToName     : string = '';//VENDOR.VENDORNO < name corresponding to ID
                                AMesgIDFieldName : string = 'SOURCE_ID';
                                AMesgTableName   : string = 'USER_MESSAGE';
                                AAttachmentsIDFKFieldName : string = 'USER_MESSAGE_ID';
                                AAttachmentsTableName   : string = 'USER_MESSAGE_ATTACH';
                                AAttachmentsFileNameCol : string = 'FILE_NAME';
                                AAttachmentsFileDataCol : string = 'FILE_DATA' );


implementation

{$R *.dfm}

uses
  IQMS.Common.HrRscstr,
  IQMS.WebVcl.Blob,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  IQMS.Common.ViewPortalMessagesBase,
  IQMS.Payroll.ViewSentMessages;


{ TFrmNewPortalMsg }

constructor TfrmNewPortalMsgBase.CreateNewPortalMessage(
                                                        ASource     : string; //VENDOR_RMA
                                                        ASourceID   : real;   //VENDOR_RMA.ID value
                                                        AToPicker   : TIQWebHPick = nil;
                                                        ACloseAfterSend : boolean = false;
                                                        AToID       : real = 0;   //VENDOR.ID < who the message is going to, field must be in picker!
                                                        AToName     : string = '';//VENDOR.VENDORNO < name corresponding to ID
                                                        AMesgIDFieldName : string = 'SOURCE_ID';
                                                        AMesgTableName   : string = 'USER_MESSAGE';
                                                        AAttachmentsIDFKFieldName : string = 'USER_MESSAGE_ID';
                                                        AAttachmentsTableName   : string = 'USER_MESSAGE_ATTACH';
                                                        AAttachmentsFileNameCol : string = 'FILE_NAME';
                                                        AAttachmentsFileDataCol : string = 'FILE_DATA'  );
begin
  inherited Create(uniGUIApplication.UniApplication); // nothing
  (*Assign Field Vars*)
  FSource     := ASource;     //VENDOR_RMA
  FSourceID   := ASourceID;   //VENDOR_RMA.ID value
  FToPicker   := AToPicker;
  FCloseAfterSend:= ACloseAfterSend;
  FToID       := AToID;       //VENDOR.ID < who the message is going to, field must be in picker!
  FToName     := AToName;     //VENDOR.VENDORNO < name corresponding to ID
  FMesgIDFieldName := AMesgIDFieldName; //'SOURCE_ID';
  FMesgTableName   := AMesgTableName;   //'USER_MESSAGE'
  FAttachementsFKFieldName:= AAttachmentsIDFKFieldName;
  FAttachmentsTableName:= AAttachmentsTableName;
  FAttachmentFileNameCol:= AAttachmentsFileNameCol;
  FAttachmentFileDataCol:= AAttachmentsFileDataCol;

  AdjustPageControlToParent(pcMain);
  // when debugging, uncomment this so you can see hidden lists tab and switch between them

  if AToID > 0 then
    FDefaultToID := AToID;

  sbtnAssignEmailTo.Visible:=  AToPicker <> nil;

  if AToName <> '' then
    edtTo.Text := AToName + '; '; // token to separate names in list

  F_Current_User := SecurityManager.UserName;
  BuildAppendToList(FDefaultToID, F_To_List);
end;

procedure TfrmNewPortalMsgBase.DoFormClose;
begin
  if Assigned(self.Owner) then
  begin
    if self.Owner is TFrmViewPortalMsgBase then
      TFrmViewPortalMsgBase(self.Owner).RefreshDatasets
    else
     if self.Owner is TFrmViewSentMsgs then
      TFrmViewSentMsgs(self.Owner).RefreshQueries;
  end;

  ClearFieldsandLists;
  Destroy;
end;

procedure TfrmNewPortalMsgBase.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure DoNewPortalMessage(
                              ASource     : string; //VENDOR_RMA
                              ASourceID   : real;   //VENDOR_RMA.ID value
                              AToPicker   : TIQWebHPick = nil;
                              ACloseAfterSend : boolean = false;
                              AToID       : real = 0;   //VENDOR.ID < who the message is going to, field must be in picker!
                              AToName     : string = '';//VENDOR.VENDORNO < name corresponding to ID
                              AMesgIDFieldName : string = 'SOURCE_ID';
                              AMesgTableName   : string = 'USER_MESSAGE';
                              AAttachmentsIDFKFieldName : string = 'USER_MESSAGE_ID';
                              AAttachmentsTableName   : string = 'USER_MESSAGE_ATTACH';
                              AAttachmentsFileNameCol : string = 'FILE_NAME';
                              AAttachmentsFileDataCol : string = 'FILE_DATA');
begin
  TFrmNewPortalMsgBase.CreateNewPortalMessage(
                                               ASource,      //VENDOR_RMA
                                               ASourceID,    //VENDOR_RMA.ID value
                                               AToPicker,
                                               ACloseAfterSend,
                                               AToID,        //VENDOR.ID < who the message is going to, field must be in picker!
                                               AToName,      //VENDOR.VENDORNO < name corresponding to ID
                                               AMesgIDFieldName,
                                               AMesgTableName,
                                               AAttachmentsIDFKFieldName,
                                               AAttachmentsTableName,
                                               AAttachmentsFileNameCol,
                                               AAttachmentsFileDataCol ).Show;
end;

procedure TfrmNewPortalMsgBase.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TfrmNewPortalMsgBase.AttachFilestoMessage(ARecipients: integer;
                                                    ASourceMessageID : real;
                                                    APR_EMP_ID: real = 0);
var
  i : integer;
  j : integer;
  ANextID : real;
  AFile_Name_Only : string;
begin
  //With this procedure, each recipient gets their own attachments, and each attachment
  //has its own pr_emp_message_attach.id, but they share a common pr_emp_message_id.

  FNumAttachments := F_Attach_List.Lines.Count;
  try
    for i := 0 to F_Attach_List.Lines.Count -1 do //for each entry in hidden memo field
    begin
      ANextID := GetNextID(FAttachmentsTableName); // 'PR_EMP_MESSAGE_ATTACH'

      AFile_Name_Only := Trim(ExtractFileName(F_Attach_List.Lines[i]));

      if FAttachmentsTableName = 'PR_EMP_MESSAGE_ATTACH' then
        (*Different schema for this table, which used this method originally*)
        ExecuteCommandFmt('INSERT into PR_EMP_MESSAGE_ATTACH( ID, PR_EMP_MESSAGE_ID, FILE_NAME, PR_EMP_ID ) ' +
                                          'VALUES ( %.0f, %.0f, ''%s'', %.0f)',
                                          [ ANextID,
                                            ASourceMessageID,
                                            IQMS.Common.StringUtils.FixStr(AFile_Name_Only),
                                            APR_EMP_ID ])
      else
       (*Dynamic SQL*)
        ExecuteCommandFmt('INSERT into %s( ID, %s, %s  ) ' +
                         'VALUES ( %.0f, %.0f, ''%s'' )',
                         [ FAttachmentsTableName,
                           FAttachementsFKFieldName,
                           FAttachmentFileNameCol,
                           ANextID,
                           ASourceMessageID,
                           IQMS.Common.StringUtils.FixStr(AFile_Name_Only) ]);

      SaveFiletoBLOB( FAttachmentsTableName, FAttachmentFileDataCol, ANextID, F_Attach_List.Lines[i]);

      F_SentAttachments_Count := F_SentAttachments_Count + 1;
    end;

  except on E:exception do
    begin
    //Inform after all have been attempted
    //If one fails don't abort all of the other ones
    end;
  end;
end;

procedure TfrmNewPortalMsgBase.BuildAppendAttachList(AFile: string;
  AAttach_List: TUniMemo);
begin

  case F_Attach_List.Text <> '' of

    True: //append to existing list
          F_Attach_List.Lines.Text := F_Attach_List.Lines.Text + AFile + #13;

    False: //build new List, assigning to Text property instead of lines clears all lines except for row 0
          F_Attach_List.Text := AFile + #13;
  end;

end;

procedure TfrmNewPortalMsgBase.BuildAppendToList(ASourceID: real; ATo_List: TUniMemo);
var
  AList : TStringList;
  ASrcID_string: string;
begin
  ASrcID_string := FloattoStr(ASourceID);

  case F_To_List.Text <> '' of

    True: // append to existing list
      begin
        F_To_List.Lines.Text := F_To_List.Lines.Text + ASrcID_string + #13;
      end;

    False: // build new List, assigning to Text property instead of lines clears all lines except for row 0
      begin
        F_To_List.Text := ASrcID_string + #13;
      end;
  end;
end;


procedure TfrmNewPortalMsgBase.BuildAttachedFilesList;
var
 i : integer;
 ATotalLines : integer;
 AFilesList : TStringList;
begin
ATotalLines := memAttachFiles.Lines.Count;
  try
    for i := 0 to ATotalLines - 1 do
      F_Attach_List.Lines[i] :=  memAttachFiles.Lines[i];
  finally

  end;
end;

function TfrmNewPortalMsgBase.CanClose: boolean;
begin
  Result := True;

  if (MessageinProgress) then
    if not IQConfirmYN(IQMS.Common.HrRscstr.cTXT0000040) then
    // Message in progress... Abort?
      Result := False;
end;

function TfrmNewPortalMsgBase.CheckReadiness: boolean;
begin
  if (edtTo.Text = '') or (edtSubject.Text = '') or (MemMessage.Lines.Text = '')
  then
    Result := False
  else
    Result := True;
end;


procedure TfrmNewPortalMsgBase.ClearFieldsandLists;
begin
  edtTo.Clear;
  edtSubject.Clear;
  memAttachFiles.Lines.Clear;
  MemMessage.Lines.Clear;
  FDefaultToID := 0;
  FNumAttachments := 0;
  F_SentAttachments_Count := 0;

  {reset hidden memos}
  F_To_List.Lines.Clear;
  F_Attach_List.Lines.Clear;
end;

function TfrmNewPortalMsgBase.ConfirmSubmission(AMesgID: real): boolean;
begin
  if SelectValueFmtAsFloat('select 1 from %s where id = %.0f', [FMesgTableName, AMesgID]) = 1
  then
    Result := True
  else
    Result := False;
end;

procedure TfrmNewPortalMsgBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if CanClose then
    DoFormClose
  else
    Abort;
end;

function TfrmNewPortalMsgBase.GetEmpNamebyPrEmpID(APR_EMP_ID: real): string;
var AFullName : string;
    AUserID : string;
begin
  Result := '';
  // Try full name first, from Emp Maintenance
  AFullName := SelectValueFmtAsString
    ('select substrB( IQMS.Common.StringUtils.Concat3w( First_Name, Middle_Name, Last_Name), 1, 255) from pr_emp where id = %.0f',
    [APR_EMP_ID]);

  if AFullName <> '' then
    Result := AFullName;

  if Result = '' then
    // Default to S_USER_GENERAL.USER_NAME
    AUserID := SelectValueFmtAsString
      ('select user_name from s_user_general where pr_emp_id = %.0f',
      [APR_EMP_ID]);

  if (Result = '') and (AUserID <> '') then
    Result := AUserID;

  if (AFullName = '') and (AUserID = '') then
    Result := '';
end;

function TfrmNewPortalMsgBase.MessageinProgress: boolean;
begin
  if // (edtTo.Text <> '') or //Don't check the To box, it is populated automatically
    (edtSubject.Text <> '') or (memAttachFiles.Lines.Text <> '') or
    (MemMessage.Lines.Text <> '') then
    Result := True
  else
    Result := False;
end;

procedure TfrmNewPortalMsgBase.SaveFiletoBlob(ATableName, AColumnName: string;
  AID: real; AFileName : string);
var
  AStream : TMemoryStream;
  APos : integer;
begin
  AStream := TMemoryStream.Create;
  try

    APos := AnsiPos(#13, AFileName);
    if APos <> 0 then
    AFileName := Copy(AFilename, 0, APos - 1 ); {Same filename, with ANSI carriage return stripped out}

    AStream.LoadFromFile( AFileName );

    IQMS.WebVcl.Blob.TIQWebBlob.SaveBlob( AColumnName,
                      ATableName,
                      AID,
                      AStream );
  finally
    AStream.Free;
  end;
end;

procedure TfrmNewPortalMsgBase.sbtnAssignEmailToClick(Sender: TObject);
var
  AToID : real;
begin
  with PkTo do
    if Execute then
    begin
      AToID := GetValue('ID');

      // Check if user already sent a message; doing this clears the F_Default_PR_EMP_ID.  Reassign it here.
      if FDefaultToID = 0 then
        FDefaultToID := AToID;

      if GetValue('FULL_NAME') <> '' then
        edtTo.Text := edtTo.Text + GetValue('FULL_NAME') + '; '
      else
        edtTo.Text := edtTo.Text + FloattoStr(AToID);

      BuildAppendToList(AToID, F_To_List);
    end;
end;

procedure TfrmNewPortalMsgBase.sbtSendMesgClick(Sender: TObject);
var
  ANewID: real;
  ASentBy: string;
  ASent_Date: string;
  AToID: real;
  i: integer;
  AMessagesSentCount: integer;
begin
  if not CheckReadiness then
  begin
    IQInformation(IQMS.Common.HrRscstr.cTXT0000039);
    // Required fields ("To", "Subject", "Text")  have not been populated.  Please revise.
    Exit;
  end;

  ASentBy := SecurityManager.UserName;
  ASent_Date := SelectValueAsString('select sysdate from dual');
  AMessagesSentCount := 0;
  FNumAttachments := F_Attach_list.Lines.Count;
  F_SentAttachments_Count := 0;

  begin { main body }

    for i := 0 to F_To_List.Lines.Count - 1 do
    begin { loop }
      ANewID := GetNextID(FMesgTableName);

      AToID := StrToFloat(StrTran(F_To_List.Lines[i], #13, ''));
      // strips out carriage return at end

      if FMesgTableName = 'PR_EMP_MESSAGE' then
        { send main message to PR_EMP_MESSAGE }
        ExecuteCommandFmt(
          'INSERT INTO PR_EMP_MESSAGE ( ID, PR_EMP_ID, SENT_BY, SENT_DATE, OPENED, SUBJECT, MESSAGE ) '
          + 'VALUES (%.0f, %.0f, ''%s'', to_date(''%s'', ''MM/DD/YYYY hh24:mi:ss''), ''N'', ''%s'', ''%s'')',
          [ANewID, AToID, ASentBy, FormatDateTime('mm/dd/yyyy hh:nn:ss',
          StrToDateTime(ASent_Date)), IQMS.Common.StringUtils.FixStr(edtSubject.Text),
          IQMS.Common.StringUtils.FixStr(MemMessage.Lines.Text)])
      else
        { send main message to USER_MESSAGE }
        ExecuteCommandFmt(
        'INSERT INTO %s ( ID, %s, SOURCE, SENT_BY, SENT_DATE, OPENED, SUBJECT, MESSAGE ) '
        + 'VALUES (%.0f, %.0f, ''%s'',''%s'', to_date(''%s'', ''MM/DD/YYYY hh24:mi:ss''), ''N'', ''%s'', ''%s'')',
        [FMesgTableName, // USER_MESSAGE
        FMesgIDFieldName, // SOURCE_ID
        ANewID, FSourceID, FSource, ASentBy, FormatDateTime('mm/dd/yyyy hh:nn:ss',
        StrToDateTime(ASent_Date)), IQMS.Common.StringUtils.FixStr(edtSubject.Text),
        IQMS.Common.StringUtils.FixStr(MemMessage.Lines.Text)]);

      AMessagesSentCount := AMessagesSentCount + 1;

      { Attach files if applicable }
      if F_Attach_list.Text <> '' then
      begin
        AttachFilestoMessage(F_To_List.Lines.Count, ANewID, AToID);
      end;

    end; { loop }

    { check number of messages/attachments to verify sucess after all Winapi.Messages are sent }
    if (AMessagesSentCount = F_To_List.Lines.Count) and
      ((AMessagesSentCount * FNumAttachments) = F_SentAttachments_Count) then
    begin
      IQInformation('Message(s) sent successfully!');
      ClearFieldsandLists;
    end
    else
    begin
      IQError('Messages/attachments failed to send!');
      ClearFieldsandLists;
    end;

    if FCloseAfterSend then
      Close;
  end; { main body }
end;

procedure TfrmNewPortalMsgBase.UniFileUpload1Completed(Sender: TObject;
  AStream: TFileStream);
var
  AAttach_List : TStringList;
begin

      memAttachFiles.Lines.Text := memAttachFiles.Lines.Text +
        AStream.FileName + #13;
      BuildAppendAttachList(AStream.FileName, F_Attach_list);
end;

procedure TfrmNewPortalMsgBase.ViewSentMessages1Click(Sender: TObject);
begin
//Akim call a new unit
  DoSentPortalMessages; //IQMS.Payroll.ViewSentMessages.pas
end;

procedure TfrmNewPortalMsgBase.sbtAttachmentsClick(Sender: TObject);
begin
  UniFileUpload1.Execute;
end;

end.

unit IQMS.Payroll.NewPortalMessage;

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
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel,
  uniPageControl, uniMainMenu, uniFileUpload;

type
  TfrmNewPortalMsg = class(TUniForm)
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
    F_Default_PR_EMP_ID : real; //passed from Emp Maint
    F_To_List_File : string; //list of pr_emp.id's as text file
    F_Attachments_List_File : string; //list of attachments' full filenames as text file
    F_Current_User : string;
    F_File_Standardizer : string; //makes files unique
    FNumAttachments : integer;
    F_SentAttachments_Count : integer;
    function CheckReadiness : boolean;
    function GetEmpNamebyPrEmpID(APR_EMP_ID : real) : string;
    function MessageinProgress : boolean;
    function CanClose : boolean;
    procedure DoFormClose;
    function ConfirmSubmission(APR_EMP_MESSAGE_ID : real) : boolean;
    procedure ClearFieldsandLists;
    procedure AttachFilestoMessage( ARecipients : integer; APR_EMP_MESSAGE_ID, APR_EMP_ID : real);
    procedure BuildAttachedFilesList;
    procedure BuildAppendToList( APR_EMP_ID : real; ATo_List : TUniMemo);
    procedure BuildAppendAttachList( AFile : string; AAttach_List : TUniMemo);
    procedure SaveFiletoBlob( ATableName, AColumnName : string; AID : real; AFileName : string);
  public
    { Public declarations }
  end;

procedure DoNewPortalMessage( ATo_ID : real = 0);

var
  frmNewPortalMsg: TfrmNewPortalMsg;

implementation

{$R *.dfm}

uses
  IQMS.Common.HrRscstr,
  IQMS.WebVcl.Blob,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.StringUtils,
  IQMS.Payroll.ViewSentMessages;

{ TFrmNewPortalMsg }

procedure TfrmNewPortalMsg.DoFormClose;
begin
  ClearFieldsandLists;
  Destroy;
end;

procedure TfrmNewPortalMsg.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure DoNewPortalMessage( ATo_ID : real = 0);
begin
   with TFrmNewPortalMsg.Create(uniGUIApplication.UniApplication) do
   begin
      AdjustPageControlToParent( pcMain );  //when debugging, uncomment this so you can see hidden lists tab and switch between them

      if ATo_ID > 0 then
      F_Default_PR_EMP_ID := ATo_ID;
      edtTo.Text := GetEmpNamebyPrEmpID( ATo_ID ) + '; ' ; // token to separate names in list

      F_Current_User := SelectValueAsString('select misc.getusername from dual');
      BuildAppendToList( F_Default_PR_EMP_ID, F_To_List );
      Show;
   end;
end;

procedure TfrmNewPortalMsg.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TfrmNewPortalMsg.AttachFilestoMessage(ARecipients: integer;
                                                APR_EMP_MESSAGE_ID,
                                                APR_EMP_ID: real);
var
  i : integer;
  j : integer;
  ANextID : real;
  AFile_Name_Only : string;
begin
//With this prccedure, each recipient gets their own attachments, and each attachment
//has its own pr_emp_message_attach.id, but they share a common pr_emp_message_id.

FNumAttachments := F_Attach_List.Lines.Count;

    try
        for i := 0 to F_Attach_List.Lines.Count -1 do //for each entry in hidden memo field
        begin
        ANextID := GetNextID('PR_EMP_MESSAGE_ATTACH');

        AFile_Name_Only := Trim(ExtractFileName(F_Attach_List.Lines[i]));

        ExecuteCommandFmt('INSERT into PR_EMP_MESSAGE_ATTACH( ID, PR_EMP_MESSAGE_ID, FILE_NAME, PR_EMP_ID ) ' +
                  'VALUES ( %.0f, %.0f, ''%s'', %.0f)', [ ANextID,
                                                          APR_EMP_MESSAGE_ID,
                                                          IQMS.Common.StringUtils.FixStr(AFile_Name_Only),
                                                          APR_EMP_ID ]);

        SaveFiletoBLOB( 'PR_EMP_MESSAGE_ATTACH', 'FILE_DATA', ANextID, F_Attach_List.Lines[i]);

        F_SentAttachments_Count := F_SentAttachments_Count + 1;
        end;

    except on E:exception do
      begin
      //Inform after all have been attempted
      //If one fails don't abort all of the other ones
      end;
    end;
end;

procedure TfrmNewPortalMsg.BuildAppendAttachList(AFile: string;
  AAttach_List: TUniMemo);
var
  AList : TStringList;
begin

      case F_Attach_List.Text <> '' of

      True: //append to existing list
            begin
              F_Attach_List.Lines.Text := F_Attach_List.Lines.Text + AFile + #13;
            end;

      False: //build new List, assigning to Text property instead of lines clears all lines except for row 0
             begin
               F_Attach_List.Text := AFile + #13;
             end;
      end;

end;

procedure TfrmNewPortalMsg.BuildAppendToList(APR_EMP_ID: real; ATo_List: TUniMemo);
var
  AList : TStringList;
  APR_EMP_ID_String: string;
begin

APR_EMP_ID_String := FloattoStr( APR_EMP_ID );


      case F_To_List.Text <> '' of

      True: //append to existing list
            begin
              F_To_List.Lines.Text := F_To_List.Lines.Text + APR_EMP_ID_String + #13;
            end;

      False: //build new List, assigning to Text property instead of lines clears all lines except for row 0
            begin
              F_To_List.Text := APR_EMP_ID_String + #13;
            end;
      end;

end;


procedure TfrmNewPortalMsg.BuildAttachedFilesList;
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

function TfrmNewPortalMsg.CanClose: boolean;
begin
Result := True;

  if (MessageinProgress) then
  if not IQConfirmYN(IQMS.Common.HrRscstr.cTXT0000040) then //Message in progress... Abort?
  Result := False;
end;

function TfrmNewPortalMsg.CheckReadiness: boolean;
begin
  if (edtTo.Text = '') or
     (edtSubject.Text = '') or
     (MemMessage.Lines.Text = '') then
  Result := False
  else
  Result := True;
end;


procedure TfrmNewPortalMsg.ClearFieldsandLists;
begin
  edtTo.Clear;
  edtSubject.Clear;
  memAttachFiles.Lines.Clear;
  MemMessage.Lines.Clear;
  F_Default_PR_EMP_ID := 0;
  FNumAttachments := 0;
  F_SentAttachments_Count := 0;

  {reset hidden memos}
  F_To_List.Lines.Clear;
  F_Attach_List.Lines.Clear;
end;

function TfrmNewPortalMsg.ConfirmSubmission(APR_EMP_MESSAGE_ID: real): boolean;
begin
  if SelectValueFmtAsFloat( 'select 1 from pr_emp_message where id = %.0f', [APR_EMP_MESSAGE_ID]) = 1 then
  Result := True
  else
  Result := False;
end;

procedure TfrmNewPortalMsg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if CanClose then
  DoFormClose
  else
  Abort;
end;

function TfrmNewPortalMsg.GetEmpNamebyPrEmpID(APR_EMP_ID: real): string;
var AFullName : string;
    AUserID : string;
begin
  Result := '';
  //Try full name first, from Emp Maintenance
  AFullName := SelectValueFmtAsString('select substrB( IQMS.Common.StringUtils.Concat3w( First_Name, Middle_Name, Last_Name), 1, 255) from pr_emp where id = %.0f', [ APR_EMP_ID ]);

  if AFullName <> '' then
  Result := AFullName;

  if Result = '' then
  //Default to S_USER_GENERAL.USER_NAME
  AUserID := SelectValueFmtAsString('select user_name from s_user_general where pr_emp_id = %.0f', [ APR_EMP_ID ]);

  if (Result = '') and (AUserID <> '') then
  Result := AUserID;

  if (AFullName = '') and (AUserID = '') then
  Result := '';

end;

function TfrmNewPortalMsg.MessageinProgress: boolean;
begin
if   //(edtTo.Text <> '') or //Don't check the To box, it is populated automatically
     (edtSubject.Text <> '') or
     (MemAttachFiles.Lines.Text <> '') or
     (MemMessage.Lines.Text <> '') then
  Result := True
  else
  Result := False;
end;

procedure TfrmNewPortalMsg.SaveFiletoBlob(ATableName, AColumnName: string;
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

procedure TfrmNewPortalMsg.sbtnAssignEmailToClick(Sender: TObject);
var
  APR_EMP_ID : real;
begin
with PkTo do
if Execute then
begin
  APR_EMP_ID := GetValue('ID');

  //Check if user already sent a message; doing this clears the F_Default_PR_EMP_ID.  Reassign it here.
  if F_Default_PR_EMP_ID = 0 then F_Default_PR_EMP_ID := APR_EMP_ID;

  if GetValue('FULL_NAME') <> '' then
  edtTo.Text := edtTo.Text + GetValue('FULL_NAME') + '; '
  else
  edtTo.Text := edtTo.Text + FloattoStr( APR_EMP_ID );

  BuildAppendToList( APR_EMP_ID, F_To_List );
end;

end;

procedure TfrmNewPortalMsg.sbtSendMesgClick(Sender: TObject);
var
  ANewID : real;
  ASentBy : string;
  ASent_Date : string;
  APR_EMP_ID : real;
  i : integer;
  AMessagesSentCount : integer;
begin
  if not CheckReadiness then
  begin
     IQInformation(IQMS.Common.HrRscstr.cTXT0000039); //Required fields ("To", "Subject", "Text")  have not been populated.  Please revise.
     Exit;
  end;

  ASentBy    := SelectValueAsString('select misc.getusername from dual');
  ASent_Date := SelectValueAsString('select sysdate from dual');
  AMessagesSentCount := 0;
  FNumAttachments := F_Attach_List.Lines.Count;
  F_SentAttachments_Count := 0;

  begin {main body}

    for i := 0 to F_To_List.Lines.Count -1 do
    begin {loop}
        ANewID := GetNextID( 'PR_EMP_MESSAGE' );

        APR_EMP_ID := StrToFloat(StrTran(F_To_List.Lines[i], #13, '')); //strips out carriage return at end

        {send main message to PR_EMP_MESSAGE}
        ExecuteCommandFmt('INSERT INTO PR_EMP_MESSAGE ( ID, PR_EMP_ID, SENT_BY, SENT_DATE, OPENED, SUBJECT, MESSAGE ) ' +
                  'VALUES (%.0f, %.0f, ''%s'', to_date(''%s'', ''MM/DD/YYYY hh24:mi:ss''), ''N'', ''%s'', ''%s'')'
                 , [ANewID,
                    APR_EMP_ID,
                    ASentBy,
                    FormatDateTime('mm/dd/yyyy hh:nn:ss', StrToDateTime(ASent_Date)),
                    IQMS.Common.StringUtils.FixStr(edtSubject.Text),
                    IQMS.Common.StringUtils.FixStr(MemMessage.Lines.Text) ]);

        AMessagesSentCount := AMessagesSentCount + 1;

        {Attach files if applicable}
        if F_Attach_List.Text <> '' then
        begin
          AttachFilestoMessage( F_To_List.Lines.Count, ANewID, APR_EMP_ID );
        end;

    end;{loop}

   {check number of messages/attachments to verify sucess after all Winapi.Messages are sent}
   if (AMessagesSentCount = F_To_List.Lines.Count) and
     ((AMessagesSentCount * FNumAttachments) = F_SentAttachments_Count )  then
      begin
        IQInformation('Message(s) sent successfully!');
        ClearFieldsandLists;
      end
      else
      begin
        IQError('Messages/attachments failed to send!');
        ClearFieldsandLists;
        {Alex todo write to event log the to list and attachments list}
      end;
  end; {main body}
end;

procedure TfrmNewPortalMsg.UniFileUpload1Completed(Sender: TObject;
  AStream: TFileStream);
var
  AAttach_List : TStringList;
begin
  MemAttachFiles.Lines.Text := MemAttachFiles.Lines.Text + AStream.FileName + #13;
    BuildAppendAttachList( AStream.FileName, F_Attach_List );
end;

procedure TfrmNewPortalMsg.ViewSentMessages1Click(Sender: TObject);
begin
  DoSentPortalMessages; //IQMS.Payroll.ViewSentMessages.pas
end;

procedure TfrmNewPortalMsg.sbtAttachmentsClick(Sender: TObject);
begin
  UniFileUpload1.Execute
end;

end.

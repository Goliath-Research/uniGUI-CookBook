unit crm_massmail_eblaster;

interface

uses
  Winapi.Windows,
  System.Classes,
  System.SysUtils,
  IQMS.Common.ProgressDialog,
  FireDAC.Phys,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  MainModule;

type
  { TMessageFormat }
  TMessageFormat = (mmfHtml, mmfPlainText);

  { TMassMailStatus }
  TMassMailStatus = (mmsPending, mmsSent, mmsError);

  { TCloseNotesOption }
  TCloseNotesOption = (cnoDefault, cnoNo, cnoYes);

  { TRecipientKind }
  { NOTE:  Keep this list relative to the ItemIndex of lstList }
  TRecipientKind = (rkCRMGoups, rkCustomerContacts, rkPartnerContacts,
    rkVendorContacts, rkEmployees, rkOutlook, rkFile, rkTiers);

  { Forwards }
  TRecipientList = class;
  TRecipientListItem = class;

  { Callback events }
  TAfterSendMailItemEvent = procedure(AEmailAddress: string;
    AStatus: TMassMailStatus; AError: string) of object;
  TBeforeSendMailItemEvent = procedure(AEmailAddress: string) of object;
  TCheckStopProgressEvent = procedure(var AStop: Boolean) of object;
  TOnProgressEvent = procedure(APos, AMax: Integer;
    AMessage1, AMessage2: string) of object;
  TOnSendMassMailEmail = procedure(ASender, ARecipient, ASubject, ABodyText,
    AAttachments: string; AHTML: Boolean; var ASent: Boolean) of object;
  TOnSendError = procedure(AErrorMsg: string) of object;

  { TCreateMailingHistory }
  TMailingHistoryBatch = class(TComponent)
  strict private
    { Private declarations }
    FMailingHistoryID: Real;
    FDescription: string;
    FAttachments: TStringList;
    FBodyText: string;
    FRecipientKind: TRecipientKind;
    FDocumentFileName: string;
    FRecipientList: TRecipientList;
    FCampaignID: Real;
    FCommissionsID: Real;
    FMessageFormat: TMessageFormat;
    FCreateCRMNotes: Boolean;
    FSenderAddress: string;
    FSenderName: string;
    FMailingNote: string;
    FIsIQAlertAction: Boolean;
    FIQAlertEffectiveDate: TDateTime;
    FOnProgress: TOnProgressEvent;
    FCheckStopProgressEvent: TCheckStopProgressEvent;
    FCloseNotesOption: TCloseNotesOption;
    FTrackingPort: Integer;
    FTrackingServer: string;
    FTracking: Boolean;
    FMaxProgress: Integer;
    FCurProgress: Integer;
    FTransaction: TFDTransaction;
    // FProgressDialog: TProgressDialog; // in iqprogressdlg.pas
    procedure CreateHeader;
    procedure CreateRecipients;
    procedure CreateAttachments;
    procedure SetDescription(const Value: string);
    procedure SetDocumentFileName(const Value: string);
    procedure UpdateMessageTextField(const ATableName, ABodyText: string;
      const ATableID: Real);
    procedure SetMailingNote(const Value: string);
    function ConnectionName: string;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Reset;
    procedure Execute(var AMailingHistoryID: Real;
      ATransaction: TFDTransaction = nil);
    // Properties
    property MailingHistoryID: Real read FMailingHistoryID;
    property SenderName: string read FSenderName write FSenderName;
    property SenderAddress: string read FSenderAddress write FSenderAddress;
    property Description: string read FDescription write SetDescription;
    property DocumentFileName: string read FDocumentFileName
      write SetDocumentFileName;
    property BodyText: string read FBodyText write FBodyText;
    property Tracking: Boolean read FTracking write FTracking;
    property TrackingServer: string read FTrackingServer write FTrackingServer;
    property TrackingPort: Integer read FTrackingPort write FTrackingPort;
    property MessageFormat: TMessageFormat read FMessageFormat
      write FMessageFormat;
    property RecipientKind: TRecipientKind read FRecipientKind
      write FRecipientKind;
    property CampaignID: Real read FCampaignID write FCampaignID;
    property CommissionsID: Real read FCommissionsID write FCommissionsID;
    property RecipientList: TRecipientList read FRecipientList;
    property Attachments: TStringList read FAttachments;
    property CreateCRMNotes: Boolean read FCreateCRMNotes write FCreateCRMNotes;
    property MailingNote: string read FMailingNote write SetMailingNote;
    property CloseNotesOption: TCloseNotesOption read FCloseNotesOption
      write FCloseNotesOption;
    property IsIQAlertAction: Boolean read FIsIQAlertAction
      write FIsIQAlertAction;
    property IQAlertEffectiveDate: TDateTime read FIQAlertEffectiveDate
      write FIQAlertEffectiveDate;
    // Events
    property OnProgress: TOnProgressEvent read FOnProgress write FOnProgress;
    property CheckStopProgress: TCheckStopProgressEvent
      read FCheckStopProgressEvent write FCheckStopProgressEvent;
  end;

  { TRecipCargo - used when building the initial list }
  TRecipientListCargo = class
    SourceID: Real; // The ID of the Source table
    Source: string; // Table name, i.e., CRM_GROUP, or ARCUSTO, CONTACT, etc.
    ContactID: Real;
    Address: string;
    // if > '' then we are using an individual item, not a group
    Caption: string;
    // if a CRM Group then the name of the group; else, the name of the recipient
    constructor Create(ASourceID, AContactID: Real;
      ASource, AAddress, ACaption: string);
  end;

  { TAttachmentCargo }
  TAttachmentCargo = class
    FileName: TFileName;
    constructor Create(AFileName: TFileName);
  end;

  { TRecipientList }
  TRecipientList = class(TCollection)
  strict private
    { Private declarations }
    FMailingHistoryID: Real;
    function GetItems(index: Integer): TRecipientListItem;
    procedure SetItems(index: Integer; const Value: TRecipientListItem);
    function AddItem: TRecipientListItem;
  public
    { Public declarations }
    constructor Create(AMailingHistoryID: Real);
    function Add(ASource: string; ASourceID, AContactID: Real;
      AEmailAddress: string; ADisplayName: string): TRecipientListItem;
    function Find(const ASource: string; const ASourceID, AContactID: Real;
      AEmailAddress: string): TRecipientListItem;
    function IndexOf(const ASource: string;
      const ASourceID, AContactID: Real; AEmailAddress: string): Integer;
    property Items[index: Integer]: TRecipientListItem read GetItems
      write SetItems; default;
    procedure GetEmailList(AList: TStringList);
  published
    { Published declarations }
    property MailingHistoryID: Real read FMailingHistoryID
      write FMailingHistoryID;
  end;

  { TRecipientListItem }
  TRecipientListItem = class(TCollectionItem)
  strict private
    { Private declarations }
    FSource: string;
    FSourceID: Real;
    FContactID: Real;
    FDisplayName: string;
    FGUID: string;
    FEmailAddress: string;
  public
    { Public declarations }
    constructor Create(Collection: TCollection); override;
  published
    { Published declarations }
    property Source: string read FSource write FSource;
    property SourceID: Real read FSourceID write FSourceID;
    property ContactID: Real read FContactID write FContactID;
    property EmailAddress: string read FEmailAddress write FEmailAddress;
    property DisplayName: string read FDisplayName write FDisplayName;
    property GUID: string read FGUID;
  end;

function IsTrackingEnabled(var AServer: string; var APort: Integer): Boolean;
procedure UpdateAttachmentFileData(AFileNameAndPath: string;
  ACRMMailingAttachmentID: Int64; AConnectionName: string = 'IQFD');

const
  MessageFormatStr: array [TMessageFormat] of string = ('TEXT/HTML',
    'TEXT/PLAIN');
  MassMailStatusStr: array [TMassMailStatus] of string =
    ('Pending', 'Sent', 'Has Errors');
  RecipientKindSource: array [TRecipientKind] of string =
    ('CRM_GROUP', 'ARCUSTO', 'PARTNERS', 'VENDOR', 'PR_EMP',
    'OUTLOOK', 'FILE', 'CUST_TYPE');

const
  c_html_starttag: string[5] = '<HTML';
  c_html_endtag: string[7] = '</HTML>';
  c_body_starttag: string[5] = '<BODY';
  c_body_endtag: string[7] = '</BODY>';
  c_break: string[4] = #13#10#13#10;

implementation

uses
  crm_rscstr,
  IQMS.WebVcl.Blob,
  IQMS.Common.Boolean,
  IQMS.Common.ErrorDialog,
  IQMS.Common.FileUtils,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.StringUtils,
  Winapi.ActiveX;

{$REGION 'Global methods'}


function IsTrackingEnabled(var AServer: string; var APort: Integer): Boolean;
begin
  Result := False;
  AServer := '';
  APort := 0;
  with TFDQuery.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add('SELECT mail_tracking, iis_server_url,');
      SQL.Add('       iis_port');
      SQL.Add('  FROM iqsys2');
      SQL.Add(' WHERE ROWNUM < 2');
      try
        Open;
        if not (BOF and EOF) then
          begin
            Result := Fields[0].AsString = 'Y';
            AServer := System.SysUtils.ExcludeTrailingPathDelimiter
              (Fields[1].AsString);
            APort := Fields[2].AsInteger;
          end;
        Result := Result and (AServer > '') and (APort > 0);
      except
        Result := False;
      end;
    finally
      Free;
    end;
end;

procedure UpdateAttachmentFileData(AFileNameAndPath: string;
  ACRMMailingAttachmentID: Int64; AConnectionName: string);
const
  c_max_length: Integer = 255;
var
  AMemoryStream: TMemoryStream;
  AExt, AFileNameToSave: String;
begin
  if FileExists(AFileNameAndPath) then
    try
      AMemoryStream := TMemoryStream.Create;
      try
        AMemoryStream.LoadFromFile(AFileNameAndPath);
        // Save the image BLOB
        IQMS.WebVcl.Blob.TIQWebBlob.SaveBlob('file_data',
          'crm_mailing_attachment',
          ACRMMailingAttachmentID,
          AMemoryStream,
          AConnectionName); // iqblob
      finally
        if Assigned(AMemoryStream) then
          FreeAndNil(AMemoryStream);
      end;
    except
      on E: Exception do
        raise Exception.Create('Error updating image:'#13 + E.Message);
    end;
end;

{$ENDREGION 'Global methods'}

{$REGION 'Cargo objects'}

{ TRecipientListCargo }

constructor TRecipientListCargo.Create(ASourceID, AContactID: Real;
  ASource, AAddress, ACaption: string);
begin
  SourceID := ASourceID;
  ContactID := AContactID;
  Source := ASource;
  Address := AAddress;
  Caption := ACaption;
end;

{ TAttachmentCargo }

constructor TAttachmentCargo.Create(AFileName: TFileName);
begin
  FileName := AFileName;
end;

{$ENDREGION 'Cargo objects'}

{$REGION 'TMailingHistoryBatch'}

{ TMailingHistoryBatch }

constructor TMailingHistoryBatch.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAttachments := TStringList.Create;
  FRecipientList := TRecipientList.Create(0);
  Reset;
end;

destructor TMailingHistoryBatch.Destroy;
begin
  if Assigned(FRecipientList) then
    FreeAndNil(FRecipientList);
  if Assigned(FAttachments) then
    FreeAndNil(FAttachments);
  inherited Destroy;
end;

function TMailingHistoryBatch.ConnectionName: string;
begin
  if Assigned(FTransaction) then
    Result := FTransaction.Connection.ConnectionName
  else
    Result := UniMainModule.FDConnection1.ConnectionName;
end;

procedure TMailingHistoryBatch.Reset;
begin
  FMailingHistoryID := 0;
  FDescription := '';
  FBodyText := '';
  FDocumentFileName := '';
  FCampaignID := 0;
  FCommissionsID := 0;
  FMessageFormat := TMessageFormat(0);
  FRecipientKind := TRecipientKind(0);
  FAttachments.Clear;
  FRecipientList.Clear;
  FIsIQAlertAction := False;
  FIQAlertEffectiveDate := Now;
end;

procedure TMailingHistoryBatch.Execute(var AMailingHistoryID: Real;
  ATransaction: TFDTransaction);
begin
  FCurProgress := 0;
  FTransaction := ATransaction;
  FMaxProgress := FRecipientList.Count + 2;
  AMailingHistoryID := 0;

  if Assigned(FOnProgress) then
    // crm_rscstr.cTXT0001918 = 'Preparing mass mailing.  Please wait...';
    FOnProgress(FCurProgress, FMaxProgress, crm_rscstr.cTXT0001918, '');
  CreateHeader;
  Inc(FCurProgress);

  // crm_rscstr.cTXT0001826 = 'Building recipient list.  Please wait...';
  if Assigned(FOnProgress) then
    FOnProgress(FCurProgress, FMaxProgress, crm_rscstr.cTXT0001918, '');
  CreateRecipients;

  if Assigned(FOnProgress) then
    // crm_rscstr.cTXT0001946 = 'Preparing attachment list ...';
    FOnProgress(FCurProgress, FMaxProgress, crm_rscstr.cTXT0001918, '');
  CreateAttachments;
  Inc(FCurProgress);

  // Step progress bar
  if Assigned(FOnProgress) then
    FOnProgress(FMaxProgress, FMaxProgress, crm_rscstr.cTXT0001918, '');

  IQMS.Common.Miscellaneous.Delay(500);

  AMailingHistoryID := FMailingHistoryID;
end;

procedure TMailingHistoryBatch.SetDescription(const Value: string);
begin
  FDescription := IQMS.Common.StringUtils.LeftStr(Value, 250);
end;

procedure TMailingHistoryBatch.SetDocumentFileName(const Value: string);
begin
  FDocumentFileName := IQMS.Common.StringUtils.LeftStr(Value, 250);
end;

procedure TMailingHistoryBatch.SetMailingNote(const Value: string);
begin
  FMailingNote := IQMS.Common.StringUtils.LeftStr(Value, 4000);
end;

procedure TMailingHistoryBatch.CreateHeader;
var
  sl: TStringList;
begin
  FMailingHistoryID := GetNextID('CRM_MAILING'); // return value

  // Update the header record
  ExecuteCommandFmt(
    'INSERT INTO crm_mailing ' +
    '(id, type, description, filename, created, createdby, ' +
    'message_format, source_list_index, sender_name, sender_address, ' +
    'create_crm_notes, status) ' +
    'VALUES (%.0f, 1, ''%s'', ''%s'', SYSDATE, misc.getusername, ''%s'', ' +
    ' %d, ''%s'', ''%s'', ''%s'', 0)',
    [FMailingHistoryID, FixStr(Description), FixStr(DocumentFileName),
    MessageFormatStr[MessageFormat], Ord(RecipientKind),
    FixStr(SenderName), FixStr(SenderAddress),
    IQMS.Common.Boolean.BoolToYN(CreateCRMNotes)],
    ConnectionName,
    FTransaction);

  // Update the Campaign ID
  if CampaignID > 0 then
    ExecuteCommandFmt(
      'UPDATE crm_mailing SET campaign_id = %.0f WHERE id = %.0f',
      [CampaignID, FMailingHistoryID],
      ConnectionName,
      FTransaction);

  UpdateMessageTextField('crm_mailing', FBodyText, FMailingHistoryID);

  if FMailingNote > '' then
    ExecuteCommandParam(
      'UPDATE crm_mailing SET notes = :NOTES WHERE id = :ID',
      ['NOTES', 'ID;F'], [FMailingNote, FMailingHistoryID],
      ConnectionName,
      FTransaction);

  // 08/05/2014 Update the mailing with the "Close Notes" option
  // EIQ-3880 Add "Close on Creation" option to CRM's Mass Mailing Wizard-SER# 05811
  ExecuteCommandParam(
    'UPDATE crm_mailing SET close_notes = :CLOSE_NOTES WHERE id = :ID',
    ['CLOSE_NOTES;I', 'ID;F'], [Ord(CloseNotesOption), FMailingHistoryID],
    ConnectionName,
    FTransaction);

  if FIsIQAlertAction then
    begin
      ExecuteCommandParam(
        'UPDATE crm_mailing SET ' +
        'iqalert_action = ''Y'', ' +
        'iqalert_effective = :IQALERT_EFFECTIVE ' +
        'WHERE id = :ID',
        ['IQALERT_EFFECTIVE;D', 'ID;F'],
        [FIQAlertEffectiveDate, FMailingHistoryID],
        ConnectionName,
        FTransaction);
    end;
end;

procedure TMailingHistoryBatch.CreateRecipients;
var
  i, AMax: Integer;
  AID: Real;
  AGUID, AModBodyText: string;
  AStop: Boolean;
begin
  AStop := False;
  if FMailingHistoryID > 0 then
    begin
      AMax := FRecipientList.Count;
      for i := 0 to FRecipientList.Count - 1 do
        begin
          if Assigned(FCheckStopProgressEvent) then
            FCheckStopProgressEvent( { var } AStop);
          // Check to see if user pressed Cancel button
          if AStop then
            begin
              ExecuteCommandFmt(
                'DELETE FROM crm_mailing WHERE id = %.0f',
                [FMailingHistoryID],
                ConnectionName,
                FTransaction);
              FMailingHistoryID := 0;
              Break;
            end;

          Inc(FCurProgress);
          if Assigned(FOnProgress) then
            // crm_rscstr.cTXT0001918 = 'Preparing mass mailing.  Please wait...'
            FOnProgress(FCurProgress, FMaxProgress, crm_rscstr.cTXT0001918,
              FRecipientList.Items[i].DisplayName);

          // Add:  CRM Groups (CRM_GROUP)
          if CompareText(FRecipientList.Items[i].Source,
            RecipientKindSource[rkCRMGoups]) = 0 then
            begin
              with TFDStoredProc.Create(NIL) do
                try
                  ConnectionName := Self.ConnectionName;
                  Transaction := FTransaction;
                  StoredProcName := 'IQMS.IQCRM_MASSMAIL.ADD_GROUP_RECIP';
                  Prepare;
                  ParamByName('p_crm_mailing_id').Value := FMailingHistoryID;
                  ParamByName('p_crm_group_id').Value := FRecipientList.Items[i].SourceID;
                  ExecProc;
                finally
                  Free;
                end;
            end
            // Add:  Customers by Teir Type (CUST_TYPE)
          else if CompareText(FRecipientList.Items[i].Source,
            RecipientKindSource[rkTiers]) = 0 then
            begin
              with TFDStoredProc.Create(NIL) do
                try
                  ConnectionName := Self.ConnectionName;
                  Transaction := FTransaction;
                  StoredProcName := 'IQMS.IQCRM_MASSMAIL.ADD_CUST_TYPE_RECIP';
                  Prepare;
                  ParamByName('p_crm_mailing_id').Value := FMailingHistoryID;
                  ParamByName('p_cust_type_id').Value := FRecipientList.Items[i].SourceID;
                  ParamByName('p_commissions_id').Value := FCommissionsID;
                  ExecProc;
                finally
                  Free;
                end;
            end
            // rkOutlook, rkFile
          else if (CompareText(FRecipientList.Items[i].Source,
            RecipientKindSource[rkOutlook]) = 0) or
            (CompareText(FRecipientList.Items[i].Source,
            RecipientKindSource[rkFile]) = 0) then
            begin
              AID := GetNextID('CRM_MAILING_RECIPIENT', ConnectionName,
                FTransaction);
              with TFDStoredProc.Create(NIL) do
                try
                  ConnectionName := Self.ConnectionName;
                  Transaction := FTransaction;
                  StoredProcName := 'IQMS.IQCRM_MASSMAIL.ADD_LIST_RECIPIENT';
                  Prepare;
                  ParamByName('p_crm_mailing_recipient_id').Value := AID;
                  ParamByName('p_crm_mailing_id').Value := FMailingHistoryID;
                  ParamByName('p_display_name').Value := FRecipientList.Items[i].DisplayName;
                  ParamByName('p_address').Value := FRecipientList.Items[i].EmailAddress;
                  ExecProc;
                finally
                  Free;
                end;
            end
          else
            // Add:  Individual recipients
            begin
              AID := GetNextID('CRM_MAILING_RECIPIENT', ConnectionName,
                FTransaction);
              with TFDStoredProc.Create(NIL) do
                try
                  ConnectionName := Self.ConnectionName;
                  Transaction := FTransaction;
                  StoredProcName := 'IQMS.IQCRM_MASSMAIL.ADD_RECIPIENT';
                  Prepare;
                  ParamByName('p_crm_mailing_recipient_id').Value := AID;
                  ParamByName('p_crm_mailing_id').Value := FMailingHistoryID;
                  ParamByName('p_source').Value := FRecipientList.Items[i].Source;
                  ParamByName('p_source_id').Value := FRecipientList.Items[i].SourceID;
                  ParamByName('p_contact_id').Value := FRecipientList.Items[i].ContactID;
                  ExecProc;
                finally
                  Free;
                end;
            end;
        end;
    end;
end;

procedure TMailingHistoryBatch.CreateAttachments;
var
  i, ASize: Integer;
  AFileName: String;
  ANewID: Int64;
begin
  ASize := SelectValueAsInteger(
    'SELECT data_length FROM cols ' +
    'WHERE table_name = ''CRM_MAILING_ATTACHMENT'' AND ' +
    'column_name = ''FILENAME'' ',
    ConnectionName,
    FTransaction);
  if FMailingHistoryID > 0 then
    begin
      for i := 0 to FAttachments.Count - 1 do
        begin
          // Get the file name value
          AFileName := FAttachments.Strings[i];
          // If the file name and path are too long, try getting the short name
          if Length(AFileName) > ASize then
            AFileName := IQMS.Common.FileUtils.ShortDirectoryAndFileName(AFileName);
          // If it is still too lone, just grab the file name (damage control)
          if Length(AFileName) > ASize then
            AFileName := IQMS.Common.StringUtils.LeftStr
              (ExtractFileName(FAttachments.Strings[i]), ASize);
          // Get the next ID
          ANewID := GetNextID('crm_mailing_attachment',
            ConnectionName, FTransaction);

          // Add the record
          ExecuteCommandParam(
            'INSERT INTO crm_mailing_attachment ' +
            '(id, crm_mailing_id, filename, file_extension, file_data) ' +
            'VALUES (:ID, :CRM_MAILING_ID, :FILENAME, :FILE_EXTENSION, EMPTY_BLOB())',
            ['ID;INT64', 'CRM_MAILING_ID;INT64', 'FILENAME', 'FILE_EXTENSION'],
            [ANewID, Trunc(FMailingHistoryID), AFileName,
            ExtractFileExt(AFileName)],
            ConnectionName,
            FTransaction);
          // Load the binary file data
          UpdateAttachmentFileData(FAttachments.Strings[i], ANewID, ConnectionName);
        end;
    end;
end;

procedure TMailingHistoryBatch.UpdateMessageTextField(const ATableName,
  ABodyText: string; const ATableID: Real);
const
  c_max_buffer: Integer = 1000; // 3200;
var
  ASQL, AAppendText: string;
  p, n: Integer;
begin
  // Add the HTML text
  // Note:  Sometimes the full HTML text excedes a buffer limitation
  // in Delphi (whether that's the BDE or DBExpress, I'm not sure).
  // But we cannot just update the CLOB with the full text.  I found
  // that updating the field by chunks worked the best.  For huge files
  // it does take a couple of seconds
  ASQL := Format('UPDATE %s SET message_text = ' +
    'message_text || :TEXT WHERE id = :ID', [ATableName]);
  AAppendText := '';
  p := 1;
  n := Length(ABodyText);
  repeat
    AAppendText := Copy(ABodyText, p, c_max_buffer);
    ExecuteCommandParam(ASQL, ['TEXT;S', 'ID;F'],
      [AAppendText, ATableID],
      ConnectionName,
      FTransaction);
    Inc(p, c_max_buffer);
  until p > n;
end;

{$ENDREGION 'TMailingHistoryBatch'}

{$REGION 'TRecipientList'}
{ TRecipientList }

constructor TRecipientList.Create(AMailingHistoryID: Real);
begin
  inherited Create(TRecipientListItem);
  FMailingHistoryID := AMailingHistoryID;
end;

function TRecipientList.Add(ASource: string; ASourceID, AContactID: Real;
  AEmailAddress, ADisplayName: string): TRecipientListItem;
begin
  Result := Find(ASource, ASourceID, AContactID, AEmailAddress);
  if Result = nil then
    try
      BeginUpdate;
      Result := AddItem;
      Result.Source := ASource;
      Result.SourceID := ASourceID;
      Result.ContactID := AContactID;
      Result.EmailAddress := AEmailAddress;
      Result.DisplayName := ADisplayName;
    finally
      EndUpdate;
    end;
end;

function TRecipientList.AddItem: TRecipientListItem;
begin
  Result := TRecipientListItem(inherited Add)
end;

function TRecipientList.Find(const ASource: string; const ASourceID,
  AContactID: Real; AEmailAddress: string): TRecipientListItem;
var
  i: Integer;
begin
  Result := nil;
  i := IndexOf(ASource, ASourceID, AContactID, AEmailAddress);
  if i > - 1 then
    Result := Items[i];
end;

procedure TRecipientList.GetEmailList(AList: TStringList);
var
  i: Integer;
begin
  if Assigned(AList) then
    begin
      for i := 0 to Count - 1 do
        AList.Add(Items[i].EmailAddress);
    end;
end;

function TRecipientList.GetItems(index: Integer): TRecipientListItem;
begin
  Result := TRecipientListItem(inherited Items[index]);
end;

function TRecipientList.IndexOf(const ASource: string; const ASourceID,
  AContactID: Real; AEmailAddress: string): Integer;
var
  i: Integer;
begin
  Result := - 1;
  for i := 0 to Count - 1 do
    if (TRecipientListItem(Items[i]).Source = ASource) and
      (TRecipientListItem(Items[i]).SourceID = ASourceID) and
      (TRecipientListItem(Items[i]).ContactID = AContactID) and
      (CompareText(TRecipientListItem(Items[i]).EmailAddress,
      AEmailAddress) = 0) then
      begin
        Result := i;
        Break;
      end;
end;

procedure TRecipientList.SetItems(index: Integer;
  const Value: TRecipientListItem);
begin
  inherited Items[index] := Value;
end;

{ TRecipientListItem }

constructor TRecipientListItem.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FSource := '';
  FSourceID := 0;
  FContactID := 0;
  FDisplayName := '';
  FGUID := '';
  FEmailAddress := '';
end;

{$ENDREGION 'TRecipientList'}

end.

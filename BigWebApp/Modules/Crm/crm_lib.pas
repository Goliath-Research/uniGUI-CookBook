unit crm_lib;

{ Developer Note:
  This shared unit contains methods that do not reference other dfm units in
  crm or the core package.  The methods are are simple, informational, or
  even database related.  For instance, do not add crm_main.pas to the uses
  clause.
}
interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule;

{$REGION 'CRM Notes'}
function AddNote(ASource: string; ASourceID, AContactID: Real; ASubject,
  AText: string; AArchived: Boolean; ACampaignID: Real = 0): Real; overload;
procedure AddNote(ASource: string; ASourceID, AContactID: Real; ASubject,
  AText: string; AArchived: Boolean;
  AAttachments: TStringList; ACampaignID: Real = 0); overload;
procedure AddGroupNote(AGroupID: Real; ASubject, AText: string;
  AArchived: Boolean;
  ACampaignID: Real = 0);
{$ENDREGION 'CRM Notes'}

procedure AddAttachmentsList(AActivityID: Real; AAttachments: TStringList);

{$REGION 'CRM Groups'}
function AddToGroupByID(ASource: string; ASourceID, AContactID: Real;
  AGroupID: Real): Boolean;
{$ENDREGION 'CRM Groups'}

// Numbers
// function GetFloatFromString(S: string): Real;

// Returns a parent or master id for the values that are passed.
// For instance, if this is a CONTACT record, the function returns the ARCUSTO.ID
function GetContextMasterID(AContactTable: string; AContactID: Real): Real;

{$REGION 'Source documents'}
// Source docs
procedure AddCRMActivitySourceDoc(ACRMActivityID: Real; ASource: string;
  ASourceID: Real);
{$ENDREGION 'Source documents'}

{$REGION 'CRM Mailing'}
// CRM Mailing:  These methods record a "mailing," whether it was a mailing
// from Mail Merge or from the Mass Mailer.  The general idea
// is to record in the database what was sent and to whom.
// How to Use:   First call the appropriate method to create the main mailing
// record -- DocumentMailing_MailMerge or DocumentMailing_MassMail.
// Next, cycle the list of recipients and add them, passing the
// CRM_MAILING_ID returned from the main method.
function DocumentMailing_MailMerge(ADescription, ADocumentFileName: string;
  AAttachmentList: TStringList; ASourceListIndex: Integer; ACampaignID: Real)
  : Real; // returns CRM_MAILING_ID
function DocumentMailing_MassMail(ADescription: string;
  ADocumentFileName: string;
  AHTMLText: TStringList; ASourceListIndex: Integer; AMessageFormat: string;
  ACampaignID: Real): Real; // returns CRM_MAILING_ID
procedure DocumentMailing_AddRecipient(ACRMMailingID: Real; ASource: string;
  ASourceID, AContactID: Real); overload;
procedure DocumentMailing_AddRecipient(ACRMMailingID: Real;
  ACaption, AEMail: string); overload;
function SourceExists(ASource: string; ASourceID, AContactID: Real): Boolean;
{$ENDREGION 'CRM Mailing'}

implementation

uses
  crm_activity_dblib,
  crm_rscstr,
  IQMS.Common.Dates,
  IQMS.Common.ErrorDialog,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  IQMS.Common.PanelMsg,
  IQMS.Common.PrincipalSource;

procedure AddNote(ASource: string; ASourceID, AContactID: Real; ASubject,
  AText: string; AArchived: Boolean; AAttachments: TStringList;
  ACampaignID: Real); overload;
var
  AActivityID: Real;
  i: Integer;
begin
  AActivityID := AddNote(ASource, ASourceID, AContactID, ASubject, AText,
    AArchived, ACampaignID);
  if AAttachments <> nil then
    AddAttachmentsList(AActivityID, AAttachments);
end;

function AddNote(ASource: string; ASourceID, AContactID: Real; ASubject,
  AText: string; AArchived: Boolean; ACampaignID: Real): Real;
var
  ARegarding, ASourceDisp, ADateStr, AArchivedStr: string;
  AActivityID: Real; // new crm_activity.id
begin
  // 10/14/2010 Initialize
  Result := 0;

  if Trim(ASource) = '' then
    Exit;

  if SelectValueFmtAsInteger('SELECT 1 FROM %s WHERE id = %.0f',
    [ASource, ASourceID]) = 0 then
    Exit;

  // Values for the query
  AActivityID := GetNextID('CRM_ACTIVITY');
  Result := AActivityID;

  with TFDStoredProc.Create(nil) do
    try
      ConnectionName := 'IQFD';
      StoredProcName := 'IQMS.IQCRM.ADD_NOTE';
      Prepare;
      ParamByName('v_new_id').Value := AActivityID;
      ParamByName('v_source').Value := ASource;
      ParamByName('v_source_id').Value := ASourceID;
      ParamByName('v_contact_id').Value := AContactID;
      ParamByName('v_subject').Value := ASubject;
      ParamByName('v_regarding').Value := AText;
      ExecProc;
    finally
      Free;
    end;

  ExecuteCommandParam(
    'UPDATE crm_activity '#13 +
    '  SET campaign_id = DECODE(NVL(:CAMPAIGN_ID,0), 0, NULL, :CAMPAIGN_ID)'#13 +
    'WHERE id = :ID',
    ['CAMPAIGN_ID;F', 'CAMPAIGN_ID;F', 'ID;F'],
    [ACampaignID, ACampaignID, AActivityID]);

  if AArchived then
    ExecuteCommandFmt(
      'UPDATE crm_activity '#13 +
      '  SET archived = ''Y'' '#13 +
      'WHERE id = %.0f',
      [AActivityID]);
end;

procedure AddGroupNote(AGroupID: Real; ASubject, AText: string;
  AArchived: Boolean; ACampaignID: Real);
var
  AActivityID: Real;
begin
  with TFDStoredProc.Create(nil) do
    try
      ConnectionName := 'IQFD';
      StoredProcName := 'IQMS.IQCRM.ADD_GROUP_NOTE';
      Prepare;
      ParamByName('v_crm_group_id').Value := Trunc(AGroupID);
      ParamByName('v_subject').Value := ASubject;
      ParamByName('v_regarding').Value := AText;
      ParamByName('v_archived').Value := IQMS.Common.Numbers.sIIf(AArchived, 'Y', 'N');
      ParamByName('v_campaign_id').Value := Trunc(ACampaignID);
      ExecProc;
    finally
      Free;
    end;
end;

procedure AddAttachmentsList(AActivityID: Real; AAttachments: TStringList);
var
  i, ASeq: Integer;
  AFileName, ADescrip: string;
begin
  if AAttachments = nil then
    Exit;

  if SelectValueFmtAsInteger(
    'SELECT 1 FROM crm_activity WHERE id = %.0f',
    [AActivityID]) = 0 then
    Exit;

  for i := 0 to AAttachments.Count - 1 do
    begin
      ASeq := SelectValueFmtAsInteger(
        'SELECT NVL(MAX(DISTINCT seq), 0) + 1 ' +
        'FROM crm_ext_doc ' +
        'WHERE parent_id = %.0f',
        [AActivityID]);
      AFileName := FixStr(Trim(LeftStr(AAttachments.Strings[i], 150)));
      ADescrip := FixStr(LeftStr(ExtractFileName(AFileName), 30));
      if AFileName = '' then
        CONTINUE; // avoid the NOT NULL exception
      ExecuteCommandFmt(
        'INSERT INTO crm_ext_doc ' +
        '(parent_id, seq, filename, descrip) ' +
        'VALUES (%.0f, %d, ''%s'', ''%s'')',
        [AActivityID, ASeq,
        AFileName,
        FixStrMemo(ExtractFileName(AFileName), 30)]);
    end;
end;

function GetContextMasterID(AContactTable: string; AContactID: Real): Real;
begin
  if AContactTable = 'CONTACT' then
    Result := SelectValueFmtAsInt64(
      'SELECT arcusto_id FROM contact WHERE id = %.0f',
      [AContactID])
  else if AContactTable = 'VENDOR_CONTACT' then
    Result := SelectValueFmtAsInt64(
      'SELECT vendor_id FROM vendor_contact WHERE id = %.0f',
      [AContactID])
  else if AContactTable = 'PARTNER_CONTACTS' then
    Result := SelectValueFmtAsInt64(
      'SELECT partner_id FROM partner_contacts WHERE id = %.0f',
      [AContactID])
  else
    Result := 0;
end;

function AddToGroupByID(ASource: string; ASourceID, AContactID: Real;
  AGroupID: Real): Boolean;
var
  ASourceDisp: string;
  AEMail: string;
  AID: Real;
begin
  Result := False;
  if AGroupID = 0 then
    Exit;
  // NOTE:  Must put a version of these functions into crmlib and keep them strictly basic
  ASourceDisp := IQMS.Common.PrincipalSource.GetShortDisplay(ASource, ASourceID,
    AContactID);
  AEMail := GetEMail(ASource, ASourceID, AContactID); // crm_context

  AID := SelectValueFmtAsInt64(
    'SELECT id FROM crm_group_dtl WHERE source = ''%s'' ' +
    'and source_id = %.0f and contact_id = %.0f and crm_group_id = %.0f',
    [ASource, ASourceID, AContactID, AGroupID]);
  // Group member does not exist, add it.
  if (AID = 0) then
    begin
      AID := GetNextID('CRM_GROUP_DTL');
      ExecuteCommandFmt(
        'INSERT INTO crm_group_dtl ' +
        '(id, crm_group_id, created, source, source_id, contact_id) ' +
        'values ' +
        '(%.0f, %.0f, to_date(''%s'', ''MM/DD/RRRR HH24:MI''), ' +
        ' ''%s'', %.0f, decode(NVL(%.0f, 0), 0, NULL, %.0f))',
        [AID, AGroupID,
        FormatDateTime('mm/dd/yyyy hh:nn', IQOracleAdjustedDateTime),
        ASource, ASourceID, AContactID, AContactID]);
      ExecuteCommandFmt
        ('begin iqms.iqcrm.update_groupdtl_disp(%.0f); end;', [AID]);
    end
    // Group member exists, update
  else
    ExecuteCommandFmt('begin iqms.iqcrm.update_groupdtl_disp(%.0f); end;',
      [AID]);

  Result := True;
end;

procedure AddCRMActivitySourceDoc(ACRMActivityID: Real; ASource: string;
  ASourceID: Real);
var
  ANewID: Real;
  ASourceDisplay: string;
begin
  ExecuteCommandFmt(
    'BEGIN iqms.source_doc.add_source_doc(%d, ''%s'', %d); END;  ',
    [Trunc(ACRMActivityID), ASource, Trunc(ASourceID)]);

  { Source Strings: the Oracle table name.
    Source ID: the id in the table
    Source Display:
    ARINVT = 'Inventory # ' || a.itemno
    STANDARD = 'BOM # ' || standard.mfgno
    RMA = 'RMA # ' || r.rmano
    CAR = 'CAR # ' || carno
    SHIPMENTS = 'Packing Slip # ' || packslipno
    ARINVOICE = 'AR Invoice # ' || p.invoice_no
    ORDERS = 'Order # ' || s.orderno
    BOL = 'BOL # ' || bolno
    PO = 'PO # ' || p.pono
  }
{
  if ASource = 'ARINVT' then
    ASourceDisplay := SelectValueFmtAsString(
      'SELECT ''Inventory # '' || itemno as sourcedisp FROM arinvt WHERE id = %.0f',
      [ASourceID])
  else if ASource = 'STANDARD' then
    ASourceDisplay := SelectValueFmtAsString(
      'SELECT ''BOM # '' || mfgno as sourcedisp FROM standard WHERE id = %.0f',
      [ASourceID])
  else if ASource = 'RMA' then
    ASourceDisplay := SelectValueFmtAsString(
      'SELECT ''RMA # '' || rmano as sourcedisp FROM rma WHERE id = %.0f',
      [ASourceID])
  else if ASource = 'CAR' then
    ASourceDisplay := SelectValueFmtAsString(
      'SELECT ''CAR # '' || carno as sourcedisp FROM car WHERE id = %.0f',
      [ASourceID])
  else if ASource = 'SHIPMENTS' then
    ASourceDisplay := SelectValueFmtAsString(
      'SELECT ''Packing Slip # '' || packslipno as sourcedisp FROM shipments WHERE id = %.0f',
      [ASourceID])
  else if ASource = 'ARINVOICE' then
    ASourceDisplay := SelectValueFmtAsString(
      'SELECT ''AR Invoice # '' || invoice_no as sourcedisp FROM arinvoice WHERE id = %.0f',
      [ASourceID])
  else if ASource = 'ORDERS' then
    ASourceDisplay := SelectValueFmtAsString
      ('SELECT ''Order # '' || orderno as sourcedisp FROM orders WHERE id = %.0f',
      [ASourceID])
  else if ASource = 'BOL' then
    ASourceDisplay := SelectValueFmtAsString(
      'SELECT ''BOL # '' || bolno as sourcedisp FROM bol WHERE id = %.0f',
      [ASourceID])
  else if ASource = 'PO' then
    ASourceDisplay := SelectValueFmtAsString(
      'SELECT ''PO # '' || pono as sourcedisp FROM po WHERE id = %.0f',
      [ASourceID])
  else
    ASourceDisplay := 'Unknown';

  ANewID := GetNextID('SRC_DOCS');
  ExecuteCommandFmt(
    'INSERT INTO src_docs ' +
    '  (ID, PARENT_NAME, PARENT_ID, SOURCE, SOURCE_ID, SOURCE_DISP) ' +
    'values ' +
    ' (%.0f, ''CRM_ACTIVITY'', %.0f, ''%s'', %.0f, ''%s'')',
    [ANewID, ACRMActivityID, ASource, ASourceID, ASourceDisplay]);
  Result := ANewID;
  }
end;

function DocumentMailing_MailMerge(ADescription, ADocumentFileName: string;
  AAttachmentList: TStringList; ASourceListIndex: Integer; ACampaignID: Real)
  : Real; // returns CRM_MAILING_ID
var
  AID: Real;
  i: Integer;
  ATemp: string;
begin
  Result := 0;

  if not (ASourceListIndex in [1 .. 8]) then
    Exit;

  AID := GetNextID('CRM_MAILING'); // return value
  ADescription := LeftStr(Trim(ADescription), 250);
  ADocumentFileName := LeftStr(Trim(ADocumentFileName), 250);

  ExecuteCommandFmt(
    'INSERT INTO crm_mailing ' +
    '(id, type, description, filename, created, createdby, source_list_index) ' +
    'VALUES (%.0f, 0, ''%s'', ''%s'', to_date(''%s'', ''MM/DD/RRRR HH24:MI''), ''%s'', %d)',
    [AID, FixStr(ADescription), FixStr(ADocumentFileName),
    FormatDateTime('mm/dd/yyyy hh:nn', IQOracleAdjustedDateTime),
    SecurityManager.UserName, ASourceListIndex]);

  if ACampaignID > 0 then
    ExecuteCommandFmt(
      'UPDATE crm_mailing set campaign_id = %.0f WHERE id = %.0f',
      [ACampaignID, AID]);

  Result := AID;

  // Add the attachments
  if AAttachmentList <> nil then
    try
      for i := 0 to AAttachmentList.Count - 1 do
        begin
          ATemp := AAttachmentList.Strings[i];
          ExecuteCommandFmt(
            'INSERT INTO crm_mailing_attachment ' +
            '(id, crm_mailing_id, filename) ' +
            'VALUES (s_crm_mailing_attachment.nextval, %.0f, ''%s'')',
            [AID, ATemp]);
        end;
    except
      on E: Exception do
        // crm_rscstr.cTXT0000316 =
        // 'Error adding attachment to mailing history.'
        // crm_rscstr.cTXT0000317 =
        // 'Attachment #: %d'#13'File Name: %s'
        ShowIQErrorMessageA(crm_rscstr.cTXT0000316, E.Message,
          Format(crm_rscstr.cTXT0000317, [i + 1, ATemp]));
    end;
end;

function DocumentMailing_MassMail(ADescription: string;
  ADocumentFileName: string;
  AHTMLText: TStringList; ASourceListIndex: Integer;
  AMessageFormat: string; ACampaignID: Real): Real; // returns CRM_MAILING_ID
const
  c_max_buffer: Integer = 2000;
var
  AID: Real;
  p, n: Integer;
  ABodyText, AAppendText: string;
  hMsg: TPanelMesg;
begin
  Result := 0;
  AID := GetNextID('CRM_MAILING'); // return value
  ADescription := LeftStr(Trim(ADescription), 250);
  ADocumentFileName := LeftStr(Trim(ADocumentFileName), 250);

  ExecuteCommandFmt(
    'INSERT INTO crm_mailing ' +
    '(id, type, description, filename, created, createdby, ' +
    'message_format, source_list_index) ' +
    'VALUES (%.0f, 1, ''%s'', ''%s'', to_date(''%s'', ' +
    '''MM/DD/RRRR HH24:MI''), ''%s'', ''%s'', %d)',
    [AID, FixStr(ADescription), FixStr(ADocumentFileName),
    FormatDateTime('mm/dd/yyyy hh:nn', IQOracleAdjustedDateTime),
    SecurityManager.UserName, AMessageFormat, ASourceListIndex]);
  Result := AID;

  // Update the Campaign ID
  if ACampaignID > 0 then
    ExecuteCommandFmt(
      'UPDATE crm_mailing set campaign_id = %.0f WHERE id = %.0f',
      [ACampaignID, AID]);

  // Add the HTML text
  // Note:  Sometimes the full HTML text excedes a buffer limitation
  // in Delphi (whether that's the BDE or DBExpress, I'm not sure).
  // But we cannot just update the CLOB with the full text.  If found
  // that updating the field by chunks worked the best.  For huge files
  // it does take a couple of seconds
  if AHTMLText <> nil then
    try
      hMsg := hPleaseWait('');
      try
        ABodyText := AHTMLText.Text;
        AAppendText := '';
        p := 1;
        n := Length(ABodyText);
        repeat
          AAppendText := Copy(ABodyText, p, c_max_buffer);
          ExecuteCommandParam(
            'UPDATE crm_mailing SET message_text = ' +
            'message_text || :TEXT ' +
            'WHERE id = :ID', ['TEXT;S', 'ID;F'], [AAppendText, AID]);
          Inc(p, c_max_buffer);
        until p > n;
      finally
        if Assigned(hMsg) then
          FreeAndNil(hMsg);
      end;
    except
      on E: Exception do
        // crm_rscstr.cTXT0000318 =
        // 'Error adding HTML text to mailing history.'
        ShowIQErrorMessageA(crm_rscstr.cTXT0000318, E.Message, ''); // iqerrdlg
    end;
end;

procedure DocumentMailing_AddRecipient(ACRMMailingID: Real; ASource: string;
  ASourceID, AContactID: Real);
begin
  if (Trim(ASource) > '') or (ASourceID > 0) then
    try
      // Fix a common source text error
      if ASource = 'CRM_GROUPS' then
        ASource := 'CRM_GROUP';

      // CRM Groups:  A group of sources
      if (ASource = 'CRM_GROUP') then
        begin
          with TFDStoredProc.Create(NIL) do
            try
              ConnectionName := 'IQFD';
              StoredProcName := 'IQMS.IQCRM_MASSMAIL.ADD_GROUP_RECIP';
              Prepare;
              ParamByName('p_crm_mailing_id').Value := Trunc(ACRMMailingID);
              ParamByName('p_crm_group_id').Value := Trunc(ASourceID);
              ExecProc;
            finally
              Free;
            end;
        end
      else
        begin
          if SourceExists(ASource, ASourceID, AContactID) then
            ExecuteCommandFmt(
              'BEGIN iqms.iqcrm_massmail.add_recipient(%d, %.0f, ''%s'', %.0f, %.0f); END;',
              [GetNextID('crm_mailing_recipient'), ACRMMailingID, ASource,
              ASourceID, AContactID]);
        end;
    except
      on E: Exception do
        // crm_rscstr.cTXT0000320 =
        // 'Error adding recipient to mailing history.'
        // crm_rscstr.cTXT0000321 =
        // 'CRM Mailing Record ID [CRM_MAILING.ID]: %.0f'#13
        // 'Source: %s'#13'Source ID: %.0f'#13'Contact ID: %.0f' }
        ShowIQErrorMessageA(crm_rscstr.cTXT0000320, E.Message,
          Format(crm_rscstr.cTXT0000321, [ACRMMailingID, ASource, ASourceID,
          AContactID])); // iqerrdlg
    end;
end;

procedure DocumentMailing_AddRecipient(ACRMMailingID: Real;
  ACaption, AEMail: string); overload;
var
  ASeq: Integer;
  ARecipientID: Real;
begin
  try
    // Get the recipient ID.  We pass this to the procedure to update the source display
    ARecipientID := GetNextID('CRM_MAILING_RECIPIENT');
    // Get the next sequence number
    ASeq := SelectValueFmtAsInteger('SELECT MAX(distinct seq) ' +
      'FROM crm_mailing_recipient WHERE crm_mailing_id = %.0f',
      [ACRMMailingID]) + 1;

    ExecuteCommandFmt(
      'INSERT INTO crm_mailing_recipient ' +
      '(id, crm_mailing_id, seq, principle_source_disp, ' +
      'principle_contact_email) ' +
      'VALUES (%.0f, %.0f, %d, ''%s'', ''%s'') ',
      [ARecipientID, ACRMMailingID, ASeq, ACaption, AEMail]);
  except
    on E: Exception do
      // crm_rscstr.cTXT0000320 =
      // 'Error adding recipient to mailing history.'
      // crm_rscstr.cTXT0000322 =
      // 'CRM Mailing Record ID [CRM_MAILING.ID]: %.0f'#13
      // 'Caption: %s'#13'Email: %s'
      IQMS.Common.ErrorDialog.ShowIQErrorMessageA(crm_rscstr.cTXT0000320, E.Message,
        Format(crm_rscstr.cTXT0000322, [ACRMMailingID, ACaption, AEMail]));
  end;
end;

function SourceExists(ASource: string; ASourceID, AContactID: Real): Boolean;
var
  AContactTableName: string;
begin
  if AContactID > 0 then
    begin
      if ASource = 'ARCUSTO' then
        AContactTableName := 'CONTACT'
      else if ASource = 'VENDOR' then
        AContactTableName := 'VENDOR_CONTACT'
      else if ASource = 'PARTNER' then
        AContactTableName := 'PARTNER_CONTACTS'
      else
        Exit(False);

      Result := SelectValueFmtAsInteger(
        'SELECT 1 FROM %s WHERE id = %.0f',
        [ASource, ASourceID]) > 0;
      if Result then
        Result := SelectValueFmtAsInteger(
          'SELECT 1 FROM %s WHERE id = %.0f',
          [AContactTableName, AContactID]) > 0;
    end
  else
    Result := SelectValueFmtAsInteger(
      'SELECT 1 FROM %s WHERE id = %.0f',
      [ASource, ASourceID]) > 0;
end;

end.

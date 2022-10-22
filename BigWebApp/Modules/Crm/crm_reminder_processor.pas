unit crm_reminder_processor;

{$I Compilers_.inc}

interface

uses
  Vcl.Forms,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule;

type
  ICRMReminderProcessor = interface
    ['{673AB84C-88A0-4602-9FF9-DAA4EA8AF257}']
    procedure Execute;
  end;

type
  { TOnSendEmail }
  TOnSendEmail = reference to procedure(ARecordID: Int64; ATo, ASubject, ABody: string);
  TOnSendError = reference to procedure(AErrorMsg: string);

  { TCRMAlertEmailer }
  TCRMReminderProcessor = class(TInterfacedObject, ICRMReminderProcessor)
  strict private
    { Private declarations }
    FOnSendEmail: TOnSendEmail;
    FUserName: string;
    FQuery: TFDQuery;
    FOnSendError: TOnSendError;
    procedure AddRegardingToList(const ACRMActivityID: Real;
      var AList: TStringList);
    procedure GetOthersInvolved(const ACRMActivityID: Real;
      var AList: TStringList);
    function HasAlertsToSend: Boolean;
    procedure OpenQuery;
    procedure BuildBodyText(var ABodyText: TStringList);
    procedure ResetFlag;
    procedure SetUserName(const Value: string);
    procedure GetEmailSubject(var AEmailSubject: string);
    procedure SendMail(ATo, ASubject, ABody: string);
  public
    { Public declarations }
    constructor Create(const AUserName: string; AOnSendEmail: TOnSendEmail;
      AOnSendError: TOnSendError);
    destructor Destroy; override;
    procedure Execute;

    property UserName: string read FUserName write SetUserName;
    // property OnSendEmail: TOnSendEmail read FOnSendEmail write FOnSendEmail;
    // property OnSendError: TOnSendError read FOnSendError write FOnSendError;
  end;

implementation

uses
  crm_rscstr,
  crm_strings,
  IQMS.Common.EmailUtils,
  IQMS.Common.StringUtils,
  IQMS.Common.Dates,
  IQMS.Common.DataLib,
  IQMS.Common.HTMLConverter;

{$REGION 'TCRMReminderProcessor'}

{ TCRMReminderProcessor }

constructor TCRMReminderProcessor.Create(const AUserName: string; AOnSendEmail: TOnSendEmail;
  AOnSendError: TOnSendError);
begin
  inherited Create;
  FUserName := AUserName;
  FOnSendEmail := AOnSendEmail;
  FOnSendError := AOnSendError;
  FQuery := TFDQuery.Create(nil);
end;

destructor TCRMReminderProcessor.Destroy;
begin
  if Assigned(FQuery) then
    FreeAndNil(FQuery);
  inherited Destroy;
end;

procedure TCRMReminderProcessor.Execute;
var
  AEmailSubject: string;
  ABodyText: TStringList;
  ABodyHtml: string;
  ACursor: Integer;
begin
  // Suppress the SQL Wait cursor
  ACursor := Screen.Cursors[Vcl.Controls.crSQLWait];
  try
    Screen.Cursors[crSQLWait] := Screen.Cursors[Vcl.Controls.crArrow];
    // Quickly check if there are any alerts to send...
    if HasAlertsToSend then
      try
        // Create the string list that will hold the email body text
        ABodyText := TStringList.Create;
        try
          // Open the query. This is the FQuery object shared within
          // this component.
          OpenQuery;
          // Loop the query records, build the reminder email text,
          // and send the email.
          while not FQuery.EOF do
          begin
            // Build the email subject
            GetEmailSubject( { var } AEmailSubject);
            // Get the body text
            BuildBodyText(ABodyText);
            // Convert to HTML so that line breaks appear
            ABodyHtml := THtmlConverter.AsHtmlString(ABodyText);
            // If the event is assigned allowing us to send the email,
            // then send it (execute the event method), and then
            // reset the flag on the activity.
            if Assigned(FOnSendEmail) then
              // Send the email!
              FOnSendEmail(
                FQuery.FieldByName('ID').AsLargeInt,
                FQuery.FieldByName('EMAIL').AsString,
                AEmailSubject, FixStr(ABodyHtml))
            else
              SendMail(FQuery.FieldByName('EMAIL').AsString,
                AEmailSubject, FixStr(ABodyHtml));
            // Reset the flag on the activity
            ResetFlag;
            // Next record
            FQuery.Next;
            // Allow the application to process clicks, other
            // events, etc.  We do this so that this can run
            // in a thread and not tie up everything else.
            Application.ProcessMessages;
          end;
        finally
          // Free memory
          if Assigned(ABodyText) then
            FreeAndNil(ABodyText);
        end;
      except
        on E: Exception do
        begin
          if Assigned(FOnSendError) then
            FOnSendError(E.Message);
          System.SysUtils.Abort; // error handled
        end;
      end;
  finally
    // Reset Delphi's ugly SQL cursor.  This is necessary,
    // or SQL wait will appear again.
    Screen.Cursor := Vcl.Controls.crArrow;
    Screen.Cursors[Vcl.Controls.crSQLWait] := ACursor;
  end;
end;

function TCRMReminderProcessor.HasAlertsToSend: Boolean;
begin
  if FUserName > '' then
    Result := SelectValueParam(
      'SELECT 1'#13 +
      '  FROM crm_notify'#13 +
      ' WHERE alert_datetime <= :ALERT_DATETIME AND'#13 +
      '       assignedto = :ASSIGNEDTO AND'#13 +
      '       NVL(send_mail, ''N'') = ''Y'' AND'#13 +
      '       TRIM(email) IS NOT NULL AND'#13 +
      '       ROWNUM < 2',
      ['ALERT_DATETIME;D', 'ASSIGNEDTO;S'],
      [IQMS.Common.Dates.IQOracleAdjustedDateTime, FUserName]) = 1
  else
    Result := SelectValueParam(
      'SELECT 1'#13 +
      '  FROM crm_notify'#13 +
      ' WHERE alert_datetime <= :ALERT_DATETIME AND'#13 +
      '       NVL(send_mail, ''N'') = ''Y'' AND'#13 +
      '       TRIM(email) IS NOT NULL AND'#13 +
      '       ROWNUM < 2',
      ['ALERT_DATETIME;D'],
      [IQMS.Common.Dates.IQOracleAdjustedDateTime]) = 1;
end;

procedure TCRMReminderProcessor.OpenQuery;
begin
  if not Assigned(FQuery) then
    FQuery := TFDQuery.Create(nil);
  if FQuery.Active then
    FQuery.Close;
  FQuery.SQL.Clear;
  FQuery.Connection := UniMainModule.FDConnection1;
  // Return all fields because we use the fields to build the email body
  FQuery.SQL.Add('  SELECT id, alert_datetime, startdate, finishdate, type,');
  FQuery.SQL.Add
    ('         priority, assignedto, subject, location, regarding,');
  FQuery.SQL.Add('         principle_source_disp, principle_first_name,');
  FQuery.SQL.Add('         principle_last_name, principle_company, email,');
  FQuery.SQL.Add('         send_mail, allday, createdby, source, source_id,');
  FQuery.SQL.Add('         crm_notify_id');
  FQuery.SQL.Add('    FROM v_crm_notify');
  FQuery.SQL.Add('   WHERE NVL(send_mail, ''N'') = ''Y'' AND');
  if UserName > '' then
    FQuery.SQL.Add
      (Format('         NVL(TRIM(assignedto), ''~'') = TRIM(''%s'') AND',
      [UserName]));
  FQuery.SQL.Add('         TRIM(email) IS NOT NULL');
  FQuery.SQL.Add('ORDER BY priority DESC');
  FQuery.Open;
end;

procedure TCRMReminderProcessor.GetEmailSubject(var AEmailSubject: string);
begin
  // Build the email subject
  AEmailSubject := Format('%s (%s)', [FQuery.FieldByName('SUBJECT').AsString,
    FormatDateTime('ddddd t', FQuery.FieldByName('STARTDATE').AsDateTime)]);
end;

procedure TCRMReminderProcessor.BuildBodyText(var ABodyText: TStringList);
var
  AOthers: TStringList;
  APrincipal: string;
  i: Integer;
begin
  if Assigned(ABodyText) then
  begin
    AOthers := TStringList.Create;
    try
      // Clear the body text list here
      ABodyText.Clear;
      // Populate "Others Involved"
      GetOthersInvolved(FQuery.FieldByName('ID').AsFloat, AOthers);
      // Get principal text
      APrincipal := ''; // initial
      if (FQuery.FieldByName('PRINCIPLE_FIRST_NAME').AsString > '') or
        (FQuery.FieldByName('PRINCIPLE_LAST_NAME').AsString > '') then
        APrincipal := Trim(Format('%s %s',
          [Trim(FQuery.FieldByName('PRINCIPLE_FIRST_NAME').AsString),
          Trim(FQuery.FieldByName('PRINCIPLE_LAST_NAME').AsString)]));
      if (APrincipal > '') and
        (FQuery.FieldByName('PRINCIPLE_COMPANY').AsString > '') then
        APrincipal := Format('%s, %s',
          [APrincipal, Trim(FQuery.FieldByName('PRINCIPLE_COMPANY')
          .AsString)]);
      if (APrincipal = '') and
        (FQuery.FieldByName('PRINCIPLE_COMPANY').AsString > '') then
        APrincipal := Trim(FQuery.FieldByName('PRINCIPLE_COMPANY').AsString);
      // crm_rscstr.cTXT0000392 = 'This message generated from IQCRM on %s.'
      ABodyText.Add(Format(crm_rscstr.cTXT0000392,
        [FormatDateTime('ddddd t', IQOracleAdjustedDateTime)]));
      // crm_rscstr.cTXT0000040 = 'Subject:  %s'
      ABodyText.Add(Format(crm_rscstr.cTXT0000040,
        [FQuery.FieldByName('SUBJECT').AsString]));
      // crm_rscstr.cTXT0001438 = 'Location:  %s'
      ABodyText.Add(Format(crm_rscstr.cTXT0001438,
        [FQuery.FieldByName('LOCATION').AsString]));
      // crm_rscstr.cTXT0000717 = 'Start Date: %s'
      ABodyText.Add(Format(crm_rscstr.cTXT0000717,
        [FormatDateTime('ddddd t', FQuery.FieldByName('STARTDATE')
        .AsDateTime)]));
      // crm_rscstr.cTXT0000393 = 'Principal: %s'
      ABodyText.Add(Format(crm_rscstr.cTXT0000393, [APrincipal]));
      // crm_rscstr.cTXT0000394 = 'Type: %s'
      ABodyText.Add(Format(crm_rscstr.cTXT0000394,
        [crm_strings.GetTypeString(FQuery.FieldByName('TYPE').AsInteger)]));
      // crm_rscstr.cTXT0000395 = 'Activity Number:  %.0f'
      ABodyText.Add(Format(crm_rscstr.cTXT0000395,
        [FQuery.FieldByName('ID').AsFloat]));
      // crm_rscstr.cTXT0000396 = 'Priority:  %s'
      ABodyText.Add(Format(crm_rscstr.cTXT0000396,
        [crm_strings.GetPriorityString(FQuery.FieldByName('PRIORITY')
        .AsInteger)]));
      // crm_rscstr.cTXT0000715 = 'Created By: %s'
      ABodyText.Add(Format(crm_rscstr.cTXT0000715,
        [FQuery.FieldByName('CREATEDBY').AsString]));
      // crm_rscstr.cTXT0001437 = 'Others Involved:'
      ABodyText.Add(crm_rscstr.cTXT0001437);
      for i := 0 to AOthers.Count - 1 do
        ABodyText.Add(#9 + AOthers.Strings[i]);
      ABodyText.Add('');
      // Add the CRM_ACTIVITY.REGARDING field value to the string list.
      // We do this so that we retain line breaks.  The result looks
      // better than if we just assign it.
      AddRegardingToList(FQuery.FieldByName('ID').AsFloat, ABodyText);
    finally
      if Assigned(AOthers) then
        FreeAndNil(AOthers);
    end;
  end;
end;

procedure TCRMReminderProcessor.ResetFlag;
begin
  // (FQuery.FieldByName('ID').AsFloat)
  if CompareText(FQuery.FieldByName('SOURCE').AsString,
    'CRM_ACTIVITY') = 0 then
  begin
    ExecuteCommandFmt(
      'UPDATE crm_activity'#13 +
      '   SET mail_sent_date = TO_DATE(''%s'', ''mm/dd/rrrr hh24:mi''),'#13 +
      '       send_mail = ''N'' '#13 +
      ' WHERE id = %.0f',
      [FormatDateTime('mm/dd/yyyy hh:nn', IQOracleAdjustedDateTime),
      FQuery.FieldByName('SOURCE_ID').AsFloat]);
  end
  else if CompareText(FQuery.FieldByName('SOURCE').AsString,
    'CRM_ACTIVITY_MEMBERS') = 0 then
  begin
    ExecuteCommandFmt(
      'UPDATE crm_activity_members'#13 +
      '   SET mail_sent_date = TO_DATE(''%s'', ''mm/dd/rrrr hh24:mi''),'#13 +
      '       send_mail = ''N'' '#13 +
      ' WHERE id = %.0f',
      [FormatDateTime('mm/dd/yyyy hh:nn', IQOracleAdjustedDateTime),
      FQuery.FieldByName('SOURCE_ID').AsFloat]);
  end;
  ExecuteCommandFmt(
    'UPDATE crm_notify'#13 +
    '   SET send_mail = ''N'' '#13 +
    ' WHERE id = %.0f',
    [FQuery.FieldByName('CRM_NOTIFY_ID').AsFloat]);
end;

procedure TCRMReminderProcessor.GetOthersInvolved(const ACRMActivityID: Real;
  var AList: TStringList);
begin
  if Assigned(AList) then
  begin
    AList.Clear;
    with TFDQuery.Create(nil) do
      try
        Connection := UniMainModule.FDConnection1;
        SQL.Add('SELECT source_disp');
        SQL.Add('FROM crm_activity_members');
        SQL.Add(Format('WHERE crm_activity_id = %.0f', [ACRMActivityID]));
        Open;
        while not EOF do
        begin
          AList.Add(Fields[0].AsString);
          Next;
        end;
      finally
        Free;
      end;
  end;
end;

procedure TCRMReminderProcessor.AddRegardingToList(const ACRMActivityID: Real;
  var AList: TStringList);
var
  sl: TStringList;
begin
  if Assigned(AList) then
  begin
    sl := TStringList.Create;
    try
      sl.Text := SelectValueFmtAsString
        ('SELECT regarding FROM crm_activity WHERE id = %.0f',
        [ACRMActivityID]);
      AList.AddStrings(sl);
    finally
      if Assigned(sl) then
        FreeAndNil(sl);
    end;
  end;
end;

procedure TCRMReminderProcessor.SendMail(ATo, ASubject, ABody: string);
begin
  IQMS.Common.EmailUtils.IQSendMailSmtp(ATo, ASubject, ABody, nil, True);
end;

procedure TCRMReminderProcessor.SetUserName(const Value: string);
begin
  FUserName := UpperCase(Trim(Value));
end;

{$ENDREGION 'TCRMReminderProcessor'}

end.

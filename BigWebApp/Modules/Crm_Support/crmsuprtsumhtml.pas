unit crmsuprtsumhtml;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.FileCtrl,
  Data.SqlExpr,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule;

/// <summary>Shows an HTML page containing the Support Summary.
/// Pass the ID value from CRM_ACTIVITY for the Support Issue.
/// </summary>
function ShowSupportSummaryHTML(const ACRMActivityID: Real): Boolean;

/// <summary>Returns TRUE if successfull.  Fills var param ALines with the HTML text.
/// Pass the ID value from CRM_ACTIVITY for the Support Issue.
/// </summary>
function GetSupportSummaryHTML(const ACRMActivityID: Real;
  var ALines: TStringList): Boolean;


/// <summary>Shows an HTML page containing the Support Summary.
/// Pass the ID value from CRM_ACTIVITY for the Support Issue.
/// </summary>
function ShowActivitySummaryHTML(const ACRMActivityID: Real): Boolean;

implementation


uses
  crm_rscstr,
  crm_types,
  IQMS.Common.FileUtils,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.StringUtils,
  IQMS.Common.PanelMsg,
  crm_activity_dblib;

function SaveActivitySummaryToFile(const ACRMActivityID: Real;
  const AActivityType: TActivityType; var AFileName: string): Boolean;
var
  AFileTag: string;
  AMemoryStream: TMemoryStream;
  AFileStream: TFileStream;
  ABlobSize: Integer;
  ACursor: Integer;
  AFileStub: string;
begin
  // Delete files containing the old format
  IQMS.Common.FileUtils.DeleteFilesOlderThan(IQMS.Common.Miscellaneous.IQGetLocalHomePath + 'supportsum.html', 3);

  case AActivityType of
    atCall: AFileStub := 'CRMCall';
    atTask: AFileStub := 'CRMTask';
    atMeeting: AFileStub := 'CRMMeeting';
    atSupport: AFileStub := 'CRMSupportIssue';
    atNote: AFileStub := 'CRMNote';
  else
    Exit(False);
  end;


  // Delete files containing the current format
  IQMS.Common.FileUtils.DeleteFilesOlderThan(IQMS.Common.Miscellaneous.IQGetLocalHomePath +
    Format('%s_*.htm',[AFileStub]), 3);

  // Get the file tag
  AFileTag := IQMS.Common.StringUtils.LPadZero(IntToStr(Trunc(ACRMActivityID)), 6);
  AFileName := IQMS.Common.Miscellaneous.IQGetLocalHomePath + Format('%s_%s.htm',
    [AFileStub, AFileTag]);

  DeleteFile(AFileName);

  try
    AFileStream := TFileStream.Create(AFileName, fmCreate);
    try
      // Build the query
      with TSQLQuery.Create(NIL) do
        try
//          SQLConnection := dbdm.SQLConnection;
          // Note: The documentation says that MaxBlobSize is used to 'limit'
          // the Blob size, and that setting it to -1 indicates no size limit.
          // Lies, lies, lies! It's not a limit, but a size indicator, which
          // will allow you to obtain all of the text in a Blob if you set
          // it right, or incomplete text if you set it wrong.  If you set
          // a value of -1, you get incomplete text. The value below is
          // an arbitrary number that works ... so far.  Setting it too high
          // results in out-of-memory errors.
          MaxBlobSize := 32 { KB } * 1024;
          SQL.Add('SELECT html_summary');
          SQL.Add('  FROM crm_activity');
          SQL.Add(Format(' WHERE id = %d', [Trunc(ACRMActivityID)]));
          Open;
          // Get the BLOB data and fill the memory stream.
          if (Fields[0] is TBlobField) then
            begin
              (Fields[0] as TBlobField).SaveToStream(AFileStream);
              ABlobSize := AFileStream.Size;
              if ABlobSize > 0 then
                begin
                  AFileStream.Position := 0;
                  Result := True;
                end;
            end;
        finally
          Free;
        end;
    finally
      AFileStream.Free;
    end;
  finally
  end;
end;

function ShowSupportSummaryHTML(const ACRMActivityID: Real): Boolean;
var
  // ALines: TStringList;
  AFileName: string;
  // AFileTag: string;
begin
  // we may need to display an exception if the ID is 0, but for now, let's
  // just walk away silently
  if (ACRMActivityID = 0) then
    Exit(False);

  // if an ID is passed, but it doesn't exist, then let the user know there is
  // a problem
  if SelectValueFmtAsInteger(
    'SELECT 1 FROM crm_activity WHERE id = %.0f', [ACRMActivityID]) = 0 then
    // crm_rscstr.cTXT0001400 =
    // 'Record not found.  Cannot display Support Summary.'
    raise Exception.Create(crm_rscstr.cTXT0001400);

  // Update the blob data
  ExecuteCommandFmt('BEGIN iqcrm_html.update_support_summary(%.0f); END;',
    [ACRMActivityID]);

  Result := SaveActivitySummaryToFile(ACRMActivityID, atSupport, AFileName);
  if Result then
    ExecuteProgram(AFileName, SW_SHOWDEFAULT, '');
end;

function ShowActivitySummaryHTML(const ACRMActivityID: Real): Boolean;
var
  AFileName: string;
  AType: Integer;
begin
  // we may need to display an exception if the ID is 0, but for now, let's
  // just walk away silently
  if (ACRMActivityID = 0) then
    Exit(False);
  // if an ID is passed, but it doesn't exist, then let the user know there is
  // a problem
  AType := SelectValueFmtAsInteger(
    'SELECT type FROM crm_activity WHERE id = %.0f AND type in (1,2,3,5)',
    [ACRMActivityID]);
  if AType = 0 then
    raise Exception.Create('Record not found.');

  // Update the blob data
  ExecuteCommandFmt('BEGIN iqcrm_html.update_activity_summary(%.0f); END;',
    [ACRMActivityID]);

  Result := SaveActivitySummaryToFile(ACRMActivityID, TActivityType(AType),
    AFileName);

  if Result then
    ExecuteProgram(AFileName, SW_SHOWDEFAULT, '');
end;

function GetSupportSummaryHTML(const ACRMActivityID: Real;
  var ALines: TStringList): Boolean;
var
  ACursor: Integer;
  hMsg: TPanelMesg;
  AFileName: string;
begin
  // crm_rscstr.cTXT0001391 = 'Building summary.  Please wait...'
  try
    hMsg := hPleaseWait(crm_rscstr.cTXT0001391);
    try
      // Suppress the SQL Wait cursor
      ExecuteCommandFmt('BEGIN iqcrm_html.update_support_summary(%.0f); END;',
        [ACRMActivityID]);
      Result := SaveActivitySummaryToFile(ACRMActivityID, atSupport, AFileName);
      if Result then
        ALines.LoadFromFile(AFileName);
    finally
      if Assigned(hMsg) then
        FreeAndNil(hMsg);
    end;
  finally
  end;
end;
(*
  function GetSupportSummaryHTML(const ACRMActivityID: Real; var ALines: TStringList): Boolean;
  const
  cHTML_White = 'white';
  cHTML_LtBlue = '#e7eefc';

  var
  ACRMSupport: TFDQuery;
  AIssueTitle, APrincipal, AIssueNumber, ARegarding,
  AContact, ACompany, HTMLColor, AAssignedTo: String;
  i, ARow, ACursor: Integer;
  AStartID  : Real;
  ATemp: TStringList;
  hMsg: TPanelMesg;
  TwoColumnTable: TTwoColumnTable;

  procedure _SetNewHTMLColor;
  begin
  // get alternating color
  if HTMLColor = cHTML_White
  then HTMLColor := cHTML_LtBlue // light blue
  else HTMLColor := cHTML_White;
  end;

  procedure _CheckAddEMailCorrespondence(ACRMEventsID: Real);
  begin
  if ACRMEventsID = 0 then Exit;

  // It is understood that we are building onto TwoColumnTable
  if (TwoColumnTable = NIL) or not Assigned(TwoColumnTable) then
  raise Exception.Create('Application Error:  TwoColumnTable = NIL.');
  with TFDQuery.Create(NIL) do
  try
  Connection := MainModule.FDConnection;
  SQL.Add('SELECT a.received_date, a.received_from, a.subject, a.comment1, a.mesg_blob, a.body_text');
  SQL.Add('FROM email_correspondence a');
  SQL.Add(Format('WHERE a.source = ''CRM_ACTIVITY_EVENTS'' and a.source_id = %.0f', [ACRMEventsID]));
  Open;
  while not EOF do
  begin
  // Add the data
  with TwoColumnTable do
  begin
  _SetNewHTMLColor;
  AddHeadingRow(FieldByName('SUBJECT').AsString, HTMLColor);
  AddRow(crm_rscstr.cTXT0000207 {'From'}, FieldByName('RECEIVED_FROM').AsString, HTMLColor);
  AddRow(crm_rscstr.cTXT0000208 {'Received'}, FormatDateTime('ddddd tt', FieldByName('RECEIVED_DATE').AsDateTime), HTMLColor, blNone);
  AddRow(crm_rscstr.cTXT0001419 {'Body Text'}, FieldByName('BODY_TEXT').AsString, HTMLColor);
  AddBlankRow;
  Inc(ARow);
  end;
  Next; // next record
  end;
  finally
  Free; // free TFDQuery
  end;
  end;


  begin
  if ALines = NIL then Exit;
  hMsg := NIL;
  // NOTE:  Do not clear the lines before populating.
  //        We may want to add a horizontal bar first for e-mailing

  try
  hMsg := hPleaseWait(crm_rscstr.cTXT0001391 {'Building summary.  Please wait...'});

  // Suppress the SQL Wait cursor
  ACursor := Screen.Cursors[crSQLWait];
  Screen.Cursors[crSQLWait] := Screen.Cursors[crArrow];


  ATemp:= TStringList.Create;
  ACRMSupport:= TFDQuery.Create(NIL);
  ACRMSupport.Connection := MainModule.FDConnection;
  ACRMSupport.SQL.Add(Format('select * from v_crm_support where id = %.0f', [ACRMActivityID]));
  ACRMSupport.Open;
  Result := not (ACRMSupport.Bof and ACRMSupport.Eof);
  if not Result then Exit;

  // ------------------------------------------------------------------------
  // *** Add the Issue Summary Header *** //
  // ------------------------------------------------------------------------
  // 1.  Begin HTML Document

  // These lines begin the HTML document. We are passing title, but these
  // are required to initial any HTML document.
  AddHTMLHeader(crm_rscstr.cTXT0001218 {'Support Issue Summary'}, ALines);
  AddHeading1(crm_rscstr.cTXT0001218 {'Support Issue Summary'}, ALines);

  // 2.  Add the Principal Information.

  // Get basic values we will be using
  AContact     := Trim(ACRMSupport.FieldByName('CONTACT_NAME').AsString);
  ACompany     := Trim(ACRMSupport.FieldByName('COMPANY').AsString);

  // Customer Name + Issue Number + Queue
  if (AContact > '') and (ACompany > '') then
  APrincipal := Format(crm_rscstr.cTXT0001274 {'%s, %s,'}, [AContact, ACompany])
  else if (AContact > '') then
  APrincipal := Format(crm_rscstr.cTXT0001275 {'%s,'}, [AContact])
  else if (ACompany > '') then
  APrincipal := Format(crm_rscstr.cTXT0001275 {'%s,'}, [ACompany]);

  // This line returns HTML lines we can just add.  See crm_activity_dblib.pas.
  // It is a complete paragraph unto itself
  //GetLongDisplayHTML(ACRMSupport.FieldByName('PRINCIPLE_SOURCE').AsString, ACRMSupport.FieldByName('PRINCIPLE_SOURCE_ID').AsFloat, ACRMSupport.FieldByName('CONTACT_ID').AsFloat, ALines);

  // 3.  Add the Support Issue header information

  // Get some basic values we will be using.
  AIssueNumber := Format('%d', [ Trunc(ACRMSupport.FieldByName('ID').AsFloat) ]);
  AIssueTitle  := Format(crm_rscstr.cTXT0000712 {'%s CRM # %s [%s]'},
  [APrincipal,AIssueNumber, ACRMSupport.FieldByName('QUEUE_NAME').AsString]);
  ARegarding   := FixStrMemo(ACRMSupport.FieldByName('SUMMARY').AsString); // iqstring
  GetLongDisplayEx(ACRMSupport.FieldByName('ID').AsFloat, ATemp); // crm_activity_dblib.pas
  AAssignedTo  := Format('%s (%s)', [ACRMSupport.FieldByName('ASSIGNEDTO_DISPLAY').AsString, ACRMSupport.FieldByName('ASSIGNEDTO_LOGIN_NAME').AsString]);
  // Add 2-column table
  TwoColumnTable := TTwoColumnTable.Create(NIL);

  try
  TwoColumnTable.AddRow(crm_rscstr.cTXT0001368 {'Support Issue #'},   AIssueNumber);
  TwoColumnTable.AddRow(crm_rscstr.cTXT0000222 {'Principal Contact'}, ATemp.Text);
  TwoColumnTable.AddRow(crm_rscstr.cTXT0001358 {'Created By'},        ACRMSupport.FieldByName('USER_ID').AsString);
  TwoColumnTable.AddRow(crm_rscstr.cTXT0001359 {'Assigned To'},       AAssignedTo);
  TwoColumnTable.AddRow(crm_rscstr.cTXT0001360 {'Start Date'},        ACRMSupport.FieldByName('STARTDATE').AsDateTime);
  TwoColumnTable.AddRow(crm_rscstr.cTXT0001361 {'Finish Date'},       ACRMSupport.FieldByName('FINISHDATE').AsDateTime);
  TwoColumnTable.AddRow(crm_rscstr.cTXT0001362 {'Closed By'},         ACRMSupport.FieldByName('CLOSEDBY').AsString);
  TwoColumnTable.AddRow(crm_rscstr.cTXT0001363 {'Time Elapsed'},      ACRMSupport.FieldByName('DAYS_ELAPSED').AsString);
  TwoColumnTable.AddRow(crm_rscstr.cTXT0001364 {'Principal'},         GetShortDisplay(ACRMSupport.FieldByName('PRINCIPLE_SOURCE').AsString, ACRMSupport.FieldByName('PRINCIPLE_SOURCE_ID').AsFloat, ACRMSupport.FieldByName('CONTACT_ID').AsFloat));
  TwoColumnTable.AddRow(crm_rscstr.cTXT0001365 {'Queue'},             Trim(ACRMSupport.FieldByName('QUEUE_NAME').AsString));
  TwoColumnTable.AddRow(crm_rscstr.cTXT0001367 {'Subqueue'},          Trim(ACRMSupport.FieldByName('SUBQUEUE_NAME').AsString));
  TwoColumnTable.AddRow(crm_rscstr.cTXT0001357 {'Summary'},           ARegarding);
  TwoColumnTable.AddBlankRow;


  // *** Add the Issue Events *** //

  with TFDQuery.Create(NIL) do
  try
  Connection := MainModule.FDConnection;
  // 01/12/2009 Changed SQL. Added "crm_activity b" and field
  // "activity_link_closed" because the v_crm_support_events.closed
  // field did not reflect the state of the linked activity.
  SQL.Add('select a.*, NVL(b.archived,''N'') as activity_link_closed');
  SQL.Add('from v_crm_support_events a, crm_activity b');
  SQL.Add(Format('where a.crm_activity_id = %.0f', [ACRMActivityID]));
  SQL.Add(' and b.id(+) = a.activity_link_id');
  SQL.Add('order by a.event_datetime desc');
  Open;
  First;

  HTMLColor := 'white'; // initial
  ARow      := 1;
  while not EOF do
  begin
  // get alternating color
  //if Odd(ARow) then HTMLColor := '#e7eefc' // light blue
  //else HTMLColor := 'white';
  _SetNewHTMLColor;

  TwoColumnTable.AddHeadingRow(FormatDateTime('c', FieldByName('EVENT_DATETIME').AsDateTime), HTMLColor);
  TwoColumnTable.AddRow(crm_rscstr.cTXT0001369 {'Added By:'}, FieldByName('USER_ID').AsString, HTMLColor);

  // Activity link info
  if Trim(FieldByName('LINK_TYPE_STRING').AsString) > '' then
  begin
  // Link type
  TwoColumnTable.AddRow(crm_rscstr.cTXT0001370 {'Activity Link:},
  Format('%s [%.0f]',[FieldByName('LINK_TYPE_STRING').AsString,
  FieldByName('ACTIVITY_LINK_ID').AsFloat]), HTMLColor);
  // Link status
  if FieldByName('ACTIVITY_LINK_CLOSED').AsString = 'Y' then
  TwoColumnTable.AddRow(crm_rscstr.cTXT0001371 {'Status:'}, crm_rscstr.cTXT0001373 {Closed}, HTMLColor) // 'Status: Closed'
  else TwoColumnTable.AddRow(crm_rscstr.cTXT0001371 {'Status:'}, crm_rscstr.cTXT0001372 {Open}, HTMLColor); // 'Status: Open'
  end;
  TwoColumnTable.AddRow(crm_rscstr.cTXT0001374 {'Caller:'}, FieldByName('CALLERNAME').AsString, HTMLColor);
  TwoColumnTable.AddRow(crm_rscstr.cTXT0001375 {'Contact Method:'}, FieldByName('CONTACT_METHOD_NAME').AsString, HTMLColor);
  TwoColumnTable.AddRow(crm_rscstr.cTXT0001376 {'Incoming/Outgoing:'}, sIIf(Trim(FieldByName('INCOMING_OUTGOING').AsString)='INCOMING', crm_rscstr.cTXT0001225 {'Incoming'}, crm_rscstr.cTXT0001226 {'Outgoing'}), HTMLColor);
  TwoColumnTable.AddRow(crm_rscstr.cTXT0001160 {'Regarding'}, FixStrMemo(FieldByName('REGARDING').AsString), HTMLColor);
  TwoColumnTable.AddBlankRow;
  Inc(ARow);

  _CheckAddEMailCorrespondence(FieldByName('ID').AsFloat);

  Next;
  end;

  finally
  Free; // free the query
  end;

  TwoColumnTable.GetHTMLText(ALines); // get the text

  finally
  if Assigned(TwoColumnTable) then FreeAndNil(TwoColumnTable);
  end;

  Result := TRUE;

  finally
  AddHTMLFooter(ALines);
  if Assigned(ACRMSupport) then FreeAndNil(ACRMSupport);
  if Assigned(ATemp) then ATemp.Free;
  Screen.Cursor := crArrow; // necessary, or SQL wait will appear again
  Screen.Cursors[crSQLWait] := ACursor;
  if (hMsg<>NIL) and Assigned(hMsg) then FreeAndNil(hMsg);
  end;
  end;
*)

end.

unit qc_eval_share;

interface

uses
  Windows,
  Forms,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  QC_Share,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  IQMS.Common.DataConst;

type
  TQCEvalWorkflowBase = class
  private
    procedure EmailOwnerRejected(AModuleName, AWorkflowNo, AElementName, AEmailTo: string; ANote: string = '');
    class procedure GetResponsibilityTableNameBasedOnHeaderTableName( AHeaderTableName: string; var AResponsibilityTableName, AResponsibilityFK_FieldName: string); static;

  protected
    FSendEmailToApprove: TSendEmailToApprove;
    FExpirePendingPeriod : Real;    // pending approval records expiration period in days
    FExpireEmailToAddress: string;  // email address to notify that pending approval records haven't been signed off
    FExtraParams: TQCEvalExtraParams;
    FRejected_WF_Responsibility_ID: Real;
    FAttachmentBatch: TAttachmentBatch;
    procedure CheckPendingAprovalExpired( ATableName: string; AParentFK_FieldName: string; AParentFK_Value: Real; AParentTableName: string );
    procedure UpdateDateEMailSent(AResponsibilityTableName: string;  AResponsibility_ID: Real; AOrigin: string);
    procedure ResetPendingAprovalExpired( ATableName: string; AID: Real );
    procedure EmailPendingApprovalExpired( ATableName: string; AResponsibility_ID: Real );
    function PendingExpiredSubject( ATableName: string; AResponsibility_ID: Real ): string; virtual;

    procedure AssignRejectedOwnerEmailTo(var AEmailTo: string); virtual;

    procedure AssignRejectNote(var ANote: string); virtual;
    procedure AssignNote(var ANote: string); virtual;

    function GetRejectingTeamMember_ID: Real; virtual;
    function PendingExpiredMoreInfo(ATableName: string; AResponsibility_ID: Real): string; virtual;

    /// <summary>Safely return an attachment list.</summary>
    function GetAttachments(var AAttachments: TStringList): Boolean; virtual;
    /// <summary>Save a Crystal report as a PDF file.</summary>
    function CreateReportPDF(const AReportName: string;
      const ASelectionCriteria: TStringList; var AFileName: string): Boolean; virtual;
    procedure DoAfterExecute; virtual;
    procedure AddRejectorName(var ABody: string); virtual;
  public
    FDataBaseName: string;
    FIs_Started      : Boolean;
    destructor Destroy; override;

    class procedure BeforeDoExecute(AHeaderTableName: string; AHeader_ID,  AElement_ID: Real; ADataBase: string );

    property SendEmailToApprove: TSendEmailToApprove read FSendEmailToApprove write FSendEmailToApprove;

    procedure CheckNotifyOwnerRejected( AModuleName,
                                        AHeaderTableName,
                                        AElementTableName,
                                        AHeaderFieldName,
                                        AHeaderFK_FieldName: string;
                                        AElement_ID: Real );

    class procedure CheckNotifyOwnerCompleted(AModuleName,
                                              AHeaderTableName,
                                              AElementTableName,
                                              AHeaderFieldName,
                                              AHeaderFK_FieldName: string;
                                              AElement_ID: Real;
                                              ADataBaseName: string;
                                              ASendEmailToApprove: TSendEmailToApprove);

    class procedure EmailOwnerCompleted( AModuleName,
                                         AWorkflowNo,
                                         AEmailTo: string;
                                         AAttachments: TStringList;
                                         ASendEmailToApprove: TSendEmailToApprove;
                                         ANote: string = '';
                                         AIsWorkflowRejected: Boolean = false;
                                         AWF_Element_ID: real = 0;
                                         ADataBaseName: string = 'IQFD');


    class procedure AssignExtraNote( var ANote: string;
                                     AModuleName,
                                     AHeaderTableName: string;
                                     AHeader_ID: Real;
                                     ADataBaseName: string );

    class procedure AssignPODetailsInfo(APO_ID: Real; var AList: TStringList; ADataBaseName: string = 'IQFD');

    class procedure CheckNotifyElementIsCompleted( AModuleName,                                {'APQP' or 'Process PQ'}
                                                   AHeaderTableName,                           {'APQP'}
                                                   AElementTableName,                          {'APQP_ELEMENT'}
                                                   AHeaderFieldName,                           {'APQPNO'}
                                                   AHeaderFK_FieldName: string;                {'APQP_ID'}
                                                   AElement_ID: Real;                          {APQP_ELEMENT.ID}
                                                   AResponsibilityTableName: string;           {'APQP_RESPONSIBILITY'}
                                                   AElementFK_FieldName: string;               {'APQP_ELEMENT_ID'}
                                                   ADataBaseName: string;
                                                   ASendEmailToApprove: TSendEmailToApprove );
    /// <summary> The batch ID for the list of attachments.  The list of
    ///  attachments is stored in table, EMAIL_ATTACHMENT.
    ///  </summary>
    //property AttachmentBatchID: Integer read FAttachmentBatchID;

    /// <summary> Create the attachment batch.</summary>
    procedure CreateAttachmentBatch(const AElement_ID: Real; var ABatchID: Real);
    /// <summary> Clear the attachment batch.</summary>
    //procedure ClearAttachmentBatch(const ADeleteFiles: Boolean = False);
  end;

implementation

uses
  IQMS.Common.NLS,
  IQMS.Common.EmailUtils,
  DB,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils,
  qc_rscstr,
  Variants,
  wf_rscstr,
  ActiveX;


function GetOriginatorFieldName( AHeaderTableName: string ) : string;
begin
  if UpperCase(AHeaderTableName) = 'WF_HEADER' then
     Result:= 'initiator'
  else
     Result:= 'originator'
end;


{$REGION 'TQCEvalWorkflowBase'}

{ TQCEvalWorkflowBase }

destructor TQCEvalWorkflowBase.Destroy;
begin
  if Assigned(FAttachmentBatch) then
    FreeAndNil(FAttachmentBatch);
  inherited Destroy;
end;

procedure TQCEvalWorkflowBase.CheckNotifyOwnerRejected( AModuleName,                  {'APQP' or 'Process PQ'}
                                                        AHeaderTableName,             {'APQP'}
                                                        AElementTableName,            {'APQP_ELEMENT'}
                                                        AHeaderFieldName,             {'APQPNO'}
                                                        AHeaderFK_FieldName: string;  {'APQP_ID'}
                                                        AElement_ID: Real );          {apqp_element.id}
var
  A: Variant;
  ANote: string;
  AEmailTo: string;
  AHeader_ID : Real;
begin
  {check if was already rejected}
  if SelectValueFmtAsFloat('select reject_email_sent from %s where id = %f', [ AElementTableName, AElement_ID ], FDataBaseName ) > 0 then EXIT;

  AHeader_ID:= SelectValueByID( AHeaderFK_FieldName, AElementTableName, AElement_ID, FDataBaseName );

  {get some fields}
  if (AModuleName = 'PO Workflow') and (AHeaderTableName = 'WF_HEADER') then
  // A:= SelectValueArrayFmt('select a.%s || '', PO # '' || rtrim(po.pono), e.descrip, t.email from %s a, %s e, team_member t, po '+
     A:= SelectValueArrayFmt('select a.%s || '', '' || wf_share.get_po_requisition_title( po.id ), e.descrip, t.email from %s a, %s e, team_member t, po '+
                        ' where e.id = %f and e.%s = a.id and a.%s = t.userid and t.email is not null '+
                        '   and a.source_id = po.id',
                        [ AHeaderFieldName,
                          AHeaderTableName,
                          AElementTableName,
                          AElement_ID,
                          AHeaderFK_FieldName,
                          GetOriginatorFieldName( AHeaderTableName )], FDataBaseName )

  else if (AModuleName = wf_rscstr.cTXT000013 {'AP Invoice Workflow'}) then
     A:= SelectValueArrayFmt('select a.%s || '', AP Invoice# '' || rtrim(ap.invoice_no), e.descrip, t.email from %s a, %s e, team_member t, apprepost ap '+
                        ' where e.id = %f and e.%s = a.id and a.%s = t.userid and t.email is not null '+
                        '   and a.source_id = ap.id',
                        [ AHeaderFieldName,
                          AHeaderTableName,
                          AElementTableName,
                          AElement_ID,
                          AHeaderFK_FieldName,
                          GetOriginatorFieldName( AHeaderTableName )], FDataBaseName )


  else if AHeaderTableName = 'CAR' then
     A:= SelectValueArrayFmt('select a.%s, e.descrip, a.problem_owner_email from %s a, %s e '+
                        ' where e.id = %f and e.%s = a.id and a.problem_owner_email is not null',
                        [ AHeaderFieldName,
                          AHeaderTableName,
                          AElementTableName,
                          AElement_ID,
                          AHeaderFK_FieldName ], FDataBaseName )
  else
     A:= SelectValueArrayFmt('select a.%s, e.descrip, t.email from %s a, %s e, team_member t '+
                        ' where e.id = %f and e.%s = a.id and a.%s = t.userid and t.email is not null',
                        [ AHeaderFieldName,
                          AHeaderTableName,
                          AElementTableName,
                          AElement_ID,
                          AHeaderFK_FieldName,
                          GetOriginatorFieldName( AHeaderTableName )], FDataBaseName );
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  AEmailTo:= A[ 2 ];

  AssignRejectNote( ANote );
  AssignExtraNote( ANote, AModuleName, AHeaderTableName, AHeader_ID, FDataBaseName );
  AssignRejectedOwnerEmailTo( AEmailTo );

  {email}
  EmailOwnerRejected( AModuleName,    {module}
                      A[ 0 ],         {workflowno such as apqp #}
                      A[ 1 ],         {element description}
                      AEmailTo,       {email}
                      ANote );

  {update date field}
  ExecuteCommandFmt('update %s set reject_email_sent = sysdate where id = %f', [ AElementTableName, AElement_ID ], FDataBaseName );
end;


procedure TQCEvalWorkflowBase.EmailOwnerRejected(AModuleName, AWorkflowNo, AElementName, AEmailTo: string; ANote: string = '');
var
  ASubject: string;
  ABody   : string;
  AAttachments: TStringList;
begin
  {Ex: APQP # XX, Element: [element description] has been rejected }
  ASubject:= Format('%s # %s, Element: %s has been rejected.',
                    [ AModuleName, AWorkflowNo, AElementName ]);

  ABody:= ASubject + #13#13;

  if ANote > '' then
     ABody:= ABody + Format('Notes: '#13'%s',  [ ANote ]) + #13#13;

  AddRejectorName( ABody );
  // qc_rscstr.cTXT000177 =
  //'Please review element, make necessary corrections and re-evaluate Workflow.'#13#13+
  //        'Thank you';

  ABody:= ABody + qc_rscstr.cTXT000177;

  AAttachments := TStringList.Create;
  try
    GetAttachments(AAttachments);
    {if coming from IQAlert then use FSendEmailToApprove}
    if Assigned( FSendEmailToApprove ) then
       FSendEmailToApprove( AEmailTo, ASubject, ABody, AAttachments )
    else
       IQMS.Common.EmailUtils.IQSendMailB(AEmailTo, // ARecipient (String)
                              ASubject, // ASubject (String)
                              ABody, // ABodyText (String)
                              AAttachments, // AAttachments (TStringList)
                              qc_share.SendAsHTML, // AHTML (Boolean)
                              True); // send now = Yes
  finally
    AAttachments.Free;
  end;
end;

class procedure TQCEvalWorkflowBase.GetResponsibilityTableNameBasedOnHeaderTableName( AHeaderTableName: string; var AResponsibilityTableName, AResponsibilityFK_FieldName: string );
begin
  if AHeaderTableName = 'WF_HEADER' then
     begin
       AResponsibilityTableName   := 'WF_RESPONSIBILITY';
       AResponsibilityFK_FieldName:= 'WF_ELEMENT_ID';
     end
  else if AHeaderTableName = 'APQP' then
     begin
       AResponsibilityTableName   := 'APQP_RESPONSIBILITY';
       AResponsibilityFK_FieldName:= 'APQP_ELEMENT_ID';
     end
  else if AHeaderTableName = 'PPAP' then
     begin
       AResponsibilityTableName   := 'PPAP_RESPONSIBILITY';
       AResponsibilityFK_FieldName:= 'PPAP_ELEMENT_ID';
     end
  else if AHeaderTableName = 'CAR' then
     begin
       AResponsibilityTableName   := 'CAR_RESPONSIBILITY';
       AResponsibilityFK_FieldName:= 'CAR_ELEMENT_ID';
     end
  else if AHeaderTableName = 'ECO' then
     begin
       AResponsibilityTableName   := 'ECO_RESPONSIBILITY';
       AResponsibilityFK_FieldName:= 'ECO_ELEMENT_ID';
     end
  else
     raise Exception.CreateFmt('Unable to determine responsibility table name based on header table name ''%s'' (qc_eval_share.pas).', [ AHeaderTableName ]);
end;


class procedure TQCEvalWorkflowBase.CheckNotifyOwnerCompleted( AModuleName,                                {'APQP' or 'Process PQ'}
                                                               AHeaderTableName,                           {'APQP'}
                                                               AElementTableName,                          {'APQP_ELEMENT'}
                                                               AHeaderFieldName,                           {'APQPNO'}
                                                               AHeaderFK_FieldName: string;                {'APQP_ID'}
                                                               AElement_ID: Real;                          {apqp_element.id}
                                                               ADataBaseName: string;
                                                               ASendEmailToApprove: TSendEmailToApprove );
var
  AHeader_ID : Real;
  A          : Variant;
  B          : Variant;
  ANote      : string;
  AIsWorkflowRejected: Boolean;
  AResponsibilityTableName: string;
  AResponsibilityFK_FieldName: string;
  ADummy     : Real; {Used to keep array in bounds when WF type <> PO }
begin
ADummy := 0;
  // shortcut the process to determine responsibility table name
  TQCEvalWorkflowBase.GetResponsibilityTableNameBasedOnHeaderTableName( AHeaderTableName, AResponsibilityTableName, AResponsibilityFK_FieldName );

  {get header field such as apqp_id}
  AHeader_ID:= SelectValueByID( AHeaderFK_FieldName, AElementTableName, AElement_ID, ADataBaseName );

  {check all completed and email not sent back to owner}
  if (SelectValueFmtAsFloat('select 1 from %s where %s = %f and complete_date is null and rownum < 2', [ AElementTableName, AHeaderFK_FieldName, AHeader_ID ], ADataBaseName) = 0)
     and
     (SelectValueFmtAsFloat('select 1 from %s where id = %f and email_sent_back is null', [ AHeaderTableName, AHeader_ID ], ADataBaseName) = 1) then
  begin
    {get module and email}
    if (AModuleName = 'PO Workflow') and (AHeaderTableName = 'WF_HEADER') then
       begin
      // A:= SelectValueArrayFmt('select a.%s || '', PO # '' || rtrim(po.pono), t.email, e.id as wf_element_id from %s a, team_member t, po, wf_element e '+
         A:= SelectValueArrayFmt('select a.%s || '', '' || wf_share.get_po_requisition_title_ex( po.id, a.id ), t.email, e.id as wf_element_id from %s a, team_member t, po, wf_element e '+
                            ' where a.id = %f and a.source_id = po.id and po.buyerid = t.userid and t.email is not null and a.id = e.wf_header_id ',
                          [ AHeaderFieldName,    {'WORKFLOWNO'}
                            AHeaderTableName,    {'WF_HEADER'  }
                            AHeader_ID ], ADataBaseName );
         B:= SelectValueArrayFmt('select t.email from %s a, pr_emp t, po '+
                            ' where a.id = %f and a.source_id = po.id and po.pr_emp_id_rqstnr = t.id and t.email is not null ',
                          [ AHeaderTableName,    {'WF_HEADER'  }
                            AHeader_ID ], ADataBaseName );
         if (VarArrayDimCount( A ) > 0) and (VarArrayDimCount( B ) > 0) then
            A[ 1 ]:= A[ 1 ] + ';' + B[ 0 ];  // add requisitioner email to buyer
       end

    else if AHeaderTableName = 'CAR' then
       A:= SelectValueArrayFmt('select a.%s, a.problem_owner_email, %.0f from %s a where a.id = %f and a.problem_owner_email is not null',
                        [ AHeaderFieldName,    {'CARNO'}
                          ADummy,              { 0 }
                          AHeaderTableName,    {'APQP'  }
                          AHeader_ID ], ADataBaseName )

    else if (AHeaderTableName = 'WF_HEADER') and (AModuleName = wf_rscstr.cTXT000003) then  // CRM Workwlow
       A:= SelectValueArrayFmt('select a.%s, a.problem_owner_email, %.0f from %s a where a.id = %f and a.problem_owner_email is not null',
                        [ AHeaderFieldName,    {'CARNO'}
                          ADummy,              { 0 }
                          AHeaderTableName,    {'APQP'  }
                          AHeader_ID ], ADataBaseName )

    else if (AModuleName = wf_rscstr.cTXT000013 {'AP Invoice Workflow'}) then
       A:= SelectValueArrayFmt('select a.%s, t.email, %.0f from %s a, team_member t '+
                        ' where a.id = %f and a.%s = t.userid and t.email is not null',
                        [ AHeaderFieldName,    {'APQPNO'}
                          ADummy,              { 0 }
                          AHeaderTableName,    {'APQP'  }
                          AHeader_ID,
                          GetOriginatorFieldName( AHeaderTableName )], ADataBaseName )

    else
       A:= SelectValueArrayFmt('select a.%s, t.email, %.0f from %s a, team_member t '+
                        ' where a.id = %f and a.%s = t.userid and t.email is not null',
                        [ AHeaderFieldName,    {'APQPNO'}
                          ADummy,              { 0 }
                          AHeaderTableName,    {'APQP'  }
                          AHeader_ID,
                          GetOriginatorFieldName( AHeaderTableName )], ADataBaseName );
    if VarArrayDimCount( A ) = 0 then
       EXIT;

    AssignExtraNote( ANote, AModuleName, AHeaderTableName, AHeader_ID, ADataBaseName );


    // check rejected
    // ex: select count(b.id) from wf_element a, wf_responsibility b where a.wf_header_id = 1 and a.id = b.wf_element_id and nvl(b.signoff,'N') <> 'Y'
    if (AModuleName = 'PO Workflow') and (AHeaderTableName = 'WF_HEADER') then
       AIsWorkflowRejected:= SelectValueFmtAsFloat('select po_misc.every_element_signed_off( %f )  from dual', [ AHeader_ID ], ADataBaseName) = 0
    else
       AIsWorkflowRejected:= SelectValueFmtAsFloat('select count(b.id) from %s a, %s b where a.%s = %f and a.id = b.%s and nvl(b.signoff,''N'') <> ''Y'' and NVL(b.type, ''Authorize'') = ''Authorize''',
                                       [ AElementTableName,
                                         AResponsibilityTableName,
                                         AHeaderFK_FieldName,
                                         AHeader_ID,
                                         AResponsibilityFK_FieldName ],
                                       ADataBaseName ) > 0;

    {email }
    TQCEvalWorkflowBase.EmailOwnerCompleted( AModuleName,          {module}  {this unit}
                                             A[ 0 ],               {workflowno such as apqp #}
                                             A[ 1 ],               {email}
                                             nil,                  {attachments}
                                             ASendEmailToApprove,  {optional procedure}
                                             ANote,                {extra email body notes}
                                             AIsWorkflowRejected,
                                             A[ 2 ],               {wf_element_id or ADummy}
                                             ADataBaseName );

    {update date field}
    ExecuteCommandFmt('update %s set email_sent_back = sysdate where id = %f', [ AHeaderTableName, AHeader_ID ], ADataBaseName );
  end;
end;

class procedure TQCEvalWorkflowBase.EmailOwnerCompleted( AModuleName,
                                                         AWorkflowNo,
                                                         AEmailTo: string;
                                                         AAttachments: TStringList;
                                                         ASendEmailToApprove: TSendEmailToApprove;
                                                         ANote: string = '';
                                                         AIsWorkflowRejected: Boolean = false;
                                                         AWF_Element_ID : real = 0;
                                                         ADataBaseName: string = 'IQFD');
var
  ASubject: string;
  ABody   : string;
  AFromEmail : string;
  ADelegateEmail : string;
begin
  if AWF_Element_ID <> 0 then
    AFromEmail := SelectValueFmtAsString('select email from team_member where id in (select signoff_team_member_id from wf_responsibility where wf_element_id = %f and signoff_team_member_id is not null)', [ AWF_Element_ID ], ADataBaseName);

  //check if email in delegate is different from email in team_member.  If delegate approved, and email is different, then display email in the delegate to email
  ADelegateEmail := SelectValueFmtAsString('select delegate_email from wf_responsibility where signoff_team_member_id = delegate_team_member_id and wf_element_id = %f and signoff_team_member_id is not null', [ AWF_Element_ID ], ADataBaseName );

  if (AnsiCompareText(AFromEmail, ADelegateEmail) <> 0) and
     (AFromEmail <> '') and
     (ADelegateEmail <> '') then
      AFromEmail := ADelegateEmail;

  {Ex: APQP # XX – approved.}
  if AIsWorkflowRejected then
     ASubject:= Format('%s # %s - rejected', [ AModuleName, AWorkflowNo ])
  else
     ASubject:= Format('%s # %s - approved', [ AModuleName, AWorkflowNo ]);

  if AIsWorkflowRejected then
     ABody:= Format('%s # %s has been rejected.'#13#13, [ AModuleName, AWorkflowNo ])
  else
     ABody:= Format('%s # %s has been completed and approved.'#13#13, [ AModuleName, AWorkflowNo ]);


  if ANote > '' then
     ABody:= ABody + Format('Notes: '#13'%s',  [ ANote ]) + #13#13;

  if AFromEmail <> '' then
       ABody:= ABody + Format('Approved by Email: %s'#13#13,[ AFromEmail ]);

  ABody:= ABody + 'Thank you';

  {if coming from IQAlert then use FSendEmailToApprove}
  if Assigned( ASendEmailToApprove ) then
     ASendEmailToApprove( AEmailTo, ASubject, ABody, AAttachments )
  else
     IQMS.Common.EmailUtils.IQSendMailB(AEmailTo, // ARecipient (String)
                            ASubject, // ASubject (String)
                            ABody, // ABodyText (String)
                            AAttachments, // AAttachments (TStringList)
                            qc_share.SendAsHTML, // AHTML (Boolean)
                            True); // send now = Yes
end;


procedure TQCEvalWorkflowBase.CheckPendingAprovalExpired( ATableName: string; AParentFK_FieldName: string; AParentFK_Value: Real; AParentTableName: string );
var
  AIsExpirePendingBasedOnDueDate: Boolean;
  AFilterExpression: string;
  AHeaderTableName : string;
  AHeader_ID: Real;
begin
  AIsExpirePendingBasedOnDueDate:= FALSE;

  if not FIs_Started then
     EXIT;

  if FExpirePendingPeriod = 0 then
     EXIT;

  if FExpireEmailToAddress = '' then
     EXIT;

  if Assigned(FExtraParams) then
     AIsExpirePendingBasedOnDueDate:= FExtraParams.IsExpirePendingBasedOnDueDate;

  {Note support for excluding weekends - GTT_wf_calendar is pre-assigned}
  AFilterExpression:= IQFormat(' and qc_misc.expire_pending_filter( ''%s'',                  '+  // v_parent_table_name
                               '                                    %f,                      '+  // v_parent_fk_field_value
                               '                                    email_sent,              '+  // v_email_sent
                               '                                    delegate_email_sent,     '+  // v_delegate_email_sent
                               '                                    delegate_team_member_id, '+  // v_delegate_team_member_id
                               '                                    delegate_threshold,      '+  // v_delegate_threshold
                               '                                    %f,                      '+  // v_expire_pending_period
                               '                                    ''%s'' ) = 1             ',  // v_expire_based_on_due_date
                               [ AParentTableName,
                                 AParentFK_Value,
                                 FExpirePendingPeriod,
                                 IQMS.Common.StringUtils.BoolToYN( AIsExpirePendingBasedOnDueDate )]);

  with TFDQuery.Create(nil) do
  try
    Connection := uniMainModule.FDConnection1;
    SQL.Add(IQFormat('select id from %s                 '+                               // car_responsibility
                     ' where %s = %f                    '+                               // car_element_id
                     '   and email_sent is not NULL     '+
                     '   and signoff_date is NULL       '+
                     '   and NVL(type, ''Authorize'') = ''Authorize'' '+
                     '   and pending_signoff_expired is null          '+                 // was not reported before
                         AFilterExpression,                                              // '   and sysdate - nvl( delegate_email_sent, email_sent ) >= %f ', see above ...
                     [ ATableName,                                                       // car_responsibility
                       AParentFK_FieldName,                                              // car_element_id
                       AParentFK_Value ]));                                              // the value of car_element_id
    Open;
    while not Eof do
    begin
      EmailPendingApprovalExpired( ATableName, FieldByName('id').asFloat );
      ExecuteCommandFmt('update %s set pending_signoff_expired = sysdate where id = %f', [ ATableName, FieldByName('id').asFloat ], FDataBaseName);
      Next;
    end;
  finally
    Free;
  end;
end;

{procedure TQCEvalWorkflowBase.ClearAttachmentBatch(const ADeleteFiles: Boolean);
begin
  if FAttachmentBatchID > 0 then
    begin
      // Delete attachement files, if requested
      if ADeleteFiles then
        begin
          with TFDQuery.Create(nil) do
          try
            Connection := MainModule.FDConnection;
            SQL.Add('SELECT unc_file_name');
            SQL.Add('FROM email_attachment');
            SQL.Add(Format('WHERE batch_id = %d', [FAttachmentBatchID]));
            Open;
            while not Eof do
              begin
                DeleteFile(Fields[0].AsString);
                Next;
              end;
          finally
            Free;
          end;
        end;
      // Clear the batch data
      ExecuteCommandFmt('DELETE FROM email_attachment WHERE batch_id = %d',
        [FAttachmentBatchID]);
    end;
end;}

procedure TQCEvalWorkflowBase.CreateAttachmentBatch(const AElement_ID: Real;
  var ABatchID: Real);
var
  i: Integer;
  AAttachments: TStringList;
begin
  if Assigned(FAttachmentBatch) then
    FreeAndNil(FAttachmentBatch);

  FAttachmentBatch := TAttachmentBatch.Create(nil);
  // Create the attachments
  AAttachments := TStringList.Create;
  try
    // Generate the attachments for this class; if this procedure is
    // not overridden by the descendent class, then nothing will happen.
    GetAttachments(AAttachments);
    // Cycle the list and add each file to the email_attachment table.
    for i := 0 to AAttachments.Count - 1 do
      FAttachmentBatch.AddAttachment(AAttachments.Strings[i], 'WF_ELEMENT',
        AElement_ID);
  finally
    FreeAndNil(AAttachments);
  end;
  // Create the attachment records
  FAttachmentBatch.Execute;
  // Return the batch ID
  ABatchID := FAttachmentBatch.AttachmentBatchID;
end;

function TQCEvalWorkflowBase.CreateReportPDF(const AReportName: string;
  const ASelectionCriteria: TStringList; var AFileName: string): Boolean;
begin
  Result := qc_share.CreateReportAsPDF(AReportName, ASelectionCriteria,
    AFileName);
end;

procedure TQCEvalWorkflowBase.DoAfterExecute;
begin
 //
end;

function TQCEvalWorkflowBase.PendingExpiredSubject( ATableName: string; AResponsibility_ID: Real ): string;
begin
  // this is normally overriden to supply meaningful description
  Result:= Format('Responsibility ID %.0f', [ AResponsibility_ID ]);
end;

procedure TQCEvalWorkflowBase.EmailPendingApprovalExpired( ATableName: string; AResponsibility_ID: Real );
var
  ASubject: string;
  ABody   : string;
  AAttachments: TStringList;
  AURL    : string;
  A       : Variant;
begin
  {URL}
  AURL := SelectValueAsString('select app_server_url from iqsys', FDataBaseName );
  IQAssert( AURL > '', 'Application Server URL is not assigned.');
  if AURL[ Length(AURL) ] <> '/' then
     AURL:= AURL + '/';

  A:= SelectValueArrayFmt( 'select email_sent, name, email from %s where id = %f', [ ATableName {ex: car_resonsibility}, AResponsibility_ID ], FDataBaseName);
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  {Ex: Pending Authorization Expired: CAR # 43, Prevent recurrence}
  ASubject:= Format('Pending Authorization Expired: %s', [ PendingExpiredSubject( ATableName, AResponsibility_ID )]);
  ABody:= #13+
          'The following request for authorization has expired.'#13#13 +
          Format('Subject: %s'#13, [ PendingExpiredSubject(ATableName, AResponsibility_ID) ]) +
          PendingExpiredMoreInfo( ATableName, AResponsibility_ID )+#13  +         // 03-04-2013 used in docs to add Library: XYZ
          Format('Sent On: %s'#13, [ DateToStr(A[ 0 ])])               +
          Format('Name: %s'#13, [ A[ 1 ]])                             +
          Format('Email: %s'#13#13, [ A[ 2 ]]);
  ABody:= ABody + 'Thank you'#13#13;

  AAttachments := TStringList.Create;
  try
    GetAttachments(AAttachments);
    {if coming from IQAlert then use FSendEmailToApprove}
    if Assigned( FSendEmailToApprove ) then
       FSendEmailToApprove(FExpireEmailToAddress, ASubject, ABody, AAttachments)
    else
       IQMS.Common.EmailUtils.IQSendMailB(FExpireEmailToAddress, // ARecipient (String)
                              ASubject, // ASubject (String)
                              ABody, // ABodyText (String)
                              AAttachments, // AAttachments (TStringList)
                              qc_share.SendAsHTML, // AHTML (Boolean)
                              True); // send now = Yes
  finally
     AAttachments.Free;
  end;
end;

function TQCEvalWorkflowBase.GetAttachments(
  var AAttachments: TStringList): Boolean;
begin
  Result := False;
  if Assigned(FExtraParams) and Assigned(AAttachments) and
    Assigned(FExtraParams.Attachments) then
    begin
      AAttachments.AddStrings(FExtraParams.Attachments);
      Result := AAttachments.Count > 0;
    end;
end;

function TQCEvalWorkflowBase.GetRejectingTeamMember_ID: Real;
begin
  Result:= -1;  // overriden in each module
end;

procedure TQCEvalWorkflowBase.ResetPendingAprovalExpired( ATableName: string; AID: Real );
begin
  ExecuteCommandFmt('update %s set pending_signoff_expired = null where id = %f', [ ATableName, AID ],
            FDataBaseName );
end;


procedure TQCEvalWorkflowBase.UpdateDateEMailSent( AResponsibilityTableName: string; AResponsibility_ID: Real; AOrigin: string );
begin
  ExecuteCommandFmt('update %s                                     '+   // apqp_resonsibility
            '   set %s = sysdate,                          '+
            '       submit_count = NVL(submit_count,0) + 1 '+
            ' where id = %f',
            [ AResponsibilityTableName,
              sIIf( AOrigin = 'ORIGINAL', 'email_sent', 'delegate_email_sent' ),
              AResponsibility_ID ],
            FDataBaseName);

  if AOrigin = 'DELEGATE' then
     ResetPendingAprovalExpired( AResponsibilityTableName, AResponsibility_ID );
end;


procedure TQCEvalWorkflowBase.AssignRejectNote( var ANote: string );
var
  AName: string;
  AEmail: string;
  ADelegateName : string;
  ADelegateEmail : string;
  ARejectingTeamMemberId : real;
  A : Variant;
begin
  ARejectingTeamMemberId := GetRejectingTeamMember_ID();   // overridden in wf_eval and qc_doc_wf_eval
  A := SelectValueArrayFmt('select name, email from team_member where id = %f', [ ARejectingTeamMemberId ], FDataBaseName);

  if VarArrayDimCount( A ) = 0 then
    EXIT;

  AName := A[ 0 ];
  AEmail:= A[ 1 ];

  ANote:= ANote + IQFormat( 'Authorizer Name: %s'#13 +
                            'Authorizer Email: %s'#13, [ AName,
                                                         AEmail ])
end;

procedure TQCEvalWorkflowBase.AssignRejectedOwnerEmailTo( var AEmailTo: string );
begin
  // used in PO workflow by templates and AP
end;

class procedure TQCEvalWorkflowBase.BeforeDoExecute(AHeaderTableName: string; AHeader_ID,  AElement_ID: Real; ADataBase: string );
begin
  // coming from IQAlert the database is not IQ and the calendar has been preassigned already in qc_share in the big loop
  // note when running workflow manually off the form we do want this line executed
  if ADataBase = cnstFDConnectionName then
     TWorkflowShell.PrepareTemporaryWorkflowCalendarWeekends( AHeaderTableName, AHeader_ID, ADataBase );  // qc_share.pas
end;

class procedure TQCEvalWorkflowBase.AssignExtraNote( var ANote: string;
                                                     AModuleName,
                                                     AHeaderTableName: string;
                                                     AHeader_ID: Real;
                                                     ADataBaseName: string );
var
  A: Variant;
  AEplant_ID : Real;
  AEplantName: string;
  AVendorNo  : string;
  ACompany   : string;
  APO_ID     : Real;
  AWF_Header_ID: Real;


  function _IsApproved: Boolean;
  var
    S: string;
  begin
    S:= SelectValueByID('nvl(rtrim(approved_by), ''*'')', 'po', APO_ID, ADataBaseName);
    Result:= not StrInList( S, ['*', 'Denied', 'Not Approved']);
  end;

  // ---------------------------------------------------------------------------
  procedure _AssignExtraNotePO;
  var
    APoNo: string;
  begin
    if AHeaderTableName = 'WF_HEADER' then
       A:= SelectValueArrayFmt('select rtrim(po.pono),              '+
                          '       po.eplant_id,                '+
                          '       e.name,                      '+
                          '       v.vendorno,                  '+
                          '       v.company,                   '+
                          '       po.id                        '+
                          '  from %s a, po, eplant e, vendor v '+
                          ' where a.id = %f                    '+
                          '   and a.source_id = po.id          '+
                          '   and po.eplant_id = e.id(+)       '+
                          '   and po.vendor_id = v.id(+)       ',
                        [ AHeaderTableName,    {'WF_HEADER'  }
                          AHeader_ID ], ADataBaseName )

    else if AHeaderTableName = 'PO' then
       A:= SelectValueArrayFmt('select rtrim(po.pono),              '+
                          '       po.eplant_id,                '+
                          '       e.name,                      '+
                          '       v.vendorno,                  '+
                          '       v.company,                   '+
                          '       po.id                        '+
                          '  from %s po, eplant e, vendor v    '+
                          ' where po.id = %f         '+
                          '   and po.eplant_id = e.id(+)       '+
                          '   and po.vendor_id = v.id(+)       ',
                        [ AHeaderTableName,    {'WF_HEADER'  }
                          AHeader_ID ], ADataBaseName )
    else
       EXIT;

    if VarArrayDimCount( A ) = 0 then
       EXIT;

    AWF_Header_ID:= 0;
    if AHeaderTableName = 'WF_HEADER' then
       AWF_Header_ID:= AHeader_ID;

    APoNo      := 'PO # ' + A[ 0 ];
    AEplant_ID := A[ 1 ];
    AEplantName:= '';
    if AEplant_ID > 0 then
       AEplantName:= Format('%.0f [%s]', [ AEplant_ID, A[ 2 ] ]);
    AVendorNo  := A[ 3 ];
    ACompany   := A[ 4 ];
    APO_ID     := A[ 5 ];

    if AHeaderTableName = 'WF_HEADER' then
       APoNo:= SelectValueFmtAsString('select wf_share.get_po_requisition_title_ex( %f, %f ) from dual', [ APO_ID, AWF_Header_ID ], ADataBaseName)
    else if (AHeaderTableName = 'PO' ) and not _IsApproved then
       APoNo:= SelectValueFmtAsString('select wf_share.get_po_requisition_title( %f ) from dual', [ APO_ID, AWF_Header_ID ], ADataBaseName);

    if ANote > '' then
       ANote:= ANote + #13#13;

 // ANote:= ANote +  Format( 'PO#: %s'#13+
    ANote:= ANote +  Format( '%s'#13+
                             'EPlant: %s'#13+
                             'Vendor: %s, %s'#13,
                             [ APoNo,          // note it includes PO# or Requisition#
                               AEplantName,
                               Trim(AVendorNo),
                               ACompany ]);
  end;

  // ---------------------------------------------------------------------------
  procedure _AssignExtraNoteAP;
  var
    AAPInvoiceNo: string;
  begin
    A:= SelectValueArrayFmt('select ap.invoice_no,               '+
                       '       ap.eplant_id,                '+
                       '       e.name,                      '+
                       '       v.vendorno,                  '+
                       '       v.company,                   '+
                       '       ap.id                        '+
                       '  from %s a, apprepost ap, eplant e, vendor v '+
                       ' where a.id = %f                    '+
                       '   and a.source_id = ap.id          '+
                       '   and ap.eplant_id = e.id(+)       '+
                       '   and ap.vendor_id = v.id(+)       ',
                     [ AHeaderTableName,    {'WF_HEADER'  }
                       AHeader_ID ], ADataBaseName );
    if VarArrayDimCount( A ) = 0 then
       EXIT;

    AAPInvoiceNo:= A[ 0 ];
    AEplant_ID := A[ 1 ];
    AEplantName:= '';
    if AEplant_ID > 0 then
       AEplantName:= Format('%.0f [%s]', [ AEplant_ID, A[ 2 ] ]);
    AVendorNo  := A[ 3 ];
    ACompany   := A[ 4 ];

    if ANote > '' then
       ANote:= ANote + #13#13;

    ANote:= ANote +  Format( 'AP Invoice#: %s'#13+
                             'EPlant: %s'#13+
                             'Vendor: %s, %s'#13,
                             [ AAPInvoiceNo,
                               AEplantName,
                               AVendorNo,
                               ACompany ]);
  end;


// -----------------------------------------------------------------------------
begin
  if (AModuleName = 'PO Workflow') then
     _AssignExtraNotePO
  else if AModuleName = wf_rscstr.cTXT000013 {'AP Invoice Workflow'} then
     _AssignExtraNoteAP
end;


procedure TQCEvalWorkflowBase.AssignNote(var ANote: string);
begin
end;

class procedure TQCEvalWorkflowBase.AssignPODetailsInfo(APO_ID: Real; var AList: TStringList; ADataBaseName: string = 'IQFD');
begin
  AList.Add( Format( wf_rscstr.cTXT000006 {'PO Type: %s'}, [ SelectValueByID('po_type', 'po', APO_ID) ]));
  AList.Add( Format( wf_rscstr.cTXT000008 {'EPlant: %s'},  [ SelectValueFmtAsString('select e.name from po, eplant e where po.id = %f and po.eplant_id = e.id', [ APO_ID ])]));
  LoadColumnValueIntoStringList( AList,
                                       Format('select seq || ''. '' || rtrim(item_number) || '', '' || rtrim(item_descrip) from v_po_detail where id = %.0f',
                                       [ APo_ID ]),
                                       nil,       // AExecuteOnAdd
                                       FALSE,     // AClearList
                                       ADataBaseName );
end;


class procedure TQCEvalWorkflowBase.CheckNotifyElementIsCompleted( AModuleName,                                {'APQP' or 'Process PQ'}
                                                                   AHeaderTableName,                           {'APQP'}
                                                                   AElementTableName,                          {'APQP_ELEMENT'}
                                                                   AHeaderFieldName,                           {'APQPNO'}
                                                                   AHeaderFK_FieldName: string;                {'APQP_ID'}
                                                                   AElement_ID: Real;                          {APQP_ELEMENT.ID}
                                                                   AResponsibilityTableName: string;           {'APQP_RESPONSIBILITY'}
                                                                   AElementFK_FieldName: string;               {'APQP_ELEMENT_ID'}
                                                                   ADataBaseName: string;
                                                                   ASendEmailToApprove: TSendEmailToApprove );
var
  AHeader_ID  : Real;
  A           : Variant;
  AWorkflowNo : string;
  AElementName: string;
  ANote       : string;
  ASubject    : string;
  ABody       : string;
  AEmailList  : TStringList;
  I           : Integer;

  procedure _AssignWorkflowInfo;
  begin
    {get header field such as apqp_id}
    AHeader_ID:= SelectValueByID( AHeaderFK_FieldName, AElementTableName, AElement_ID, ADataBaseName );

    {get module}
    if (AModuleName = 'PO Workflow') and (AHeaderTableName = 'WF_HEADER') then
    // A:= SelectValueArrayFmt('select a.%s || '', PO # '' || rtrim(po.pono) from %s a, po '+
       A:= SelectValueArrayFmt('select a.%s || '', '' || wf_share.get_po_requisition_title( po.id ) from %s a, po '+
                          ' where a.id = %f and a.source_id = po.id',
                        [ AHeaderFieldName,    {'WORKFLOWNO'}
                          AHeaderTableName,    {'WF_HEADER'  }
                          AHeader_ID ], ADataBaseName )

    else if AModuleName = wf_rscstr.cTXT000013 {'AP Invoice Workflow'} then
       A:= SelectValueArrayFmt('select a.%s || '', AP Invoice# '' || rtrim(ap.invoice_no) from %s a, apprepost ap '+
                          ' where a.id = %f and a.source_id = ap.id',
                        [ AHeaderFieldName,    {'CARNO'}
                          AHeaderTableName,    {'APQP'  }
                          AHeader_ID ], ADataBaseName )

    else
       A:= SelectValueArrayFmt('select a.%s from %s a where a.id = %f',
                        [ AHeaderFieldName,    {'CARNO'}
                          AHeaderTableName,    {'APQP'  }
                          AHeader_ID ], ADataBaseName );
    if VarArrayDimCount( A ) > 0 then
       AWorkflowNo:= A[ 0 ];

    AElementName:= SelectValueFmtAsString('select descrip from %s where id = %f', [ AElementTableName, AElement_ID ]);
  end;


  function _LoadEmailList: Boolean;
  begin
    with TFDQuery.Create(nil) do
    try
      Connection := uniMainModule.FDConnection1;

      SQL.Add(IQFormat('select email from %s where %s = %f and element_complete_notification = ''Y'' and email is not null order by id',
                       [ AResponsibilityTableName,
                         AElementFK_FieldName,
                         AElement_ID ]));
      Open;
      while not Eof do
      begin
        AEmailList.Add(FieldByName('email').asString );
        Next;
      end;
    finally
      Free;
    end;

    Result:= AEmailList.Count > 0;
  end;

begin
  ANote:= '';
  AEmailList:= TStringList.Create;
  try
    if not _LoadEmailList() then
       EXIT;

    _AssignWorkflowInfo();

    AssignExtraNote( ANote, AModuleName, AHeaderTableName, AHeader_ID, ADataBaseName );

    {Ex: APQP # 123, element XYZ is completed}
    ASubject:= Format('%s # %s, %s is completed', [ AModuleName, AWorkflowNo, AElementName ]);

    ABody:= Format('%s # %s, %s has been completed.'#13#13, [ AModuleName, AWorkflowNo, AElementName ]);

    if ANote > '' then
       ABody:= ABody + Format('Notes: '#13'%s',  [ ANote ]) + #13#13;

    ABody:= ABody + 'Thank you';

    for I:= 0 to AEmailList.Count - 1 do
    begin
      if Assigned( ASendEmailToApprove ) then
         ASendEmailToApprove( AEmailList[I], ASubject, ABody, nil )
      else
         IQMS.Common.EmailUtils.IQSendMailB( AEmailList[I], // ARecipient (String)
                                 ASubject,      // ASubject (String)
                                 ABody,         // ABodyText (String)
                                 nil, // AAttachments (TStringList)
                                 qc_share.SendAsHTML, // AHTML (Boolean)
                                 True);         // send now = Yes
    end;
  finally
    AEmailList.Free;
  end;
end;

function TQCEvalWorkflowBase.PendingExpiredMoreInfo( ATableName: string; AResponsibility_ID: Real ): string;
begin
   // 03-04-2013 used in docs to add Library: XYZ
   Result:= '';
end;

procedure TQCEvalWorkflowBase.AddRejectorName( var ABody: string );
begin
  {overriden in qc_doc_wf_eval}
end;

{$ENDREGION 'TQCEvalWorkflowBase'}

end.

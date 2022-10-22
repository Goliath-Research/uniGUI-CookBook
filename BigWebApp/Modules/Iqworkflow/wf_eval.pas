unit wf_eval;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  wf_const,
  qc_eval_share,
  QC_Share,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  IQMS.Common.DataConst;

type
  TEvalWorkFlow = class( TQCEvalWorkflowBase )  {qc_eval_share}
  private
    function IsAnyRejected: Boolean;
    function IsAnySentOutAndPendingReview: Boolean;
    function IsAnyPendingReviewCanDelegate: Boolean;
    procedure MarkElementComplete;
    procedure NotifyTeamMembers;
    procedure EmailTeamMember( AWF_Responsibility_ID: Real; AEmailTo, AType: string );
  protected
    function IsEverythingApproved: Boolean; virtual;
    function GetKind: string;
    procedure MarkHeaderComplete; virtual;
    function ConfigureLink( AURL: string; AWF_Responsibility_ID: Real ): string; virtual;
    function GetEMailSubject(AWF_Responsibility_ID: Real; AType: string): string; virtual;
    function PendingExpiredSubject( ATableName: string; AResponsibility_ID: Real ): string; override;
    procedure AssignRejectNote(var ANote: string); override;
    procedure AssignNote(var ANote: string); override;
    function GetRejectingTeamMember_ID: Real; override;
    function CreateAttachment(var AFileName: string): Boolean; virtual;
  public
    FWF_Element_ID   : Real;
    FWF_Header_ID    : Real;
    FState           : TWorkflowState;   // wsUnknown, wsInProgress, wsApproved, wsRejected

    FWorkflowNo      : string;
    FIsSeqWorkflow   : Boolean;
    FElement_Descrip : string;

    FKind            : string;

    constructor Create( AWF_Element_ID: Real; ADataBaseName: string = cnstFDConnectionName; ASendEmailToApprove: TSendEmailToApprove = NIL; AExtraParams: TQCEvalExtraParams = nil );
    procedure Execute;
    class procedure DoExecute( AWF_Element_ID: Real; ADataBaseName: string = cnstFDConnectionName; ASendEmailToApprove: TSendEmailToApprove = NIL; AExtraParams: TQCEvalExtraParams = nil );
  end;

implementation

uses
  IQMS.Common.NLS,
  wf_rscstr,
  IQMS.Common.EmailUtils,
  DB,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils,
  Variants,
  IQMS.Common.DataLib;

class procedure TEvalWorkFlow.DoExecute( AWF_Element_ID: Real; ADataBaseName: string = cnstFDConnectionName; ASendEmailToApprove: TSendEmailToApprove = NIL; AExtraParams: TQCEvalExtraParams = nil );
begin
  self.BeforeDoExecute( 'WF_HEADER', SelectValueByID('wf_header_id', 'wf_element', AWF_Element_ID, ADataBaseName), AWF_Element_ID, ADataBaseName ); // assign temporary table gtt_wf_element used in end_date calcs
  self.Create(AWF_Element_ID, ADataBaseName, ASendEmailToApprove, AExtraParams).Execute;
end;

constructor TEvalWorkFlow.Create( AWF_Element_ID: Real; ADataBaseName: string = cnstFDConnectionName; ASendEmailToApprove: TSendEmailToApprove = NIL; AExtraParams: TQCEvalExtraParams = nil );
var
  A: Variant;
begin
  FWF_Element_ID:= AWF_Element_ID;
  FState        := wsUnknown;
  FDataBaseName := ADataBaseName;
  SendEmailToApprove:= ASendEmailToApprove;
  FExtraParams  := AExtraParams;
  if Assigned(FExtraParams) then
  begin
     FExpirePendingPeriod := FExtraParams.ExpirePendingPeriod;
     FExpireEmailToAddress:= FExtraParams.ExpireEmailToAddress;
  end;

  A:= SelectValueArrayFmt( 'select h.workflowno, elem.seq_workflow, elem.descrip, h.kind, h.is_started  '+
                      '  from wf_element elem, wf_header h             '+
                      ' where elem.id = %f and elem.wf_header_id = h.id',
                      [ FWF_Element_ID ], FDataBaseName);
  IQAssert( VarArrayDimCount( A ) > 0, 'Unable to locate workflow element ID ' + FloatToStr(FWF_Element_ID));

  FWorkflowNo     := A[ 0 ];
  FIsSeqWorkflow  := A[ 1 ] = 'Y';
  FElement_Descrip:= FixStr(A[ 2 ]);
  FKind           := A[ 3 ];
  FIs_Started     := A[ 4 ] = 'Y';

  FWF_Header_ID:= SelectValueByID( 'wf_header_id', 'wf_element', FWF_Element_ID, FDataBaseName );
end;

function TEvalWorkFlow.CreateAttachment(var AFileName: string): Boolean;
begin
  // nothing; for an example, see wf_maint_project_manager.pas.
end;

{ Main }
procedure TEvalWorkFlow.Execute;
begin
  if not FIs_Started then
     begin
       FState:= wsUnknown;
     end

  else if IsEverythingApproved then
     begin
       FState:= wsApproved;
       MarkElementComplete;
     end

  else if IsAnyRejected then
     begin
       FState:= wsRejected;
       CheckNotifyOwnerRejected( GetKind,                 // AModuleName,   {qc_eval_share.pas}
                                 'WF_HEADER',             // AHeaderTableName
                                 'WF_ELEMENT',            // AElementTableName
                                 'WORKFLOWNO',            // AHeaderFieldName
                                 'WF_HEADER_ID',          // AHeaderFK_FieldName
                                 FWF_Element_ID );        // AElement_ID
     end

  else if IsAnyPendingReviewCanDelegate then
     begin
       FState:= wsInProgress;
       NotifyTeamMembers;
     end

  else if FIsSeqWorkflow and IsAnySentOutAndPendingReview then
     begin
       FState:= wsInProgress;
     end

  else
     begin
       FState:= wsInProgress;
       NotifyTeamMembers;
     end;

  CheckPendingAprovalExpired('wf_responsibility', 'wf_element_id', FWF_Element_ID, 'WF_ELEMENT' );  // 02-12-2009

  DoAfterExecute;
end;

function TEvalWorkFlow.IsEverythingApproved: Boolean;
begin
  Result:= SelectValueFmtAsFloat('select count(*) from wf_responsibility '+
                     ' where wf_element_id = %f              ',
                     [ FWF_Element_ID ], FDataBaseName) = 0;
  if Result then
     EXIT;

  Result:= (SelectValueFmtAsFloat('select 1 from wf_responsibility        '+
                     ' where wf_element_id = %f              '+
                     '   and ( email_sent is NULL                       '+
                     '         or                                       '+
                     '         NVL(type, ''Authorize'') = ''Authorize'' '+
                     '         and                                      '+
                     '         ( signoff_date is NULL                   '+
                     '           or                                     '+
                     '           NVL(signoff, ''N'') = ''N''))          '+
                     '   and rownum < 2                                 ',
                     [ FWF_Element_ID ], FDataBaseName) = 0)
           and
             IsNoResponsiblesOrAnyAuthorizeFound( FWF_Element_ID,
                                                  'WF_HEADER',
                                                  'WF_ELEMENT',
                                                  'WF_RESPONSIBILITY',
                                                  FDataBaseName );
end;

function TEvalWorkFlow.IsAnyRejected: Boolean;
begin
  FRejected_WF_Responsibility_ID:= SelectValueFmtAsFloat('select id from wf_responsibility    '+
                                             ' where wf_element_id = %f          '+
                                             '   and email_sent is not NULL      '+
                                             '   and signoff_date is not NULL    '+
                                             '   and NVL(signoff, ''N'') = ''N'' '+
                                             '   and NVL(type, ''Authorize'') = ''Authorize'' '+
                                             '   and rownum < 2                  ',
                                             [ FWF_Element_ID ], FDataBaseName );
  Result:= FRejected_WF_Responsibility_ID > 0;
end;

function TEvalWorkFlow.IsAnySentOutAndPendingReview: Boolean;
begin
  Result:= SelectValueFmtAsFloat('select 1 from wf_responsibility '+
                     ' where wf_element_id = %f       '+
                     '   and email_sent is not NULL    '+
                     '   and signoff_date is NULL      '+
                     '   and NVL(type, ''Authorize'') = ''Authorize'' '+
                     '   and rownum < 2                ',
                     [ FWF_Element_ID ], FDataBaseName) = 1;
end;

function TEvalWorkFlow.IsAnyPendingReviewCanDelegate: Boolean;
begin
  Result:= SelectValueFmtAsFloat('select 1 from wf_responsibility        '+
                     ' where wf_element_id = %f              '+
                     '   and email_sent is not NULL          '+
                     '   and delegate_email_sent is NULL     '+
                     '   and qc_misc.can_delegate( email_sent, delegate_team_member_id, delegate_threshold ) = 1 ' +
                     '   and signoff_date is NULL            '+
                     '   and NVL(type, ''Authorize'') = ''Authorize'' '+
                     '   and rownum < 2                ',
                     [ FWF_Element_ID ], FDataBaseName) = 1;
end;

procedure TEvalWorkFlow.NotifyTeamMembers;
begin
  with TFDQuery.Create( NIL ) do
  try
    Connection := uniMainModule.FDConnection1;
    SQL.Add(IQFormat('select id,                                                              '+
                     '       decode( email_sent, null, email, delegate_email ) as email,      '+
                     '       decode( email_sent, null, ''ORIGINAL'', ''DELEGATE'') as origin, '+
                     '       NVL(type, ''Authorize'') as type                                 '+
                     '  from wf_responsibility                       '+
                     ' where wf_element_id = %f                      '+
                     '   and qc_misc.should_send_email( email_sent, delegate_email_sent, delegate_team_member_id, delegate_threshold ) = 1 '+
                     ' order by seq',
                     [ FWF_Element_ID ]));
    Open;
    while not Eof do
    begin
      EmailTeamMember( FieldByName('ID').asFloat, FieldByName('email').asString, FieldByName('type').asString );

      {update email_sent or delegate_email_sent, submit_count, reset pendig_approval_expired if delegated}
      UpdateDateEMailSent('wf_responsibility', FieldByName('ID').asFloat, FieldByName('origin').asString );

      if FIsSeqWorkflow and (FieldByName('type').asString = 'Authorize') then
         BREAK;

      Next;
    end;
  finally
    Free;
  end;
end;

procedure TEvalWorkFlow.EmailTeamMember( AWF_Responsibility_ID: Real; AEmailTo, AType: string );
var
  ASubject: string;
  ABody   : string;
  AAttachments: TStringList;
  AURL    : string;
  ALink   : string;
  AKind   : string;
  AResults: Variant;
begin
  AKind:= GetKind;
  ABody:= '';

  {Email}
  IQAssert( AEmailTo > '', Format('Email address is not assigned. %s Responsibility ID %.0f', [ AKind, AWF_Responsibility_ID ]));

  {Type}
  AType:= ProperCase( AType );
  if AType = '' then
     AType:= 'Review';

  {URL}
  AURL := SelectValueAsString('select app_server_url from iqsys', FDataBaseName);
  IQAssert( AURL > '', Format('Application Server URL is not assigned. %s Responsibility ID %.0f', [ AKind, AWF_Responsibility_ID ]));
  if AURL[ Length(AURL) ] <> '/' then
     AURL:= AURL + '/';

  {Ex: CAR # 43, Prevent recurrence - Review}
  // ASubject:= Format('%s # %s - %s - %s', [ AKind, FWorkflowNo, FElement_Descrip, AType ]);
  ASubject:= GetEmailSubject( AWF_Responsibility_ID, AType );

  // wf_rscstr.cTXT000003 = 'CRM Workflow'
  if (CompareText(AKind, wf_rscstr.cTXT000003) = 0) and ( FWF_Header_ID <> 0 ) then
  begin
    AResults:= SelectValueArrayFmt('select nvl(arcusto_custno,  ''N/A''),    '+ //[0]
                              '       nvl(arcusto_company, ''N/A''),    '+ //[1]
                              '       nvl(crm_opportunity_id, 0),       '+ //[2]
                              '      (select nvl(description, ''N/A'')  '+ //[3]
                              '         from crm_opportunity            '+
                              '        where id = crm_opportunity_id)   '+
                              '  from wf_header '+
                              ' where id = %f', [ FWF_Header_ID ], FDataBaseName);
    if VarArrayDimCount( AResults ) > 0 then
    begin
      // wf_rscstr.cTXT000009 = 'Customer #:'
      ABody:= Format('%s  %s'#13,    [ wf_rscstr.cTXT000009, AResults[ 0 ]]);
      // wf_rscstr.cTXT000010 = 'Customer Name:'
      ABody:= Format('%s %s  %s'#13, [ ABody, wf_rscstr.cTXT000010,
        Variants.VarToStr(AResults[1])]);
      if (Variants.VarAsType(AResults[2], varInteger) > 0 ) then
      begin
        // wf_rscstr.cTXT000011 = 'Opportunity #:'
        ABody:= Format('%s %s  %s'#13, [ ABody, wf_rscstr.cTXT000011,
          Variants.VarToStr(AResults[2])]);
        // wf_rscstr.cTXT000012 = 'Opportunity Descrip:'
        ABody:= Format('%s %s  %s'#13, [ ABody, wf_rscstr.cTXT000012,
          Variants.VarToStr(AResults[3])]);
      end;
      ABody:= ABody + #13#13;
    end;
  end;

 // wf_rscstr.cTXT000007 = 'Project Workflow';
  if (CompareText(AKind, wf_rscstr.cTXT000007) = 0) and ( FWF_Header_ID <> 0 ) then
  begin
    AResults:= SelectValueArrayFmt(
      'SELECT project_rfq,                      '#13 +
      '       project_name,                     '#13 +
      '       project_type                      '#13 +
      '  FROM wf_header                         '#13 +
      ' WHERE id = %.0f                         ',
      [FWF_Header_ID], FDataBaseName);
    if VarArrayDimCount( AResults ) > 0 then
    begin
      // wf_rscstr.cTXT000014 = 'Project #';
      ABody:= Format('%s  %s'#13,    [ wf_rscstr.cTXT000014,
        Variants.VarToStr(AResults[0])]);
      // wf_rscstr.cTXT000015 = 'Project Name';
      ABody:= Format('%s %s  %s'#13, [ ABody, wf_rscstr.cTXT000015,
        Variants.VarToStr(AResults[1])]);
      // wf_rscstr.cTXT000016 = 'Project Type';
      ABody:= Format('%s %s  %s'#13, [ ABody, wf_rscstr.cTXT000016,
        Variants.VarToStr(AResults[2])]);
      ABody:= ABody + #13#13;
    end;
  end;

  {Ex: http://P450/web_doc_admin.get_data?v_WF_Responsibility_ID=12345 }
  ABody:= Format(ABody +
    'Click on the link below to %s %s element ''%s'''#13#13,
    [LowerCase(AType), AKind, FElement_Descrip]);

  AssignNote( ABody );

  // ALink:= Format('%siqms/web_wf_admin.get_data?v_wf_responsibility_id=%.0f'#13#13, [ AURL, AWF_Responsibility_ID ]);
  ALink:= ConfigureLink( AURL, AWF_Responsibility_ID );
  ExecuteCommandFmt('update wf_responsibility set signoff_link = ''%s'', signoff_subject = ''%s'' where id = %f',
            [ ALink, FixStr(ASubject), AWF_Responsibility_ID ], FDataBaseName);

  ABody:= ABody + ALink + #13#13;

  ABody:= ABody + 'Thank you'#13#13;
  ABody:= ABody + Format('(submission counter: %.0f)',
    [DToF(SelectValueByID('submit_count', 'wf_responsibility',
     AWF_Responsibility_ID, FDataBaseName))+1 ]);
  AAttachments := TStringList.Create;
  try
    GetAttachments(AAttachments); // in base class (qc_eval_share.pas)
    {if coming from IQAlert then use FSendEmailToApprove}
    if Assigned( FSendEmailToApprove ) then
       FSendEmailToApprove( AEmailTo, ASubject, ABody, AAttachments)
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

procedure TEvalWorkFlow.MarkElementComplete;
begin
  IQAssert( FWF_Element_ID > 0, 'Workflow Element ID is NULL - unable to toggle to ''Complete''' );
  ExecuteCommandFmt('update wf_element set complete_date = SYSDATE where id = %f', [ FWF_Element_ID ], FDataBaseName);

  if SelectValueFmtAsFloat('select count(*) from wf_element where wf_header_id = %f and complete_date is NULL', [ FWF_Header_ID ], FDataBaseName) = 0 then
     MarkHeaderComplete;

  TQCEvalWorkflowBase.CheckNotifyOwnerCompleted( GetKind,                 // AModuleName,   {qc_eval_share.pas}
                                                 'WF_HEADER',             // AHeaderTableName
                                                 'WF_ELEMENT',            // AElementTableName
                                                 'WORKFLOWNO',            // AHeaderFieldName
                                                 'WF_HEADER_ID',          // AHeaderFK_FieldName
                                                 FWF_Element_ID,          // AElement_ID
                                                 FDataBaseName,
                                                 FSendEmailToApprove );

  TQCEvalWorkflowBase.CheckNotifyElementIsCompleted( GetKind,                 // AModuleName,   {qc_eval_share.pas}
                                                     'WF_HEADER',             // AHeaderTableName
                                                     'WF_ELEMENT',            // AElementTableName
                                                     'WORKFLOWNO',            // AHeaderFieldName
                                                     'WF_HEADER_ID',          // AHeaderFK_FieldName
                                                     FWF_Element_ID,          // AElement_ID
                                                     'WF_RESPONSIBILITY',     // AResponsibilityTableName
                                                     'WF_ELEMENT_ID',         // AElementFK_FieldName
                                                     FDataBaseName,
                                                     FSendEmailToApprove );
end;

procedure TEvalWorkFlow.MarkHeaderComplete;
begin
  ExecuteCommandFmt('update wf_header set complete_date = SYSDATE where id = %f', [ FWF_Header_ID ], FDataBaseName);
end;

function TEvalWorkFlow.GetKind: string;
begin
  if CompareText( FKind, wf_const.WF_KIND_DEV ) = 0 then
     Result:= 'Deviation'
  else if CompareText( FKind, wf_const.WF_KIND_MRB ) = 0 then
     Result:= 'MRB'
  else if CompareText( FKind, wf_const.WF_KIND_PLM ) = 0 then
     Result:= 'PLM'
  else if CompareText( FKind, wf_const.WF_KIND_DHR ) = 0 then
     Result:= 'DHR'
  else if CompareText( FKind, wf_const.WF_KIND_CRM) = 0 then
     Result:= wf_rscstr.cTXT000003 // 'CRM Workflow'
  else if CompareText( FKind, wf_const.WF_KIND_PO ) = 0 then
     Result:= 'PO Workflow'
  else if CompareText( FKind, wf_const.WF_KIND_DOC ) = 0 then
     Result:= 'Document Revision Workflow'
  else if CompareText( FKind, wf_const.WF_KIND_AUDIT) = 0 then
     Result:= wf_rscstr.cTXT000002 // 'Quality Audit Workflow'
  else if CompareText( FKind, wf_const.WF_KIND_PROJECT) = 0 then
     Result:= wf_rscstr.cTXT000007 // 'Project Workflow'
  else if CompareText( FKind, wf_const.WF_KIND_AP) = 0 then
     Result:= wf_rscstr.cTXT000013 {'AP Invoice Workflow'}
  else
     Result:= 'Workflow';
end;

function TEvalWorkFlow.ConfigureLink( AURL: string; AWF_Responsibility_ID: Real): string;
begin
  // 11/07/2013 Ensured Kind attribute is assigned to v_module param.
  Result:= Format('%siqms/web_wf_admin.get_data?v_wf_responsibility_id=%.0f' +
   '&v_module=%s', [AURL, AWF_Responsibility_ID, FKind]);
end;

function TEvalWorkFlow.GetEMailSubject( AWF_Responsibility_ID: Real; AType: string ): string;
begin
  Result:= Format('%s # %s - %s - %s', [ GetKind, FWorkflowNo, FElement_Descrip, AType ]);
end;

function TEvalWorkFlow.PendingExpiredSubject(ATableName: string; AResponsibility_ID: Real): string;
begin
  Result:= GetEmailSubject( AResponsibility_ID, 'Authorize' );
end;

procedure TEvalWorkFlow.AssignNote(var ANote: string);
var
  ADescrip: string;
begin
  inherited;

  if not StrInList( FKind, ['CRM', 'DEV'])  then
     EXIT;

  ADescrip:= SelectValueByID('descrip', 'wf_header', FWF_Header_ID, FDataBaseName );
  if ADescrip > '' then
     ANote:= ANote + Format('Description: %s', [ ADescrip ]) + #13#13;
end;

procedure TEvalWorkFlow.AssignRejectNote(var ANote: string);
begin
  // 07-10-2013 this will assign description for CRM and DEV kinds
  AssignNote(ANote);

  inherited;

  ANote:= ANote + SelectValueByID('text', 'wf_responsibility', FRejected_WF_Responsibility_ID, FDataBaseName);
end;

function TEvalWorkFlow.GetRejectingTeamMember_ID: Real;
begin
  inherited;  // n
  Result:= SelectValueByID('signoff_team_member_id', 'wf_responsibility', FRejected_WF_Responsibility_ID, FDataBaseName);
end;




end.

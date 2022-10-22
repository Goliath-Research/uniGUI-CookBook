unit QC_Del_Collect;

{objects to collect data from different modules}

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms;

type
  TQCReferenceModule = ( rmAPQP,
                         rmCAPA,
                         rmCAR,
                         rmDEV,
                         rmECO,
                         rmMRB,
                         rmPPAP,
                         rmPROC_PQ,
                         rmPROD_PQ,
                         rmCRM,
                         rmPLM,
                         rmDHR,
                         rmDOC,
                         rmLIB_TEAM,
                         rmDOC_TEMPLATE,
                         rmPO,
                         rmAUDIT,
                         rmEMP,
                         rmAPP );
  
type
  {Basic class}
  TQC_CollectReferenceBase = class
     FModule                     : TQCReferenceModule;
     FTeam_Member_ID             : Real;
     FSQL                        : TStrings;
     
     FTemplateHeaderKind         : string;
     FTemplateHeaderName         : string;
     FTemplateElementName        : string;
     FTemplateSource             : string;
     FTemplateDescription        : string;
     
     FWorkflowHeaderKind         : string;
     FWorkflowHeaderName         : string;
     FWorkflowElementName        : string;
     FWorkflowDescription        : string;
     FWorkflowHeaderFieldName    : string;
     FWorkflowElementFieldName   : string;
     FWorkflowResponsibilityTable: string;
     FWorkflowTemplateFieldName  : string;
                                          
     procedure Init; virtual;
     procedure AddTemplateReference; virtual;
     procedure AddWorkflowReference; virtual;
     constructor Create( AModule: TQCReferenceModule; ATeam_Member_ID: Real; ASQL: TStrings );
     class procedure Execute( AModule: TQCReferenceModule; ATeam_Member_ID: Real; ASQL: TStrings );
  end;

  
  {APQP, PPAP, CAR, ECO}
  TQC_CollectReferenceStandard = class( TQC_CollectReferenceBase )
     procedure Init; override;
  end;


  {DEV, MRB, CRM, PLM, DHR, EMP, APP}
  TQC_CollectReferenceExtended = class( TQC_CollectReferenceBase )
     procedure Init; override;
  end;                                 
  
  {External_Doc}
  TQC_CollectReferenceExternalDoc = class( TQC_CollectReferenceBase )
     procedure Init; override;
     procedure AddTemplateReference; override;
     procedure AddWorkflowReference; override;
  end;                    

  {External_Doc Template Based}
  TQC_CollectReferenceExternalDocTemplateBased = class( TQC_CollectReferenceBase )
     procedure Init; override;
     procedure AddTemplateReference; override;
     procedure AddWorkflowReference; override;
  end;                                 
               
  
  {Library Team}
  TQC_CollectReferenceLibTeam = class( TQC_CollectReferenceBase )
     procedure Init; override;
     procedure AddTemplateReference; override;
     procedure AddWorkflowReference; override;
  end;                                 
  

implementation

uses
  IQMS.Common.qc_const,
  IQMS.Common.NLS,
  TypInfo;

{ TQC_CollectReferenceBase }

constructor TQC_CollectReferenceBase.Create( AModule: TQCReferenceModule; ATeam_Member_ID: Real; ASQL: TStrings );
begin
  FModule        := AModule;
  FTeam_Member_ID:= ATeam_Member_ID;
  FSQL           := ASQL;  {this is the query sql that will get updated with whatever we find for AModule}
end;               

class procedure TQC_CollectReferenceBase.Execute( AModule: TQCReferenceModule; ATeam_Member_ID: Real; ASQL: TStrings );
begin
  with self.Create( AModule, ATeam_Member_ID, ASQL ) do
  try
    Init;

    {THe following templates skipped because they are shown on the parents: rmPROC_PQ is shown in APQP, rmPROD_PQ in PPAP, rmCAPA in CAR}
    if not (FModule in [ rmPROC_PQ, rmPROD_PQ, rmCAPA ]) then
       AddTemplateReference;
    
    AddWorkflowReference;
  finally
    Free;
  end;
end;


procedure TQC_CollectReferenceBase.Init;
begin
  // place holder
end;


procedure TQC_CollectReferenceBase.AddTemplateReference;
begin
  if FSQL.Count > 0 then FSQL.Add( 'union all' );

  FSQL.Add(IQFormat( 'select ''Template'' as source_type,              '+
                {1}  '       ''%s'' as source_descrip,                 '+ // 'Advanced Product Quality Planning Templates'
                     '       x.id as source_id,                        '+ // id of the row in the source table
                     '       ''TEAM_MEMBER_TEMPLATE'' as source_table, '+ // source table
                     '       h.name as header,                         '+ // template name
                     '       e.descrip as element,                     '+ // element name
                {2}  '       ''%s'' as module_name,                    '+
                     '       ''D'' as action,                          '+ // place holders
                     '       0 as new_team_member_id,                  '+         
                     '       x.type as authorization_type,             '+ // authorize or review
                {3}  '       substrB(iqeval.substrW63Max(qc_team.responsibility_designation( x.team_member_id, x.delegate_team_member_id, %f), 1, 20), 1, 20) as designation '+ // responsibility designation Both, Responsible, Delegate
                     '  from team_member_template x,                   '+
                {4}  '       %s e,                                     '+ // APQP_TYPE_ELEMENT 
                {5}  '       %s h                                      '+ // APQP_TYPE
                {6,7}' where (x.team_member_id = %f or x.delegate_team_member_id = %f) '+
                {8}  '   and x.source = ''%s''                         '+
                     '   and x.source_id = e.id                        '+
                {9}  '   and e.%s_id = h.id                            ', // APQP_TYPE_ID
                {1}  [ FTemplateDescription,
                {2}    Copy( GetEnumName( TypeInfo( TQCReferenceModule ), Ord( FModule )), 3, 255 ),
                {3}    FTeam_Member_ID,
                {4}    FTemplateElementName,
                {5}    FTemplateHeaderName,
                {6}    FTeam_Member_ID,
                {7}    FTeam_Member_ID,
                {8}    FTemplateSource,
                {9}    FTemplateHeaderName ]));

  if FTemplateHeaderKind > '' then
     FSQL.Add(Format( '   and h.kind = ''%s''', [ FTemplateHeaderKind ]))
end;


procedure TQC_CollectReferenceBase.AddWorkflowReference;
begin
  if FSQL.Count > 0 then FSQL.Add( 'union all' );
  
  FSQL.Add(IQFormat( 'select ''Workflow'' as source_type, '+
              {1 }   '       ''%s'' as source_descrip,    '+ // 'Advanced Product Quality Planning Workflow'
                     '       x.id as source_id,           '+ // id of the row in the source table - APQP_RESPONSIBILITY 
              {2 }   '       ''%s'' as source_table,      '+ // APQP_RESPONSIBILITY 
              {3,3A} '       rtrim(h.%s) || '' ['' || h.%s || '']'' as header, '+  // apqpno, apqp_type_name
              {4 }   '       e.%s as element,             '+ // decrip
              {5 }   '       ''%s'' as module_name,       '+
                     '       ''D'' as action,             '+ // place holders
                     '       0 as new_team_member_id,     '+         
                     '       x.type as authorization_type,'+ // authorize or review
              {5A}   '       substrB(iqeval.substrW63Max(qc_team.responsibility_designation( x.team_member_id, x.delegate_team_member_id, %f), 1, 20), 1, 20) as designation '+ // responsibility designation Both, Responsible, Delegate
              {6 }   '  from %s x,                        '+ // APQP_RESPONSIBILITY
              {7 }   '       %s e,                        '+ // APQP_TYPE_ELEMENT 
              {8 }   '       %s h                         '+ // APQP_TYPE
              {9, 9A}' where (x.team_member_id = %f or x.delegate_team_member_id = %f) '+
              {10}   '   and x.%s_id = e.id               '+ // APQP_ELEMENT_ID
                     '   and x.signoff_date is NULL       '+
              {11}   '   and e.%s_id = h.id               ', // APQP_TYPE_ID
                     [ 
              {1 }    FWorkflowDescription,
              {2 }    FWorkflowResponsibilityTable,
              {3 }    FWorkflowHeaderFieldName,
              {3A}    FWorkflowTemplateFieldName,
              {4 }    FWorkflowElementFieldName,
              {5 }    Copy( GetEnumName( TypeInfo( TQCReferenceModule ), Ord( FModule )), 3, 255 ),
              {5A}    FTeam_Member_ID,
              {6 }    FWorkflowResponsibilityTable,
              {7 }    FWorkflowElementName,
              {8 }    FWorkflowHeaderName,
              {9 }    FTeam_Member_ID,
              {9A}    FTeam_Member_ID,
              {10}    FWorkflowElementName,
              {11}    FWorkflowHeaderName ]));
              
  if FWorkflowHeaderKind > '' then
     FSQL.Add(Format( '   and h.kind = ''%s''', [ FWorkflowHeaderKind ]));
end;



{ TQC_CollectReferenceStandard: APQP, PPAP, CAR, ECO }

procedure TQC_CollectReferenceStandard.Init;
begin
  inherited;
  case FModule of
    rmAPQP:
            begin
               FTemplateHeaderName         := 'APQP_TYPE';
               FTemplateElementName        := 'APQP_TYPE_ELEMENT';
               FTemplateDescription        := 'Advanced Product Quality Planning Template';
               FTemplateSource             := QC_SOURCE_APQP_TYPE_ELEMENT;
               FTemplateHeaderKind         := '';

               FWorkflowHeaderName         := 'APQP';
               FWorkflowElementName        := 'APQP_ELEMENT';
               FWorkflowDescription        := 'Advanced Product Quality Planning Workflow';
               FWorkflowHeaderFieldName    := 'APQPNO';
               FWorkflowElementFieldName   := 'DESCRIP';
               FWorkflowResponsibilityTable:= 'APQP_RESPONSIBILITY';
               FWorkflowHeaderKind         := 'APQP';
               FWorkflowTemplateFieldName  := 'APQP_TYPE_NAME';
            end;
    rmPROC_PQ:
            begin 
               FTemplateHeaderName         := 'APQP_TYPE';
               FTemplateElementName        := 'APQP_TYPE_ELEMENT';
               FTemplateDescription        := 'Process Performance Qualification Template';
               FTemplateSource             := QC_SOURCE_APQP_TYPE_ELEMENT;
               FTemplateHeaderKind         := '';

               FWorkflowHeaderName         := 'APQP';
               FWorkflowElementName        := 'APQP_ELEMENT';
               FWorkflowDescription        := 'Process Performance Qualification Workflow';
               FWorkflowHeaderFieldName    := 'APQPNO';
               FWorkflowElementFieldName   := 'DESCRIP';
               FWorkflowResponsibilityTable:= 'APQP_RESPONSIBILITY';
               FWorkflowHeaderKind         := 'PROC_PQ';
               FWorkflowTemplateFieldName  := 'APQP_TYPE_NAME';
            end;          
            
    rmPPAP: 
            begin 
               FTemplateHeaderName         := 'PPAP_TYPE';
               FTemplateElementName        := 'PPAP_TYPE_ELEMENT';
               FTemplateDescription        := 'Production Part Approval Process Template';
               FTemplateSource             := QC_SOURCE_PPAP_TYPE_ELEMENT;
               FTemplateHeaderKind         := '';

               FWorkflowHeaderName         := 'PPAP';
               FWorkflowElementName        := 'PPAP_ELEMENT';
               FWorkflowDescription        := 'Production Part Approval Process Workflow';
               FWorkflowHeaderFieldName    := 'PPAPNO';
               FWorkflowElementFieldName   := 'DESCRIP';
               FWorkflowResponsibilityTable:= 'PPAP_RESPONSIBILITY';
               FWorkflowHeaderKind         := 'PPAP';
               FWorkflowTemplateFieldName  := 'PPAP_TYPE_NAME';
            end;                                                    
    rmPROD_PQ: 
            begin 
               FTemplateHeaderName         := 'PPAP_TYPE';
               FTemplateElementName        := 'PPAP_TYPE_ELEMENT';
               FTemplateDescription        := 'Product Performance Qualification Template';
               FTemplateSource             := QC_SOURCE_PPAP_TYPE_ELEMENT;
               FTemplateHeaderKind         := '';

               FWorkflowHeaderName         := 'PPAP';
               FWorkflowElementName        := 'PPAP_ELEMENT';
               FWorkflowDescription        := 'Product Performance Qualification Workflow';
               FWorkflowHeaderFieldName    := 'PPAPNO';
               FWorkflowElementFieldName   := 'DESCRIP';
               FWorkflowResponsibilityTable:= 'PPAP_RESPONSIBILITY';
               FWorkflowHeaderKind         := 'PROD_PQ';
               FWorkflowTemplateFieldName  := 'PPAP_TYPE_NAME';
            end;                                                    
    rmECO : begin 
               FTemplateHeaderName         := 'ECO_TYPE';
               FTemplateElementName        := 'ECO_TYPE_ELEMENT';
               FTemplateDescription        := 'Engineering Change Order Template';
               FTemplateSource             := QC_SOURCE_ECO_TYPE_ELEMENT;
               FTemplateHeaderKind         := '';

               FWorkflowHeaderName         := 'ECO';
               FWorkflowElementName        := 'ECO_ELEMENT';
               FWorkflowDescription        := 'Engineering Change Order Workflow';
               FWorkflowHeaderFieldName    := 'ECONO';
               FWorkflowElementFieldName   := 'DESCRIP';
               FWorkflowResponsibilityTable:= 'ECO_RESPONSIBILITY';
               FWorkflowHeaderKind         := '';
               FWorkflowTemplateFieldName  := 'ECO_TYPE_NAME';
            end;                                                                
    rmCAR:
            begin 
               FTemplateHeaderName         := 'CAR_TYPE';
               FTemplateElementName        := 'CAR_TYPE_ELEMENT';
               FTemplateDescription        := 'Corrective Action Template';
               FTemplateSource             := QC_SOURCE_CAR_TYPE_ELEMENT;
               FTemplateHeaderKind         := '';

               FWorkflowHeaderName         := 'CAR';
               FWorkflowElementName        := 'CAR_ELEMENT';
               FWorkflowDescription        := 'Corrective Action Workflow';
               FWorkflowHeaderFieldName    := 'CARNO';
               FWorkflowElementFieldName   := 'DESCRIP';
               FWorkflowResponsibilityTable:= 'CAR_RESPONSIBILITY';
               FWorkflowHeaderKind         := 'CAR';
               FWorkflowTemplateFieldName  := 'CAR_TYPE_NAME';
            end;                                         
    rmCAPA:
            begin 
               FTemplateHeaderName         := 'CAR_TYPE';
               FTemplateElementName        := 'CAR_TYPE_ELEMENT';
               FTemplateDescription        := 'CAPA Template';
               FTemplateSource             := QC_SOURCE_CAR_TYPE_ELEMENT;
               FTemplateHeaderKind         := '';

               FWorkflowHeaderName         := 'CAR';
               FWorkflowElementName        := 'CAR_ELEMENT';
               FWorkflowDescription        := 'CAPA Workflow';
               FWorkflowHeaderFieldName    := 'CARNO';
               FWorkflowElementFieldName   := 'DESCRIP';
               FWorkflowResponsibilityTable:= 'CAR_RESPONSIBILITY';
               FWorkflowHeaderKind         := 'CAPA';
               FWorkflowTemplateFieldName  := 'CAR_TYPE_NAME';
            end;
  end;
end;




{ TQC_CollectReferenceExtended: DEV, MRB, CRM, PLM}
procedure TQC_CollectReferenceExtended.Init;
begin
  inherited;
  
  FTemplateHeaderName         := 'WF_TYPE';
  FTemplateElementName        := 'WF_TYPE_ELEMENT';
  FTemplateSource             := 'WF_TYPE_ELEMENT';

  FWorkflowHeaderName         := 'WF_HEADER';
  FWorkflowElementName        := 'WF_ELEMENT';
  FWorkflowHeaderFieldName    := 'WORKFLOWNO';
  FWorkflowElementFieldName   := 'DESCRIP';
  FWorkflowResponsibilityTable:= 'WF_RESPONSIBILITY';
  FWorkflowTemplateFieldName  := 'WF_TYPE_NAME';
                                                   
  case FModule of
    rmDEV:
          begin 
            FTemplateDescription:= 'Deviation Template';
            FWorkflowDescription:= 'Deviation Workflow';
            FTemplateHeaderKind := 'DEV';
            FWorkflowHeaderKind := 'DEV';
          end;                
    rmMRB:
          begin 
            FTemplateDescription:= 'Material Review Board Template';
            FWorkflowDescription:= 'Material Review Board Workflow';
            FTemplateHeaderKind := 'MRB';
            FWorkflowHeaderKind := 'MRB';
          end;                  
    rmCRM:
          begin
            FTemplateDescription:= 'CRM Workflow Template';
            FWorkflowDescription:= 'CRM Workflow';
            FTemplateHeaderKind := 'CRM';
            FWorkflowHeaderKind := 'CRM';
          end;
    rmPLM:
          begin 
            FTemplateDescription:= 'PLM Workflow Template';
            FWorkflowDescription:= 'PLM Workflow';
            FTemplateHeaderKind := 'PLM';
            FWorkflowHeaderKind := 'PLM';
          end;                  
    rmDHR:
          begin 
            FTemplateDescription:= 'DHR Workflow Template';
            FWorkflowDescription:= 'DHR Workflow';
            FTemplateHeaderKind := 'DHR';
            FWorkflowHeaderKind := 'DHR';
          end;
    rmPO:
          begin
            FTemplateDescription:= 'Requisition Workflow Template';
            FWorkflowDescription:= 'Requisition Workflow';
            FTemplateHeaderKind := 'PO';
            FWorkflowHeaderKind := 'PO';
          end;
    rmAUDIT:
          begin
            FTemplateDescription:= 'Quality Audit Workflow Template';
            FWorkflowDescription:= 'Quality Audit  Workflow';
            FTemplateHeaderKind := 'AUDIT';
            FWorkflowHeaderKind := 'AUDIT';
          end;
    rmEMP:
          begin 
            FTemplateDescription:= 'Employee Workflow Template';
            FWorkflowDescription:= 'Employee Workflow';
            FTemplateHeaderKind := 'EMP';
            FWorkflowHeaderKind := 'EMP';
          end;
    rmAPP:
          begin 
            FTemplateDescription:= 'Applicant Workflow Template';
            FWorkflowDescription:= 'Applicant Workflow';
            FTemplateHeaderKind := 'APP';
            FWorkflowHeaderKind := 'APP';
          end;
  end;                                 
end;



{ TQC_CollectReferenceExternalDoc }

procedure TQC_CollectReferenceExternalDoc.AddTemplateReference;
begin
  {add external_doc table references}
  if FSQL.Count > 0 then FSQL.Add( 'union all' );

  FSQL.Add(IQFormat( 'select ''External Document Owner'' as source_type,       '+
                     '       ''External Document Control'' as source_descrip,  '+ 
                     '       x.id as source_id,                        '+ // id of the row in the source table
                     '       ''EXTERNAL_DOC'' as source_table,         '+ // source table
                     '       h.descrip as header,                      '+ // library description
                     '       x.descrip as element,                     '+ // document description
                     '       ''%s'' as module_name,                    '+
                     '       ''N'' as action,                          '+ // note - N (nothing) instead of D (delete)
                     '       0 as new_team_member_id,                  '+         
                     '       to_char(null) as authorization_type,      '+ // authorize or review
                     '       ''Responsible'' as designation            '+
                     '  from external_doc x,                           '+
                     '       doc_library h                             '+ // doc_library
                     ' where x.team_member_id = %f                     '+
                     '   and x.doc_library_id = h.id                   ', 
                     [ Copy( GetEnumName( TypeInfo( TQCReferenceModule ), Ord( FModule )), 3, 255 ),
                       FTeam_Member_ID ]));

  {add doc_idea table references}
  if FSQL.Count > 0 then FSQL.Add( 'union all' );

  FSQL.Add(IQFormat( 'select ''Ideas'' as source_type,                        '+
                     '       ''External Document Control'' as source_descrip, '+ 
                     '       x.id as source_id,                        '+ // id of the row in the source table
                     '       ''DOC_IDEA'' as source_table,             '+ // source table
                     '       h.descrip as header,                      '+ // library description
                     '       d.descrip as element,                     '+ // document description
                     '       ''%s'' as module_name,                    '+
                     '       ''D'' as action,                          '+ // place holders
                     '       0 as new_team_member_id,                  '+         
                     '       to_char(null) as authorization_type,      '+ // authorize or review
                     '       ''Responsible'' as designation            '+
                     '  from doc_idea x,                               '+
                     '       doc_revision r,                           '+
                     '       external_doc d,                           '+
                     '       doc_library h                             '+ // doc_library
                     ' where x.team_member_id = %f                     '+
                     '   and x.doc_revision_id = r.id                  '+
                     '   and NVL(r.hist, ''N'') = ''N''                '+
                     '   and r.external_doc_id = d.id                  '+
                     '   and d.doc_library_id = h.id                   ',
                     [ Copy( GetEnumName( TypeInfo( TQCReferenceModule ), Ord( FModule )), 3, 255 ),
                       FTeam_Member_ID ]));
end;

procedure TQC_CollectReferenceExternalDoc.AddWorkflowReference;
begin
  {add doc_routing table references}
  if FSQL.Count > 0 then FSQL.Add( 'union all' );

  FSQL.Add(IQFormat( 'select ''Workflow'' as source_type,                     '+
                     '       ''External Document Control'' as source_descrip, '+ 
                     '       x.id as source_id,                        '+ // id of the row in the source table
                     '       ''DOC_ROUTING'' as source_table,          '+ // source table
                     '       h.descrip as header,                      '+ // library description
                     '       d.descrip as element,                     '+ // document description
              {1}    '       ''%s'' as module_name,                    '+
                     '       ''D'' as action,                          '+ // place holders
                     '       0 as new_team_member_id,                  '+         
                     '       x.type as authorization_type,             '+ // authorize or review
              {2}    '       substrB(iqeval.substrW63Max(qc_team.responsibility_designation( x.team_member_id, x.delegate_team_member_id, %f), 1, 20), 1, 20) as designation '+ // responsibility designation Both, Responsible, Delegate
                     '  from doc_routing x,                            '+
                     '       doc_revision r,                           '+
                     '       external_doc d,                           '+
                     '       doc_library h                             '+ // doc_library
              {3,4}  ' where (x.team_member_id = %f or x.delegate_team_member_id = %f) '+
                     '   and x.doc_revision_id = r.id                  '+
                     '   and NVL(r.hist, ''N'') = ''N''                '+
                     '   and r.external_doc_id = d.id                  '+
                     '   and x.signoff_date is NULL                    '+
                     '   and d.doc_library_id = h.id                   ',
              {1}    [ Copy( GetEnumName( TypeInfo( TQCReferenceModule ), Ord( FModule )), 3, 255 ),
              {2}      FTeam_Member_ID,
              {3}      FTeam_Member_ID,
              {4}      FTeam_Member_ID ]));
end;

procedure TQC_CollectReferenceExternalDoc.Init;
begin
  {not used}
end;

{ TQC_CollectReferenceLibTeam }

procedure TQC_CollectReferenceLibTeam.AddTemplateReference;
begin
  {add doc_team table references}
  if FSQL.Count > 0 then FSQL.Add( 'union all' );

  FSQL.Add(IQFormat( 'select ''Lib Team'' as source_type,                     '+
                     '       ''External Document Control'' as source_descrip, '+ 
                     '       x.id as source_id,                        '+ // id of the row in the source table
                     '       ''DOC_TEAM'' as source_table,             '+ // source table
                     '       h.descrip as header,                      '+ // library description
                     '       ''Library Team Member'' as element,       '+ // document description
                     '       ''%s'' as module_name,                    '+
                     '       ''D'' as action,                          '+ // place holders
                     '       0 as new_team_member_id,                  '+         
                     '       to_char(null) as authorization_type,      '+ // authorize or review
                     '       ''Responsible'' as designation            '+
                     '  from doc_team  x,                              '+
                     '       doc_library h                             '+ // doc_library
                     ' where x.team_member_id = %f                     '+
                     '   and x.doc_library_id = h.id                   ',
                     [ Copy( GetEnumName( TypeInfo( TQCReferenceModule ), Ord( FModule )), 3, 255 ),
                       FTeam_Member_ID ]));

end;

procedure TQC_CollectReferenceLibTeam.AddWorkflowReference;
begin
  {not used}
end;

procedure TQC_CollectReferenceLibTeam.Init;
begin
  {not used}
end;


{ TQC_CollectReferenceExternalDocTemplateBased }

procedure TQC_CollectReferenceExternalDocTemplateBased.AddTemplateReference;
begin
  inherited;

  {add doc_idea table references}
  if FSQL.Count > 0 then FSQL.Add( 'union all' );

  FSQL.Add(IQFormat( 'select ''Ideas'' as source_type,                        '+
                     '       ''External Document Control'' as source_descrip, '+ 
                     '       x.id as source_id,                        '+ // id of the row in the source table
                     '       ''DOC_IDEA'' as source_table,             '+ // source table
                     '       h.descrip as header,                      '+ // library description
                     '       d.descrip as element,                     '+ // document description
                     '       ''%s'' as module_name,                    '+
                     '       ''D'' as action,                          '+ // place holders
                     '       0 as new_team_member_id,                  '+         
                     '       to_char(null) as authorization_type,      '+ // authorize or review
                     '       ''Responsible'' as designation            '+
                     '  from doc_idea x,                               '+
                     '       doc_revision r,                           '+
                     '       external_doc d,                           '+
                     '       doc_library h                             '+ // doc_library
                     ' where x.team_member_id = %f                     '+
                     '   and x.doc_revision_id = r.id                  '+
                     '   and NVL(r.hist, ''N'') = ''N''                '+
                     '   and r.external_doc_id = d.id                  '+
                     '   and d.doc_library_id = h.id                   ',
                     [ Copy( GetEnumName( TypeInfo( TQCReferenceModule ), Ord( FModule )), 3, 255 ),
                       FTeam_Member_ID ]));
end;

procedure TQC_CollectReferenceExternalDocTemplateBased.AddWorkflowReference;
begin
  inherited;
end;

procedure TQC_CollectReferenceExternalDocTemplateBased.Init;
begin
  inherited;
  
  FTemplateHeaderName         := 'WF_TYPE';
  FTemplateElementName        := 'WF_TYPE_ELEMENT';
  FTemplateSource             := 'WF_TYPE_ELEMENT';

  FWorkflowHeaderName         := 'WF_HEADER';
  FWorkflowElementName        := 'WF_ELEMENT';
  FWorkflowHeaderFieldName    := 'WORKFLOWNO';
  FWorkflowElementFieldName   := 'DESCRIP';
  FWorkflowResponsibilityTable:= 'WF_RESPONSIBILITY';
  FWorkflowTemplateFieldName  := 'WF_TYPE_NAME';
                                                   
  FTemplateDescription:= 'External Document Template';
  FWorkflowDescription:= 'External Document Template Based Workflow';
  FTemplateHeaderKind := 'DOC';
  FWorkflowHeaderKind := 'DOC';
end;

end.

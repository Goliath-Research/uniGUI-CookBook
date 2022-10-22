unit po_wf_eval;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  wf_eval,
  qc_eval_share,
  QC_Share,
  MainModule,
  IQMS.Common.DataConst;

type
  TEvalWorkFlowPO = class( TEvalWorkFlow  )
  private
    function GetPO_ID: Real;
  protected
    function ConfigureLink( AURL: string; AWF_Responsibility_ID: Real ): string; override;
    procedure MarkHeaderComplete; override;
    function GetEMailSubject(AWF_Responsibility_ID: Real; AType: string): string; override;

    procedure AssignRejectedOwnerEmailTo(var AEmailTo: string); override;
    procedure AssignNote(var ANote: string); override;
    property PO_ID: Real read GetPO_ID;
    function IsEverythingApproved: Boolean; override;
  public
    class procedure DoExecute( AWF_Element_ID: Real; ADataBaseName: string = cnstFDConnectionName; ASendEmailToApprove: TSendEmailToApprove = NIL; AExtraParams: TQCEvalExtraParams = nil );
  end;

implementation

uses
  IQMS.Common.DataLib,
  { TODO : Dependancy on Mon_Thrd
  Mon_Thrd,}
  po_share;
{ TEvalWorkFlowPO }

class procedure TEvalWorkFlowPO.DoExecute( AWF_Element_ID: Real; ADataBaseName: string = cnstFDConnectionName; ASendEmailToApprove: TSendEmailToApprove = NIL; AExtraParams: TQCEvalExtraParams = nil );
begin
  // TEvalWorkFlowPO.Create( AWF_Element_ID, ADataBaseName, ASendEmailToApprove, AExtraParams ).Execute;
  inherited;
end;

procedure TEvalWorkFlowPO.AssignNote(var ANote: string);
var
  AList: TStringList;
  I: Integer;
begin
  inherited;  // nothing

  AList:= TStringList.Create;
  try
    TQCEvalWorkflowBase.AssignPODetailsInfo( PO_ID, AList );
    if AList.Count > 0 then
    begin
      for I:= 0 to AList.Count - 1 do
          ANote:= ANote + #13 + AList[ I ];
      ANote:= ANote + #13#13;
    end;
  finally
    AList.Free;
  end;
end;

function TEvalWorkFlowPO.ConfigureLink(AURL: string; AWF_Responsibility_ID: Real): string;
begin
  Result:= Format('%siqms/web_wf_admin.get_data?v_wf_responsibility_id=%.0f&v_module=PO', [ AURL, AWF_Responsibility_ID ]);
end;


procedure TEvalWorkFlowPO.MarkHeaderComplete;
begin
  inherited;

  //if SelectValueFmtAsFloat('select 1                                        '+
  //             '  from wf_element e, wf_responsibility r        '+
  //             ' where e.wf_header_id = %f                      '+
  //             '   and e.id = r.wf_element_id                   '+
  //             '   and nvl(r.signoff, ''N'') <> ''Y''           '+
  //             '   and NVL(type, ''Authorize'') = ''Authorize'' '+
  //             '   and rownum < 2                               ',
  //             [ FWF_Header_ID ], FDataBaseName) = 0 then
  if SelectValueFmtAsFloat('select po_misc.every_element_signed_off( %f )  from dual', [ FWF_Header_ID ], FDataBaseName) = 1 then
  begin
    ExecuteCommandFmt('update po set approved_by = ''Approved'' where id = (select source_id from wf_header where id = %f)', [ FWF_Header_ID ], FDataBaseName);

    // if we came from IQAlert request special syncronization to avoid AV when printing report
      { TODO -omugdha -cWEBIQ :  Undeclared identifier: 'TMonThreadBas'
    if Assigned(FExtraParams) and Assigned(FExtraParams.Owner) and (FExtraParams.Owner is TMonThreadBas) then
       TMonThreadBas(FExtraParams.Owner).CheckExecuteAutoEFormPO( PO_ID )
    else
       // 08/27/2015 (Byron, EIQ-8339)  Remmed this
       //po_share.CheckExecuteAutoEFormPO( PO_ID );
       // 08/27/2015 (Byron, EIQ-8339)  Instead, call this.
       po_share.CheckExecuteAutoEFormPOQueue; }
  end;
end;

function TEvalWorkFlowPO.GetEMailSubject(AWF_Responsibility_ID: Real;  AType: string): string;
var
  APO_ID: Real;
begin
  Result:= inherited GetEMailSubject( AWF_Responsibility_ID, AType);

  APO_ID:= SelectValueFmtAsFloat('select po.id from po, wf_header h where h.id = %f and h.source_id = po.id', [ FWF_Header_ID ], FDataBaseName);
  Result:= Format('%s, %s', [ po_share.get_po_requisition_title( APO_ID, FDatabaseName ), Result ]);
end;


function TEvalWorkFlowPO.GetPO_ID: Real;
begin
  Result:= SelectValueFmtAsFloat('select po.id from po, wf_header h where h.id = %f and h.source_id = po.id', [ FWF_Header_ID ], FDataBaseName);
end;

function TEvalWorkFlowPO.IsEverythingApproved: Boolean;
begin
  Result:= SelectValueFmtAsFloat('select wf_share.signoff_limit_covers_po( %f ) from dual', [FWF_Element_ID], FDataBaseName) = 1;
  if Result then
     EXIT;

  Result:= inherited;
end;

procedure TEvalWorkFlowPO.AssignRejectedOwnerEmailTo(var AEmailTo: string);
var
  APR_Emp_ID_Rqstnr: Real;
begin
  APR_Emp_ID_Rqstnr:= SelectValueFmtAsFloat('select pr_emp_id_rqstnr from po, wf_header h where h.id = %f and h.source_id = po.id', [ FWF_Header_ID ], FDataBaseName);
  AEmailTo:= SelectValueFmtAsString('select email from pr_emp where id = %f', [ APR_Emp_ID_Rqstnr ], FDataBaseName);
end;


end.

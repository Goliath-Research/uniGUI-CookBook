unit wf_const;

interface

uses
  IQMS.Common.RegFrm,
  Classes;

const
    WF_CRM_MAINT = 1;
    WF_CRM_ADD_WORKFLOW = 3;
    WF_EVALUATE  = 2;

    WF_KIND_CRM: String = 'CRM';
    WF_KIND_AUDIT: String = 'AUDIT';
    WF_KIND_DHR: String = 'DHR';
    WF_KIND_DEV: String = 'Dev';
    WF_KIND_MRB: String = 'MRB';
    WF_KIND_PLM: String = 'PLM';
    WF_KIND_PO: String = 'PO';
    WF_KIND_DOC: String = 'DOC';
    WF_KIND_EMP: String = 'EMP';
    WF_KIND_APP: String = 'APP';
    WF_KIND_PROJECT: String = 'PROJECT';
    WF_KIND_AP: String = 'AP';
    WF_KIND_OE: String = 'OE';

type
    TWorkflowShowing = (wsAll, wsOpen, wsClosed);

    TWorkflowState = (wsUnknown, wsInProgress, wsApproved, wsRejected );
    
    TWorkflowFilter = record
      Kind      : string;
      Arcusto_ID: Real;
      Vendor_ID : Real;
      Showing   : TWorkflowShowing;  {All, Open, Closed}
      Wording   : string; {caption and hints}
      PR_Emp_ID : Real;
      HR_App_ID : Real;
    end;
    
procedure DoWorkflowFilterRead( AOwner: TComponent;  var AFilter: TWorkflowFilter );
procedure DoWorkflowFilterWrite( AOwner: TComponent; AFilter: TWorkflowFilter );
    
implementation

procedure DoWorkflowFilterRead( AOwner: TComponent;  var AFilter: TWorkflowFilter );
var
  Value: Integer;
begin
  if not IQRegStringScalarRead( AOwner, 'WorkflowFilter_Kind', AFilter.Kind ) then 
     AFilter.Kind:= '';
  if not IQRegFloatScalarRead( AOwner, 'WorkflowFilter_Arcusto_ID', AFilter.Arcusto_ID ) then 
     AFilter.Arcusto_ID:= 0;
  if not IQRegFloatScalarRead( AOwner, 'WorkflowFilter_Vendor_ID', AFilter.Vendor_ID ) then 
     AFilter.Vendor_ID:= 0;
  if not IQRegFloatScalarRead( AOwner, 'WorkflowFilter_Pr_Emp_ID', AFilter.PR_Emp_ID ) then 
     AFilter.Pr_Emp_ID:= 0;
  if not IQRegFloatScalarRead( AOwner, 'WorkflowFilter_HR_App_ID', AFilter.HR_App_ID ) then 
     AFilter.Hr_App_ID:= 0;
  if not IQRegIntegerScalarRead( AOwner, 'WorkflowFilter_Showing', Value ) then 
     AFilter.Showing:= wsOpen
  else   
     AFilter.Showing:= TWorkflowShowing( Value );
end;


procedure DoWorkflowFilterWrite( AOwner: TComponent; AFilter: TWorkflowFilter );
begin
  IQRegStringScalarWrite ( AOwner, 'WorkflowFilter_Kind',       AFilter.Kind );
  IQRegFloatScalarWrite  ( AOwner, 'WorkflowFilter_Arcusto_ID', AFilter.Arcusto_ID );
  IQRegFloatScalarWrite  ( AOwner, 'WorkflowFilter_Vendor_ID',  AFilter.Vendor_ID );
  IQRegFloatScalarWrite  ( AOwner, 'WorkflowFilter_Pr_Emp_ID',  AFilter.Pr_Emp_ID );
  IQRegFloatScalarWrite  ( AOwner, 'WorkflowFilter_HR_App_ID',  AFilter.HR_App_ID );
  IQRegIntegerScalarWrite( AOwner, 'WorkflowFilter_Showing',    Ord(AFilter.Showing));
end;


end.
